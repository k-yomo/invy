package auth

import (
	"context"
	"testing"
)

// SetUserIDForTest to pass authentication for tests
// DO NOT USE for production code
func SetUserIDForTest(t *testing.T, ctx context.Context, userID string) context.Context {
	t.Helper()
	return context.WithValue(ctx, ctxKeyAccountID{}, userID)
}
