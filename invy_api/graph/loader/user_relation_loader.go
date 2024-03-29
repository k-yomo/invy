package loader

import (
	"context"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql"

	"github.com/google/uuid"
	"github.com/graph-gophers/dataloader/v7"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/friendship"
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/userblock"
	"github.com/k-yomo/invy/invy_api/ent/userlocation"
	"github.com/k-yomo/invy/invy_api/ent/usermute"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/pgutil"
)

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

type UserBlockKey struct {
	UserID      uuid.UUID
	BlockUserID uuid.UUID
}

func NewUserBlockLoader(db *ent.Client) func(context.Context, []UserBlockKey) []*dataloader.Result[*ent.UserBlock] {
	return func(ctx context.Context, keys []UserBlockKey) []*dataloader.Result[*ent.UserBlock] {
		if len(keys) == 0 {
			return nil
		}
		userID := keys[0].UserID
		userIDs := convutil.ConvertToList(keys, func(from UserBlockKey) uuid.UUID {
			return from.BlockUserID
		})
		userBlocks, err := db.UserBlock.Query().
			Where(userblock.UserID(userID), userblock.BlockUserIDIn(userIDs...)).
			All(ctx)
		if err != nil {
			return convertToErrorResults[*ent.UserBlock](fmt.Errorf("load user mute: %w", err), len(userIDs))
		}
		userIDBlockMap := map[uuid.UUID]*ent.UserBlock{}
		for _, um := range userBlocks {
			userIDBlockMap[um.BlockUserID] = um
		}
		return convertToResults(userIDs, userIDBlockMap)
	}
}

// NewFriendGeoPointLoader loads the latest geo point of the friend
// WARN: Please carefully use the returned geo point, because it's PII.
func NewFriendGeoPointLoader(db *ent.Client) func(context.Context, []uuid.UUID) []*dataloader.Result[*pgutil.GeoPoint] {
	return func(ctx context.Context, userIDs []uuid.UUID) []*dataloader.Result[*pgutil.GeoPoint] {
		if len(userIDs) == 0 {
			return nil
		}

		authUserID := auth.GetCurrentUserID(ctx)
		friendLocations, err := db.Debug().Friendship.Query().
			Where(
				friendship.UserID(authUserID),
				func(s *sql.Selector) {
					userBlockTable := sql.Table(userblock.Table)
					s.Where(
						// Do not return user's location who blocks auth user
						sql.NotExists(
							sql.Select().
								From(userBlockTable).
								Where(
									sql.And(
										sql.ColumnsEQ(userBlockTable.C(userblock.FieldUserID), s.C(friendship.FieldFriendUserID)),
										sql.EQ(userBlockTable.C(userblock.FieldBlockUserID), authUserID),
									),
								),
						),
					)
				},
			).
			QueryFriendUser().
			QueryUserLocation().
			Where(
				userlocation.UpdatedAtGTE(time.Now().Add(-3 * time.Hour)),
			).
			All(ctx)
		if err != nil {
			return convertToErrorResults[*pgutil.GeoPoint](fmt.Errorf("load user locations: %w", err), len(userIDs))
		}
		friendUserIDCoordinateMap := map[uuid.UUID]*pgutil.GeoPoint{}
		for _, fl := range friendLocations {
			friendUserIDCoordinateMap[fl.UserID] = fl.Coordinate
		}

		results := make([]*dataloader.Result[*pgutil.GeoPoint], 0, len(userIDs))
		for _, userID := range userIDs {
			friendCoordinate := friendUserIDCoordinateMap[userID]
			results = append(results, &dataloader.Result[*pgutil.GeoPoint]{Data: friendCoordinate})
		}
		return results
	}
}
