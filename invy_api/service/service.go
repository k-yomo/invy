package service

import (
	"cloud.google.com/go/firestore"
	fcm "firebase.google.com/go/v4/messaging"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/query"
)

type Service struct {
	Chat         *chatService
	Notification *notificationService
}

func NewService(db *ent.Client, dbQuery *query.Query, fcmClient *fcm.Client, firestoreClient *firestore.Client) *Service {
	return &Service{
		Chat:         newChatService(firestoreClient),
		Notification: newNotificationService(db, dbQuery, fcmClient),
	}
}
