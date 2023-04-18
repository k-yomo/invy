package chat_service

import (
	"context"

	fcm "firebase.google.com/go/v4/messaging"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/service/notification_service"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/sliceutil"
)

func (c *ChatServiceImpl) sendChatMessageNotification(
	ctx context.Context,
	chatRoomID uuid.UUID,
	notificationBody string,
) {
	sentUserID := auth.GetCurrentUserID(ctx)
	participantUserIDs, err := c.GetChatRoomParticipantUserIDs(ctx, chatRoomID)
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
		return
	}

	notifyUserIDs := sliceutil.Filter(participantUserIDs, func(v uuid.UUID) bool {
		return v != sentUserID
	})

	authUserProfile, err := c.userService.GetUserProfile(ctx, sentUserID)
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
		return
	}
	err = c.notificationService.SendMulticast(ctx, &notification_service.MulticastMessage{
		FromUserID: sentUserID,
		ToUserIDs:  notifyUserIDs,
		Data: map[string]string{
			"type":       gqlmodel.PushNotificationTypeChatMessageReceived.String(),
			"chatRoomId": chatRoomID.String(),
		},
		Notification: &fcm.Notification{
			Title: authUserProfile.Nickname,
			Body:  notificationBody,
		},
	})
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
	}
}
