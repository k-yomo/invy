//go:build tools
// +build tools

package tools

import (
	_ "entgo.io/ent/cmd/ent"
	_ "github.com/99designs/gqlgen"
	_ "github.com/99designs/gqlgen/graphql/introspection"
	_ "gotest.tools/gotestsum"
)
