package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// PushNotificationToken holds the schema definition for the PushNotificationToken entity.
type PushNotificationToken struct {
	ent.Schema
}

// Fields of the PushNotificationToken.
func (PushNotificationToken) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New).
			Immutable(),
		// When different user logs in the same device, it can be updated
		// (In the most case, records will be deleted at the sign out time, so update won't happen)
		field.UUID("user_id", uuid.UUID{}),
		field.String("device_id").
			Immutable().
			Unique(),
		field.String("fcm_token").
			Unique(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
		field.Time("updated_at").
			Default(time.Now).
			UpdateDefault(time.Now),
	}
}

// Edges of the PushNotificationToken.
func (PushNotificationToken) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Unique().
			Required().
			Field("user_id"),
	}
}
