package testutil

import (
	"testing"
)

func NoError(t *testing.T, err error) bool {
	t.Helper()
	if err != nil {
		t.Errorf("Received unexpected error: %+v", err)
	}

	return true
}
