package requestutil

import (
	"context"
	"net/http"

	"github.com/k-yomo/bump/pkg/xuuid"
)

type (
	ctxKeyRequestID     struct{}
	ctxKeyRequestHeader struct{}
)

const RequestIDHeader = "X-Request-Id"

func Middleware(next http.Handler) http.Handler {
	fn := func(w http.ResponseWriter, r *http.Request) {
		ctx := r.Context()
		requestID := r.Header.Get(RequestIDHeader)
		if requestID == "" {
			requestID = xuuid.New().String()
		}
		ctx = context.WithValue(ctx, ctxKeyRequestID{}, requestID)
		ctx = context.WithValue(ctx, ctxKeyRequestHeader{}, r.Header)
		next.ServeHTTP(w, r.WithContext(ctx))
	}
	return http.HandlerFunc(fn)
}

func GetRequestID(ctx context.Context) string {
	if reqID, ok := ctx.Value(ctxKeyRequestID{}).(string); ok {
		return reqID
	}
	return ""
}

func GetRequestHeader(ctx context.Context) http.Header {
	if header, ok := ctx.Value(ctxKeyRequestHeader{}).(http.Header); ok {
		return header
	}
	return map[string][]string{}
}
