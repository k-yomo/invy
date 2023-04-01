package directive

import (
	"context"

	"github.com/99designs/gqlgen/graphql"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/internal/auth"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
)

func AuthRequired(ctx context.Context, obj interface{}, next graphql.Resolver) (res interface{}, err error) {
	if userID := auth.GetCurrentUserID(ctx); userID == uuid.Nil {
		return nil, xerrors.NewErrUnauthenticated()
	}
	return next(ctx)
}
