package xuuid

import (
	"testing"

	"github.com/google/uuid"
)

var DummyUUID = uuid.MustParse("ef45b54c-9f70-11e9-a730-6476baad914e")

func MockNew(t *testing.T, id uuid.UUID) (clear func()) {
	t.Helper()
	New = func() uuid.UUID {
		return id
	}
	return func() {
		New = newUUID
	}
}
