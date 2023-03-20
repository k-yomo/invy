package graph

import (
	"context"
	"fmt"

	"cloud.google.com/go/firestore"
	fcm "firebase.google.com/go/v4/messaging"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/auth"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/logging"
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

func getChatRoomUserIDs(ctx context.Context, firestoreClient *firestore.Client, chatRoomID uuid.UUID) ([]uuid.UUID, error) {
	chatRoomSnapshot, err := firestoreClient.Doc(firestoreChatRoomPath(chatRoomID)).Get(ctx)
	if status.Code(err) == codes.NotFound {
		return nil, xerrors.NewErrNotFound(fmt.Errorf("chat room %q not found", chatRoomID))
	}
	if err != nil {
		return nil, err
	}
	userIDs := convutil.ConvertToList(chatRoomSnapshot.Data()["userIds"].([]interface{}), func(from interface{}) uuid.UUID {
		return uuid.MustParse(from.(string))
	})
	return userIDs, nil
}

func (r *mutationResolver) sendChatMessageNotification(
	ctx context.Context,
	chatRoomUserIDs []uuid.UUID,
	notificationBody string,
) {
	sentUserID := auth.GetCurrentUserID(ctx)
	notifyUserIDs := sliceutil.Filter(chatRoomUserIDs, func(v uuid.UUID) bool {
		return v != sentUserID
	})
	targetUserPushNotificationTokens, err := r.DBQuery.Notification.GetNotifiableFriendUserPushTokens(ctx, sentUserID, notifyUserIDs)
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
		return
	}
	if len(targetUserPushNotificationTokens) == 0 {
		return
	}

	authUserProfile, err := r.DB.UserProfile.Query().Where(userprofile.UserID(sentUserID)).Only(ctx)
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
		return
	}
	// TODO: Chunk tokens by 500 (max tokens per multicast)
	// TODO: delete expired tokens
	_, err = r.FCMClient.SendMulticast(ctx, &fcm.MulticastMessage{
		Tokens: targetUserPushNotificationTokens,
		Data: map[string]string{
			"type": gqlmodel.PushNotificationTypeChatMessageReceived.String(),
		},
		Notification: &fcm.Notification{
			Title: authUserProfile.Nickname,
			Body:  notificationBody,
		},
		Android: &fcm.AndroidConfig{
			Priority: "high",
		},
	})
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
	}
}
