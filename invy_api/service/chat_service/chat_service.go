package chat_service

import (
	"context"
	"io"
	"time"

	"cloud.google.com/go/firestore"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/service/notification_service"
	"github.com/k-yomo/invy/invy_api/service/user_service"
	"github.com/k-yomo/invy/pkg/storage"
)

//go:generate $GOBIN/mockgen -source=$GOFILE -package=mock_$GOPACKAGE -destination=../../mocks/service/$GOPACKAGE/mock_$GOFILE
type ChatService interface {
	GetChatRoom(ctx context.Context, chatRoomID uuid.UUID) (*gqlmodel.ChatRoom, error)
	GetChatRoomParticipantUserIDs(ctx context.Context, chatRoomID uuid.UUID) ([]uuid.UUID, error)
	CreateChatRoom(ctx context.Context, chatRoomID uuid.UUID, participantUserIDs []uuid.UUID) (*gqlmodel.ChatRoom, error)
	AddParticipant(ctx context.Context, chatRoomID uuid.UUID, userID uuid.UUID) error
	UpdateLastReadAt(ctx context.Context, chatRoomID uuid.UUID, userID uuid.UUID, lastReadAt time.Time) error

	CreateChatMessageText(ctx context.Context, messageID uuid.UUID, chatRoomID uuid.UUID, text string) (*gqlmodel.ChatMessage, error)
	CreateChatMessageImage(ctx context.Context, messageID uuid.UUID, chatRoomID uuid.UUID, image io.Reader) (*gqlmodel.ChatMessage, error)
}

type ChatServiceImpl struct {
	firestoreClient          *firestore.Client
	chatMessageImageUploader storage.FileUploader

	userService         user_service.UserService
	notificationService notification_service.NotificationService
}

func NewChatService(
	firestoreClient *firestore.Client,
	chatMessageImageUploader storage.FileUploader,
	userService user_service.UserService,
	notificationService notification_service.NotificationService,
) ChatService {
	return &ChatServiceImpl{
		firestoreClient:          firestoreClient,
		chatMessageImageUploader: chatMessageImageUploader,
		userService:              userService,
		notificationService:      notificationService,
	}
}
