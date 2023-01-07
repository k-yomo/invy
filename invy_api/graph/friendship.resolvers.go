package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/friendgroup"
	"github.com/k-yomo/invy/invy_api/ent/friendship"
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/pkg/convutil"
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
func (r *mutationResolver) RequestFriendship(ctx context.Context, friendUserID uuid.UUID) (*gqlmodel.RequestFriendshipPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	if friendUserID == authUserID {
		return nil, errors.New("friendship can't be requested to currently logged-in user")
	}
	alreadyFriend, err := r.DB.Friendship.Query().
		Where(
			friendship.UserID(authUserID),
			friendship.FriendUserID(friendUserID),
		).
		Exist(ctx)
	if err != nil {
		return nil, err
	}
	if alreadyFriend {
		return nil, errors.New("already friend")
	}

	dbFriendshipRequest, err := r.DB.FriendshipRequest.Create().
		SetFromUserID(authUserID).
		SetToUserID(friendUserID).
		Save(ctx)
	if err != nil {
		return nil, err
	}
	// TODO: notification
	return &gqlmodel.RequestFriendshipPayload{FriendShipRequest: conv.ConvertFromDBFriendshipRequest(dbFriendshipRequest)}, nil
}

// CancelFriendshipRequest is the resolver for the cancelFriendshipRequest field.
func (r *mutationResolver) CancelFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (*gqlmodel.CancelFriendshipRequestPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.FriendshipRequest.Delete().
		Where(
			friendshiprequest.ID(friendshipRequestID),
			friendshiprequest.FromUserID(authUserID),
		).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.CancelFriendshipRequestPayload{CanceledFriendshipRequestID: friendshipRequestID}, nil
}

// AcceptFriendshipRequest is the resolver for the acceptFriendshipRequest field.
func (r *mutationResolver) AcceptFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (*gqlmodel.AcceptFriendshipRequestPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		friendshipRequest, err := tx.FriendshipRequest.Query().
			Where(
				friendshiprequest.ID(friendshipRequestID),
				friendshiprequest.ToUserID(authUserID),
			).Only(ctx)
		if err != nil {
			return err
		}
		if err := tx.FriendshipRequest.DeleteOne(friendshipRequest).Exec(ctx); err != nil {
			return err
		}
		err = tx.Friendship.Create().
			SetUserID(friendshipRequest.FromUserID).
			SetFriendUserID(friendshipRequest.ToUserID).
			Exec(ctx)
		if err != nil {
			return err
		}
		err = tx.Friendship.Create().
			SetUserID(friendshipRequest.ToUserID).
			SetFriendUserID(friendshipRequest.FromUserID).
			Exec(ctx)
		if err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, err
	}
	// TODO: notification
	return &gqlmodel.AcceptFriendshipRequestPayload{AcceptedFriendshipRequestID: friendshipRequestID}, nil
}

// DenyFriendshipRequest is the resolver for the denyFriendshipRequest field.
func (r *mutationResolver) DenyFriendshipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (*gqlmodel.DenyFriendshipRequestPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.FriendshipRequest.Delete().
		Where(
			friendshiprequest.ID(friendshipRequestID),
			friendshiprequest.ToUserID(authUserID),
		).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.DenyFriendshipRequestPayload{DeniedFriendshipRequestID: friendshipRequestID}, nil
}

// CreateFriendGroup is the resolver for the createFriendGroup field.
func (r *mutationResolver) CreateFriendGroup(ctx context.Context, input gqlmodel.CreateFriendGroupInput) (*gqlmodel.CreateFriendGroupPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	var dbFriendGroup *ent.FriendGroup
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		var err error
		dbFriendGroup, err = tx.FriendGroup.Create().
			SetName(input.Name).
			SetUserID(authUserID).
			SetTotalCount(len(input.FriendUserIds)).
			AddFriendUserIDs(input.FriendUserIds...).
			Save(ctx)
		return err
	})
	if err != nil {
		return nil, err
	}
	return &gqlmodel.CreateFriendGroupPayload{FriendGroup: conv.ConvertFromDBFriendGroup(dbFriendGroup)}, nil
}

// UpdateFriendGroup is the resolver for the updateFriendGroup field.
func (r *mutationResolver) UpdateFriendGroup(ctx context.Context, input gqlmodel.UpdateFriendGroupInput) (*gqlmodel.UpdateFriendGroupPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	err := ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		// FIXME: remove -diff & add +diff might be better than clear then add
		err := tx.FriendGroup.Update().
			Where(friendgroup.ID(input.ID), friendgroup.UserID(authUserID)).
			ClearFriendUsers().
			Exec(ctx)
		if err != nil {
			return err
		}
		err = tx.FriendGroup.Update().
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
	return &gqlmodel.UpdateFriendGroupPayload{FriendGroup: conv.ConvertFromDBFriendGroup(dbFriendGroup)}, nil
}

// DeleteFriendGroup is the resolver for the deleteFriendGroup field.
func (r *mutationResolver) DeleteFriendGroup(ctx context.Context, friendGroupID uuid.UUID) (*gqlmodel.DeleteFriendGroupPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	_, err := r.DB.FriendGroup.Delete().
		Where(friendgroup.ID(friendGroupID), friendgroup.UserID(authUserID)).
		Exec(ctx)
	if err != nil {
		return nil, err
	}
	return &gqlmodel.DeleteFriendGroupPayload{DeletedFriendGroupID: friendGroupID}, nil
}

// FriendGroup returns gqlgen.FriendGroupResolver implementation.
func (r *Resolver) FriendGroup() gqlgen.FriendGroupResolver { return &friendGroupResolver{r} }

// FriendshipRequest returns gqlgen.FriendshipRequestResolver implementation.
func (r *Resolver) FriendshipRequest() gqlgen.FriendshipRequestResolver {
	return &friendshipRequestResolver{r}
}

type friendGroupResolver struct{ *Resolver }
type friendshipRequestResolver struct{ *Resolver }