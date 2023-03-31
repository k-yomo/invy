package service

import (
	"context"
	"fmt"

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

func (c *notificationService) SendMulticast(ctx context.Context, message *fcm.MulticastMessage) error {
	if len(message.Tokens) == 0 {
		return nil
	}

	if message.APNS == nil {
		message.APNS = &fcm.APNSConfig{}
	}
	if message.APNS.Payload == nil {
		message.APNS.Payload = &fcm.APNSPayload{}
	}
	if message.APNS.Payload.Aps == nil {
		message.APNS.Payload.Aps = &fcm.Aps{}
	}
	// To wake the app process and trigger the background handler
	message.APNS.Payload.Aps.ContentAvailable = true

	eg := errgroup.Group{}
	for _, chunkedTokens := range sliceutil.Chunk(message.Tokens, maxMulticastMessages) {
		m := fcm.MulticastMessage{
			Tokens:       chunkedTokens,
			Data:         message.Data,
			Notification: message.Notification,
			Android:      message.Android,
			Webpush:      message.Webpush,
			APNS:         message.APNS,
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
					unregisteredTokens = append(unregisteredTokens, message.Tokens[i])
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
