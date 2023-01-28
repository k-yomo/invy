package graph

import (
	"context"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
)

func IsAuthUserIncludedInTheInvitation(ctx context.Context, dbClient *ent.Client, invitationID uuid.UUID) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	invited, err := dbClient.InvitationUser.Query().
		Where(invitationuser.InvitationID(invitationID), invitationuser.UserID(authUserID)).
		Exist(ctx)
	if err != nil {
		return false, err
	}
	return invited, nil
}
