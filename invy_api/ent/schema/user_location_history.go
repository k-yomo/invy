package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/dialect"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/pkg/pgutil"
)

// UserLocationHistory holds the schema definition for the UserLocationHistory entity.
type UserLocationHistory struct {
	ent.Schema
}

// Fields of the UserLocationHistory.
func (UserLocationHistory) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.UUID("user_id", uuid.UUID{}).
			Immutable().
			Unique(),
		field.Other("coordinate", &pgutil.GeoPoint{}).
			SchemaType(map[string]string{
				dialect.Postgres: "geometry(Point,4326)",
			}),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the UserLocationHistory.
func (UserLocationHistory) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Required().
			Unique().
			Field("user_id").
			Immutable(),
	}
}

// Indexes of the UserLocationHistory.
func (UserLocationHistory) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("user_id", "created_at").
			Unique(),
	}
}
