package graph

import (
	"context"

	"github.com/cockroachdb/errors"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
	"github.com/k-yomo/invy/invy_api/internal/auth"
)

func CanAuthUserRespondToInvitation(ctx context.Context, dbClient *ent.Client, invitationID uuid.UUID) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	canRespond, err := dbClient.Invitation.Query().
		Where(
			invitation.ID(invitationID),
			invitation.StatusEQ(invitation.StatusActive),
		).
		QueryInvitationUsers().
		Where(invitationuser.UserID(authUserID)).
		Exist(ctx)
	if err != nil {
		return false, err
	}
	return canRespond, nil
}

func IsAuthUserIncludedInTheInvitation(ctx context.Context, dbClient *ent.Client, invitationID uuid.UUID) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	invited, err := dbClient.Invitation.Query().
		Where(
			invitation.ID(invitationID),
			invitation.StatusIn(invitation.StatusActive, invitation.StatusClosed),
		).
		QueryInvitationUsers().
		Where(invitationuser.UserID(authUserID)).
		Exist(ctx)
	if err != nil {
		return false, errors.Wrap(err, "check if user is invited")
	}
	return invited, nil
}
