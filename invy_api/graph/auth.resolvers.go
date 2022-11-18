package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"errors"
	"strings"

	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/pkg/requestutil"
	"github.com/k-yomo/invy/pkg/shortid"
)

// SignUp is the resolver for the signUp field.
func (r *mutationResolver) SignUp(ctx context.Context, input *gqlmodel.SignUpInput) (*gqlmodel.Viewer, error) {
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

	var dbUserProfile *ent.UserProfile
	err = ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		var err error
		dbUserProfile, err = tx.User.Query().
			Where(user.AuthID(token.UID)).
			QueryUserProfile().
			Only(ctx)
		if err != nil && !ent.IsNotFound(err) {
			return err
		}
		if dbUserProfile != nil {
			return nil
		}
		dbUser, err := tx.User.Create().SetAuthID(token.UID).Save(ctx)
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
			SetNillableEmail(email).
			SetNickname(input.Nickname).
			SetAvatarURL(avatarURL).
			Save(ctx)
		if err != nil {
			return err
		}

		claims := map[string]interface{}{
			auth.UserIDClaimKey: dbUser.ID,
		}
		if err := r.FirebaseAuthClient.SetCustomUserClaims(ctx, token.UID, claims); err != nil {
			return err
		}

		return nil
	})
	if err != nil {
		return nil, err
	}

	return conv.ConvertFromDBUserProfileToViewer(dbUserProfile), nil
}
