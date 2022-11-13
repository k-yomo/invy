package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// FriendshipRequest holds the schema definition for the FriendshipRequest entity.
type FriendshipRequest struct {
	ent.Schema
}

// Fields of the FriendshipRequest.
func (FriendshipRequest) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("from_user_id", uuid.UUID{}).
			Immutable(),
		field.UUID("to_user_id", uuid.UUID{}).
			Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

func (FriendshipRequest) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("from_user_id", "to_user_id").Unique(),
	}
}

// Edges of the FriendshipRequest.
func (FriendshipRequest) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("from_users", User.Type).
			Field("from_user_id").
			Required().
			Unique().
			Immutable(),
		edge.To("to_users", User.Type).
			Field("to_user_id").
			Required().
			Unique().
			Immutable(),
	}
}
