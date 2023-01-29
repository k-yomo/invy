package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.22

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql"
	"github.com/99designs/gqlgen/graphql"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/friendgroup"
	"github.com/k-yomo/invy/invy_api/ent/friendship"
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/invitationdenial"
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
	"github.com/k-yomo/invy/invy_api/ent/userblock"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlgen"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/graph/loader"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/convutil"
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
		return nil, err
	}
	dbUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		return nil, err
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
		return nil, err
	}
	dbUserProfile, err := r.DB.UserProfile.Query().
		Where(userprofile.UserID(authUserID)).
		Only(ctx)
	if err != nil {
		if ent.IsConstraintError(err) {
			return nil, xerrors.New(err, gqlmodel.ErrorCodeAlreadyExists)
		}
		return nil, err
	}
	return &gqlmodel.UpdateScreenIDPayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUserProfile)}, nil
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

// IsBlocked is the resolver for the isBlocked field.
func (r *userResolver) IsBlocked(ctx context.Context, obj *gqlmodel.User) (bool, error) {
	panic(fmt.Errorf("not implemented: IsBlocked - isBlocked"))
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
	dbFriendshipConnection, err := r.DB.Friendship.Query().
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

// BlockedFriends is the resolver for the blockedFriends field.
func (r *viewerResolver) BlockedFriends(ctx context.Context, obj *gqlmodel.Viewer, after *ent.Cursor, first *int, before *ent.Cursor, last *int) (*gqlmodel.UserConnection, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	dbUserProfileConnection, err := r.DB.UserBlock.Query().
		Where(userblock.UserID(authUserID)).
		QueryBlockUser().
		QueryUserProfile().
		Paginate(ctx, after, first, before, last)
	if err != nil {
		return nil, err
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

	dbInvitations, err := r.DB.InvitationUser.Query().
		Where(invitationuser.UserID(authUserID)).
		QueryInvitation().
		Where(
			invitation.ExpiresAtGTE(now),
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
		Order(ent.Asc(invitation.FieldExpiresAt)).
		All(ctx)
	if err != nil {
		return nil, err
	}

	invitations := convutil.ConvertToList(dbInvitations, conv.ConvertFromDBInvitation)

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
