package graph

import (
	"context"

	"github.com/99designs/gqlgen/graphql"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/requestutil"
	"github.com/vektah/gqlparser/v2/gqlerror"
)

func NewErrorPresenter() graphql.ErrorPresenterFunc {
	return func(ctx context.Context, err error) *gqlerror.Error {
		gqlErr := graphql.DefaultErrorPresenter(ctx, err)
		code := xerrors.Code(gqlErr.Unwrap())
		gqlErr.Extensions = map[string]interface{}{
			"code":      code,
			"requestId": requestutil.GetRequestID(ctx),
			"message":   err.Error(),
		}
		if code == gqlmodel.ErrorCodeInternal {
			logging.Logger(ctx).Error(err.Error())
			gqlErr.Message = "internal server error"
		}
		return gqlErr
	}
}
