package graph

import (
	"context"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/invitationfriendgroup"
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
	"github.com/k-yomo/invy/invy_api/ent/userfriendgroup"
)

func IsAuthUserIncludedInTheInvitation(ctx context.Context, dbClient *ent.Client, invitationID uuid.UUID) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	invitationUserExists, err := dbClient.InvitationUser.Query().
		Where(invitationuser.InvitationID(invitationID), invitationuser.UserID(authUserID)).
		Exist(ctx)
	if err != nil {
		return false, err
	}
	invitationFriendGroupExists, err := dbClient.InvitationFriendGroup.Query().
		Where(invitationfriendgroup.InvitationID(invitationID)).
		QueryFriendGroup().
		QueryUserFriendGroups().
		Where(userfriendgroup.UserID(authUserID)).
		Exist(ctx)
	if err != nil {
		return false, err
	}

	invited := invitationUserExists || invitationFriendGroupExists
	return invited, nil
}
