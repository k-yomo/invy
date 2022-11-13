package schema

import (
	"time"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// User holds the schema definition for the User entity.
type User struct {
	ent.Schema
}

// Fields of the User.
func (User) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.String("auth_id").
			Immutable().
			Unique(),
		field.Time("created_at").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the User.
func (User) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("user_profile", UserProfile.Type).Unique(),
		edge.To("friend_users", User.Type).
			Through("friendships", Friendship.Type),
		edge.From("friend_groups", FriendGroup.Type).Ref("user"),
		edge.From("belonging_friend_groups", FriendGroup.Type).
			Ref("friend_users").
			Through("user_friend_groups", UserFriendGroup.Type),
	}
}
