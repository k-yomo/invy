package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// InvitationAcceptance holds the schema definition for the InvitationAcceptance entity.
type InvitationAcceptance struct {
	ent.Schema
}

// Fields of the InvitationAcceptance.
func (InvitationAcceptance) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("user_id", uuid.UUID{}).Immutable(),
		field.UUID("invitation_id", uuid.UUID{}).Immutable(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the InvitationAcceptance.
func (InvitationAcceptance) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Immutable().
			Unique().
			Required().
			Field("user_id"),
		edge.To("invitation", Invitation.Type).
			Immutable().
			Unique().
			Required().
			Field("invitation_id"),
	}
}

func (InvitationAcceptance) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("user_id", "invitation_id").Unique(),
	}
}
