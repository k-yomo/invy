package loader

import (
	"context"
	"fmt"
	"time"

	"github.com/google/uuid"
	"github.com/graph-gophers/dataloader/v7"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/invitationawaiting"
	"github.com/k-yomo/invy/invy_api/internal/auth"
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

func NewInvitationAwaitingsLoader(db *ent.Client) func(context.Context, []uuid.UUID) []*dataloader.Result[ent.InvitationAwaitings] {
	return func(ctx context.Context, userIDs []uuid.UUID) []*dataloader.Result[ent.InvitationAwaitings] {
		if len(userIDs) == 0 {
			return nil
		}

		authUserID := auth.GetCurrentUserID(ctx)
		friendshipLoaderKeys := make([]FriendshipKey, 0, len(userIDs))
		for _, userID := range userIDs {
			friendshipLoaderKeys = append(friendshipLoaderKeys, FriendshipKey{UserID: authUserID, FriendUserID: userID})
		}
		friendshipLoaderResults := NewFriendshipLoader(db)(ctx, friendshipLoaderKeys)
		friendUserIDs := make([]uuid.UUID, 0, len(userIDs))
		for _, result := range friendshipLoaderResults {
			if result.Error == nil {
				friendUserIDs = append(friendUserIDs, result.Data.FriendUserID)
			}
		}

		now := time.Now()
		invitationAwaitings, err := db.InvitationAwaiting.Query().
			Where(
				invitationawaiting.UserIDIn(friendUserIDs...),
				invitationawaiting.Or(
					invitationawaiting.And(
						invitationawaiting.StartsAtLTE(now),
						invitationawaiting.EndsAtGTE(now),
					),
					invitationawaiting.StartsAtGTE(now),
				),
			).
			Order(ent.Asc(invitationawaiting.FieldStartsAt), ent.Asc(invitationawaiting.FieldEndsAt)).
			All(ctx)
		if err != nil {
			return convertToErrorResults[ent.InvitationAwaitings](fmt.Errorf("load accepted user: %w", err), len(userIDs))
		}
		userIDInvitationAwaitingsMap := map[uuid.UUID]ent.InvitationAwaitings{}
		for _, ia := range invitationAwaitings {
			userIDInvitationAwaitingsMap[ia.UserID] = append(userIDInvitationAwaitingsMap[ia.UserID], ia)
		}
		return convertToResults[uuid.UUID, ent.InvitationAwaitings](userIDs, userIDInvitationAwaitingsMap)
	}
}
