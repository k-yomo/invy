package chat_service

import (
	"context"
	"fmt"
	"io"
	"time"

	"github.com/cockroachdb/errors"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/pkg/convutil"
)

func (c *ChatServiceImpl) CreateChatMessageText(ctx context.Context, messageID uuid.UUID, chatRoomID uuid.UUID, text string) (*gqlmodel.ChatMessage, error) {
	chatMessage := gqlmodel.ChatMessage{
		ID:         messageID,
		ChatRoomID: chatRoomID,
		UserID:     auth.GetCurrentUserID(ctx),
		Kind:       gqlmodel.ChatMessageKindText,
		Body:       gqlmodel.ChatMessageBodyText{Text: text},
		CreatedAt:  time.Now(),
	}
	chatMessageMap, err := convutil.ConvertStructToJSONMap(chatMessage)
	if err != nil {
		return nil, errors.Wrap(err, "convert chat message struct to json map")
	}
	_, err = c.firestoreClient.Doc(FirestoreChatMessagePath(chatMessage.ChatRoomID, chatMessage.ID)).
		Create(ctx, chatMessageMap)
	if err != nil {
		return nil, errors.Wrap(err, "insert chat message into firestore")
	}
	c.sendChatMessageNotification(ctx, chatMessage.ChatRoomID, text)

	return &chatMessage, nil
}

func (c *ChatServiceImpl) CreateChatMessageImage(ctx context.Context, messageID uuid.UUID, chatRoomID uuid.UUID, image io.Reader) (*gqlmodel.ChatMessage, error) {
	fileName := fmt.Sprintf("%s-%s-%d", chatRoomID, messageID, time.Now().Unix())
	if _, err := c.chatMessageImageUploader.Upload(ctx, fileName, image); err != nil {
		return nil, errors.Wrap(err, "upload image in message")
	}
	imageURL := fmt.Sprintf("%s/chatRooms/%s/images/%s", c.apiRootURL, chatRoomID, fileName)

	chatMessage := gqlmodel.ChatMessage{
		ID:         messageID,
		ChatRoomID: chatRoomID,
		UserID:     auth.GetCurrentUserID(ctx),
		Kind:       gqlmodel.ChatMessageKindImage,
		Body:       gqlmodel.ChatMessageBodyImage{URL: imageURL},
		CreatedAt:  time.Now(),
	}
	chatMessageMap, err := convutil.ConvertStructToJSONMap(chatMessage)
	if err != nil {
		return nil, errors.Wrap(err, "convert chat message struct to json")
	}
	_, err = c.firestoreClient.Doc(FirestoreChatMessagePath(chatRoomID, messageID)).
		Create(ctx, chatMessageMap)
	if err != nil {
		return nil, errors.Wrap(err, "create chat message")
	}

	c.sendChatMessageNotification(ctx, chatRoomID, "写真を送信しました")

	return &chatMessage, nil
}

func FirestoreChatMessagePath(chatRoomID uuid.UUID, chatMessageID uuid.UUID) string {
	return fmt.Sprintf("%s/chatMessages/%s", firestoreChatRoomPath(chatRoomID), chatMessageID)
}
