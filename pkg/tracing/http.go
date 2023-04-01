package tracing

import (
	"net/http"

	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
)

// HTTPMiddleware injects tracing into an HTTP handler and returns the handler.
func HTTPMiddleware(handler http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		h := otelhttp.NewHandler(handler, r.RequestURI)
		h.ServeHTTP(w, r)
	})
}
