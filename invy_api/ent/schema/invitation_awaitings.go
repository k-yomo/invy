package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// InvitationAwaiting holds the schema definition for the InvitationAwaiting entity.
type InvitationAwaiting struct {
	ent.Schema
}

// Fields of the InvitationAwaiting.
func (InvitationAwaiting) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("user_id", uuid.UUID{}).
			Immutable(),
		field.Time("starts_at"),
		field.Time("ends_at"),
		field.String("comment"),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
		field.Time("updated_at").
			Default(time.Now).
			UpdateDefault(time.Now),
	}
}

// Edges of the InvitationAwaiting.
func (InvitationAwaiting) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Immutable().
			Unique().
			Required().
			Field("user_id"),
	}
}
