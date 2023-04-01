package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.22

import (
	"context"
	"strings"

	"github.com/cockroachdb/errors"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/account"
	"github.com/k-yomo/invy/invy_api/ent/pushnotificationtoken"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/conv"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/internal/config"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/requestutil"
	"github.com/k-yomo/invy/pkg/shortid"
)

// SignUp is the resolver for the signUp field.
func (r *mutationResolver) SignUp(ctx context.Context, input gqlmodel.SignUpInput) (*gqlmodel.SignUpPayload, error) {
	header := requestutil.GetRequestHeader(ctx)
	authHeader := header.Get("Authorization")
	if authHeader == "" {
		return nil, xerrors.NewErrUnauthenticated()
	}

	idToken := strings.Replace(authHeader, "Bearer ", "", 1)
	token, err := r.FirebaseAuthClient.VerifyIDToken(ctx, idToken)
	if err != nil {
		return nil, xerrors.NewErrUnauthenticated()
	}

	firebaseUser, err := r.FirebaseAuthClient.GetUser(ctx, token.UID)
	if err != nil {
		return nil, xerrors.NewErrUnauthenticated()
	}

	// TODO: Replace with our own file
	avatarURL := config.DefaultAvatarURL
	if input.AvatarURL != nil {
		avatarURL = *input.AvatarURL
	}
	var email *string
	if firebaseUser.EmailVerified && firebaseUser.Email != "" {
		email = &firebaseUser.Email
	}
	var phoneNumber *string
	if firebaseUser.PhoneNumber != "" {
		phoneNumber = &firebaseUser.PhoneNumber
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
			SetNillablePhoneNumber(phoneNumber).
			Save(ctx)
		if err != nil {
			return errors.Wrap(err, "create account")
		}
		dbUser, err = tx.User.Create().
			SetAccountID(dbAccount.ID).
			Save(ctx)
		if err != nil {
			return errors.Wrap(err, "create user")
		}
		screenID := shortid.Generate()
		for i := 0; i < 5; i++ {
			exist, err := tx.UserProfile.Query().
				Where(userprofile.ScreenID(screenID)).
				Exist(ctx)
			if err != nil {
				return errors.Wrap(err, "check if given user id already exists")
			}
			if exist {
				screenID = shortid.Generate()
			} else {
				break
			}
		}

		nickname := screenID
		if input.Nickname != nil {
			nickname = *input.Nickname
		}

		dbUserProfile, err = tx.UserProfile.Create().
			SetUserID(dbUser.ID).
			SetScreenID(screenID).
			SetNickname(nickname).
			SetAvatarURL(avatarURL).
			Save(ctx)
		if err != nil {
			return errors.Wrap(err, "create user profile")
		}

		claims := map[string]interface{}{
			auth.AccountIDClaimKey:     dbAccount.ID,
			auth.CurrentUserIDClaimKey: dbUser.ID,
		}
		if err := r.FirebaseAuthClient.SetCustomUserClaims(ctx, token.UID, claims); err != nil {
			return errors.Wrap(err, "set custom user claims in firebase auth")
		}

		return nil
	})
	if err != nil {
		return nil, errors.Wrap(err, "ent run transaction")
	}

	return &gqlmodel.SignUpPayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUserProfile)}, nil
}

// SignOut is the resolver for the signOut field.
func (r *mutationResolver) SignOut(ctx context.Context) (*gqlmodel.SignOutPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	// Not to send push notifications to signed out user
	_, err := r.DB.PushNotificationToken.Delete().
		Where(pushnotificationtoken.UserID(authUserID)).
		Exec(ctx)
	if err != nil {
		return nil, errors.Wrap(err, "delete notification token")
	}
	return &gqlmodel.SignOutPayload{SignedOutUserID: authUserID}, nil
}

// DeleteAccount is the resolver for the deleteAccount field.
func (r *mutationResolver) DeleteAccount(ctx context.Context) (*gqlmodel.DeleteAccountPayload, error) {
	authAccountID := auth.GetAccountID(ctx)
	dbAccount, err := r.DB.Account.Query().
		Where(account.ID(authAccountID)).
		Only(ctx)
	if err != nil {
		return nil, errors.Wrap(err, "get account")
	}
	userIDs, err := r.DB.Account.Query().
		QueryUsers().
		Where(user.AccountID(authAccountID)).
		IDs(ctx)
	if err != nil {
		return nil, errors.Wrap(err, "get user ids")
	}
	err = ent.RunInTx(ctx, r.DB, func(tx *ent.Tx) error {
		err := tx.Account.Update().
			Where(account.ID(authAccountID)).
			SetStatus(account.StatusDeleted).
			Exec(ctx)
		if err != nil {
			return errors.Wrap(err, "update account to deleted")
		}
		err = tx.User.Update().
			Where(user.AccountID(authAccountID)).
			SetStatus(user.StatusDeleted).
			Exec(ctx)
		err = tx.UserProfile.Update().
			Where(userprofile.UserIDIn(userIDs...)).
			SetNickname("削除済みユーザー").
			SetAvatarURL(config.DefaultAvatarURL).
			Exec(ctx)
		if err != nil {
			return errors.Wrap(err, "update user profile to deleted")
		}
		if err := r.FirebaseAuthClient.DeleteUser(ctx, dbAccount.AuthID); err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, errors.Wrap(err, "ent run transaction")
	}
	return &gqlmodel.DeleteAccountPayload{DeletedAccountID: authAccountID}, nil
}

// CreateUser is the resolver for the createUser field.
func (r *mutationResolver) CreateUser(ctx context.Context, input gqlmodel.CreateUserInput) (*gqlmodel.CreateUserPayload, error) {
	accountID := auth.GetAccountID(ctx)
	userCount, err := r.DB.User.Query().
		Where(user.AccountID(accountID)).
		Count(ctx)
	if err != nil {
		return nil, errors.Wrap(err, "get user count for the login account")
	}
	const maxUserCountPerAccount = 5
	if userCount >= maxUserCountPerAccount {
		return nil, xerrors.NewErrInvalidArgument(errors.New("account can't create more than 5 users"))
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
			return errors.Wrap(err, "create user")
		}
		screenID := shortid.Generate()
		for i := 0; i < 5; i++ {
			exist, err := tx.UserProfile.Query().
				Where(userprofile.ScreenID(screenID)).
				Exist(ctx)
			if err != nil {
				return errors.Wrap(err, "check if screen id exists")
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
			return errors.Wrap(err, "save user profile")
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
		return nil, errors.Wrap(err, "query user profile")
	}

	claims := map[string]interface{}{
		auth.AccountIDClaimKey:     accountID,
		auth.CurrentUserIDClaimKey: dbUser.ID,
	}
	if err := r.FirebaseAuthClient.SetCustomUserClaims(ctx, dbUser.Edges.Account.AuthID, claims); err != nil {
		return nil, errors.Wrap(err, "set custom user claims in firebase auth")
	}

	return &gqlmodel.SwitchUserPayload{Viewer: conv.ConvertFromDBUserProfileToViewer(dbUser.Edges.UserProfile)}, nil
}
