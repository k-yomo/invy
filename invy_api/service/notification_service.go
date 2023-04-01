package service

import (
	"context"
	"fmt"
	"strconv"
	"time"

	fcm "firebase.google.com/go/v4/messaging"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/ent/pushnotificationtoken"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/sliceutil"
	"golang.org/x/sync/errgroup"
)

const maxMulticastMessages = 500

type notificationService struct {
	db        *ent.Client
	fcmClient *fcm.Client
}

func newNotificationService(db *ent.Client, fcmClient *fcm.Client) *notificationService {
	return &notificationService{
		db:        db,
		fcmClient: fcmClient,
	}
}

type MulticastMessage struct {
	Tokens       []string
	Data         map[string]string
	Notification *fcm.Notification
	ExpiredAt    *time.Time
	CollapseKey  string
}

func (m *MulticastMessage) ToFCMMulticastMessageMessage() *fcm.MulticastMessage {
	apnsHeader := map[string]string{}

	var ttl *time.Duration
	if m.ExpiredAt != nil {
		apnsHeader["apns-expiration"] = strconv.FormatInt(m.ExpiredAt.Unix(), 10)
		temp := m.ExpiredAt.Sub(time.Now())
		ttl = &temp
	}

	if m.CollapseKey != "" {
		apnsHeader["apns-collapse-id"] = m.CollapseKey
	}

	return &fcm.MulticastMessage{
		Tokens:       m.Tokens,
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
	}
}

func (c *notificationService) SendMulticast(ctx context.Context, message *MulticastMessage) error {
	if len(message.Tokens) == 0 {
		return nil
	}

	fcmMessage := message.ToFCMMulticastMessageMessage()
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
			multicastResp, err := c.fcmClient.SendMulticast(ctx, &m)
			if err != nil {
				return fmt.Errorf("multicast to fcm: %w", err)
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

			_, err = c.db.PushNotificationToken.
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
