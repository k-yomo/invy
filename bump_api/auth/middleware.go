package auth

import (
	"context"
	"net/http"
	"strings"

	firebaseAuth "firebase.google.com/go/v4/auth"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/pkg/logging"
	"github.com/k-yomo/bump/pkg/tracing"
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

func Middleware(firebaseAuthClient *firebaseAuth.Client) func(next http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			ctx := r.Context()
			ctx, span := tracing.NewSpan(ctx, "auth.Middleware")

			auth := r.Header.Get("Authorization")
			if auth == "" {
				span.End()
				next.ServeHTTP(w, r.WithContext(ctx))
				return
			}

			idToken := strings.Replace(auth, "Bearer ", "", 1)
			token, err := firebaseAuthClient.VerifyIDToken(ctx, idToken)
			if err != nil {
				w.WriteHeader(http.StatusUnauthorized)
				return
			}

			userIDStr, ok := token.Claims[UserIDClaimKey].(string)
			if !ok {
				w.WriteHeader(http.StatusUnauthorized)
				return
			}
			userID, err := uuid.Parse(userIDStr)
			if err != nil {
				logging.Logger(ctx).Error(
					"failed to parse user id",
					zap.String("auth_id", token.UID),
					zap.String("user_id", userIDStr),
				)
				w.WriteHeader(http.StatusUnauthorized)
				return
			}

			ctx = setUserID(ctx, userID)
			logging.AddFields(ctx, zap.String("userId", userID.String()))

			span.End()
			next.ServeHTTP(w, r.WithContext(ctx))
		})
	}
}
