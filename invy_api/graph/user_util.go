package graph

import (
	"fmt"
	"time"

	"github.com/google/uuid"
)

func generateUserAvatarImageFileName(userID uuid.UUID) string {
	return fmt.Sprintf("%s-%d", userID, time.Now().Unix())
}
