package service

import (
	"cloud.google.com/go/firestore"
	fcm "firebase.google.com/go/v4/messaging"
	"github.com/k-yomo/invy/invy_api/ent"
)

type Service struct {
	Chat         *chatService
	Notification *notificationService
}

func NewService(db *ent.Client, fcmClient *fcm.Client, firestoreClient *firestore.Client) *Service {
	return &Service{
		Chat:         newChatService(firestoreClient),
		Notification: newNotificationService(db, fcmClient),
	}
}
