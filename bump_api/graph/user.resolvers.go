package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"
	"strings"

	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/auth"
	"github.com/k-yomo/bump/bump_api/ent"
	entfriendgroup "github.com/k-yomo/bump/bump_api/ent/friendgroup"
	entfriendship "github.com/k-yomo/bump/bump_api/ent/friendship"
	entfriendshiprequest "github.com/k-yomo/bump/bump_api/ent/friendshiprequest"
	entuser "github.com/k-yomo/bump/bump_api/ent/user"
	entusermute "github.com/k-yomo/bump/bump_api/ent/usermute"
	entuserprofile "github.com/k-yomo/bump/bump_api/ent/userprofile"
	"github.com/k-yomo/bump/bump_api/graph/conv"
	"github.com/k-yomo/bump/bump_api/graph/gqlgen"
	"github.com/k-yomo/bump/bump_api/graph/gqlmodel"
	"github.com/k-yomo/bump/pkg/convutil"
	"github.com/k-yomo/bump/pkg/requestutil"
)

// FriendUsers is the resolver for the friendUsers field.
func (r *friendGroupResolver) FriendUsers(ctx context.Context, obj *gqlmodel.FriendGroup) ([]*gqlmodel.User, error) {
	friendUsersInGroup, err := r.DBClient.FriendGroup.Query().
		Where(entfriendgroup.ID(obj.ID)).
		QueryFriendUsers().
		QueryUserProfile().
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(friendUsersInGroup, conv.ConvertFromDBUserProfile), nil
}

// FromUser is the resolver for the fromUser field.
func (r *friendshipRequestResolver) FromUser(ctx context.Context, obj *gqlmodel.FriendshipRequest) (*gqlmodel.User, error) {
	userProfile, err := r.DBClient.UserProfile.Query().
		Where(entuserprofile.UserID(obj.FromUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(userProfile), nil
}

// ToUser is the resolver for the toUser field.
func (r *friendshipRequestResolver) ToUser(ctx context.Context, obj *gqlmodel.FriendshipRequest) (*gqlmodel.User, error) {
	userProfile, err := r.DBClient.UserProfile.Query().
		Where(entuserprofile.UserID(obj.ToUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(userProfile), nil
}

// SignUp is the resolver for the signUp field.
func (r *mutationResolver) SignUp(ctx context.Context, input *gqlmodel.SignUpInput) (bool, error) {
	header := requestutil.GetRequestHeader(ctx)
	authHeader := header.Get("Authorization")
	if authHeader == "" {
		return false, errors.New("unauthenticated")
	}

	idToken := strings.Replace(authHeader, "Bearer ", "", 1)
	token, err := r.FirebaseAuthClient.VerifyIDToken(ctx, idToken)
	if err != nil {
		return false, errors.New("unauthenticated")
	}

	firebaseUser, err := r.FirebaseAuthClient.GetUser(ctx, token.UID)
	if err != nil {
		return false, errors.New("unauthenticated")
	}

	err = ent.RunInTx(ctx, r.DBClient, func(tx *ent.Tx) error {
		userExist, err := tx.User.Query().
			Where(entuser.AuthID(token.UID)).
			Exist(ctx)
		if err != nil {
			return err
		}
		if userExist {
			return nil
		}
		user, err := tx.User.Create().SetAuthID(token.UID).Save(ctx)
		if err != nil {
			return err
		}
		err = tx.UserProfile.Create().
			SetUserID(user.ID).
			SetEmail(firebaseUser.Email).
			SetNickname(input.Nickname).
			SetNillableAvatarURL(input.AvatarURL).
			Exec(ctx)
		if err != nil {
			return err
		}

		claims := map[string]interface{}{
			auth.UserIDClaimKey: user.ID,
		}
		if err := r.FirebaseAuthClient.SetCustomUserClaims(ctx, token.UID, claims); err != nil {
			return err
		}

		return nil
	})
	if err != nil {
		return false, err
	}

	return true, nil
}

// RequestFriendShip is the resolver for the requestFriendShip field.
func (r *mutationResolver) RequestFriendShip(ctx context.Context, friendUserID uuid.UUID) (*gqlmodel.FriendshipRequest, error) {
	authUserID := auth.GetUserID(ctx)
	friendshipRequest, err := r.DBClient.FriendshipRequest.Create().
		SetFromUserID(authUserID).
		SetToUserID(friendUserID).
		Save(ctx)
	if err != nil {
		return nil, err
	}
	// TODO: notification
	return conv.ConvertFromDBFriendshipRequest(friendshipRequest), nil
}

// CancelFriendShipRequest is the resolver for the cancelFriendShipRequest field.
func (r *mutationResolver) CancelFriendShipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	_, err := r.DBClient.FriendshipRequest.Delete().
		Where(
			entfriendshiprequest.ID(friendshipRequestID),
			entfriendshiprequest.FromUserID(authUserID),
		).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// DenyFriendShipRequest is the resolver for the denyFriendShipRequest field.
func (r *mutationResolver) DenyFriendShipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	_, err := r.DBClient.FriendshipRequest.Delete().
		Where(
			entfriendshiprequest.ID(friendshipRequestID),
			entfriendshiprequest.ToUserID(authUserID),
		).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// ApproveFriendShipRequest is the resolver for the approveFriendShipRequest field.
func (r *mutationResolver) ApproveFriendShipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	err := ent.RunInTx(ctx, r.DBClient, func(tx *ent.Tx) error {
		friendshipRequest, err := r.DBClient.FriendshipRequest.Query().
			Where(
				entfriendshiprequest.ID(friendshipRequestID),
				entfriendshiprequest.ToUserID(authUserID),
			).Only(ctx)
		if err != nil {
			return err
		}
		if err := r.DBClient.FriendshipRequest.DeleteOne(friendshipRequest).Exec(ctx); err != nil {
			return err
		}
		err = r.DBClient.Friendship.Create().
			SetUserID(friendshipRequest.FromUserID).
			SetFriendUserID(friendshipRequest.ToUserID).
			Exec(ctx)
		if err != nil {
			return err
		}
		err = r.DBClient.Friendship.Create().
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
	var friendGroup *ent.FriendGroup
	err := ent.RunInTx(ctx, r.DBClient, func(tx *ent.Tx) error {
		var err error
		friendGroup, err = r.DBClient.FriendGroup.Create().
			SetName(input.Name).
			SetUserID(authUserID).
			AddFriendUserIDs(input.FriendUserIds...).
			Save(ctx)
		return err
	})
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBFriendGroup(friendGroup), nil
}

// UpdateFriendGroup is the resolver for the updateFriendGroup field.
func (r *mutationResolver) UpdateFriendGroup(ctx context.Context, input gqlmodel.UpdateFriendGroupInput) (*gqlmodel.FriendGroup, error) {
	authUserID := auth.GetUserID(ctx)
	err := ent.RunInTx(ctx, r.DBClient, func(tx *ent.Tx) error {
		// FIXME: remove -diff & add +diff might be better than clear then add
		err := r.DBClient.FriendGroup.Update().
			Where(entfriendgroup.ID(input.ID), entfriendgroup.UserID(authUserID)).
			ClearFriendUsers().
			Exec(ctx)
		if err != nil {
			return err
		}
		err = r.DBClient.FriendGroup.Update().
			Where(entfriendgroup.ID(input.ID), entfriendgroup.UserID(authUserID)).
			SetName(input.Name).
			AddFriendUserIDs(input.FriendUserIds...).Exec(ctx)
		if err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, err
	}

	friendGroup, err := r.DBClient.FriendGroup.Query().
		Where(entfriendgroup.ID(input.ID), entfriendgroup.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBFriendGroup(friendGroup), nil
}

// DeleteFriendGroup is the resolver for the deleteFriendGroup field.
func (r *mutationResolver) DeleteFriendGroup(ctx context.Context, friendGroupID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	_, err := r.DBClient.FriendGroup.Delete().
		Where(entfriendgroup.ID(friendGroupID), entfriendgroup.UserID(authUserID)).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// MuteUser is the resolver for the muteUser field.
func (r *mutationResolver) MuteUser(ctx context.Context, muteUserID uuid.UUID) (bool, error) {
	authUserID := auth.GetUserID(ctx)
	err := r.DBClient.UserMute.Create().
		SetUserID(authUserID).
		SetMuteUserID(muteUserID).
		OnConflictColumns(entusermute.UserColumn, entusermute.MuteUserColumn).
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
	_, err := r.DBClient.UserMute.Delete().
		Where(entusermute.UserID(authUserID), entusermute.MuteUserID(muteUserID)).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// Viewer is the resolver for the viewer field.
func (r *queryResolver) Viewer(ctx context.Context) (*gqlmodel.User, error) {
	userProfile, err := r.DBClient.UserProfile.Query().
		Where(entuserprofile.UserID(auth.GetUserID(ctx))).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(userProfile), nil
}

// User is the resolver for the user field.
func (r *queryResolver) User(ctx context.Context, userID uuid.UUID) (*gqlmodel.User, error) {
	userProfile, err := r.DBClient.UserProfile.Query().
		Where(entuserprofile.UserID(userID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(userProfile), nil
}

// Friends is the resolver for the friends field.
func (r *queryResolver) Friends(ctx context.Context, after *ent.Cursor, first *int, before *ent.Cursor, last *int) (*gqlmodel.UserConnection, error) {
	authUserID := auth.GetUserID(ctx)
	order := &ent.FriendshipOrder{
		Direction: ent.OrderDirectionDesc,
		Field:     ent.FriendshipOrderFieldCreatedAt,
	}
	friendshipConnection, err := r.DBClient.Debug().Friendship.Query().
		WithFriendUser(func(q *ent.UserQuery) {
			q.WithUserProfile()
		}).
		Where(entfriendship.UserID(authUserID)).
		Paginate(ctx, after, first, before, last, ent.WithFriendshipOrder(order))
	if err != nil {
		return nil, err
	}
	userConnection := gqlmodel.UserConnection{
		PageInfo:   conv.ConvertFromDBPageInfo(&friendshipConnection.PageInfo),
		TotalCount: friendshipConnection.TotalCount,
	}
	for _, edge := range friendshipConnection.Edges {
		userConnection.Edges = append(userConnection.Edges, &gqlmodel.UserEdge{
			Node:   conv.ConvertFromDBUserProfile(edge.Node.Edges.FriendUser.Edges.UserProfile),
			Cursor: edge.Cursor,
		})
	}
	return &userConnection, nil
}

// PendingFriendShipRequests is the resolver for the pendingFriendShipRequests field.
func (r *queryResolver) PendingFriendShipRequests(ctx context.Context) ([]*gqlmodel.FriendshipRequest, error) {
	authUserID := auth.GetUserID(ctx)
	pendingRequests, err := r.DBClient.FriendshipRequest.Query().
		Where(entfriendshiprequest.ToUserID(authUserID)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(pendingRequests, conv.ConvertFromDBFriendshipRequest), nil
}

// RequestingFriendShipRequests is the resolver for the requestingFriendShipRequests field.
func (r *queryResolver) RequestingFriendShipRequests(ctx context.Context) ([]*gqlmodel.FriendshipRequest, error) {
	authUserID := auth.GetUserID(ctx)
	pendingRequests, err := r.DBClient.FriendshipRequest.Query().
		Where(entfriendshiprequest.FromUserID(authUserID)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(pendingRequests, conv.ConvertFromDBFriendshipRequest), nil
}

// FriendGroup is the resolver for the friendGroup field.
func (r *queryResolver) FriendGroup(ctx context.Context, friendGroupID uuid.UUID) (*gqlmodel.FriendGroup, error) {
	authUserID := auth.GetUserID(ctx)
	friendGroup, err := r.DBClient.FriendGroup.Query().
		Where(entfriendgroup.ID(friendGroupID), entfriendgroup.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBFriendGroup(friendGroup), nil
}

// FriendGroups is the resolver for the friendGroups field.
func (r *queryResolver) FriendGroups(ctx context.Context) ([]*gqlmodel.FriendGroup, error) {
	authUserID := auth.GetUserID(ctx)
	friendGroups, err := r.DBClient.FriendGroup.Query().
		Where(entfriendgroup.UserID(authUserID)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(friendGroups, conv.ConvertFromDBFriendGroup), nil
}

// IsMuted is the resolver for the isMuted field.
func (r *userResolver) IsMuted(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	// TODO: Use data loader
	authUserID := auth.GetUserID(ctx)
	exist, err := r.DBClient.UserMute.Query().
		Where(entusermute.UserID(authUserID), entusermute.MuteUserID(obj.ID)).
		Exist(ctx)
	if err != nil {
		return false, err
	}
	return exist, nil
}

// FriendGroup returns gqlgen.FriendGroupResolver implementation.
func (r *Resolver) FriendGroup() gqlgen.FriendGroupResolver { return &friendGroupResolver{r} }

// FriendshipRequest returns gqlgen.FriendshipRequestResolver implementation.
func (r *Resolver) FriendshipRequest() gqlgen.FriendshipRequestResolver {
	return &friendshipRequestResolver{r}
}

// User returns gqlgen.UserResolver implementation.
func (r *Resolver) User() gqlgen.UserResolver { return &userResolver{r} }

type friendGroupResolver struct{ *Resolver }
type friendshipRequestResolver struct{ *Resolver }
type userResolver struct{ *Resolver }
