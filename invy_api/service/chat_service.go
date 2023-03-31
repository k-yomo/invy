package service

import (
	"context"
	"fmt"
	"time"

	"cloud.google.com/go/firestore"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/pkg/convutil"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type chatService struct {
	firestoreClient *firestore.Client
}

func newChatService(firestoreClient *firestore.Client) *chatService {
	return &chatService{
		firestoreClient: firestoreClient,
	}
}

func (c *chatService) GetChatRoom(ctx context.Context, chatRoomID uuid.UUID) (*gqlmodel.ChatRoom, error) {
	chatRoomDocRef := c.firestoreClient.Doc(FirestoreChatRoomPath(chatRoomID))
	chatRoomSnapshot, err := chatRoomDocRef.Get(ctx)
	if err != nil {
		return nil, fmt.Errorf("get chat room: %w", err)
	}
	var chatRoom gqlmodel.ChatRoom
	if err := convutil.ConvertMapToStructViaJSON(chatRoomSnapshot.Data(), &chatRoom); err != nil {
		return nil, fmt.Errorf("unmarhsal chat room snapshot: %w", err)
	}
	return &chatRoom, nil
}

func (c *chatService) GetChatRoomParticipantUserIDs(ctx context.Context, chatRoomID uuid.UUID) ([]uuid.UUID, error) {
	chatRoomDocRef := c.firestoreClient.Doc(FirestoreChatRoomPath(chatRoomID))
	chatRoomSnapshot, err := chatRoomDocRef.Get(ctx)
	if err != nil {
		return nil, fmt.Errorf("get chat room: %w", err)
	}
	participantUserIDs := convutil.ConvertToList(chatRoomSnapshot.Data()["participantUserIds"].([]interface{}), func(from interface{}) uuid.UUID {
		return uuid.MustParse(from.(string))
	})
	return participantUserIDs, nil
}

func (c *chatService) UpdateLastReadAt(ctx context.Context, chatRoomID uuid.UUID, userID uuid.UUID, lastReadAt time.Time) error {
	return c.firestoreClient.RunTransaction(ctx, func(ctx context.Context, firestoreTx *firestore.Transaction) error {
		chatRoomDocRef := c.firestoreClient.Doc(FirestoreChatRoomPath(chatRoomID))
		chatRoomSnapshot, err := firestoreTx.Get(chatRoomDocRef)
		if status.Code(err) == codes.NotFound {
			return nil
		}
		if err != nil {
			return fmt.Errorf("get chat room: %w", err)
		}

		var chatRoom gqlmodel.ChatRoom
		if err := convutil.ConvertMapToStructViaJSON(chatRoomSnapshot.Data(), &chatRoom); err != nil {
			return fmt.Errorf("unmarhsal chat room snapshot: %w", err)
		}

		for _, participant := range chatRoom.Participants {
			if participant.UserID == userID {
				participant.LastReadAt = lastReadAt
			}
		}

		chatRoomMap, err := convutil.ConvertStructToJSONMap(chatRoom)
		if err != nil {
			return fmt.Errorf("convert chat room struct to json map: %w", err)
		}
		return firestoreTx.Set(chatRoomDocRef, chatRoomMap)
	})
}

func (c *chatService) AddParticipant(ctx context.Context, chatRoomID uuid.UUID, userID uuid.UUID) error {
	return c.firestoreClient.RunTransaction(ctx, func(ctx context.Context, firestoreTx *firestore.Transaction) error {
		chatRoomDocRef := c.firestoreClient.Doc(FirestoreChatRoomPath(chatRoomID))
		chatRoomSnapshot, err := firestoreTx.Get(chatRoomDocRef)
		if err != nil {
			return fmt.Errorf("get chat room: %w", err)
		}
		var chatRoom gqlmodel.ChatRoom
		if err := convutil.ConvertMapToStructViaJSON(chatRoomSnapshot.Data(), &chatRoom); err != nil {
			return fmt.Errorf("unmarhsal chat room snapshot: %w", err)
		}

		chatRoom.ParticipantUserIds = append(chatRoom.ParticipantUserIds, userID)
		chatRoom.Participants = append(chatRoom.Participants, &gqlmodel.ChatRoomParticipant{
			UserID:     userID,
			LastReadAt: time.Now(),
		})

		chatRoomMap, err := convutil.ConvertStructToJSONMap(chatRoom)
		if err != nil {
			return fmt.Errorf("convert chat room struct to json map: %w", err)
		}
		return firestoreTx.Set(chatRoomDocRef, chatRoomMap)
	})
}

func FirestoreChatRoomPath(chatRoomID uuid.UUID) string {
	return fmt.Sprintf("chatRooms/%s", chatRoomID)
}

func FirestoreChatMessagePath(chatRoomID uuid.UUID, chatMessageID uuid.UUID) string {
	return fmt.Sprintf("%s/chatMessages/%s", FirestoreChatRoomPath(chatRoomID), chatMessageID)
}
