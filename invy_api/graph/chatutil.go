package graph

import (
	"context"
	"fmt"

	"cloud.google.com/go/firestore"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/sliceutil"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func firestoreChatRoomPath(chatRoomID uuid.UUID) string {
	return fmt.Sprintf("chatRooms/%s", chatRoomID)
}

func firestoreChatMessagePath(chatRoomID uuid.UUID, chatMessageID uuid.UUID) string {
	return fmt.Sprintf("%s/chatMessages/%s", firestoreChatRoomPath(chatRoomID), chatMessageID)
}

func isAuthUserIncludedInTheChatRoom(ctx context.Context, firestoreClient *firestore.Client, chatRoomID uuid.UUID) (bool, error) {
	authUserID := auth.GetCurrentUserID(ctx)

	chatRoomSnapshot, err := firestoreClient.Doc(firestoreChatRoomPath(chatRoomID)).Get(ctx)
	if status.Code(err) == codes.NotFound {
		return false, xerrors.NewErrNotFound(fmt.Errorf("chat room %q not found", chatRoomID))
	}
	if err != nil {
		return false, err
	}
	var chatRoom gqlmodel.ChatRoom
	if err := chatRoomSnapshot.DataTo(&chatRoom); err != nil {
		return false, err
	}
	if !sliceutil.Includes(chatRoom.UserIds, authUserID) {
		return false, nil
	}

	return true, nil
}
