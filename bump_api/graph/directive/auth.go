package directive

import (
	"context"
	"errors"

	"github.com/99designs/gqlgen/graphql"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/auth"
)

func AuthRequired(ctx context.Context, obj interface{}, next graphql.Resolver) (res interface{}, err error) {
	if userID := auth.GetUserID(ctx); userID == uuid.Nil {
		return nil, errors.New("unauthenticated")
	}
	return next(ctx)
}
