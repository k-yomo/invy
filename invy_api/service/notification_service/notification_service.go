package notification_service

import (
	"context"
	"fmt"
	"strconv"
	"time"

	fcm "firebase.google.com/go/v4/messaging"
	"github.com/cockroachdb/errors"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/pushnotificationtoken"
	"github.com/k-yomo/invy/invy_api/query"
	"github.com/k-yomo/invy/pkg/convutil"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/sliceutil"
	"golang.org/x/sync/errgroup"
)

const maxMulticastMessages = 500

//go:generate $GOBIN/mockgen -source=$GOFILE -package=mock_$GOPACKAGE -destination=../../mocks/service/$GOPACKAGE/mock_$GOFILE
type NotificationService interface {
	SendMulticast(ctx context.Context, message *MulticastMessage) error
}

type NotificationServiceImpl struct {
	db        *ent.Client
	dbQuery   *query.Query
	fcmClient *fcm.Client
}

func NewNotificationService(db *ent.Client, dbQuery *query.Query, fcmClient *fcm.Client) NotificationService {
	return &NotificationServiceImpl{
		db:        db,
		dbQuery:   dbQuery,
		fcmClient: fcmClient,
	}
}

type MulticastMessage struct {
	FromUserID   uuid.UUID // optional
	ToUserIDs    []uuid.UUID
	Data         map[string]string
	Notification *fcm.Notification
	ExpiredAt    *time.Time
	CollapseKey  string
}

func (n *NotificationServiceImpl) SendMulticast(ctx context.Context, message *MulticastMessage) error {
	if len(message.ToUserIDs) == 0 {
		return nil
	}

	fcmMessage, err := n.convertToFCMMulticastMessage(ctx, message)
	if err != nil {
		return errors.Wrap(err, "convert to fcm multicast message")
	}
	if len(fcmMessage.Tokens) == 0 {
		return nil
	}

	eg := errgroup.Group{}
	for _, chunkedTokens := range sliceutil.Chunk(fcmMessage.Tokens, maxMulticastMessages) {
		m := fcm.MulticastMessage{
			Tokens:       chunkedTokens,
			Data:         fcmMessage.Data,
			Notification: fcmMessage.Notification,
			Android:      fcmMessage.Android,
			Webpush:      fcmMessage.Webpush,
			APNS:         fcmMessage.APNS,
		}
		eg.Go(func() error {
			multicastResp, err := n.fcmClient.SendMulticast(ctx, &m)
			if err != nil {
				return errors.Wrap(err, "multicast to fcm")
			}
			var unregisteredTokens []string
			for i, resp := range multicastResp.Responses {
				if resp.Error == nil {
					continue
				}
				if fcm.IsUnregistered(resp.Error) {
					unregisteredTokens = append(unregisteredTokens, fcmMessage.Tokens[i])
				}
			}

			_, err = n.db.PushNotificationToken.
				Delete().
				Where(pushnotificationtoken.FcmTokenIn(unregisteredTokens...)).
				Exec(ctx)
			if err != nil {
				logging.Logger(ctx).Error(fmt.Errorf("failed to delete unregistered tokens: %w", err).Error())
			}
			return nil
		})
	}

	return eg.Wait()
}

func (n *NotificationServiceImpl) convertToFCMMulticastMessage(ctx context.Context, m *MulticastMessage) (*fcm.MulticastMessage, error) {
	var fcmTokens []string
	if m.FromUserID == uuid.Nil {
		var err error
		fcmTokens, err = n.dbQuery.Notification.GetNotifiableFriendUserPushTokens(ctx, m.FromUserID, m.ToUserIDs)
		if err != nil {
			return nil, errors.Wrap(err, "get notifiable friend user push tokens")
		}
	} else {
		pushNotificationTokens, err := n.db.PushNotificationToken.Query().
			Where(pushnotificationtoken.UserIDIn(m.ToUserIDs...)).
			All(ctx)
		if err != nil {
			return nil, errors.Wrap(err, "query push notification tokens")
		}
		fcmTokens = convutil.ConvertToList(pushNotificationTokens, func(from *ent.PushNotificationToken) string {
			return from.FcmToken
		})
	}

	apnsHeader := map[string]string{}

	var ttl *time.Duration
	if m.ExpiredAt != nil {
		apnsHeader["apns-expiration"] = strconv.FormatInt(m.ExpiredAt.Unix(), 10)
		temp := time.Until(*m.ExpiredAt)
		ttl = &temp
	}

	if m.CollapseKey != "" {
		apnsHeader["apns-collapse-id"] = m.CollapseKey
	}

	return &fcm.MulticastMessage{
		Tokens:       fcmTokens,
		Data:         m.Data,
		Notification: m.Notification,
		APNS: &fcm.APNSConfig{
			Headers: apnsHeader,
			Payload: &fcm.APNSPayload{
				Aps: &fcm.Aps{
					// To wake the app process and trigger the background handler
					ContentAvailable: true,
				},
			},
		},
		Android: &fcm.AndroidConfig{
			CollapseKey: m.CollapseKey,
			Priority:    "high",
			TTL:         ttl,
		},
	}, nil
}
