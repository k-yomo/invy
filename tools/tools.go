//go:build tools
// +build tools

package tools

import (
	_ "entgo.io/ent/cmd/ent"
	_ "github.com/99designs/gqlgen"
	_ "github.com/99designs/gqlgen/graphql/introspection"
	_ "github.com/cosmtrek/air"
	_ "github.com/golangci/golangci-lint/cmd/golangci-lint"
	_ "github.com/kyleconroy/sqlc/cmd/sqlc"
	_ "gotest.tools/gotestsum"
)
