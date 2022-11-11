package graph

import "github.com/k-yomo/bump/bump_api/ent"

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

type Resolver struct {
	DBClient *ent.Client
}
