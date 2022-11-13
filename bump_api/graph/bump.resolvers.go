package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/graph/gqlmodel"
)

// SendBump is the resolver for the sendBump field.
func (r *mutationResolver) SendBump(ctx context.Context, input *gqlmodel.SendBumpInput) (*gqlmodel.Bump, error) {
	panic(fmt.Errorf("not implemented: SendBump - sendBump"))
}

// AcceptBump is the resolver for the acceptBump field.
func (r *mutationResolver) AcceptBump(ctx context.Context, bumpID uuid.UUID) (bool, error) {
	panic(fmt.Errorf("not implemented: AcceptBump - acceptBump"))
}
