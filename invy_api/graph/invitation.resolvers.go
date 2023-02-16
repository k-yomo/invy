package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.22

import (
	"context"
	"errors"
	"fmt"
	"time"

	fcm "firebase.google.com/go/v4/messaging"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/invitationawaiting"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/pgutil"
	"github.com/k-yomo/invy/pkg/timeutil"
	"go.uber.org/zap"
)

// User is the resolver for the user field.
func (r *invitationResolver) User(ctx context.Context, obj *gqlmodel.Invitation) (*gqlmodel.User, error) {
	dbUserProfile, err := loader.Get(ctx).UserProfile.Load(ctx, obj.UserID)()
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// AcceptedUsers is the resolver for the acceptedUsers field.
func (r *invitationResolver) AcceptedUsers(ctx context.Context, obj *gqlmodel.Invitation) ([]*gqlmodel.User, error) {
	dbAcceptedUserProfiles, err := loader.Get(ctx).InvitationAcceptedUserProfiles.Load(ctx, obj.ID)()
	if errors.Is(err, loader.ErrNotFound) {
		return nil, nil
	}
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(dbAcceptedUserProfiles, conv.ConvertFromDBUserProfile), nil
}

// IsAccepted is the resolver for the isAccepted field.
func (r *invitationResolver) IsAccepted(ctx context.Context, obj *gqlmodel.Invitation) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	if authUserID == obj.UserID {
		return true, nil
	}
	// TODO: Use data loader
	return r.DB.InvitationAcceptance.Query().
		Where(
			invitationacceptance.InvitationID(obj.ID),
			invitationacceptance.UserID(authUserID),
		).Exist(ctx)
}

// User is the resolver for the user field.
func (r *invitationAwaitingResolver) User(ctx context.Context, obj *gqlmodel.InvitationAwaiting) (*gqlmodel.User, error) {
	userProfile, err := loader.Get(ctx).UserProfile.Load(ctx, obj.ID)()
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(userProfile), nil
}

// SendInvitation is the resolver for the sendInvitation field.
func (r *mutationResolver) SendInvitation(ctx context.Context, input *gqlmodel.SendInvitationInput) (*gqlmodel.SendInvitationPayload, error) {
	now := time.Now()
	if input.ExpiresAt.Before(now) {
		return nil, errors.New("expiration time must be future date time")
	}
	authUserID := auth.GetCurrentUserID(ctx)

	targetFriendUserIDs, err := r.DBQuery.UserRelation.GetNotBlockedFriendUserIDs(
		ctx,
		authUserID,
		input.TargetFriendUserIds,
		input.TargetFriendGroupIds,
	)
	if err != nil {
		return nil, err
	}

	var locationCoordinate *pgutil.GeoPoint
	if input.Latitude != nil && input.Longitude != nil {
		locationCoordinate = pgutil.NewGeoPoint(*input.Latitude, *input.Longitude)
	}

	var dbInvitation *ent.Invitation
	err = ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		var err error
		dbInvitation, err = tx.Invitation.Create().
			SetUserID(authUserID).
			SetLocation(input.Location).
			SetCoordinate(locationCoordinate).
			SetComment(input.Comment).
			SetStartsAt(input.StartsAt).
			SetExpiresAt(input.ExpiresAt).
			Save(ctx)
		if err != nil {
			return err
		}

		invitationUserCreates := make([]*ent.InvitationUserCreate, 0, len(targetFriendUserIDs))
		for _, targetUserID := range targetFriendUserIDs {
			invitationUserCreates = append(
				invitationUserCreates,
				tx.InvitationUser.Create().
					SetInvitationID(dbInvitation.ID).
					SetUserID(targetUserID),
			)
		}
		err = tx.InvitationUser.CreateBulk(invitationUserCreates...).Exec(ctx)
		if err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, err
	}

	// TODO: Send notification async
	inviterProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(dbInvitation.UserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	targetUserPushNotificationTokens, err := r.DBQuery.Notification.GetNotifiableFriendUserPushTokens(ctx, authUserID, targetFriendUserIDs)
	// TODO: Chunk tokens by 500 (max tokens per multicast)
	// TODO: delete expired tokens
	_, err = r.FCMClient.SendMulticast(ctx, &fcm.MulticastMessage{
		Tokens: targetUserPushNotificationTokens,
		Data: map[string]string{
			"type":         gqlmodel.PushNotificationTypeInvitationReceived.String(),
			"invitationId": dbInvitation.ID.String(),
		},
		Notification: &fcm.Notification{
			Body: fmt.Sprintf("%sさんから、%s開催のおさそいが届きました。", inviterProfile.Nickname, dbInvitation.Location),
		},
		Android: &fcm.AndroidConfig{
			Priority: "high",
		},
	})
	if err != nil {
		logging.Logger(ctx).Error(err.Error(), zap.String("invitationId", dbInvitation.ID.String()))
	}
	return &gqlmodel.SendInvitationPayload{Invitation: conv.ConvertFromDBInvitation(dbInvitation)}, nil
}

// AcceptInvitation is the resolver for the acceptInvitation field.
func (r *mutationResolver) AcceptInvitation(ctx context.Context, invitationID uuid.UUID) (*gqlmodel.AcceptInvitationPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)

	isAuthUserInvited, err := IsAuthUserIncludedInTheInvitation(ctx, r.DB, invitationID)
	if err != nil {
		return nil, err
	}
	if !isAuthUserInvited {
		return nil, xerrors.NewErrNotFound(fmt.Errorf("invitation %q not found", invitationID))
	}

	// TODO: Should we check if user already denied?
	err = r.DB.InvitationAcceptance.Create().
		SetInvitationID(invitationID).
		SetUserID(authUserID).
		Exec(ctx)
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

	inviterPushNotificationTokens, err := r.DB.Invitation.Query().
		Where(invitation.ID(invitationID)).
		QueryUser().
		QueryPushNotificationTokens().
		All(ctx)
	if err != nil {
		return nil, err
	}
	acceptedUserPushNotificationTokens, err := r.DB.InvitationAcceptance.Query().
		Where(
			invitationacceptance.And(
				invitationacceptance.InvitationID(invitationID),
				// do not send notification to just accepted user
				invitationacceptance.UserIDNEQ(authUserID),
			),
		).
		QueryUser().
		QueryPushNotificationTokens().
		All(ctx)
	if err != nil {
		return nil, err
	}
	fcmTokens := convutil.ConvertToList(append(inviterPushNotificationTokens, acceptedUserPushNotificationTokens...), func(from *ent.PushNotificationToken) string {
		return from.FcmToken
	})
	// TODO: Chunk tokens by 500 (max tokens per multicast)
	_, err = r.FCMClient.SendMulticast(ctx, &fcm.MulticastMessage{
		Tokens: fcmTokens,
		Data: map[string]string{
			"type":         gqlmodel.PushNotificationTypeInvitationAccepted.String(),
			"invitationId": invitationID.String(),
		},
		Notification: &fcm.Notification{
			Body: fmt.Sprintf("%sさんがおさそいを承諾しました。", acceptedUserProfile.Nickname),
		},
		Android: &fcm.AndroidConfig{
			Priority: "high",
		},
	})
	if err != nil {
		logging.Logger(ctx).Error(err.Error(), zap.String("invitationId", invitationID.String()))
	}

	dbInvitation, err := r.DB.Invitation.Get(ctx, invitationID)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.AcceptInvitationPayload{Invitation: conv.ConvertFromDBInvitation(dbInvitation)}, nil
}

// DenyInvitation is the resolver for the denyInvitation field.
func (r *mutationResolver) DenyInvitation(ctx context.Context, invitationID uuid.UUID) (*gqlmodel.DenyInvitationPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)

	isAuthUserInvited, err := IsAuthUserIncludedInTheInvitation(ctx, r.DB, invitationID)
	if err != nil {
		return nil, err
	}
	if !isAuthUserInvited {
		return nil, xerrors.NewErrNotFound(fmt.Errorf("invitation %q not found", invitationID))
	}

	// TODO: Should we check if user already accepted?
	err = r.DB.InvitationDenial.Create().
		SetInvitationID(invitationID).
		SetUserID(authUserID).
		Exec(ctx)
	if err != nil {
		return nil, err
	}

	dbInvitation, err := r.DB.Invitation.Get(ctx, invitationID)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.DenyInvitationPayload{Invitation: conv.ConvertFromDBInvitation(dbInvitation)}, nil
}

// RegisterInvitationAwaiting is the resolver for the registerInvitationAwaiting field.
func (r *mutationResolver) RegisterInvitationAwaiting(ctx context.Context, input gqlmodel.RegisterInvitationAwaitingInput) (*gqlmodel.RegisterInvitationAwaitingPayload, error) {
	now := time.Now()
	if input.EndsAt.Before(now) {
		return nil, xerrors.NewErrInvalidArgument(errors.New("endsAt must be future date time"))
	}
	if input.EndsAt.Before(input.StartsAt) {
		return nil, xerrors.NewErrInvalidArgument(errors.New("endsAt must be after startsAt"))
	}

	authUserID := auth.GetCurrentUserID(ctx)
	overlappingInvitationAwaitingExists, err := r.DB.InvitationAwaiting.Query().
		Where(
			invitationawaiting.UserID(authUserID),
			invitationawaiting.StartsAtLT(input.EndsAt),
			invitationawaiting.EndsAtGT(input.StartsAt),
		).Exist(ctx)
	if err != nil {
		return nil, err
	}
	if overlappingInvitationAwaitingExists {
		return nil, xerrors.New(errors.New("conflicting with existing invitation awaitings"), gqlmodel.ErrorCodeAlreadyExists)
	}

	dbInvitationAwaiting, err := r.DB.InvitationAwaiting.Create().
		SetUserID(authUserID).
		SetStartsAt(input.StartsAt).
		SetEndsAt(input.EndsAt).
		SetComment(input.Comment).
		Save(ctx)
	if err != nil {
		return nil, err
	}

	// TODO: Send notification async
	userProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	friendUserIDs, err := r.DB.User.Query().
		Where(user.ID(authUserID)).
		QueryFriendUsers().
		IDs(ctx)
	if err != nil {
		return nil, err
	}
	targetUserPushNotificationTokens, err := r.DBQuery.Notification.GetNotifiableFriendUserPushTokens(ctx, authUserID, friendUserIDs)
	// TODO: Chunk tokens by 500 (max tokens per multicast)
	// TODO: delete expired tokens
	if len(targetUserPushNotificationTokens) > 0 {
		_, err = r.FCMClient.SendMulticast(ctx, &fcm.MulticastMessage{
			Tokens: targetUserPushNotificationTokens,
			Data: map[string]string{
				"type":                 gqlmodel.PushNotificationTypeInvitationAwaitingReceived.String(),
				"invitationAwaitingId": dbInvitationAwaiting.ID.String(),
			},
			Notification: &fcm.Notification{
				Body: fmt.Sprintf("%sさんが、%s以降のおさそいを待っています。", userProfile.Nickname, dbInvitationAwaiting.StartsAt.In(timeutil.JST).Format("1月2日 15時04分")),
			},
			Android: &fcm.AndroidConfig{
				Priority: "high",
			},
		})
		if err != nil {
			logging.Logger(ctx).Error(err.Error(), zap.String("invitationAwaitingId", dbInvitationAwaiting.ID.String()))
		}
	}

	return &gqlmodel.RegisterInvitationAwaitingPayload{InvitationAwaiting: conv.ConvertFromDBInvitationAwaiting(dbInvitationAwaiting)}, nil
}

// DeleteInvitationAwaiting is the resolver for the deleteInvitationAwaiting field.
func (r *mutationResolver) DeleteInvitationAwaiting(ctx context.Context, invitationAwaitingID uuid.UUID) (*gqlmodel.DeleteInvitationAwaitingPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.InvitationAwaiting.Delete().
		Where(invitationawaiting.ID(invitationAwaitingID), invitationawaiting.UserID(authUserID)).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.DeleteInvitationAwaitingPayload{DeletedInvitationAwaitingID: invitationAwaitingID}, nil
}

// Invitation is the resolver for the invitation field.
func (r *queryResolver) Invitation(ctx context.Context, id uuid.UUID) (*gqlmodel.Invitation, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbInvitation, err := r.DB.Invitation.Get(ctx, id)
	if err != nil {
		if ent.IsNotFound(err) {
			return nil, xerrors.NewErrNotFound(fmt.Errorf("invitation %q not found", id))
		}
		return nil, err
	}

	isAuthUserInvited, err := IsAuthUserIncludedInTheInvitation(ctx, r.DB, id)
	if err != nil {
		return nil, err
	}
	if authUserID != dbInvitation.UserID && !isAuthUserInvited {
		return nil, xerrors.NewErrNotFound(fmt.Errorf("invitation %q not found", id))
	}

	return conv.ConvertFromDBInvitation(dbInvitation), nil
}

// Invitation returns gqlgen.InvitationResolver implementation.
func (r *Resolver) Invitation() gqlgen.InvitationResolver { return &invitationResolver{r} }

// InvitationAwaiting returns gqlgen.InvitationAwaitingResolver implementation.
func (r *Resolver) InvitationAwaiting() gqlgen.InvitationAwaitingResolver {
	return &invitationAwaitingResolver{r}
}

type invitationResolver struct{ *Resolver }
type invitationAwaitingResolver struct{ *Resolver }
