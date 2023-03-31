package loader

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"github.com/graph-gophers/dataloader/v7"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
)

func NewUserProfileLoader(db *ent.Client) func(context.Context, []uuid.UUID) []*dataloader.Result[*ent.UserProfile] {
	return func(ctx context.Context, userIDs []uuid.UUID) []*dataloader.Result[*ent.UserProfile] {
		if len(userIDs) == 0 {
			return nil
		}
		userProfiles, err := db.UserProfile.Query().
			Where(userprofile.UserIDIn(userIDs...)).
			All(ctx)
		if err != nil {
			return convertToErrorResults[*ent.UserProfile](fmt.Errorf("load user profile: %w", err), len(userIDs))
		}
		userIDProfileMap := map[uuid.UUID]*ent.UserProfile{}
		for _, up := range userProfiles {
			userIDProfileMap[up.UserID] = up
		}
		return convertToResults(userIDs, userIDProfileMap)
	}
}
