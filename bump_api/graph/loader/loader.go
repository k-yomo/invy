package loader

import (
	"context"

	"github.com/google/uuid"
	"github.com/graph-gophers/dataloader/v7"
	"github.com/k-yomo/bump/bump_api/ent"
	"github.com/k-yomo/bump/bump_api/ent/invitationacceptance"
	"github.com/k-yomo/bump/bump_api/ent/usermute"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
	"github.com/k-yomo/bump/pkg/convutil"
)

type Loaders struct {
	UserProfile                    *dataloader.Loader[uuid.UUID, *ent.UserProfile]
	UserMute                       *dataloader.Loader[UserMuteKey, *ent.UserMute]
	InvitationAcceptedUserProfiles *dataloader.Loader[uuid.UUID, []*ent.UserProfile]
}

func NewLoaders(db *ent.Client) *Loaders {
	return &Loaders{
		UserProfile: dataloader.NewBatchedLoader(
			NewUserProfileLoader(db),
			dataloader.WithCache[uuid.UUID, *ent.UserProfile](&dataloader.NoCache[uuid.UUID, *ent.UserProfile]{}),
		),
		UserMute: dataloader.NewBatchedLoader(
			NewUserMuteLoader(db),
			dataloader.WithCache[UserMuteKey, *ent.UserMute](&dataloader.NoCache[UserMuteKey, *ent.UserMute]{}),
		),
		InvitationAcceptedUserProfiles: dataloader.NewBatchedLoader(
			NewInvitationAcceptedUserProfileLoader(db),
			dataloader.WithCache[uuid.UUID, []*ent.UserProfile](&dataloader.NoCache[uuid.UUID, []*ent.UserProfile]{}),
		),
	}
}

func NewUserProfileLoader(db *ent.Client) func(context.Context, []uuid.UUID) []*dataloader.Result[*ent.UserProfile] {
	return func(ctx context.Context, userIDs []uuid.UUID) []*dataloader.Result[*ent.UserProfile] {
		if len(userIDs) == 0 {
			return nil
		}
		userProfiles, err := db.UserProfile.Query().
			Where(userprofile.UserIDIn(userIDs...)).
			All(ctx)
		if err != nil {
			return convertToErrorResults[*ent.UserProfile](err, len(userIDs))
		}
		userIDProfileMap := map[uuid.UUID]*ent.UserProfile{}
		for _, up := range userProfiles {
			userIDProfileMap[up.UserID] = up
		}
		return convertToResults(userIDs, userIDProfileMap)
	}
}

type UserMuteKey struct {
	UserID     uuid.UUID
	MuteUserID uuid.UUID
}

func NewUserMuteLoader(db *ent.Client) func(context.Context, []UserMuteKey) []*dataloader.Result[*ent.UserMute] {
	return func(ctx context.Context, keys []UserMuteKey) []*dataloader.Result[*ent.UserMute] {
		if len(keys) == 0 {
			return nil
		}
		userID := keys[0].UserID
		muteUserIDs := convutil.ConvertToList(keys, func(from UserMuteKey) uuid.UUID {
			return from.MuteUserID
		})
		userMutes, err := db.UserMute.Query().
			Where(usermute.UserID(userID), usermute.MuteUserIDIn(muteUserIDs...)).
			All(ctx)
		if err != nil {
			return convertToErrorResults[*ent.UserMute](err, len(muteUserIDs))
		}
		muteUserIDMuteMap := map[uuid.UUID]*ent.UserMute{}
		for _, um := range userMutes {
			muteUserIDMuteMap[um.MuteUserID] = um
		}
		return convertToResults(muteUserIDs, muteUserIDMuteMap)
	}
}

func NewInvitationAcceptedUserProfileLoader(db *ent.Client) func(context.Context, []uuid.UUID) []*dataloader.Result[[]*ent.UserProfile] {
	return func(ctx context.Context, invitationIDs []uuid.UUID) []*dataloader.Result[[]*ent.UserProfile] {
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
			return convertToErrorResults[[]*ent.UserProfile](err, len(invitationIDs))
		}
		invitationIDProfileMap := map[uuid.UUID][]*ent.UserProfile{}
		for _, ia := range invitationAcceptances {
			invitationIDProfileMap[ia.InvitationID] = append(invitationIDProfileMap[ia.InvitationID], ia.Edges.User.Edges.UserProfile)
		}
		return convertToResults[uuid.UUID, []*ent.UserProfile](invitationIDs, invitationIDProfileMap)
	}
}
