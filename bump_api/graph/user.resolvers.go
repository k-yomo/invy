package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"

	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/auth"
	"github.com/k-yomo/bump/bump_api/ent"
	"github.com/k-yomo/bump/bump_api/ent/friendgroup"
	"github.com/k-yomo/bump/bump_api/ent/friendship"
	"github.com/k-yomo/bump/bump_api/ent/friendshiprequest"
	"github.com/k-yomo/bump/bump_api/ent/usermute"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
	"github.com/k-yomo/bump/bump_api/graph/conv"
	"github.com/k-yomo/bump/bump_api/graph/gqlgen"
	"github.com/k-yomo/bump/bump_api/graph/gqlmodel"
	"github.com/k-yomo/bump/bump_api/graph/loader"
	"github.com/k-yomo/bump/pkg/convutil"
)

// FriendUsers is the resolver for the friendUsers field.
func (r *friendGroupResolver) FriendUsers(ctx context.Context, obj *gqlmodel.FriendGroup) ([]*gqlmodel.User, error) {
	dbFriendUsersInGroup, err := r.DB.FriendGroup.Query().
		Where(friendgroup.ID(obj.ID)).
		QueryFriendUsers().
		QueryUserProfile().
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(dbFriendUsersInGroup, conv.ConvertFromDBUserProfile), nil
}

// FromUser is the resolver for the fromUser field.
func (r *friendshipRequestResolver) FromUser(ctx context.Context, obj *gqlmodel.FriendshipRequest) (*gqlmodel.User, error) {
	dbUserProfile, err := loader.Get(ctx).UserProfile.Load(ctx, obj.FromUserID)()
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// ToUser is the resolver for the toUser field.
func (r *friendshipRequestResolver) ToUser(ctx context.Context, obj *gqlmodel.FriendshipRequest) (*gqlmodel.User, error) {
	dbUserProfile, err := loader.Get(ctx).UserProfile.Load(ctx, obj.FromUserID)()
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(dbUserProfile), nil
}

// RequestFriendship is the resolver for the requestFriendship field.
func (r *mutationResolver) RequestFriendship(ctx context.Context, friendUserID uuid.UUID) (*gqlmodel.FriendshipRequest, error) {
	authUserID := auth.GetUserID(ctx)
	dbFriendshipRequest, err := r.DB.FriendshipRequest.Create().
		SetFromUserID(authUserID).
		SetToUserID(friendUserID).
		Save(ctx)
	if err != nil {
		return nil, err
	}
	// TODO: notification
	return conv.ConvertFromDBFriendshipRequest(dbFriendshipRequest), nil
}

// CancelFriendshipRequest is the resolver for the cancelFriendshipRequest field.
func (r *mutationResolver) CancelFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	_, err := r.DB.FriendshipRequest.Delete().
		Where(
			friendshiprequest.ID(friendshipRequestID),
			friendshiprequest.FromUserID(authUserID),
		).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// DenyFriendshipRequest is the resolver for the denyFriendshipRequest field.
func (r *mutationResolver) DenyFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	_, err := r.DB.FriendshipRequest.Delete().
		Where(
			friendshiprequest.ID(friendshipRequestID),
			friendshiprequest.ToUserID(authUserID),
		).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// ApproveFriendshipRequest is the resolver for the approveFriendshipRequest field.
func (r *mutationResolver) ApproveFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		friendshipRequest, err := r.DB.FriendshipRequest.Query().
			Where(
				friendshiprequest.ID(friendshipRequestID),
				friendshiprequest.ToUserID(authUserID),
			).Only(ctx)
		if err != nil {
			return err
		}
		if err := r.DB.FriendshipRequest.DeleteOne(friendshipRequest).Exec(ctx); err != nil {
			return err
		}
		err = r.DB.Friendship.Create().
			SetUserID(friendshipRequest.FromUserID).
			SetFriendUserID(friendshipRequest.ToUserID).
			Exec(ctx)
		if err != nil {
			return err
		}
		err = r.DB.Friendship.Create().
			SetUserID(friendshipRequest.ToUserID).
			SetFriendUserID(friendshipRequest.FromUserID).
			Exec(ctx)
		if err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return false, err
	}
	// TODO: notification
	return true, nil
}

// CreateFriendGroup is the resolver for the createFriendGroup field.
func (r *mutationResolver) CreateFriendGroup(ctx context.Context, input gqlmodel.CreateFriendGroupInput) (*gqlmodel.FriendGroup, error) {
	authUserID := auth.GetUserID(ctx)
	var dbFriendGroup *ent.FriendGroup
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		var err error
		dbFriendGroup, err = r.DB.FriendGroup.Create().
			SetName(input.Name).
			SetUserID(authUserID).
			AddFriendUserIDs(input.FriendUserIds...).
			Save(ctx)
		return err
	})
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBFriendGroup(dbFriendGroup), nil
}

// UpdateFriendGroup is the resolver for the updateFriendGroup field.
func (r *mutationResolver) UpdateFriendGroup(ctx context.Context, input gqlmodel.UpdateFriendGroupInput) (*gqlmodel.FriendGroup, error) {
	authUserID := auth.GetUserID(ctx)
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		// FIXME: remove -diff & add +diff might be better than clear then add
		err := r.DB.FriendGroup.Update().
			Where(friendgroup.ID(input.ID), friendgroup.UserID(authUserID)).
			ClearFriendUsers().
			Exec(ctx)
		if err != nil {
			return err
		}
		err = r.DB.FriendGroup.Update().
			Where(friendgroup.ID(input.ID), friendgroup.UserID(authUserID)).
			SetName(input.Name).
			SetTotalCount(len(input.FriendUserIds)).
			AddFriendUserIDs(input.FriendUserIds...).Exec(ctx)
		if err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, err
	}

	dbFriendGroup, err := r.DB.FriendGroup.Query().
		Where(friendgroup.ID(input.ID), friendgroup.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBFriendGroup(dbFriendGroup), nil
}

// DeleteFriendGroup is the resolver for the deleteFriendGroup field.
func (r *mutationResolver) DeleteFriendGroup(ctx context.Context, friendGroupID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	_, err := r.DB.FriendGroup.Delete().
		Where(friendgroup.ID(friendGroupID), friendgroup.UserID(authUserID)).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// MuteUser is the resolver for the muteUser field.
func (r *mutationResolver) MuteUser(ctx context.Context, muteUserID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	err := r.DB.UserMute.Create().
		SetUserID(authUserID).
		SetMuteUserID(muteUserID).
		OnConflictColumns(usermute.UserColumn, usermute.MuteUserColumn).
		Ignore().
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// UnmuteUser is the resolver for the unmuteUser field.
func (r *mutationResolver) UnmuteUser(ctx context.Context, muteUserID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	_, err := r.DB.UserMute.Delete().
		Where(usermute.UserID(authUserID), usermute.MuteUserID(muteUserID)).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// Viewer is the resolver for the viewer field.
func (r *queryResolver) Viewer(ctx context.Context) (*gqlmodel.Viewer, error) {
	dbUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(auth.GetUserID(ctx))).
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

// Friends is the resolver for the friends field.
func (r *queryResolver) Friends(ctx context.Context, after *ent.Cursor, first *int, before *ent.Cursor, last *int) (*gqlmodel.UserConnection, error) {
	authUserID := auth.GetUserID(ctx)
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

// IsMuted is the resolver for the isMuted field.
func (r *userResolver) IsMuted(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	authUserID := auth.GetUserID(ctx)
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
	authUserID := auth.GetUserID(ctx)
	_, err := loader.Get(ctx).Friendship.Load(ctx, loader.FriendshipKey{UserID: authUserID, FriendUserID: obj.ID})()
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
	authUserID := auth.GetUserID(ctx)
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
	authUserID := auth.GetUserID(ctx)
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
	authUserID := auth.GetUserID(ctx)
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
	authUserID := auth.GetUserID(ctx)
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
	authUserID := auth.GetUserID(ctx)
	dbFriendGroups, err := r.DB.FriendGroup.Query().
		Where(friendgroup.UserID(authUserID)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(dbFriendGroups, conv.ConvertFromDBFriendGroup), nil
}

// FriendGroup returns gqlgen.FriendGroupResolver implementation.
func (r *Resolver) FriendGroup() gqlgen.FriendGroupResolver { return &friendGroupResolver{r} }

// FriendshipRequest returns gqlgen.FriendshipRequestResolver implementation.
func (r *Resolver) FriendshipRequest() gqlgen.FriendshipRequestResolver {
	return &friendshipRequestResolver{r}
}

// User returns gqlgen.UserResolver implementation.
func (r *Resolver) User() gqlgen.UserResolver { return &userResolver{r} }

// Viewer returns gqlgen.ViewerResolver implementation.
func (r *Resolver) Viewer() gqlgen.ViewerResolver { return &viewerResolver{r} }

type friendGroupResolver struct{ *Resolver }
type friendshipRequestResolver struct{ *Resolver }
type userResolver struct{ *Resolver }
type viewerResolver struct{ *Resolver }
