package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/dialect/entsql"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// UserFriendGroup holds the schema definition for the UserFriendGroup entity.
type UserFriendGroup struct {
	ent.Schema
}

// Fields of the UserFriendGroup.
func (UserFriendGroup) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("friend_group_id", uuid.UUID{}).Immutable(),
		field.UUID("user_id", uuid.UUID{}).Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the UserFriendGroup.
func (UserFriendGroup) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("friend_group", FriendGroup.Type).
			Required().
			Unique().
			Field("friend_group_id").
			Immutable().
			Annotations(entsql.Annotation{
				OnDelete: entsql.Cascade,
			}),
		edge.To("user", User.Type).
			Required().
			Unique().
			Field("user_id").
			Immutable(),
	}
}
