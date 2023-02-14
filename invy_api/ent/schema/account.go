package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// Account holds the schema definition for the Account entity.
type Account struct {
	ent.Schema
}

// Fields of the Account.
func (Account) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.String("auth_id").
			Immutable().
			Unique(),
		field.String("email").
			Nillable().
			Optional(),
		field.String("phone_number").
			Nillable().
			Optional(),
		field.Enum("status").
			Values("active", "suspended", "deleted").
			Default("active"),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the Account.
func (Account) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("users", User.Type).
			Ref("account"),
	}
}

func (Account) Indexes() []ent.Index {
	return []ent.Index{
		// To make it possible to create account after withdrawal
		index.Fields("phone_number", "status").Unique(),
	}
}
