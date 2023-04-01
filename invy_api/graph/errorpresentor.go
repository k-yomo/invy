package graph

import (
	"context"

	"github.com/99designs/gqlgen/graphql"
	"github.com/cockroachdb/errors"
	"github.com/k-yomo/invy/invy_api/graph/gqlmodel"
	"github.com/k-yomo/invy/invy_api/internal/xerrors"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/k-yomo/invy/pkg/requestutil"
	"github.com/vektah/gqlparser/v2/gqlerror"
	"go.uber.org/zap"
)

func NewErrorPresenter() graphql.ErrorPresenterFunc {
	return func(ctx context.Context, err error) *gqlerror.Error {
		gqlErr := graphql.DefaultErrorPresenter(ctx, err)
		code := xerrors.Code(gqlErr.Unwrap())
		gqlErr.Extensions = map[string]interface{}{
			"code":      code,
			"requestId": requestutil.GetRequestID(ctx),
		}
		if code == gqlmodel.ErrorCodeInternal {
			logging.Logger(ctx).
				// Increase stacktrace level not to log stacktrace here
				WithOptions(zap.AddStacktrace(zap.DPanicLevel)).
				Error(err.Error(), zap.Error(errors.Unwrap(err)))
			gqlErr.Message = "internal server error"
		}
		return gqlErr
	}
}
