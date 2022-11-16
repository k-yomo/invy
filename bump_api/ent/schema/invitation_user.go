package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// InvitationUser holds the schema definition for the InvitationUser entity.
type InvitationUser struct {
	ent.Schema
}

// Fields of the InvitationUser.
func (InvitationUser) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("invitation_id", uuid.UUID{}).Immutable(),
		field.UUID("user_id", uuid.UUID{}).Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the InvitationUser.
func (InvitationUser) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("invitation", Invitation.Type).
			Immutable().
			Unique().
			Required().
			Field("invitation_id"),
		edge.To("user", User.Type).
			Immutable().
			Unique().
			Required().
			Field("user_id"),
	}
}
