package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"
	"fmt"
	"time"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/pkg/convutil"
)

// AcceptedUsers is the resolver for the acceptedUsers field.
func (r *invitationResolver) AcceptedUsers(ctx context.Context, obj *gqlmodel.Invitation) ([]*gqlmodel.User, error) {
	dbAcceptedUserProfiles, err := loader.Get(ctx).InvitationAcceptedUserProfiles.Load(ctx, obj.ID)()
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(dbAcceptedUserProfiles, conv.ConvertFromDBUserProfile), nil
}

// SendInvitation is the resolver for the sendInvitation field.
func (r *mutationResolver) SendInvitation(ctx context.Context, input *gqlmodel.SendInvitationInput) (*gqlmodel.Invitation, error) {
	now := time.Now()
	if input.ExpiresAt.Before(now) {
		return nil, errors.New("expiration time must be future date time")
	}
	authUserID := auth.GetCurrentUserID(ctx)
	var dbInvitation *ent.Invitation
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		var err error
		dbInvitation, err = tx.Invitation.Create().
			SetUserID(authUserID).
			SetLocation(input.Location).
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
	// TODO: Notification to invited users
	return conv.ConvertFromDBInvitation(dbInvitation), nil
}

// AcceptInvitation is the resolver for the acceptInvitation field.
func (r *mutationResolver) AcceptInvitation(ctx context.Context, invitationID uuid.UUID) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)

	isAuthUserInvited, err := IsAuthUserIncludedInTheInvitation(ctx, r.DB, invitationID)
	if err != nil {
		return false, err
	}
	if !isAuthUserInvited {
		return false, fmt.Errorf("invitation %q not found", invitationID)
	}

	// TODO: Should we check if user already denied?
	err = r.DB.InvitationAcceptance.Create().
		SetInvitationID(invitationID).
		SetUserID(authUserID).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	// TODO: notification
	return true, nil
}

// DenyInvitation is the resolver for the denyInvitation field.
func (r *mutationResolver) DenyInvitation(ctx context.Context, invitationID uuid.UUID) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)

	isAuthUserInvited, err := IsAuthUserIncludedInTheInvitation(ctx, r.DB, invitationID)
	if err != nil {
		return false, err
	}
	if !isAuthUserInvited {
		return false, fmt.Errorf("invitation %q not found", invitationID)
	}

	// TODO: Should we check if user already accepted?
	err = r.DB.InvitationDenial.Create().
		SetInvitationID(invitationID).
		SetUserID(authUserID).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// Invitation returns gqlgen.InvitationResolver implementation.
func (r *Resolver) Invitation() gqlgen.InvitationResolver { return &invitationResolver{r} }

type invitationResolver struct{ *Resolver }
