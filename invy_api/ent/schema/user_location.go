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

// UserLocation holds the schema definition for the UserLocation entity.
type UserLocation struct {
	ent.Schema
}

// Fields of the UserLocation.
func (UserLocation) Fields() []ent.Field {
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
		field.Time("updated_at").
			Default(time.Now).
			UpdateDefault(time.Now),
	}
}

// Edges of the UserLocation.
func (UserLocation) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user", User.Type).
			Required().
			Unique().
			Field("user_id").
			Immutable(),
	}
}

func (UserLocation) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("user_id").
			Unique(),
	}
}
