package loader

import (
	"github.com/google/uuid"
	"github.com/graph-gophers/dataloader/v7"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/pkg/pgutil"
)

type Loaders struct {
	UserProfile                    *dataloader.Loader[uuid.UUID, *ent.UserProfile]
	Friendship                     *dataloader.Loader[FriendshipKey, *ent.Friendship]
	FriendshipRequest              *dataloader.Loader[FriendshipRequestKey, *ent.FriendshipRequest]
	UserMute                       *dataloader.Loader[UserMuteKey, *ent.UserMute]
	UserBlock                      *dataloader.Loader[UserBlockKey, *ent.UserBlock]
	InvitationAcceptedUserProfiles *dataloader.Loader[uuid.UUID, ent.UserProfiles]
	InvitationDeniedUserProfiles   *dataloader.Loader[uuid.UUID, ent.UserProfiles]
	FriendGeoPoint                 *dataloader.Loader[uuid.UUID, *pgutil.GeoPoint]
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
		InvitationDeniedUserProfiles: dataloader.NewBatchedLoader(
			NewInvitationDeniedUserProfilesLoader(db),
			dataloader.WithCache[uuid.UUID, ent.UserProfiles](&dataloader.NoCache[uuid.UUID, ent.UserProfiles]{}),
		),
		FriendGeoPoint: dataloader.NewBatchedLoader(
			NewFriendGeoPointLoader(db),
			dataloader.WithCache[uuid.UUID, *pgutil.GeoPoint](&dataloader.NoCache[uuid.UUID, *pgutil.GeoPoint]{}),
		),
	}
}
