package tracing

import (
	"context"

	texporter "github.com/GoogleCloudPlatform/opentelemetry-operations-go/exporter/trace"
	"go.opentelemetry.io/otel"
	sdktrace "go.opentelemetry.io/otel/sdk/trace"
	"go.opentelemetry.io/otel/trace"
)

func InitTracer() (shutdown func(ctx context.Context) error, _ error) {
	exporter, err := texporter.New()
	if err != nil {
		return nil, err
	}

	sampler := sdktrace.ParentBased(
		sdktrace.NeverSample(),
		sdktrace.WithRemoteParentSampled(sdktrace.AlwaysSample()),
	)

	tp := sdktrace.NewTracerProvider(
		sdktrace.WithBatcher(exporter),
		sdktrace.WithSampler(sampler),
	)
	otel.SetTracerProvider(tp)

	return exporter.Shutdown, nil
}

func NewSpan(ctx context.Context, spanName string) (context.Context, trace.Span) {
	return otel.Tracer("").Start(ctx, spanName)
}
