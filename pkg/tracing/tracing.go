package tracing

import (
	"context"
	"fmt"

	texporter "github.com/GoogleCloudPlatform/opentelemetry-operations-go/exporter/trace"
	"go.opentelemetry.io/contrib/detectors/gcp"
	"go.opentelemetry.io/otel"
	"go.opentelemetry.io/otel/sdk/resource"
	sdktrace "go.opentelemetry.io/otel/sdk/trace"
	semconv "go.opentelemetry.io/otel/semconv/v1.4.0"
	"go.opentelemetry.io/otel/trace"
)

func InitTracer(ctx context.Context, serviceName string) (shutdown func(ctx context.Context) error, _ error) {
	exporter, err := texporter.New()
	if err != nil {
		return nil, fmt.Errorf("initialize gcp exporter: %w", err)
	}

	sampler := sdktrace.ParentBased(
		sdktrace.NeverSample(),
		sdktrace.WithRemoteParentSampled(sdktrace.AlwaysSample()),
	)

	res, err := resource.New(ctx,
		resource.WithDetectors(gcp.NewDetector()),
		resource.WithTelemetrySDK(),
		resource.WithAttributes(
			semconv.ServiceNameKey.String(serviceName),
		),
	)
	if err != nil {
		return nil, fmt.Errorf("initialize resource: %w", err)
	}

	tp := sdktrace.NewTracerProvider(
		sdktrace.WithBatcher(exporter),
		sdktrace.WithSampler(sampler),
		sdktrace.WithResource(res),
	)
	otel.SetTracerProvider(tp)

	return tp.Shutdown, nil
}

func NewSpan(ctx context.Context, spanName string) (context.Context, trace.Span) {
	return otel.Tracer("").Start(ctx, spanName)
}
