package graph

import (
	firebaseAuth "firebase.google.com/go/v4/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/query"
	"github.com/k-yomo/invy/invy_api/service/chat_service"
	"github.com/k-yomo/invy/invy_api/service/notification_service"
	"github.com/k-yomo/invy/invy_api/service/user_service"
	"github.com/k-yomo/invy/pkg/cache"
	"github.com/k-yomo/invy/pkg/storage"
)

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

//go:generate gqlgen
type Resolver struct {
	// Use DB for mutation / simple query
	DB    *ent.Client
	Cache *cache.Cache
	// Use DBQuery to work with complex query
	DBQuery *query.Query

	UserService         user_service.UserService
	ChatService         chat_service.ChatService
	NotificationService notification_service.NotificationService
	FirebaseAuthClient  *firebaseAuth.Client
	AvatarUploader      storage.FileUploader
}
