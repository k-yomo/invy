package graph

import (
	"fmt"
	"github.com/google/uuid"
	"time"
)

func generateUserAvatarImageFileName(userID uuid.UUID) string {
	return fmt.Sprintf("%s-%d", userID, time.Now().Unix())
}
