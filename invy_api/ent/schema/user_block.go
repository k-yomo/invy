package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// UserBlock holds the schema definition for the UserBlock entity.
type UserBlock struct {
	ent.Schema
}

// Fields of the UserBlock.
func (UserBlock) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("user_id", uuid.UUID{}).Immutable(),
		field.UUID("block_user_id", uuid.UUID{}).Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the UserBlock.
func (UserBlock) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Required().
			Unique().
			Field("user_id").
			Immutable(),
		edge.To("block_user", User.Type).
			Required().
			Unique().
			Field("block_user_id").
			Immutable(),
	}
}

func (UserBlock) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("user_id", "block_user_id").Unique(),
	}
}
