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
	entfriendship "github.com/k-yomo/bump/bump_api/ent/friendship"
	entfriendshiprequest "github.com/k-yomo/bump/bump_api/ent/friendshiprequest"
	entuser "github.com/k-yomo/bump/bump_api/ent/user"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
	"github.com/k-yomo/bump/bump_api/graph/conv"
	"github.com/k-yomo/bump/bump_api/graph/gqlgen"
	"github.com/k-yomo/bump/bump_api/graph/gqlmodel"
	"github.com/k-yomo/bump/pkg/convutil"
	"github.com/k-yomo/bump/pkg/requestutil"
)

// FromUser is the resolver for the fromUser field.
func (r *friendshipRequestResolver) FromUser(ctx context.Context, obj *gqlmodel.FriendshipRequest) (*gqlmodel.User, error) {
	userProfile, err := r.DBClient.UserProfile.Query().
		Where(userprofile.UserID(obj.FromUserID)).
		First(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(userProfile), nil
}

// ToUser is the resolver for the toUser field.
func (r *friendshipRequestResolver) ToUser(ctx context.Context, obj *gqlmodel.FriendshipRequest) (*gqlmodel.User, error) {
	userProfile, err := r.DBClient.UserProfile.Query().
		Where(userprofile.UserID(obj.ToUserID)).
		First(ctx)
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
		foundUser, err := tx.User.Query().Where(entuser.AuthID(token.UID)).First(ctx)
		if err != nil && !ent.IsNotFound(err) {
			return err
		}
		if foundUser != nil {
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
func (r *mutationResolver) RequestFriendShip(ctx context.Context, userID uuid.UUID) (bool, error) {
	loggedInUserID := auth.GetUserID(ctx)
	err := r.DBClient.FriendshipRequest.Create().
		SetFromUserID(loggedInUserID).
		SetToUserID(userID).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	// TODO: notification
	return true, nil
}

// CancelFriendShipRequest is the resolver for the cancelFriendShipRequest field.
func (r *mutationResolver) CancelFriendShipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	userID := auth.GetUserID(ctx)
	_, err := r.DBClient.FriendshipRequest.Delete().
		Where(
			entfriendshiprequest.ID(friendshipRequestID),
			entfriendshiprequest.FromUserID(userID),
		).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// DenyFriendShipRequest is the resolver for the denyFriendShipRequest field.
func (r *mutationResolver) DenyFriendShipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	userID := auth.GetUserID(ctx)
	_, err := r.DBClient.FriendshipRequest.Delete().
		Where(
			entfriendshiprequest.ID(friendshipRequestID),
			entfriendshiprequest.ToUserID(userID),
		).
		Exec(ctx)
	if err != nil {
		return false, err
	}
	return true, nil
}

// ApproveFriendShipRequest is the resolver for the approveFriendShipRequest field.
func (r *mutationResolver) ApproveFriendShipRequest(ctx context.Context, friendshipRequestID uuid.UUID) (bool, error) {
	userID := auth.GetUserID(ctx)
	err := ent.RunInTx(ctx, r.DBClient, func(tx *ent.Tx) error {
		friendshipRequest, err := r.DBClient.FriendshipRequest.Query().
			Where(
				entfriendshiprequest.ID(friendshipRequestID),
				entfriendshiprequest.ToUserID(userID),
			).First(ctx)
		if err != nil {
			return err
		}
		if err := r.DBClient.FriendshipRequest.DeleteOne(friendshipRequest).Exec(ctx); err != nil {
			return err
		}
		err = r.DBClient.Friendship.Create().
			SetUserID(friendshipRequest.FromUserID).
			SetFriendID(friendshipRequest.ToUserID).
			Exec(ctx)
		if err != nil {
			return err
		}
		err = r.DBClient.Friendship.Create().
			SetUserID(friendshipRequest.ToUserID).
			SetFriendID(friendshipRequest.FromUserID).
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

// Viewer is the resolver for the viewer field.
func (r *queryResolver) Viewer(ctx context.Context) (*gqlmodel.User, error) {
	userProfile, err := r.DBClient.UserProfile.Query().
		Where(userprofile.UserID(auth.GetUserID(ctx))).
		First(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(userProfile), nil
}

// User is the resolver for the user field.
func (r *queryResolver) User(ctx context.Context, userID uuid.UUID) (*gqlmodel.User, error) {
	userProfile, err := r.DBClient.UserProfile.Query().
		Where(userprofile.UserID(userID)).
		First(ctx)
	if err != nil {
		return nil, err
	}
	return conv.ConvertFromDBUserProfile(userProfile), nil
}

// Friends is the resolver for the friends field.
func (r *queryResolver) Friends(ctx context.Context, after *ent.Cursor, first *int, before *ent.Cursor, last *int) (*gqlmodel.UserConnection, error) {
	userID := auth.GetUserID(ctx)
	order := &ent.FriendshipOrder{
		Direction: ent.OrderDirectionDesc,
		Field:     ent.FriendshipOrderFieldCreatedAt,
	}
	friendshipConnection, err := r.DBClient.Debug().Friendship.Query().
		WithFriend(func(q *ent.UserQuery) {
			q.WithUserProfile()
		}).
		Where(entfriendship.UserID(userID)).
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
			Node:   conv.ConvertFromDBUserProfile(edge.Node.Edges.Friend.Edges.UserProfile),
			Cursor: edge.Cursor,
		})
	}
	return &userConnection, nil
}

// PendingFriendShipRequests is the resolver for the pendingFriendShipRequests field.
func (r *queryResolver) PendingFriendShipRequests(ctx context.Context) ([]*gqlmodel.FriendshipRequest, error) {
	userID := auth.GetUserID(ctx)
	pendingRequests, err := r.DBClient.FriendshipRequest.Query().
		Where(entfriendshiprequest.ToUserID(userID)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(pendingRequests, conv.ConvertFromDBFriendshipRequest), nil
}

// RequestingFriendShipRequests is the resolver for the requestingFriendShipRequests field.
func (r *queryResolver) RequestingFriendShipRequests(ctx context.Context) ([]*gqlmodel.FriendshipRequest, error) {
	userID := auth.GetUserID(ctx)
	pendingRequests, err := r.DBClient.FriendshipRequest.Query().
		Where(entfriendshiprequest.FromUserID(userID)).
		All(ctx)
	if err != nil {
		return nil, err
	}
	return convutil.ConvertToList(pendingRequests, conv.ConvertFromDBFriendshipRequest), nil
}

// FriendshipRequest returns gqlgen.FriendshipRequestResolver implementation.
func (r *Resolver) FriendshipRequest() gqlgen.FriendshipRequestResolver {
	return &friendshipRequestResolver{r}
}

// Mutation returns gqlgen.MutationResolver implementation.
func (r *Resolver) Mutation() gqlgen.MutationResolver { return &mutationResolver{r} }

// Query returns gqlgen.QueryResolver implementation.
func (r *Resolver) Query() gqlgen.QueryResolver { return &queryResolver{r} }

type friendshipRequestResolver struct{ *Resolver }
type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
