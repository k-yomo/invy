// Code generated by ent, DO NOT EDIT.

package userfriendgroup

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent/predicate"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldID), id))
	})
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldID), id))
	})
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldID), id))
	})
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		v := make([]any, len(ids))
		for i := range v {
			v[i] = ids[i]
		}
		s.Where(sql.In(s.C(FieldID), v...))
	})
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		v := make([]any, len(ids))
		for i := range v {
			v[i] = ids[i]
		}
		s.Where(sql.NotIn(s.C(FieldID), v...))
	})
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.GT(s.C(FieldID), id))
	})
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.GTE(s.C(FieldID), id))
	})
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.LT(s.C(FieldID), id))
	})
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.LTE(s.C(FieldID), id))
	})
}

// FriendGroupID applies equality check predicate on the "friend_group_id" field. It's identical to FriendGroupIDEQ.
func FriendGroupID(v uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldFriendGroupID), v))
	})
}

// UserID applies equality check predicate on the "user_id" field. It's identical to UserIDEQ.
func UserID(v uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldUserID), v))
	})
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldCreatedAt), v))
	})
}

// FriendGroupIDEQ applies the EQ predicate on the "friend_group_id" field.
func FriendGroupIDEQ(v uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldFriendGroupID), v))
	})
}

// FriendGroupIDNEQ applies the NEQ predicate on the "friend_group_id" field.
func FriendGroupIDNEQ(v uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldFriendGroupID), v))
	})
}

// FriendGroupIDIn applies the In predicate on the "friend_group_id" field.
func FriendGroupIDIn(vs ...uuid.UUID) predicate.UserFriendGroup {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.In(s.C(FieldFriendGroupID), v...))
	})
}

// FriendGroupIDNotIn applies the NotIn predicate on the "friend_group_id" field.
func FriendGroupIDNotIn(vs ...uuid.UUID) predicate.UserFriendGroup {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.NotIn(s.C(FieldFriendGroupID), v...))
	})
}

// UserIDEQ applies the EQ predicate on the "user_id" field.
func UserIDEQ(v uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldUserID), v))
	})
}

// UserIDNEQ applies the NEQ predicate on the "user_id" field.
func UserIDNEQ(v uuid.UUID) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldUserID), v))
	})
}

// UserIDIn applies the In predicate on the "user_id" field.
func UserIDIn(vs ...uuid.UUID) predicate.UserFriendGroup {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.In(s.C(FieldUserID), v...))
	})
}

// UserIDNotIn applies the NotIn predicate on the "user_id" field.
func UserIDNotIn(vs ...uuid.UUID) predicate.UserFriendGroup {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.NotIn(s.C(FieldUserID), v...))
	})
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.UserFriendGroup {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.In(s.C(FieldCreatedAt), v...))
	})
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.UserFriendGroup {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.NotIn(s.C(FieldCreatedAt), v...))
	})
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.GT(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.GTE(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.LT(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s.Where(sql.LTE(s.C(FieldCreatedAt), v))
	})
}

// HasFriendGroup applies the HasEdge predicate on the "friend_group" edge.
func HasFriendGroup() predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(FriendGroupTable, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, FriendGroupTable, FriendGroupColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasFriendGroupWith applies the HasEdge predicate on the "friend_group" edge with a given conditions (other predicates).
func HasFriendGroupWith(preds ...predicate.FriendGroup) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(FriendGroupInverseTable, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, FriendGroupTable, FriendGroupColumn),
		)
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// HasUser applies the HasEdge predicate on the "user" edge.
func HasUser() predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(UserTable, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, UserTable, UserColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasUserWith applies the HasEdge predicate on the "user" edge with a given conditions (other predicates).
func HasUserWith(preds ...predicate.User) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(UserInverseTable, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, UserTable, UserColumn),
		)
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.UserFriendGroup) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s1 := s.Clone().SetP(nil)
		for _, p := range predicates {
			p(s1)
		}
		s.Where(s1.P())
	})
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.UserFriendGroup) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		s1 := s.Clone().SetP(nil)
		for i, p := range predicates {
			if i > 0 {
				s1.Or()
			}
			p(s1)
		}
		s.Where(s1.P())
	})
}

// Not applies the not operator on the given predicate.
func Not(p predicate.UserFriendGroup) predicate.UserFriendGroup {
	return predicate.UserFriendGroup(func(s *sql.Selector) {
		p(s.Not())
	})
}
