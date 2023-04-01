package graph

import (
	"cloud.google.com/go/firestore"
	firebaseAuth "firebase.google.com/go/v4/auth"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/query"
	"github.com/k-yomo/invy/invy_api/service"
	"github.com/k-yomo/invy/pkg/storage"
)

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

//go:generate gqlgen
type Resolver struct {
	// Use DB for mutation / simple query
	DB *ent.Client
	// Use DBQuery to work with complex query
	DBQuery                  *query.Query
	Service                  *service.Service
	FirebaseAuthClient       *firebaseAuth.Client
	FirestoreClient          *firestore.Client
	AvatarUploader           storage.FileUploader
	ChatMessageImageUploader storage.FileUploader
}
