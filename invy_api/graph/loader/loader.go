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
	"github.com/k-yomo/invy/invy_api/ent/userlocation"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/pkg/length"
	"github.com/k-yomo/invy/pkg/location"
	"github.com/k-yomo/invy/pkg/pgutil"
)

type Loaders struct {
	UserProfile                    *dataloader.Loader[uuid.UUID, *ent.UserProfile]
	Friendship                     *dataloader.Loader[FriendshipKey, *ent.Friendship]
	FriendshipRequest              *dataloader.Loader[FriendshipRequestKey, *ent.FriendshipRequest]
	UserMute                       *dataloader.Loader[UserMuteKey, *ent.UserMute]
	UserBlock                      *dataloader.Loader[UserBlockKey, *ent.UserBlock]
	InvitationAcceptedUserProfiles *dataloader.Loader[uuid.UUID, ent.UserProfiles]
	FriendInvitationAwaitings      *dataloader.Loader[uuid.UUID, ent.InvitationAwaitings]
	FriendDistance                 *dataloader.Loader[uuid.UUID, *length.Length]
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
		UserBlock: dataloader.NewBatchedLoader(
			NewUserBlockLoader(db),
			dataloader.WithCache[UserBlockKey, *ent.UserBlock](&dataloader.NoCache[UserBlockKey, *ent.UserBlock]{}),
		),
		InvitationAcceptedUserProfiles: dataloader.NewBatchedLoader(
			NewInvitationAcceptedUserProfilesLoader(db),
			dataloader.WithCache[uuid.UUID, ent.UserProfiles](&dataloader.NoCache[uuid.UUID, ent.UserProfiles]{}),
		),
		FriendInvitationAwaitings: dataloader.NewBatchedLoader(
			NewInvitationAwaitingsLoader(db),
			dataloader.WithCache[uuid.UUID, ent.InvitationAwaitings](&dataloader.NoCache[uuid.UUID, ent.InvitationAwaitings]{}),
		),
		FriendDistance: dataloader.NewBatchedLoader(
			NewFriendDistanceLoader(db),
			dataloader.WithCache[uuid.UUID, *length.Length](&dataloader.NoCache[uuid.UUID, *length.Length]{}),
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

// NewFriendDistanceLoader loads the distance with a friend in meters
func NewFriendDistanceLoader(db *ent.Client) func(context.Context, []uuid.UUID) []*dataloader.Result[*length.Length] {
	return func(ctx context.Context, userIDs []uuid.UUID) []*dataloader.Result[*length.Length] {
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

		userLocations, err := db.UserLocation.Query().
			Where(
				userlocation.UserIDIn(append(friendUserIDs, authUserID)...),
				userlocation.UpdatedAtGTE(time.Now().Add(-2*time.Hour)),
			).
			All(ctx)
		if err != nil {
			return convertToErrorResults[*length.Length](fmt.Errorf("load user locations: %w", err), len(userIDs))
		}
		userIDCoordinateMap := map[uuid.UUID]*pgutil.GeoPoint{}
		for _, ul := range userLocations {
			userIDCoordinateMap[ul.UserID] = ul.Coordinate
		}

		results := make([]*dataloader.Result[*length.Length], 0, len(userIDs))
		for _, userID := range userIDs {
			userCoord, ok1 := userIDCoordinateMap[authUserID]
			friendCoord, ok2 := userIDCoordinateMap[userID]
			if !ok1 || !ok2 {
				results = append(results, &dataloader.Result[*length.Length]{})
				continue
			}
			distance := length.NewMeter(int(location.CalcDistanceMeter(userCoord.Y(), userCoord.X(), friendCoord.Y(), friendCoord.X())))
			results = append(results, &dataloader.Result[*length.Length]{Data: &distance})
		}
		return results
	}
}
