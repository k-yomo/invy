package handler

import (
	"errors"
	"net/http"
	"time"

	gcs "cloud.google.com/go/storage"
	"github.com/go-chi/chi"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/invy_api/service/chat_service"
	"github.com/k-yomo/invy/pkg/sliceutil"
)

type ChatImageHandler struct {
	chatService chat_service.ChatService
	gcsClient   *gcs.Client
	bucketName  string
}

func NewChatImageHandler(chatService chat_service.ChatService, gcsClient *gcs.Client, bucketName string) *ChatImageHandler {
	return &ChatImageHandler{
		chatService: chatService,
		gcsClient:   gcsClient,
		bucketName:  bucketName,
	}
}

func (c *ChatImageHandler) HandleGetChatImage(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	authUserID := auth.GetCurrentUserID(ctx)
	chatRoomIDStr := chi.URLParam(r, "chatRoomID")
	object := chi.URLParam(r, "object")

	chatRoomID, err := uuid.Parse(chatRoomIDStr)
	if err != nil {
		HandleClientError(ctx, err, errors.New("chatRoomId must be uuid"), http.StatusBadRequest, w)
		return
	}

	chatRoom, err := c.chatService.GetChatRoom(ctx, chatRoomID)
	if err != nil {
		if xerrors.Code(err) == gqlmodel.ErrorCodeNotFound {
			HandleClientError(ctx, err, errors.New("chatRoom not found"), http.StatusNoContent, w)
			return
		}
		HandleServerError(ctx, err, w)
		return
	}

	if !sliceutil.Includes(chatRoom.ParticipantUserIds, authUserID) {
		HandleClientError(ctx, err, errors.New("chatRoom not found"), http.StatusNoContent, w)
		return
	}

	signedURL, err := c.gcsClient.Bucket(c.bucketName).SignedURL(object, &gcs.SignedURLOptions{
		Scheme:  gcs.SigningSchemeV4,
		Method:  http.MethodGet,
		Expires: time.Now().Add(7 * 24 * time.Hour),
	})
	if err != nil {
		HandleServerError(ctx, err, w)
		return
	}

	http.Redirect(w, r, signedURL, http.StatusSeeOther)
}
