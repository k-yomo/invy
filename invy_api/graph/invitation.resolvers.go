package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.22

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql"
	fcm "firebase.google.com/go/v4/messaging"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/invitationfriendgroup"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/usermute"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/pgutil"
	"github.com/k-yomo/invy/pkg/sliceutil"
	"github.com/twpayne/go-geom"
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

// SendInvitation is the resolver for the sendInvitation field.
func (r *mutationResolver) SendInvitation(ctx context.Context, input *gqlmodel.SendInvitationInput) (*gqlmodel.SendInvitationPayload, error) {
	now := time.Now()
	if input.ExpiresAt.Before(now) {
		return nil, errors.New("expiration time must be future date time")
	}
	authUserID := auth.GetCurrentUserID(ctx)

	coordinate := pgutil.GeoPoint{
		Point: geom.NewPoint(geom.XY).
			MustSetCoords(geom.Coord{input.Latitude, input.Longitude}).
			SetSRID(4326),
	}

	var dbInvitation *ent.Invitation
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		var err error
		dbInvitation, err = tx.Invitation.Create().
			SetUserID(authUserID).
			SetLocation(input.Location).
			SetCoordinate(&coordinate).
			SetComment(input.Comment).
			SetStartsAt(input.StartsAt).
			SetExpiresAt(input.ExpiresAt).
			Save(ctx)
		if err != nil {
			return err
		}
		invitationFriendGroupCreates := make([]*ent.InvitationFriendGroupCreate, 0, len(input.TargetFriendGroupIds))
		for _, targetFriendGroupID := range input.TargetFriendGroupIds {
			invitationFriendGroupCreates = append(
				invitationFriendGroupCreates,
				tx.InvitationFriendGroup.Create().
					SetInvitationID(dbInvitation.ID).
					SetFriendGroupID(targetFriendGroupID),
			)
		}
		err = tx.InvitationFriendGroup.CreateBulk(invitationFriendGroupCreates...).Exec(ctx)
		if err != nil {
			return err
		}
		// TODO: We may need to check if they are friends
		invitationUserCreates := make([]*ent.InvitationUserCreate, 0, len(input.TargetFriendUserIds))
		for _, targetUserID := range input.TargetFriendUserIds {
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
	whereNotMutedUser := func(s *sql.Selector) {
		userMuteTable := sql.Table(usermute.Table)
		s.Where(
			sql.NotExists(
				sql.Select().
					From(userMuteTable).
					Where(
						sql.And(
							sql.ColumnsEQ(userMuteTable.C(usermute.FieldUserID), s.C(user.FieldID)),
							sql.EQ(userMuteTable.C(usermute.FieldMuteUserID), authUserID),
						),
					),
			),
		)
	}
	targetGroupUserPushNotificationTokens, err := r.DB.InvitationFriendGroup.Query().
		Where(invitationfriendgroup.FriendGroupIDIn(input.TargetFriendGroupIds...)).
		QueryFriendGroup().
		QueryUserFriendGroups().
		QueryUser().
		Where(whereNotMutedUser).
		QueryPushNotificationTokens().
		All(ctx)
	if err != nil {
		return nil, err
	}
	targetUserPushNotificationTokens, err := r.DB.User.Query().
		Where(
			user.IDIn(input.TargetFriendUserIds...),
			whereNotMutedUser,
		).
		QueryPushNotificationTokens().
		All(ctx)
	if err != nil {
		return nil, err
	}
	dedupedPushNotificationTokens := sliceutil.Dedup(append(targetGroupUserPushNotificationTokens, targetUserPushNotificationTokens...))
	fcmTokens := convutil.ConvertToList(dedupedPushNotificationTokens, func(from *ent.PushNotificationToken) string {
		return from.FcmToken
	})
	// TODO: Chunk tokens by 500 (max tokens per multicast)
	// TODO: delete expired tokens
	_, err = r.FCMClient.SendMulticast(ctx, &fcm.MulticastMessage{
		Tokens: fcmTokens,
		Data: map[string]string{
			"type":         gqlmodel.PushNotificationTypeInvitationReceived.String(),
			"invitationId": dbInvitation.ID.String(),
		},
		Notification: &fcm.Notification{
			Body: fmt.Sprintf("%sさんから、%s開催のさそいが届きました。", inviterProfile.Nickname, dbInvitation.Location),
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
		return nil, fmt.Errorf("invitation %q not found", invitationID)
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
			Body: fmt.Sprintf("%sさんがさそいを承諾しました。", acceptedUserProfile.Nickname),
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
		return nil, fmt.Errorf("invitation %q not found", invitationID)
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

// Invitation returns gqlgen.InvitationResolver implementation.
func (r *Resolver) Invitation() gqlgen.InvitationResolver { return &invitationResolver{r} }

type invitationResolver struct{ *Resolver }
