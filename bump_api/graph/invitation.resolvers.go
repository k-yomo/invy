package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"
	"fmt"
	"sort"
	"time"

	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/auth"
	"github.com/k-yomo/bump/bump_api/ent/invitation"
	"github.com/k-yomo/bump/bump_api/ent/invitationacceptance"
	"github.com/k-yomo/bump/bump_api/ent/invitationuser"
	"github.com/k-yomo/bump/bump_api/ent/userfriendgroup"
	"github.com/k-yomo/bump/bump_api/graph/conv"
	"github.com/k-yomo/bump/bump_api/graph/gqlmodel"
	"github.com/k-yomo/bump/pkg/convutil"
	"github.com/k-yomo/bump/pkg/sliceutil"
)

// SendInvitation is the resolver for the sendInvitation field.
func (r *mutationResolver) SendInvitation(ctx context.Context, input *gqlmodel.SendInvitationInput) (*gqlmodel.Invitation, error) {
	now := time.Now()
	if input.ExpiresAt.Before(now) {
		return nil, errors.New("expiration time must be future date time")
	}
	if input.StartsAt.Before(now) {
		return nil, errors.New("start time must be future date time")
	}
	authUserID := auth.GetUserID(ctx)
	dbInvitation, err := r.DBClient.Invitation.Create().
		SetUserID(authUserID).
		SetLocation(input.Location).
		SetComment(input.Comment).
		SetStartsAt(input.StartsAt).
		SetExpiresAt(input.ExpiresAt).
		AddInvitationUserIDs(input.TargetFriendUserIds...).
		AddInvitationFriendGroupIDs(input.TargetFriendUserIds...).
		Save(ctx)
	if err != nil {
		return nil, err
	}
	// TODO: Notification to invited users
	return conv.ConvertFromDBInvitation(dbInvitation), nil
}

// AcceptInvitation is the resolver for the acceptInvitation field.
func (r *mutationResolver) AcceptInvitation(ctx context.Context, invitationID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)

	isAuthUserInvited, err := IsAuthUserIncludedInTheInvitation(ctx, r.DBClient, invitationID)
	if err != nil {
		return false, err
	}
	if !isAuthUserInvited {
		return false, fmt.Errorf("invitation %q not found", invitationID)
	}

	// TODO: Should we check if user already denied?
	err = r.DBClient.InvitationAcceptance.Create().
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
	authUserID := auth.GetUserID(ctx)

	isAuthUserInvited, err := IsAuthUserIncludedInTheInvitation(ctx, r.DBClient, invitationID)
	if err != nil {
		return false, err
	}
	if !isAuthUserInvited {
		return false, fmt.Errorf("invitation %q not found", invitationID)
	}

	// TODO: Should we check if user already accepted?
	err = r.DBClient.InvitationDenial.Create().
		SetInvitationID(invitationID).
		SetUserID(authUserID).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// PendingInvitations is the resolver for the pendingInvitations field.
func (r *queryResolver) PendingInvitations(ctx context.Context) ([]*gqlmodel.Invitation, error) {
	authUserID := auth.GetUserID(ctx)
	now := time.Now()
	dbInvitationsToUser, err := r.DBClient.InvitationUser.Query().
		Where(invitationuser.UserID(authUserID)).
		QueryInvitation().
		Where(invitation.ExpiresAtGTE(now)).
		All(ctx)
	if err != nil {
		return nil, err
	}

	dbInvitationsToGroup, err := r.DBClient.UserFriendGroup.Query().
		Where(userfriendgroup.UserID(authUserID)).
		QueryFriendGroup().
		QueryInvitationFriendGroups().
		QueryInvitation().
		Where(invitation.ExpiresAtGTE(now)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	invitations := sliceutil.MergeNodes(
		convutil.ConvertToList(dbInvitationsToUser, conv.ConvertFromDBInvitation),
		convutil.ConvertToList(dbInvitationsToGroup, conv.ConvertFromDBInvitation),
	)

	// sort by expiration time ASC
	sort.Slice(invitations, func(i, j int) bool {
		return invitations[i].ExpiresAt.Before(invitations[j].ExpiresAt)
	})

	return invitations, nil
}

// AcceptedInvitations is the resolver for the acceptedInvitations field.
func (r *queryResolver) AcceptedInvitations(ctx context.Context) ([]*gqlmodel.Invitation, error) {
	authUserID := auth.GetUserID(ctx)
	dbInvitations, err := r.DBClient.InvitationAcceptance.Query().
		Where(invitationacceptance.UserID(authUserID)).
		QueryInvitation().
		Where(invitation.StartsAtGTE(time.Now().Add(-12 * time.Hour))). // Do not show the old(started before 12H ago) invitations
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(dbInvitations, conv.ConvertFromDBInvitation), nil
}
