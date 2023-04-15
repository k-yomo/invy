package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.27

import (
	"context"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql"
	"github.com/99designs/gqlgen/graphql"
	cerrors "github.com/cockroachdb/errors"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/friendgroup"
	"github.com/k-yomo/invy/invy_api/ent/friendship"
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/invitationawaiting"
	"github.com/k-yomo/invy/invy_api/ent/invitationdenial"
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userblock"
	"github.com/k-yomo/invy/invy_api/ent/userlocation"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/length"
	"github.com/k-yomo/invy/pkg/location"
)

// UpdateAvatar is the resolver for the updateAvatar field.
func (r *mutationResolver) UpdateAvatar(ctx context.Context, avatar graphql.Upload) (*gqlmodel.UpdateAvatarPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	fileName := fmt.Sprintf("%s-%d", authUserID, time.Now().Unix())
	avatarURL, err := r.AvatarUploader.Upload(ctx, fileName, avatar.File)
	if err != nil {
		return nil, err
	}
	err = r.DB.UserProfile.Update().
		Where(userprofile.UserID(authUserID)).
		SetAvatarURL(avatarURL).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	dbUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.UpdateAvatarPayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUserProfile)}, nil
}

// UpdateNickname is the resolver for the updateNickname field.
func (r *mutationResolver) UpdateNickname(ctx context.Context, nickname string) (*gqlmodel.UpdateNicknamePayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	err := r.DB.UserProfile.Update().
		Where(userprofile.UserID(authUserID)).
		SetNickname(nickname).
		Exec(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "update user profile")
	}
	dbUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "get user profile")
	}
	return &gqlmodel.UpdateNicknamePayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUserProfile)}, nil
}

// UpdateScreenID is the resolver for the updateScreenId field.
func (r *mutationResolver) UpdateScreenID(ctx context.Context, screenID string) (*gqlmodel.UpdateScreenIDPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	err := r.DB.UserProfile.Update().
		Where(userprofile.UserID(authUserID)).
		SetScreenID(screenID).
		Exec(ctx)
	if err != nil {
		if ent.IsConstraintError(err) {
			return nil, xerrors.New(err, gqlmodel.ErrorCodeAlreadyExists)
		}
		return nil, cerrors.Wrap(err, "update user profile")
	}
	dbUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "get user profile")
	}
	return &gqlmodel.UpdateScreenIDPayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUserProfile)}, nil
}

// Viewer is the resolver for the viewer field.
func (r *queryResolver) Viewer(ctx context.Context) (*gqlmodel.Viewer, error) {
	dbUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(auth.GetCurrentUserID(ctx))).
		Only(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "get user profile")
	}
	return conv.ConvertFromDBUserProfileToViewer(dbUserProfile), nil
}

// User is the resolver for the user field.
func (r *queryResolver) User(ctx context.Context, userID uuid.UUID) (*gqlmodel.User, error) {
	dbUserProfile, err := r.DB.User.Query().
		Where(user.ID(userID)).
		QueryUserProfile().
		Only(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "get user profile")
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// UserByScreenID is the resolver for the userByScreenId field.
func (r *queryResolver) UserByScreenID(ctx context.Context, screenID string) (*gqlmodel.User, error) {
	dbUserProfile, err := r.DB.User.Query().
		QueryUserProfile().
		Where(userprofile.ScreenID(screenID)).Only(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "get user profile")
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// UserFriends is the resolver for the userFriends field.
func (r *queryResolver) UserFriends(ctx context.Context, userID uuid.UUID, after *ent.Cursor, first *int, before *ent.Cursor, last *int) (*gqlmodel.UserConnection, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	isFriend, err := r.DB.Friendship.Query().
		Where(friendship.UserID(authUserID), friendship.FriendUserID(userID)).
		Exist(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "query is friend")
	}

	// Friend list can be only seen by friend
	if userID != authUserID && !isFriend {
		return &gqlmodel.UserConnection{
			PageInfo: &gqlmodel.PageInfo{},
		}, nil
	}

	dbUserProfileConnection, err := r.DB.Friendship.Query().
		WithFriendUser(func(q *ent.UserQuery) {
			q.WithUserProfile()
		}).
		Where(
			friendship.UserID(userID),
			func(s *sql.Selector) {
				userBlockTable := sql.Table(userblock.Table)
				s.Where(
					sql.NotExists(
						sql.Select().
							From(userBlockTable).
							Where(
								sql.And(
									sql.EQ(userBlockTable.C(userblock.FieldUserID), userID),
									sql.ColumnsEQ(userBlockTable.C(userblock.FieldBlockUserID), s.C(friendship.FieldFriendUserID)),
								),
							),
					),
				)
			},
		).
		QueryFriendUser().
		Where(user.StatusEQ(user.StatusActive)).
		QueryUserProfile().
		Paginate(ctx, after, first, before, last)
	if err != nil {
		return nil, cerrors.Wrap(err, "query friend user profiles")
	}
	userConnection := gqlmodel.UserConnection{
		PageInfo:   conv.ConvertFromDBPageInfo(&dbUserProfileConnection.PageInfo),
		TotalCount: dbUserProfileConnection.TotalCount,
	}
	for _, edge := range dbUserProfileConnection.Edges {
		userConnection.Edges = append(userConnection.Edges, &gqlmodel.UserEdge{
			Node:   conv.ConvertFromDBUserProfile(edge.Node),
			Cursor: edge.Cursor,
		})
	}
	return &userConnection, nil
}

// IsMuted is the resolver for the isMuted field.
func (r *userResolver) IsMuted(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := loader.Get(ctx).UserMute.Load(
		ctx,
		loader.UserMuteKey{UserID: authUserID, MuteUserID: obj.ID},
	)()
	if cerrors.Is(err, loader.ErrNotFound) {
		return false, nil
	}
	if err != nil {
		return false, cerrors.Wrap(err, "load user mute")
	}
	return true, nil
}

// IsBlocked is the resolver for the isBlocked field.
func (r *userResolver) IsBlocked(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := loader.Get(ctx).UserBlock.Load(
		ctx,
		loader.UserBlockKey{UserID: authUserID, BlockUserID: obj.ID},
	)()
	if cerrors.Is(err, loader.ErrNotFound) {
		return false, nil
	}
	if err != nil {
		return false, cerrors.Wrap(err, "load user block")
	}
	return true, nil
}

// IsFriend is the resolver for the isFriend field.
func (r *userResolver) IsFriend(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := loader.Get(ctx).Friendship.Load(ctx, loader.FriendshipKey{UserID: authUserID, FriendUserID: obj.ID})()
	if cerrors.Is(err, loader.ErrNotFound) {
		return false, nil
	}
	if err != nil && !cerrors.Is(err, loader.ErrNotFound) {
		return false, cerrors.Wrap(err, "load friendship")
	}
	return true, nil
}

// FuzzyCoordinate is the resolver for the fuzzyCoordinate field.
func (r *userResolver) FuzzyCoordinate(ctx context.Context, obj *gqlmodel.User) (*gqlmodel.Coordinate, error) {
	friendGeoPoint, err := loader.Get(ctx).FriendGeoPoint.Load(ctx, obj.ID)()
	if err != nil {
		return nil, cerrors.Wrap(err, "load friend geo point")
	}
	if friendGeoPoint == nil {
		return nil, nil
	}
	lat, lon := location.GetRandomLocation(friendGeoPoint.Lat(), friendGeoPoint.Lat(), 1000)
	return &gqlmodel.Coordinate{Latitude: lat, Longitude: lon}, nil
}

// DistanceKm is the resolver for the distanceKm field.
func (r *userResolver) DistanceKm(ctx context.Context, obj *gqlmodel.User) (*int, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	authUserLocation, err := r.DB.UserLocation.Query().
		Where(
			userlocation.UserID(authUserID),
			userlocation.UpdatedAtGTE(time.Now().Add(-2*time.Hour)),
		).
		Only(ctx)
	if ent.IsNotFound(err) {
		return nil, nil
	}
	friendGeoPoint, err := loader.Get(ctx).FriendGeoPoint.Load(ctx, obj.ID)()
	if err != nil {
		return nil, cerrors.Wrap(err, "load friend distance")
	}
	if friendGeoPoint == nil {
		return nil, nil
	}

	authUserGeoPoint := authUserLocation.Coordinate
	distance := length.NewMeter(int(location.CalcDistanceMeter(authUserGeoPoint.Lat(), authUserGeoPoint.Lon(), friendGeoPoint.Lat(), friendGeoPoint.Lon())))
	// Not to expose the actual location
	var approximateDistanceKM int
	distanceKM := distance.Kilometers()
	switch {
	case distanceKM < 3:
		approximateDistanceKM = 3
	case distanceKM < 6:
		approximateDistanceKM = 6
	case distanceKM < 10:
		approximateDistanceKM = 10
	default:
		approximateDistanceKM = (int(distanceKM) + 10) / 10 * 10
	}
	return &approximateDistanceKM, nil
}

// IsRequestingFriendship is the resolver for the isRequestingFriendship field.
func (r *userResolver) IsRequestingFriendship(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	key := loader.FriendshipRequestKey{FromUserID: authUserID, ToUserID: obj.ID}
	_, err := loader.Get(ctx).FriendshipRequest.Load(ctx, key)()
	if cerrors.Is(err, loader.ErrNotFound) {
		return false, nil
	}
	if err != nil {
		return false, cerrors.Wrap(err, "load friendship request")
	}
	return true, nil
}

// InvitationAwaitings is the resolver for the invitationAwaitings field.
func (r *userResolver) InvitationAwaitings(ctx context.Context, obj *gqlmodel.User) ([]*gqlmodel.InvitationAwaiting, error) {
	dbInvitationAwaitings, err := loader.Get(ctx).FriendInvitationAwaitings.Load(ctx, obj.ID)()
	if err != nil && !cerrors.Is(err, loader.ErrNotFound) {
		return nil, cerrors.Wrap(err, "load friend invitation awaitings")
	}
	return convutil.ConvertToList(dbInvitationAwaitings, conv.ConvertFromDBInvitationAwaiting), nil
}

// Friends is the resolver for the friends field.
func (r *viewerResolver) Friends(ctx context.Context, obj *gqlmodel.Viewer, after *ent.Cursor, first *int, before *ent.Cursor, last *int) (*gqlmodel.UserConnection, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbUserProfileConnection, err := r.DB.Friendship.Query().
		WithFriendUser(func(q *ent.UserQuery) {
			q.WithUserProfile()
		}).
		Where(
			friendship.UserID(authUserID),
			func(s *sql.Selector) {
				userBlockTable := sql.Table(userblock.Table)
				s.Where(
					sql.NotExists(
						sql.Select().
							From(userBlockTable).
							Where(
								sql.And(
									sql.EQ(userBlockTable.C(userblock.FieldUserID), authUserID),
									sql.ColumnsEQ(userBlockTable.C(userblock.FieldBlockUserID), s.C(friendship.FieldFriendUserID)),
								),
							),
					),
				)
			},
		).
		QueryFriendUser().
		Where(user.StatusEQ(user.StatusActive)).
		QueryUserProfile().
		Paginate(ctx, after, first, before, last)
	if err != nil {
		return nil, cerrors.Wrap(err, "query friend user profiles")
	}
	userConnection := gqlmodel.UserConnection{
		PageInfo:   conv.ConvertFromDBPageInfo(&dbUserProfileConnection.PageInfo),
		TotalCount: dbUserProfileConnection.TotalCount,
	}
	for _, edge := range dbUserProfileConnection.Edges {
		userConnection.Edges = append(userConnection.Edges, &gqlmodel.UserEdge{
			Node:   conv.ConvertFromDBUserProfile(edge.Node),
			Cursor: edge.Cursor,
		})
	}
	return &userConnection, nil
}

// BlockedFriends is the resolver for the blockedFriends field.
func (r *viewerResolver) BlockedFriends(ctx context.Context, obj *gqlmodel.Viewer, after *ent.Cursor, first *int, before *ent.Cursor, last *int) (*gqlmodel.UserConnection, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbUserProfileConnection, err := r.DB.UserBlock.Query().
		Where(userblock.UserID(authUserID)).
		QueryBlockUser().
		Where(user.StatusEQ(user.StatusActive)).
		QueryUserProfile().
		Paginate(ctx, after, first, before, last)
	if err != nil {
		return nil, cerrors.Wrap(err, "query blocked user profiles")
	}
	userConnection := gqlmodel.UserConnection{
		PageInfo:   conv.ConvertFromDBPageInfo(&dbUserProfileConnection.PageInfo),
		TotalCount: dbUserProfileConnection.TotalCount,
	}
	for _, edge := range dbUserProfileConnection.Edges {
		userConnection.Edges = append(userConnection.Edges, &gqlmodel.UserEdge{
			Node:   conv.ConvertFromDBUserProfile(edge.Node),
			Cursor: edge.Cursor,
		})
	}
	return &userConnection, nil
}

// PendingFriendshipRequests is the resolver for the pendingFriendshipRequests field.
func (r *viewerResolver) PendingFriendshipRequests(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.FriendshipRequest, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbPendingRequests, err := r.DB.FriendshipRequest.Query().
		Where(friendshiprequest.ToUserID(authUserID)).
		All(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "query pending friendship requests")
	}
	return convutil.ConvertToList(dbPendingRequests, conv.ConvertFromDBFriendshipRequest), nil
}

// RequestingFriendshipRequests is the resolver for the requestingFriendshipRequests field.
func (r *viewerResolver) RequestingFriendshipRequests(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.FriendshipRequest, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbPendingRequests, err := r.DB.FriendshipRequest.Query().
		Where(friendshiprequest.FromUserID(authUserID)).
		All(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "query requesting friendship requests")
	}
	return convutil.ConvertToList(dbPendingRequests, conv.ConvertFromDBFriendshipRequest), nil
}

// FriendGroup is the resolver for the friendGroup field.
func (r *viewerResolver) FriendGroup(ctx context.Context, obj *gqlmodel.Viewer, friendGroupID uuid.UUID) (*gqlmodel.FriendGroup, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbFriendGroup, err := r.DB.FriendGroup.Query().
		Where(friendgroup.ID(friendGroupID), friendgroup.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "get friend group")
	}
	return conv.ConvertFromDBFriendGroup(dbFriendGroup), nil
}

// FriendGroups is the resolver for the friendGroups field.
func (r *viewerResolver) FriendGroups(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.FriendGroup, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbFriendGroups, err := r.DB.FriendGroup.Query().
		Where(friendgroup.UserID(authUserID)).
		All(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "query friend groups")
	}
	return convutil.ConvertToList(dbFriendGroups, conv.ConvertFromDBFriendGroup), nil
}

// SentInvitations is the resolver for the sentInvitations field.
func (r *viewerResolver) SentInvitations(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.Invitation, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbInvitations, err := r.DB.Invitation.Query().
		Where(invitation.UserID(authUserID)).
		Where(invitation.StatusIn(invitation.StatusActive, invitation.StatusClosed)).
		Where(invitation.StartsAtGTE(time.Now().Add(-12 * time.Hour))). // Do not show the old(started before 12H ago) invitations
		All(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "query sent invitations")
	}

	return convutil.ConvertToListAndError(dbInvitations, conv.ConvertFromDBInvitation)
}

// PendingInvitations is the resolver for the pendingInvitations field.
func (r *viewerResolver) PendingInvitations(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.Invitation, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	now := time.Now()

	dbInvitations, err := r.DB.InvitationUser.Query().
		Where(invitationuser.UserID(authUserID)).
		QueryInvitation().
		Where(
			invitation.StatusEQ(invitation.StatusActive),
			// invitation wil lbe expired after 2 hours from `startsAt`
			invitation.StartsAtGTE(now.Add(-2*time.Hour)),
			func(s *sql.Selector) {
				invitationAcceptanceTable := sql.Table(invitationacceptance.Table)
				s.Where(
					sql.NotExists(
						sql.Select().
							From(invitationAcceptanceTable).
							Where(
								sql.And(
									sql.EQ(invitationAcceptanceTable.C(invitationacceptance.FieldUserID), authUserID),
									sql.ColumnsEQ(invitationAcceptanceTable.C(invitationacceptance.FieldInvitationID), s.C(invitation.FieldID)),
								),
							),
					),
				)
			},
			func(s *sql.Selector) {
				invitationDenialTable := sql.Table(invitationdenial.Table)
				s.Where(
					sql.NotExists(
						sql.Select().
							From(invitationDenialTable).
							Where(
								sql.And(
									sql.EQ(invitationDenialTable.C(invitationdenial.FieldUserID), authUserID),
									sql.ColumnsEQ(invitationDenialTable.C(invitationdenial.FieldInvitationID), s.C(invitation.FieldID)),
								),
							),
					),
				)
			}).
		Order(ent.Asc(invitation.FieldStartsAt)).
		All(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "query pending invitations")
	}

	return convutil.ConvertToListAndError(dbInvitations, conv.ConvertFromDBInvitation)
}

// AcceptedInvitations is the resolver for the acceptedInvitations field.
func (r *viewerResolver) AcceptedInvitations(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.Invitation, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbInvitations, err := r.DB.InvitationAcceptance.Query().
		Where(invitationacceptance.UserID(authUserID)).
		QueryInvitation().
		Where(
			invitation.StatusIn(invitation.StatusActive, invitation.StatusClosed),
			invitation.StartsAtGTE(time.Now().Add(-12*time.Hour)), // Do not show the old(started before 12H ago) invitations
		).
		All(ctx)
	if err != nil {
		return nil, cerrors.Wrap(err, "query accepted invitations")
	}
	return convutil.ConvertToListAndError(dbInvitations, conv.ConvertFromDBInvitation)
}

// InvitationAwaitings is the resolver for the invitationAwaitings field.
func (r *viewerResolver) InvitationAwaitings(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.InvitationAwaiting, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	now := time.Now()
	dbInvitationAwaitings, err := r.DB.InvitationAwaiting.Query().
		Where(
			invitationawaiting.UserID(authUserID),
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
		return nil, cerrors.Wrap(err, "query invitation awaitings")
	}
	return convutil.ConvertToList(dbInvitationAwaitings, conv.ConvertFromDBInvitationAwaiting), nil
}

// User returns gqlgen.UserResolver implementation.
func (r *Resolver) User() gqlgen.UserResolver { return &userResolver{r} }

// Viewer returns gqlgen.ViewerResolver implementation.
func (r *Resolver) Viewer() gqlgen.ViewerResolver { return &viewerResolver{r} }

type userResolver struct{ *Resolver }
type viewerResolver struct{ *Resolver }
