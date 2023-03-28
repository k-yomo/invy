package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.22

import (
	"context"
	"fmt"
	"time"

	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/invy_api/service"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/sliceutil"
)

// SendChatMessageText is the resolver for the SendChatMessageText field.
func (r *mutationResolver) SendChatMessageText(ctx context.Context, input *gqlmodel.SendChatMessageTextInput) (*gqlmodel.SendChatMessageTextPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)

	participantUserIDs, err := r.Service.Chat.GetChatRoomParticipantUserIDs(ctx, input.ChatRoomID)
	if err != nil {
		return nil, err
	}
	if !sliceutil.Includes(participantUserIDs, authUserID) {
		return nil, xerrors.NewErrNotFound(fmt.Errorf("chat room %q not found", input.ChatRoomID))
	}

	chatMessage := gqlmodel.ChatMessage{
		ID:         input.ID,
		ChatRoomID: input.ChatRoomID,
		UserID:     authUserID,
		Kind:       gqlmodel.ChatMessageKindText,
		Body:       gqlmodel.ChatMessageBodyText{Text: input.Text},
		CreatedAt:  time.Now(),
	}
	chatMessageMap, err := convutil.ConvertStructToJSONMap(chatMessage)
	if err != nil {
		return nil, err
	}
	_, err = r.FirestoreClient.Doc(service.FirestoreChatMessagePath(input.ChatRoomID, input.ID)).
		Create(ctx, chatMessageMap)
	if err != nil {
		return nil, err
	}

	r.sendChatMessageNotification(ctx, input.ChatRoomID, participantUserIDs, input.Text)

	return &gqlmodel.SendChatMessageTextPayload{
		ChatMessage: &chatMessage,
	}, nil
}

// SendChatMessageImage is the resolver for the SendChatMessageImage field.
func (r *mutationResolver) SendChatMessageImage(ctx context.Context, input *gqlmodel.SendChatMessageImageInput) (*gqlmodel.SendChatMessageImagePayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)

	participantUserIDs, err := r.Service.Chat.GetChatRoomParticipantUserIDs(ctx, input.ChatRoomID)
	if err != nil {
		return nil, err
	}
	if !sliceutil.Includes(participantUserIDs, authUserID) {
		return nil, xerrors.NewErrNotFound(fmt.Errorf("chat room %q not found", input.ChatRoomID))
	}

	fileName := fmt.Sprintf("%s-%s-%d", input.ChatRoomID, input.ID, time.Now().Unix())
	imageURL, err := r.AvatarUploader.Upload(ctx, fileName, input.Image.File)
	if err != nil {
		return nil, err
	}

	chatMessage := gqlmodel.ChatMessage{
		ID:         input.ID,
		ChatRoomID: input.ChatRoomID,
		UserID:     auth.GetCurrentUserID(ctx),
		Kind:       gqlmodel.ChatMessageKindImage,
		Body:       gqlmodel.ChatMessageBodyImage{URL: imageURL},
		CreatedAt:  time.Now(),
	}
	chatMessageMap, err := convutil.ConvertStructToJSONMap(chatMessage)
	if err != nil {
		return nil, err
	}
	_, err = r.FirestoreClient.Doc(service.FirestoreChatMessagePath(input.ChatRoomID, input.ID)).
		Create(ctx, chatMessageMap)
	if err != nil {
		return nil, err
	}

	r.sendChatMessageNotification(ctx, input.ChatRoomID, participantUserIDs, "写真を送信しました")

	return &gqlmodel.SendChatMessageImagePayload{
		ChatMessage: &chatMessage,
	}, nil
}

// UpdateChatLastReadAt is the resolver for the updateChatLastReadAt field.
func (r *mutationResolver) UpdateChatLastReadAt(ctx context.Context, input gqlmodel.UpdateChatLastReadAtInput) (*gqlmodel.UpdateChatLastReadAtPayload, error) {
	authUserID := auth.GetCurrentUserID(ctx)
	// client sends UTC time, but to align with the other data, converting to local here
	err := r.Service.Chat.UpdateLastReadAt(ctx, input.ChatRoomID, authUserID, input.LastReadAt.Local())
	if err != nil {
		return nil, fmt.Errorf("update last read at: %w", err)
	}

	return &gqlmodel.UpdateChatLastReadAtPayload{ChatRoomID: input.ChatRoomID}, nil
}
