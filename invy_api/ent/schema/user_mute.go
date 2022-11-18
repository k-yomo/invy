package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// UserMute holds the schema definition for the UserMute entity.
type UserMute struct {
	ent.Schema
}

// Fields of the UserMute.
func (UserMute) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("user_id", uuid.UUID{}).Immutable(),
		field.UUID("mute_user_id", uuid.UUID{}).Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the UserMute.
func (UserMute) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Required().
			Unique().
			Field("user_id").
			Immutable(),
		edge.To("mute_user", User.Type).
			Required().
			Unique().
			Field("mute_user_id").
			Immutable(),
	}
}

func (UserMute) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("user_id", "mute_user_id").Unique(),
	}
}
