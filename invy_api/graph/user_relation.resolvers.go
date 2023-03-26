package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.22

import (
	"context"
	"errors"
	"fmt"

	fcm "firebase.google.com/go/v4/messaging"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/friendship"
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/pushnotificationtoken"
	"github.com/k-yomo/invy/invy_api/ent/userblock"
	"github.com/k-yomo/invy/invy_api/ent/usermute"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/logging"
)

// FromUser is the resolver for the fromUser field.
func (r *friendshipRequestResolver) FromUser(ctx context.Context, obj *gqlmodel.FriendshipRequest) (*gqlmodel.User, error) {
	dbUserProfile, err := loader.Get(ctx).UserProfile.Load(ctx, obj.FromUserID)()
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// ToUser is the resolver for the toUser field.
func (r *friendshipRequestResolver) ToUser(ctx context.Context, obj *gqlmodel.FriendshipRequest) (*gqlmodel.User, error) {
	dbUserProfile, err := loader.Get(ctx).UserProfile.Load(ctx, obj.FromUserID)()
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// RequestFriendship is the resolver for the requestFriendship field.
func (r *mutationResolver) RequestFriendship(ctx context.Context, friendUserID uuid.UUID) (*gqlmodel.RequestFriendshipPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	if friendUserID == authUserID {
		return nil, errors.New("friendship can't be requested to currently logged-in user")
	}
	alreadyFriend, err := r.DB.Friendship.Query().
		Where(
			friendship.UserID(authUserID),
			friendship.FriendUserID(friendUserID),
		).
		Exist(ctx)
	if err != nil {
		return nil, err
	}
	if alreadyFriend {
		return nil, errors.New("already friend")
	}

	dbFriendshipRequest, err := r.DB.FriendshipRequest.Create().
		SetFromUserID(authUserID).
		SetToUserID(friendUserID).
		Save(ctx)
	if err != nil {
		return nil, err
	}

	// TODO: Send notification async
	requesterProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	friendUserPushNotificationTokens, err := r.DB.PushNotificationToken.Query().
		Where(pushnotificationtoken.UserID(friendUserID)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	fcmTokens := convutil.ConvertToList(friendUserPushNotificationTokens, func(from *ent.PushNotificationToken) string {
		return from.FcmToken
	})
	err = r.Service.Notification.SendMulticast(ctx, &fcm.MulticastMessage{
		Tokens: fcmTokens,
		Data: map[string]string{
			"type": gqlmodel.PushNotificationTypeFriendshipRequestReceived.String(),
		},
		Notification: &fcm.Notification{
			Body: fmt.Sprintf("%sさんから友達申請が届きました。", requesterProfile.Nickname),
		},
		Android: &fcm.AndroidConfig{
			Priority: "high",
		},
	})
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
	}

	return &gqlmodel.RequestFriendshipPayload{FriendShipRequest: conv.ConvertFromDBFriendshipRequest(dbFriendshipRequest)}, nil
}

// CancelFriendshipRequest is the resolver for the cancelFriendshipRequest field.
func (r *mutationResolver) CancelFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (*gqlmodel.CancelFriendshipRequestPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.FriendshipRequest.Delete().
		Where(
			friendshiprequest.ID(friendshipRequestID),
			friendshiprequest.FromUserID(authUserID),
		).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.CancelFriendshipRequestPayload{CanceledFriendshipRequestID: friendshipRequestID}, nil
}

// AcceptFriendshipRequest is the resolver for the acceptFriendshipRequest field.
func (r *mutationResolver) AcceptFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (*gqlmodel.AcceptFriendshipRequestPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	var requestedUserID uuid.UUID
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		friendshipRequest, err := tx.FriendshipRequest.Query().
			Where(
				friendshiprequest.ID(friendshipRequestID),
				friendshiprequest.ToUserID(authUserID),
			).Only(ctx)
		if err != nil {
			return err
		}
		requestedUserID = friendshipRequest.FromUserID
		if err := tx.FriendshipRequest.DeleteOne(friendshipRequest).Exec(ctx); err != nil {
			return err
		}
		err = tx.Friendship.Create().
			SetUserID(friendshipRequest.FromUserID).
			SetFriendUserID(friendshipRequest.ToUserID).
			Exec(ctx)
		if err != nil {
			return err
		}
		err = tx.Friendship.Create().
			SetUserID(friendshipRequest.ToUserID).
			SetFriendUserID(friendshipRequest.FromUserID).
			Exec(ctx)
		if err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, err
	}

	// TODO: Send notification async
	acceptedUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	requestedUserPushNotificationTokens, err := r.DB.PushNotificationToken.Query().
		Where(pushnotificationtoken.UserID(requestedUserID)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	fcmTokens := convutil.ConvertToList(requestedUserPushNotificationTokens, func(from *ent.PushNotificationToken) string {
		return from.FcmToken
	})
	err = r.Service.Notification.SendMulticast(ctx, &fcm.MulticastMessage{
		Tokens: fcmTokens,
		Data: map[string]string{
			"type": gqlmodel.PushNotificationTypeFriendshipRequestAccepted.String(),
		},
		Notification: &fcm.Notification{
			Body: fmt.Sprintf("%sさんが友達申請を承諾しました。", acceptedUserProfile.Nickname),
		},
		Android: &fcm.AndroidConfig{
			Priority: "high",
		},
	})
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
	}

	return &gqlmodel.AcceptFriendshipRequestPayload{AcceptedFriendshipRequestID: friendshipRequestID}, nil
}

// DenyFriendshipRequest is the resolver for the denyFriendshipRequest field.
func (r *mutationResolver) DenyFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (*gqlmodel.DenyFriendshipRequestPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.FriendshipRequest.Delete().
		Where(
			friendshiprequest.ID(friendshipRequestID),
			friendshiprequest.ToUserID(authUserID),
		).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.DenyFriendshipRequestPayload{DeniedFriendshipRequestID: friendshipRequestID}, nil
}

// MuteUser is the resolver for the muteUser field.
func (r *mutationResolver) MuteUser(ctx context.Context, userID uuid.UUID) (*gqlmodel.MuteUserPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	err := r.DB.UserMute.Create().
		SetUserID(authUserID).
		SetMuteUserID(userID).
		OnConflictColumns(usermute.UserColumn, usermute.MuteUserColumn).
		Ignore().
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.MuteUserPayload{MutedUserID: userID}, nil
}

// UnmuteUser is the resolver for the unmuteUser field.
func (r *mutationResolver) UnmuteUser(ctx context.Context, userID uuid.UUID) (*gqlmodel.UnmuteUserPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.UserMute.Delete().
		Where(usermute.UserID(authUserID), usermute.MuteUserID(userID)).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.UnmuteUserPayload{UnmutedUserID: userID}, nil
}

// BlockUser is the resolver for the blockUser field.
func (r *mutationResolver) BlockUser(ctx context.Context, userID uuid.UUID) (*gqlmodel.BlockUserPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	err := r.DB.UserBlock.Create().
		SetUserID(authUserID).
		SetBlockUserID(userID).
		OnConflictColumns(userblock.UserColumn, userblock.BlockUserColumn).
		Ignore().
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.BlockUserPayload{BlockedUserID: userID}, nil
}

// UnblockUser is the resolver for the unblockUser field.
func (r *mutationResolver) UnblockUser(ctx context.Context, userID uuid.UUID) (*gqlmodel.UnblockUserPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.UserBlock.Delete().
		Where(userblock.UserID(authUserID), userblock.BlockUserID(userID)).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.UnblockUserPayload{UnblockedUserID: userID}, nil
}

// FriendshipRequest returns gqlgen.FriendshipRequestResolver implementation.
func (r *Resolver) FriendshipRequest() gqlgen.FriendshipRequestResolver {
	return &friendshipRequestResolver{r}
}

type friendshipRequestResolver struct{ *Resolver }
