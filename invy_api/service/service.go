package service

import (
	fcm "firebase.google.com/go/v4/messaging"
	"github.com/k-yomo/invy/invy_api/ent"
)

type Service struct {
	Notification *notificationService
}

func NewService(db *ent.Client, fcmClient *fcm.Client) *Service {
	return &Service{
		Notification: newNotificationService(db, fcmClient),
	}
}
