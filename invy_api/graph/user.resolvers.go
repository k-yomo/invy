package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"
	"sort"
	"time"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/friendgroup"
	"github.com/k-yomo/invy/invy_api/ent/friendship"
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
	"github.com/k-yomo/invy/invy_api/ent/userfriendgroup"
	"github.com/k-yomo/invy/invy_api/ent/usermute"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/sliceutil"
)

// MuteUser is the resolver for the muteUser field.
func (r *mutationResolver) MuteUser(ctx context.Context, userID uuid.UUID) (*gqlmodel.MuteUserPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	err := r.DB.UserMute.Create().
		SetUserID(authUserID).
		SetMuteUserID(userID).
		OnConflictColumns(usermute.UserColumn, usermute.MuteUserColumn).
		Ignore().
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.MuteUserPayload{MutedUserID: userID}, nil
}

// UnmuteUser is the resolver for the unmuteUser field.
func (r *mutationResolver) UnmuteUser(ctx context.Context, userID uuid.UUID) (*gqlmodel.UnmuteUserPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.UserMute.Delete().
		Where(usermute.UserID(authUserID), usermute.MuteUserID(userID)).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.UnmuteUserPayload{UnmutedUserID: userID}, nil
}

// Viewer is the resolver for the viewer field.
func (r *queryResolver) Viewer(ctx context.Context) (*gqlmodel.Viewer, error) {
	dbUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(auth.GetCurrentUserID(ctx))).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfileToViewer(dbUserProfile), nil
}

// User is the resolver for the user field.
func (r *queryResolver) User(ctx context.Context, userID uuid.UUID) (*gqlmodel.User, error) {
	dbUserProfile, err := loader.Get(ctx).UserProfile.Load(ctx, userID)()
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// UserByScreenID is the resolver for the userByScreenId field.
func (r *queryResolver) UserByScreenID(ctx context.Context, screenID string) (*gqlmodel.User, error) {
	dbUserProfile, err := r.DB.UserProfile.Query().Where(userprofile.ScreenID(screenID)).Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// IsMuted is the resolver for the isMuted field.
func (r *userResolver) IsMuted(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := loader.Get(ctx).UserMute.Load(
		ctx,
		loader.UserMuteKey{UserID: authUserID, MuteUserID: obj.ID},
	)()
	if err != nil && !errors.Is(err, loader.ErrNotFound) {
		return false, err
	}
	if errors.Is(err, loader.ErrNotFound) {
		return false, nil
	}
	return true, nil
}

// IsFriend is the resolver for the isFriend field.
func (r *userResolver) IsFriend(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := loader.Get(ctx).Friendship.Load(ctx, loader.FriendshipKey{UserID: authUserID, FriendUserID: obj.ID})()
	if err != nil && !errors.Is(err, loader.ErrNotFound) {
		return false, err
	}
	if errors.Is(err, loader.ErrNotFound) {
		return false, nil
	}
	return true, nil
}

// IsRequestingFriendship is the resolver for the isRequestingFriendship field.
func (r *userResolver) IsRequestingFriendship(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	key := loader.FriendshipRequestKey{FromUserID: authUserID, ToUserID: obj.ID}
	_, err := loader.Get(ctx).FriendshipRequest.Load(ctx, key)()
	if err != nil && !errors.Is(err, loader.ErrNotFound) {
		return false, err
	}
	if errors.Is(err, loader.ErrNotFound) {
		return false, nil
	}
	return true, nil
}

// Friends is the resolver for the friends field.
func (r *viewerResolver) Friends(ctx context.Context, obj *gqlmodel.Viewer, after *ent.Cursor, first *int, before *ent.Cursor, last *int) (*gqlmodel.UserConnection, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	order := &ent.FriendshipOrder{
		Direction: ent.OrderDirectionDesc,
		Field:     ent.FriendshipOrderFieldCreatedAt,
	}
	dbFriendshipConnection, err := r.DB.Debug().Friendship.Query().
		WithFriendUser(func(q *ent.UserQuery) {
			q.WithUserProfile()
		}).
		Where(friendship.UserID(authUserID)).
		Paginate(ctx, after, first, before, last, ent.WithFriendshipOrder(order))
	if err != nil {
		return nil, err
	}
	userConnection := gqlmodel.UserConnection{
		PageInfo:   conv.ConvertFromDBPageInfo(&dbFriendshipConnection.PageInfo),
		TotalCount: dbFriendshipConnection.TotalCount,
	}
	for _, edge := range dbFriendshipConnection.Edges {
		userConnection.Edges = append(userConnection.Edges, &gqlmodel.UserEdge{
			Node:   conv.ConvertFromDBUserProfile(edge.Node.Edges.FriendUser.Edges.UserProfile),
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
		return nil, err
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
		return nil, err
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
		return nil, err
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
		return nil, err
	}
	return convutil.ConvertToList(dbFriendGroups, conv.ConvertFromDBFriendGroup), nil
}

// SentInvitations is the resolver for the sentInvitations field.
func (r *viewerResolver) SentInvitations(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.Invitation, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbInvitations, err := r.DB.Invitation.Query().
		Where(invitation.UserID(authUserID)).
		Where(invitation.StartsAtGTE(time.Now().Add(-12 * time.Hour))). // Do not show the old(started before 12H ago) invitations
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(dbInvitations, conv.ConvertFromDBInvitation), nil
}

// PendingInvitations is the resolver for the pendingInvitations field.
func (r *viewerResolver) PendingInvitations(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.Invitation, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	now := time.Now()
	dbInvitationsToUser, err := r.DB.InvitationUser.Query().
		Where(invitationuser.UserID(authUserID)).
		QueryInvitation().
		Where(invitation.ExpiresAtGTE(now)).
		All(ctx)
	if err != nil {
		return nil, err
	}

	dbInvitationsToGroup, err := r.DB.UserFriendGroup.Query().
		Where(userfriendgroup.UserID(authUserID)).
		QueryFriendGroup().
		QueryInvitationFriendGroups().
		QueryInvitation().
		Where(invitation.ExpiresAtGTE(now)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	invitations := sliceutil.MergeNodes(
		convutil.ConvertToList(dbInvitationsToUser, conv.ConvertFromDBInvitation),
		convutil.ConvertToList(dbInvitationsToGroup, conv.ConvertFromDBInvitation),
	)

	// TODO: dedup

	// sort by expiration time ASC
	sort.Slice(invitations, func(i, j int) bool {
		return invitations[i].ExpiresAt.Before(invitations[j].ExpiresAt)
	})

	return invitations, nil
}

// AcceptedInvitations is the resolver for the acceptedInvitations field.
func (r *viewerResolver) AcceptedInvitations(ctx context.Context, obj *gqlmodel.Viewer) ([]*gqlmodel.Invitation, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbInvitations, err := r.DB.InvitationAcceptance.Query().
		Where(invitationacceptance.UserID(authUserID)).
		QueryInvitation().
		Where(invitation.StartsAtGTE(time.Now().Add(-12 * time.Hour))). // Do not show the old(started before 12H ago) invitations
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(dbInvitations, conv.ConvertFromDBInvitation), nil
}

// User returns gqlgen.UserResolver implementation.
func (r *Resolver) User() gqlgen.UserResolver { return &userResolver{r} }

// Viewer returns gqlgen.ViewerResolver implementation.
func (r *Resolver) Viewer() gqlgen.ViewerResolver { return &viewerResolver{r} }

type userResolver struct{ *Resolver }
type viewerResolver struct{ *Resolver }
