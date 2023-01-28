package graph

import (
	firebaseAuth "firebase.google.com/go/v4/auth"
	fcm "firebase.google.com/go/v4/messaging"
	"github.com/k-yomo/invy/invy_api/ent"
	"github.com/k-yomo/invy/invy_api/query"
	"github.com/k-yomo/invy/pkg/storage"
)

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

//go:generate go run github.com/99designs/gqlgen
type Resolver struct {
	// Use DB for mutation / simple query
	DB *ent.Client
	// Use DBQuery to work with complex query
	DBQuery            *query.Query
	FirebaseAuthClient *firebaseAuth.Client
	FCMClient          *fcm.Client
	AvatarUploader     storage.FileUploader
}
