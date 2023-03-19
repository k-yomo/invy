package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/dialect"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/pkg/pgutil"
)

// Invitation holds the schema definition for the Invitation entity.
type Invitation struct {
	ent.Schema
}

// Fields of the Invitation.
func (Invitation) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("user_id", uuid.UUID{}).Immutable(),
		field.String("location"),
		field.Other("coordinate", &pgutil.GeoPoint{}).
			SchemaType(map[string]string{
				dialect.Postgres: "geometry(Point,4326)",
			}).
			Nillable().
			Optional(),
		field.String("comment"),
		field.Time("starts_at"),
		field.Time("expires_at"),
		field.UUID("chat_room_id", uuid.UUID{}).
			Immutable().
			Nillable().
			Optional(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
		field.Time("updated_at").
			Default(time.Now).
			UpdateDefault(time.Now),
	}
}

// Edges of the Invitation.
func (Invitation) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Immutable().
			Unique().
			Required().
			Field("user_id"),
		edge.From("invitation_users", InvitationUser.Type).
			Ref("invitation"),
		edge.From("invitation_acceptances", InvitationAcceptance.Type).
			Ref("invitation"),
		edge.From("invitation_denials", InvitationDenial.Type).
			Ref("invitation"),
	}
}
