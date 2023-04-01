package logging

import (
	"context"
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/99designs/gqlgen/graphql"
	"github.com/blendle/zapdriver"
	"github.com/grpc-ecosystem/go-grpc-middleware/logging/zap/ctxzap"
	"github.com/k-yomo/invy/pkg/requestutil"
	"github.com/pkg/errors"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

// NewMiddleware returns middleware to set logger to context
func NewMiddleware(gcpProjectID string, logger *zap.Logger) func(next http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			t := newTraceFromTraceContext(gcpProjectID, r.Header.Get("X-Cloud-Trace-Context"))
			zapFields := append(
				zapdriver.TraceContext(t.TraceID, t.SpanID, true, t.ProjectID),
				zap.String("ip", r.RemoteAddr),
				zap.String("requestId", requestutil.GetRequestID(r.Context())),
			)
			ctx := ctxzap.ToContext(r.Context(), logger.With(zapFields...))
			next.ServeHTTP(w, r.WithContext(ctx))
		})
	}
}

type traceInfo struct {
	ProjectID string
	TraceID   string
	SpanID    string
}

func newTraceFromTraceContext(projectID, traceContext string) traceInfo {
	t := traceInfo{ProjectID: projectID}
	if traceContext != "" {
		params := strings.Split(traceContext, "/")
		if len(params) >= 2 {
			t.TraceID = params[0]
			t.SpanID = params[1]
		}
	}
	return t
}

type GraphQLResponseInterceptor struct{}

var _ interface {
	graphql.HandlerExtension
	graphql.ResponseInterceptor
} = GraphQLResponseInterceptor{}

func (g GraphQLResponseInterceptor) ExtensionName() string {
	return "Logging"
}

func (g GraphQLResponseInterceptor) Validate(schema graphql.ExecutableSchema) error {
	return nil
}

func (g GraphQLResponseInterceptor) InterceptResponse(ctx context.Context, next graphql.ResponseHandler) *graphql.Response {
	oc := graphql.GetOperationContext(ctx)
	resp := next(ctx)

	latency := time.Since(oc.Stats.OperationStart)
	operationName := oc.OperationName
	if oc.Operation != nil {
		operationName = oc.Operation.Name
	}
	reqLog := requestLog{
		GraphqlOperation:    operationName,
		Latency:             newCloudLoggingDuration(latency),
		LatencyMilliseconds: latency.Milliseconds(),
		ResponseSize:        int64(len(resp.Data)),
	}
	Logger(ctx).Info(
		fmt.Sprintf("graphql operation: %s", operationName),
		zap.Bool("isError", resp.Errors != nil),
		zap.Object("httpRequest", &reqLog),
	)
	AddFields(ctx, zap.String("graphqlOperation", operationName))
	return resp
}

type requestLog struct {
	GraphqlOperation    string
	Latency             cloudLoggingDuration
	LatencyMilliseconds int64
	ResponseSize        int64
}

func (r *requestLog) MarshalLogObject(enc zapcore.ObjectEncoder) error {
	enc.AddString("graphqlOperation", r.GraphqlOperation)
	enc.AddInt64("latencyMs", r.LatencyMilliseconds)
	err := enc.AddObject("latency", r.Latency)
	if err != nil {
		return errors.WithStack(err)
	}
	enc.AddInt64("responseSize", r.ResponseSize)
	return nil
}

type cloudLoggingDuration struct {
	Seconds int64
	Nanos   int32
}

func newCloudLoggingDuration(d time.Duration) cloudLoggingDuration {
	nanos := d.Nanoseconds()
	secs := nanos / 1e9
	nanos -= secs * 1e9
	return cloudLoggingDuration{
		Nanos:   int32(nanos),
		Seconds: secs,
	}
}

func (c cloudLoggingDuration) MarshalLogObject(enc zapcore.ObjectEncoder) error {
	enc.AddInt64("seconds", c.Seconds)
	enc.AddInt32("nanos", c.Nanos)
	return nil
}
