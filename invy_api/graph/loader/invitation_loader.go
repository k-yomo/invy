package loader

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"github.com/graph-gophers/dataloader/v7"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
)

func NewInvitationAcceptedUserProfilesLoader(db *ent.Client) func(context.Context, []uuid.UUID) []*dataloader.Result[ent.UserProfiles] {
	return func(ctx context.Context, invitationIDs []uuid.UUID) []*dataloader.Result[ent.UserProfiles] {
		if len(invitationIDs) == 0 {
			return nil
		}
		invitationAcceptances, err := db.InvitationAcceptance.Query().
			Where(invitationacceptance.InvitationIDIn(invitationIDs...)).
			WithUser(func(userQuery *ent.UserQuery) {
				userQuery.WithUserProfile()
			}).
			All(ctx)
		if err != nil {
			return convertToErrorResults[ent.UserProfiles](fmt.Errorf("load accepted user: %w", err), len(invitationIDs))
		}
		invitationIDProfileMap := map[uuid.UUID]ent.UserProfiles{}
		for _, ia := range invitationAcceptances {
			invitationIDProfileMap[ia.InvitationID] = append(invitationIDProfileMap[ia.InvitationID], ia.Edges.User.Edges.UserProfile)
		}
		return convertToResults[uuid.UUID, ent.UserProfiles](invitationIDs, invitationIDProfileMap)
	}
}
