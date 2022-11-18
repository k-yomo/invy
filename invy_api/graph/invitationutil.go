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
	authUserID := auth.GetUserID(ctx)
	_, invitationUserErr := dbClient.InvitationUser.Query().
		Where(invitationuser.ID(invitationID), invitationuser.UserID(authUserID)).
		Only(ctx)
	if invitationUserErr != nil && !ent.IsNotFound(invitationUserErr) {
		return false, invitationUserErr
	}
	_, invitationFriendGroupErr := dbClient.InvitationFriendGroup.Query().
		Where(invitationfriendgroup.InvitationID(invitationID)).
		QueryFriendGroup().
		QueryUserFriendGroups().
		Where(userfriendgroup.UserID(authUserID)).
		Only(ctx)
	if invitationFriendGroupErr != nil && !ent.IsNotFound(invitationFriendGroupErr) {
		return false, invitationFriendGroupErr
	}

	// user is not included in the invitation list
	if ent.IsNotFound(invitationUserErr) && ent.IsNotFound(invitationFriendGroupErr) {
		return false, nil
	}

	return true, nil
}
