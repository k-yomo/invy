package loader

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"github.com/graph-gophers/dataloader/v7"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/friendship"
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/usermute"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/pkg/convutil"
)

type Loaders struct {
	UserProfile                    *dataloader.Loader[uuid.UUID, *ent.UserProfile]
	Friendship                     *dataloader.Loader[FriendshipKey, *ent.Friendship]
	FriendshipRequest              *dataloader.Loader[FriendshipRequestKey, *ent.FriendshipRequest]
	UserMute                       *dataloader.Loader[UserMuteKey, *ent.UserMute]
	InvitationAcceptedUserProfiles *dataloader.Loader[uuid.UUID, []*ent.UserProfile]
}

func NewLoaders(db *ent.Client) *Loaders {
	return &Loaders{
		UserProfile: dataloader.NewBatchedLoader(
			NewUserProfileLoader(db),
			dataloader.WithCache[uuid.UUID, *ent.UserProfile](&dataloader.NoCache[uuid.UUID, *ent.UserProfile]{}),
		),
		Friendship: dataloader.NewBatchedLoader(
			NewFriendshipLoader(db),
			dataloader.WithCache[FriendshipKey, *ent.Friendship](&dataloader.NoCache[FriendshipKey, *ent.Friendship]{}),
		),
		FriendshipRequest: dataloader.NewBatchedLoader(
			NewFriendshipRequestLoader(db),
			dataloader.WithCache[FriendshipRequestKey, *ent.FriendshipRequest](&dataloader.NoCache[FriendshipRequestKey, *ent.FriendshipRequest]{}),
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
			return convertToErrorResults[*ent.UserProfile](fmt.Errorf("load user profile: %w", err), len(userIDs))
		}
		userIDProfileMap := map[uuid.UUID]*ent.UserProfile{}
		for _, up := range userProfiles {
			userIDProfileMap[up.UserID] = up
		}
		return convertToResults(userIDs, userIDProfileMap)
	}
}

type FriendshipKey struct {
	UserID       uuid.UUID
	FriendUserID uuid.UUID
}

func NewFriendshipLoader(db *ent.Client) func(context.Context, []FriendshipKey) []*dataloader.Result[*ent.Friendship] {
	return func(ctx context.Context, keys []FriendshipKey) []*dataloader.Result[*ent.Friendship] {
		if len(keys) == 0 {
			return nil
		}
		userID := keys[0].UserID
		friendUserIDs := convutil.ConvertToList(keys, func(from FriendshipKey) uuid.UUID {
			return from.FriendUserID
		})
		dbFriendships, err := db.Friendship.Query().
			Where(friendship.UserID(userID), friendship.FriendUserIDIn(friendUserIDs...)).
			All(ctx)
		if err != nil {
			return convertToErrorResults[*ent.Friendship](fmt.Errorf("load friendship: %w", err), len(friendUserIDs))
		}
		friendUserIDFriendshipMap := map[uuid.UUID]*ent.Friendship{}
		for _, f := range dbFriendships {
			friendUserIDFriendshipMap[f.FriendUserID] = f
		}
		return convertToResults(friendUserIDs, friendUserIDFriendshipMap)
	}
}

type FriendshipRequestKey struct {
	FromUserID uuid.UUID
	ToUserID   uuid.UUID
}

func NewFriendshipRequestLoader(db *ent.Client) func(context.Context, []FriendshipRequestKey) []*dataloader.Result[*ent.FriendshipRequest] {
	return func(ctx context.Context, keys []FriendshipRequestKey) []*dataloader.Result[*ent.FriendshipRequest] {
		if len(keys) == 0 {
			return nil
		}
		fromUserID := keys[0].FromUserID
		toUserIDs := convutil.ConvertToList(keys, func(key FriendshipRequestKey) uuid.UUID {
			return key.ToUserID
		})
		dbFriendships, err := db.FriendshipRequest.Query().
			Where(friendshiprequest.FromUserID(fromUserID), friendshiprequest.ToUserIDIn(toUserIDs...)).
			All(ctx)
		if err != nil {
			return convertToErrorResults[*ent.FriendshipRequest](fmt.Errorf("load friendship request: %w", err), len(toUserIDs))
		}
		toUserIDFriendshipRequestMap := map[uuid.UUID]*ent.FriendshipRequest{}
		for _, f := range dbFriendships {
			toUserIDFriendshipRequestMap[f.ToUserID] = f
		}
		return convertToResults(toUserIDs, toUserIDFriendshipRequestMap)
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
			return convertToErrorResults[*ent.UserMute](fmt.Errorf("load user mute: %w", err), len(muteUserIDs))
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
			return convertToErrorResults[[]*ent.UserProfile](fmt.Errorf("load accepted user: %w", err), len(invitationIDs))
		}
		invitationIDProfileMap := map[uuid.UUID][]*ent.UserProfile{}
		for _, ia := range invitationAcceptances {
			invitationIDProfileMap[ia.InvitationID] = append(invitationIDProfileMap[ia.InvitationID], ia.Edges.User.Edges.UserProfile)
		}
		return convertToResults[uuid.UUID, []*ent.UserProfile](invitationIDs, invitationIDProfileMap)
	}
}
