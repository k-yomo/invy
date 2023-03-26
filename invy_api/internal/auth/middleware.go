package auth

import (
	"context"
	"errors"
	"net/http"
	"strings"

	firebaseAuth "firebase.google.com/go/v4/auth"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/tracing"
	"go.uber.org/zap"
)

type ctxKeyAccountID struct{}
type ctxKeyCurrentUserID struct{}

const (
	AccountIDClaimKey     = "accountId"
	CurrentUserIDClaimKey = "currentUserId"
)

func setAccountID(ctx context.Context, userID uuid.UUID) context.Context {
	return context.WithValue(ctx, ctxKeyAccountID{}, userID)
}

func GetAccountID(ctx context.Context) uuid.UUID {
	accountID, ok := ctx.Value(ctxKeyAccountID{}).(uuid.UUID)
	if !ok {
		return uuid.Nil
	}
	return accountID
}

func setCurrentUserID(ctx context.Context, userID uuid.UUID) context.Context {
	return context.WithValue(ctx, ctxKeyCurrentUserID{}, userID)
}

func GetCurrentUserID(ctx context.Context) uuid.UUID {
	currentUserID, ok := ctx.Value(ctxKeyCurrentUserID{}).(uuid.UUID)
	if !ok {
		return uuid.Nil
	}
	return currentUserID
}

// Middleware authenticates user
// This does not return error even if authentication failed
func Middleware(firebaseAuthClient *firebaseAuth.Client) func(next http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			ctx := r.Context()

			accountID, currentUserID, err := authenticate(ctx, firebaseAuthClient, r.Header.Get("Authorization"))
			if err != nil {
				next.ServeHTTP(w, r.WithContext(ctx))
				return
			}
			ctx = setAccountID(ctx, accountID)
			ctx = setCurrentUserID(ctx, currentUserID)
			logging.AddFields(ctx, zap.String("accountId", accountID.String()))
			logging.AddFields(ctx, zap.String("currentUserId", currentUserID.String()))

			next.ServeHTTP(w, r.WithContext(ctx))
		})
	}
}

func authenticate(ctx context.Context, firebaseAuthClient *firebaseAuth.Client, authHeader string) (accountID uuid.UUID, currentUserID uuid.UUID, err error) {
	ctx, span := tracing.NewSpan(ctx, "auth.Authenticate")
	defer span.End()

	idToken := strings.Replace(authHeader, "Bearer ", "", 1)
	if idToken == "" {
		return uuid.Nil, uuid.Nil, errors.New("auth id token is not set")
	}

	token, err := firebaseAuthClient.VerifyIDToken(ctx, idToken)
	if err != nil {
		logging.Logger(ctx).Error("verify token id failed", zap.Error(err))
		return uuid.Nil, uuid.Nil, err
	}

	accountIDStr, ok := token.Claims[AccountIDClaimKey].(string)
	if !ok {
		return uuid.Nil, uuid.Nil, errors.New("account id not found in claims")
	}
	accountID, err = uuid.Parse(accountIDStr)
	if err != nil {
		return uuid.Nil, uuid.Nil, err
	}

	currentUserIDStr, ok := token.Claims[CurrentUserIDClaimKey].(string)
	if !ok {
		return uuid.Nil, uuid.Nil, errors.New("current user id not found in claims")
	}
	currentUserID, err = uuid.Parse(currentUserIDStr)
	if err != nil {
		return uuid.Nil, uuid.Nil, err
	}
	return accountID, currentUserID, err
}
