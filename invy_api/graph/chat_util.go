package graph

import (
	"context"

	fcm "firebase.google.com/go/v4/messaging"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/service"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/sliceutil"
)

func (r *mutationResolver) sendChatMessageNotification(
	ctx context.Context,
	chatRoomID uuid.UUID,
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

	invitation, err := r.DB.Invitation.Query().Where(invitation.ChatRoomID(chatRoomID)).Only(ctx)
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
		return
	}

	authUserProfile, err := r.DB.UserProfile.Query().Where(userprofile.UserID(sentUserID)).Only(ctx)
	if err != nil {
		logging.Logger(ctx).Error(err.Error())
		return
	}
	err = r.Service.Notification.SendMulticast(ctx, &service.MulticastMessage{
		Tokens: targetUserPushNotificationTokens,
		Data: map[string]string{
			"type":         gqlmodel.PushNotificationTypeChatMessageReceived.String(),
			"invitationId": invitation.ID.String(),
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
