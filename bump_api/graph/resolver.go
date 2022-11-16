package graph

import (
	firebaseAuth "firebase.google.com/go/v4/auth"
	"github.com/k-yomo/bump/bump_api/ent"
)

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

//go:generate go run github.com/99designs/gqlgen
type Resolver struct {
	DB                 *ent.Client
	FirebaseAuthClient *firebaseAuth.Client
}
