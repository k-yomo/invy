package xuuid

import (
	"github.com/google/uuid"
)

var New = newUUID

func newUUID() uuid.UUID {
	return uuid.New()
}
