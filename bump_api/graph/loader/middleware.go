package loader

import (
	"context"
	"net/http"

	"github.com/k-yomo/bump/bump_api/ent"
)

type ctxKeyLoaders struct{}

// Middleware injects loader
func Middleware(db *ent.Client) func(next http.Handler) http.Handler {
	loaders := NewLoaders(db)

	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			nextCtx := context.WithValue(r.Context(), ctxKeyLoaders{}, loaders)
			next.ServeHTTP(w, r.WithContext(nextCtx))
		})
	}
}

func Get(ctx context.Context) *Loaders {
	return ctx.Value(ctxKeyLoaders{}).(*Loaders)
}
