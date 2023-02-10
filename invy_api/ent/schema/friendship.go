package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Friendship holds the schema definition for the Friendship entity.
type Friendship struct {
	ent.Schema
}

// Fields of the Friendship.
func (Friendship) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("user_id", uuid.UUID{}).Immutable(),
		field.UUID("friend_user_id", uuid.UUID{}).Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the Friendship.
func (Friendship) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Required().
			Unique().
			Field("user_id").
			Immutable(),
		edge.To("friend_user", User.Type).
			Required().
			Unique().
			Field("friend_user_id").
			Immutable(),
	}
}
