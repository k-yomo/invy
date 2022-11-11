package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// LineAuth holds the schema definition for the LineAuth entity.
type LineAuth struct {
	ent.Schema
}

// Fields of the LineAuth.
func (LineAuth) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.String("line_id").
			Unique().
			Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the LineAuth.
func (LineAuth) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("user", User.Type).
			Ref("line_auth").
			Unique().
			Required(),
	}
}
