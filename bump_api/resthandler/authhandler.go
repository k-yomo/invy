package resthandler

import (
	"context"
	"database/sql"
	"net/http"

	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent"
	"github.com/k-yomo/bump/bump_api/ent/lineauth"
	"github.com/k-yomo/bump/bump_api/session"
	"github.com/k-yomo/bump/pkg/logging"
	"github.com/markbates/goth"
	"github.com/markbates/goth/gothic"
	"go.uber.org/zap"
)

type AuthHandler struct {
	sessionManager session.Manager
	db             *ent.Client
}

func NewAuthHandler(
	sessionManager session.Manager,
	db *ent.Client,
) *AuthHandler {
	return &AuthHandler{
		sessionManager: sessionManager,
		db:             db,
	}
}

func (a *AuthHandler) HandleOAuth(w http.ResponseWriter, r *http.Request) {
	if err := a.sessionManager.Authenticate(r.Context()); err == nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	gothic.BeginAuthHandler(w, r)
}

func (a *AuthHandler) HandleOAuthCallback(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	gothUser, err := gothic.CompleteUserAuth(w, r)
	if err != nil {
		logging.Logger(ctx).Error("gothic.CompleteUserAuth", zap.Error(err))
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	switch gothUser.Provider {
	case "line":
		lineAuth, err := a.db.LineAuth.Query().
			WithUser().
			Where(lineauth.LineIDEQ(gothUser.UserID)).
			Only(ctx)
		if err != sql.ErrNoRows {
			HandleServerError(ctx, err, w)
			return
		}
		var userID uuid.UUID
		if lineAuth != nil {
			userID = lineAuth.Edges.User.ID
		} else {
			user, err := a.createOauthUser(ctx, gothUser)
			if err != nil {
				HandleServerError(ctx, err, w)
				return
			}
			userID = user.ID
		}

		if err := a.sessionManager.Login(ctx, userID.String()); err != nil {
			HandleServerError(ctx, err, w)
			return
		}
	}
	w.WriteHeader(http.StatusOK)
}

func (a *AuthHandler) Logout(w http.ResponseWriter, r *http.Request) {
	if err := a.sessionManager.Logout(r.Context()); err != nil {
		HandleServerError(r.Context(), err, w)
		return
	}

}

func (a *AuthHandler) createOauthUser(ctx context.Context, gothUser goth.User) (*ent.User, error) {
	tx, err := a.db.Tx(ctx)
	if err != nil {
		return nil, err
	}
	user, err := tx.User.Create().
		SetLineAuth(&ent.LineAuth{LineID: gothUser.UserID}).
		SetUserProfile(&ent.UserProfile{Email: gothUser.Email}).
		Save(ctx)
	if err != nil {
		return nil, err
	}

	return user, nil
}
