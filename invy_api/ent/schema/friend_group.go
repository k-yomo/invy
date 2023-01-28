package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// FriendGroup holds the schema definition for the FriendGroup entity.
type FriendGroup struct {
	ent.Schema
}

// Fields of the FriendGroup.
func (FriendGroup) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("user_id", uuid.UUID{}).Immutable(),
		field.String("name"),
		field.Int("total_count").Default(0),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
		field.Time("updated_at").
			Default(time.Now).
			UpdateDefault(time.Now),
	}
}

// Edges of the FriendGroup.
func (FriendGroup) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Immutable().
			Unique().
			Required().
			Field("user_id"),
		edge.To("friend_users", User.Type).
			Through("user_friend_groups", UserFriendGroup.Type),
	}
}
