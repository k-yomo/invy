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

type ctxKeyUserID struct{}

const UserIDClaimKey = "userId"

func setUserID(ctx context.Context, userID uuid.UUID) context.Context {
	return context.WithValue(ctx, ctxKeyUserID{}, userID)
}

func GetUserID(ctx context.Context) uuid.UUID {
	userID, ok := ctx.Value(ctxKeyUserID{}).(uuid.UUID)
	if !ok {
		return uuid.Nil
	}
	return userID
}

// Middleware authenticates user
// This does not return error even if authentication failed
func Middleware(firebaseAuthClient *firebaseAuth.Client) func(next http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			ctx := r.Context()

			authHeader := r.Header.Get("Authorization")
			idToken := strings.Replace(authHeader, "Bearer ", "", 1)
			userID, err := authenticate(ctx, firebaseAuthClient, idToken)
			if err != nil {
				logging.Logger(ctx).Error("authentication failed", zap.Error(err))
				next.ServeHTTP(w, r.WithContext(ctx))
				return
			}
			ctx = setUserID(ctx, userID)
			logging.AddFields(ctx, zap.String("userId", userID.String()))

			next.ServeHTTP(w, r.WithContext(ctx))
		})
	}
}

func authenticate(ctx context.Context, firebaseAuthClient *firebaseAuth.Client, idToken string) (uuid.UUID, error) {
	ctx, span := tracing.NewSpan(ctx, "auth.Authenticate")
	defer span.End()

	if idToken == "" {
		return uuid.Nil, errors.New("auth id token is not set")
	}

	token, err := firebaseAuthClient.VerifyIDToken(ctx, idToken)
	if err != nil {
		return uuid.Nil, err
	}

	userIDStr, ok := token.Claims[UserIDClaimKey].(string)
	if !ok {
		return uuid.Nil, errors.New("user id not found in claims")
	}
	userID, err := uuid.Parse(userIDStr)
	if err != nil {
		return uuid.Nil, err
	}
	return userID, err
}
