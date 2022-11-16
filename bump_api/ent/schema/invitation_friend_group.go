package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// InvitationFriendGroup holds the schema definition for the InvitationFriendGroup entity.
type InvitationFriendGroup struct {
	ent.Schema
}

// Fields of the InvitationFriendGroup.
func (InvitationFriendGroup) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("invitation_id", uuid.UUID{}).Immutable(),
		field.UUID("friend_group_id", uuid.UUID{}).Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the InvitationFriendGroup.
func (InvitationFriendGroup) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("invitation", Invitation.Type).
			Immutable().
			Unique().
			Required().
			Field("invitation_id"),
		edge.To("friend_group", FriendGroup.Type).
			Immutable().
			Unique().
			Required().
			Field("friend_group_id"),
	}
}
