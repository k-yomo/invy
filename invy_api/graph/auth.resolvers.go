package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"
	"strings"

	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/account"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/pkg/requestutil"
	"github.com/k-yomo/invy/pkg/shortid"
)

// SignUp is the resolver for the signUp field.
func (r *mutationResolver) SignUp(ctx context.Context, input gqlmodel.SignUpInput) (*gqlmodel.SignUpPayload, error) {
	header := requestutil.GetRequestHeader(ctx)
	authHeader := header.Get("Authorization")
	if authHeader == "" {
		return nil, errors.New("unauthenticated")
	}

	idToken := strings.Replace(authHeader, "Bearer ", "", 1)
	token, err := r.FirebaseAuthClient.VerifyIDToken(ctx, idToken)
	if err != nil {
		return nil, errors.New("unauthenticated")
	}

	firebaseUser, err := r.FirebaseAuthClient.GetUser(ctx, token.UID)
	if err != nil {
		return nil, errors.New("unauthenticated")
	}

	// TODO: Replace with our own file
	avatarURL := "https://cdn-icons-png.flaticon.com/512/456/456283.png"
	if input.AvatarURL != nil {
		avatarURL = *input.AvatarURL
	}
	var email *string
	if firebaseUser.EmailVerified && firebaseUser.Email != "" {
		email = &firebaseUser.Email
	}

	var dbUser *ent.User
	var dbUserProfile *ent.UserProfile
	err = ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		var err error
		dbAccount, err := tx.Account.Query().
			Where(account.AuthID(token.UID)).
			Only(ctx)
		if err != nil && !ent.IsNotFound(err) {
			return err
		}
		if dbAccount != nil {
			return nil
		}

		dbAccount, err = tx.Account.Create().
			SetAuthID(token.UID).
			SetNillableEmail(email).
			Save(ctx)
		if err != nil {
			return err
		}
		dbUser, err = tx.User.Create().
			SetAccountID(dbAccount.ID).
			Save(ctx)
		if err != nil {
			return err
		}
		screenID := shortid.Generate()
		for i := 0; i < 5; i++ {
			exist, err := tx.UserProfile.Query().
				Where(userprofile.ScreenID(screenID)).
				Exist(ctx)
			if err != nil {
				return err
			}
			if exist {
				screenID = shortid.Generate()
			} else {
				break
			}
		}

		dbUserProfile, err = tx.UserProfile.Create().
			SetUserID(dbUser.ID).
			SetScreenID(screenID).
			SetNickname(input.Nickname).
			SetAvatarURL(avatarURL).
			Save(ctx)
		if err != nil {
			return err
		}

		claims := map[string]interface{}{
			auth.AccountIDClaimKey:     dbAccount.ID,
			auth.CurrentUserIDClaimKey: dbUser.ID,
		}
		if err := r.FirebaseAuthClient.SetCustomUserClaims(ctx, token.UID, claims); err != nil {
			return err
		}

		return nil
	})
	if err != nil {
		return nil, err
	}

	return &gqlmodel.SignUpPayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUserProfile)}, nil
}

// CreateUser is the resolver for the createUser field.
func (r *mutationResolver) CreateUser(ctx context.Context, input gqlmodel.CreateUserInput) (*gqlmodel.CreateUserPayload, error) {
	accountID := auth.GetAccountID(ctx)
	userCount, err := r.DB.User.Query().
		Where(user.AccountID(accountID)).
		Count(ctx)
	if err != nil {
		return nil, err
	}
	const maxUserCountPerAccount = 5
	if userCount >= maxUserCountPerAccount {
		return nil, errors.New("account can't create more than 5 users")
	}

	avatarURL := "https://cdn-icons-png.flaticon.com/512/456/456283.png"
	if input.AvatarURL != nil {
		avatarURL = *input.AvatarURL
	}

	var dbUserProfile *ent.UserProfile
	err = ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		dbUser, err := tx.User.Create().
			SetAccountID(accountID).
			Save(ctx)
		if err != nil {
			return err
		}
		screenID := shortid.Generate()
		for i := 0; i < 5; i++ {
			exist, err := tx.UserProfile.Query().
				Where(userprofile.ScreenID(screenID)).
				Exist(ctx)
			if err != nil {
				return err
			}
			if exist {
				screenID = shortid.Generate()
			} else {
				break
			}
		}
		dbUserProfile, err = tx.UserProfile.Create().
			SetUserID(dbUser.ID).
			SetScreenID(screenID).
			SetAvatarURL(avatarURL).
			SetNickname(input.Nickname).
			Save(ctx)
		if err != nil {
			return err
		}

		return nil
	})

	return &gqlmodel.CreateUserPayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUserProfile)}, nil
}

// SwitchUser is the resolver for the switchUser field.
func (r *mutationResolver) SwitchUser(ctx context.Context, userID uuid.UUID) (*gqlmodel.SwitchUserPayload, error) {
	accountID := auth.GetAccountID(ctx)
	dbUser, err := r.DB.User.Query().
		Where(
			user.ID(userID),
			user.AccountID(accountID),
		).
		WithAccount().
		WithUserProfile().
		Only(ctx)
	if err != nil {
		return nil, err
	}

	claims := map[string]interface{}{
		auth.AccountIDClaimKey:     accountID,
		auth.CurrentUserIDClaimKey: dbUser.ID,
	}
	if err := r.FirebaseAuthClient.SetCustomUserClaims(ctx, dbUser.Edges.Account.AuthID, claims); err != nil {
		return nil, err
	}

	return &gqlmodel.SwitchUserPayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUser.Edges.UserProfile)}, nil
}
