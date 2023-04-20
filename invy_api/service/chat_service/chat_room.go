package chat_service

import (
	"context"
	"fmt"
	"time"

	"cloud.google.com/go/firestore"
	"github.com/cockroachdb/errors"
	"github.com/cockroachdb/errors/grpc/status"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/convutil"
	"google.golang.org/grpc/codes"
)

func (c *ChatServiceImpl) GetChatRoom(ctx context.Context, chatRoomID uuid.UUID) (*gqlmodel.ChatRoom, error) {
	chatRoomDocRef := c.firestoreClient.Doc(firestoreChatRoomPath(chatRoomID))
	chatRoomSnapshot, err := chatRoomDocRef.Get(ctx)
	if status.Code(err) == codes.NotFound {
		return nil, xerrors.NewErrNotFound(fmt.Errorf("chat room '%s' not found", chatRoomID))
	}
	if err != nil {
		return nil, errors.Wrap(err, "get chat room")
	}
	var chatRoom gqlmodel.ChatRoom
	if err := convutil.ConvertMapToStructViaJSON(chatRoomSnapshot.Data(), &chatRoom); err != nil {
		return nil, errors.Wrap(err, "unmarhsal chat room snapshot")
	}
	return &chatRoom, nil
}

func (c *ChatServiceImpl) GetChatRoomParticipantUserIDs(ctx context.Context, chatRoomID uuid.UUID) ([]uuid.UUID, error) {
	chatRoomDocRef := c.firestoreClient.Doc(firestoreChatRoomPath(chatRoomID))
	chatRoomSnapshot, err := chatRoomDocRef.Get(ctx)
	if err != nil {
		return nil, errors.Wrap(err, "get chat room")
	}
	participantUserIDs := convutil.ConvertToList(chatRoomSnapshot.Data()["participantUserIds"].([]interface{}), func(from interface{}) uuid.UUID {
		return uuid.MustParse(from.(string))
	})
	return participantUserIDs, nil
}

func (c *ChatServiceImpl) CreateChatRoom(ctx context.Context, chatRoomID uuid.UUID, participantUserIDs []uuid.UUID) (*gqlmodel.ChatRoom, error) {
	now := time.Now()
	chatRoom := gqlmodel.ChatRoom{
		ID:                 chatRoomID,
		ParticipantUserIds: participantUserIDs,
		CreatedAt:          now,
	}
	for _, userID := range participantUserIDs {
		chatRoom.Participants = append(chatRoom.Participants, &gqlmodel.ChatRoomParticipant{
			UserID:     userID,
			LastReadAt: now,
		})
	}
	chatRoomMap, err := convutil.ConvertStructToJSONMap(chatRoom)
	if err != nil {
		return nil, errors.Wrap(err, "convert chat room struct to json map")
	}

	_, err = c.firestoreClient.Doc(firestoreChatRoomPath(chatRoomID)).Create(ctx, chatRoomMap)
	if err != nil {
		return nil, errors.Wrap(err, "create chat room document")
	}
	return &chatRoom, nil
}

func (c *ChatServiceImpl) AddParticipant(ctx context.Context, chatRoomID uuid.UUID, userID uuid.UUID) error {
	return c.firestoreClient.RunTransaction(ctx, func(ctx context.Context, firestoreTx *firestore.Transaction) error {
		chatRoomDocRef := c.firestoreClient.Doc(firestoreChatRoomPath(chatRoomID))
		chatRoomSnapshot, err := firestoreTx.Get(chatRoomDocRef)
		if err != nil {
			return errors.Wrap(err, "get chat room")
		}
		var chatRoom gqlmodel.ChatRoom
		if err := convutil.ConvertMapToStructViaJSON(chatRoomSnapshot.Data(), &chatRoom); err != nil {
			return errors.Wrap(err, "unmarhsal chat room snapshot")
		}

		chatRoom.ParticipantUserIds = append(chatRoom.ParticipantUserIds, userID)
		chatRoom.Participants = append(chatRoom.Participants, &gqlmodel.ChatRoomParticipant{
			UserID:     userID,
			LastReadAt: time.Now(),
		})

		chatRoomMap, err := convutil.ConvertStructToJSONMap(chatRoom)
		if err != nil {
			return errors.Wrap(err, "convert chat room struct to json map")
		}
		return firestoreTx.Set(chatRoomDocRef, chatRoomMap)
	})
}

func (c *ChatServiceImpl) UpdateLastReadAt(ctx context.Context, chatRoomID uuid.UUID, userID uuid.UUID, lastReadAt time.Time) error {
	return c.firestoreClient.RunTransaction(ctx, func(ctx context.Context, firestoreTx *firestore.Transaction) error {
		chatRoomDocRef := c.firestoreClient.Doc(firestoreChatRoomPath(chatRoomID))
		chatRoomSnapshot, err := firestoreTx.Get(chatRoomDocRef)
		if status.Code(err) == codes.NotFound {
			return nil
		}
		if err != nil {
			return errors.Wrap(err, "get chat room")
		}

		var chatRoom gqlmodel.ChatRoom
		if err := convutil.ConvertMapToStructViaJSON(chatRoomSnapshot.Data(), &chatRoom); err != nil {
			return errors.Wrap(err, "unmarhsal chat room snapshot")
		}

		for _, participant := range chatRoom.Participants {
			if participant.UserID == userID {
				participant.LastReadAt = lastReadAt
			}
		}

		chatRoomMap, err := convutil.ConvertStructToJSONMap(chatRoom)
		if err != nil {
			return errors.Wrap(err, "convert chat room struct to json map")
		}
		return firestoreTx.Set(chatRoomDocRef, chatRoomMap)
	})
}

func firestoreChatRoomPath(chatRoomID uuid.UUID) string {
	return fmt.Sprintf("chatRooms/%s", chatRoomID)
}
