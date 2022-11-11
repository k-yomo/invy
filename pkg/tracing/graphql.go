package tracing

import (
	"context"
	"fmt"

	"github.com/99designs/gqlgen/graphql"
	"github.com/99designs/gqlgen/graphql/handler/extension"
	"go.opentelemetry.io/otel"
	"go.opentelemetry.io/otel/attribute"
)

type GraphqlExtension struct {
	ComplexityExtensionName string
	DataDog                 bool
}

var _ interface {
	graphql.HandlerExtension
	graphql.ResponseInterceptor
} = GraphqlExtension{}

func (a GraphqlExtension) ExtensionName() string {
	return "OpenTelemetry"
}

func (a GraphqlExtension) Validate(schema graphql.ExecutableSchema) error {
	return nil
}

func (a GraphqlExtension) InterceptResponse(ctx context.Context, next graphql.ResponseHandler) *graphql.Response {
	tracer := otel.Tracer("response")
	ctx, span := tracer.Start(ctx, fmt.Sprintf("Operation/%s", operationName(ctx)))
	defer span.End()
	if !span.IsRecording() {
		return next(ctx)
	}

	oc := graphql.GetOperationContext(ctx)
	span.SetAttributes(
		attribute.String("request.query", oc.RawQuery),
	)
	complexityExtension := a.ComplexityExtensionName
	if complexityExtension == "" {
		complexityExtension = "ComplexityLimit"
	}
	complexityStats, ok := oc.Stats.GetExtension(complexityExtension).(*extension.ComplexityStats)
	if !ok {
		// complexity extension is not used
		complexityStats = &extension.ComplexityStats{}
	}

	if complexityStats.ComplexityLimit > 0 {
		span.SetAttributes(
			attribute.Int64("request.complexityLimit", int64(complexityStats.ComplexityLimit)),
			attribute.Int64("request.operationComplexity", int64(complexityStats.Complexity)),
		)
	}

	for key, val := range oc.Variables {
		span.SetAttributes(
			attribute.String(fmt.Sprintf("request.variables.%s", key), fmt.Sprintf("%+v", val)),
		)
	}

	return next(ctx)
}

func operationName(ctx context.Context) string {
	requestContext := graphql.GetOperationContext(ctx)
	requestName := "nameless-operation"
	if requestContext.Doc != nil && len(requestContext.Doc.Operations) != 0 {
		op := requestContext.Doc.Operations[0]
		if op.Name != "" {
			requestName = op.Name
		}
	}

	return requestName
}
