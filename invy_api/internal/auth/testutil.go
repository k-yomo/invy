package auth

import (
	"context"
	"testing"

	"github.com/google/uuid"
)

// SetUserIDForTest to pass authentication for tests
// DO NOT USE for production code
func SetUserIDForTest(t *testing.T, ctx context.Context, userID uuid.UUID) context.Context {
	t.Helper()
	return setCurrentUserID(ctx, userID)
}
