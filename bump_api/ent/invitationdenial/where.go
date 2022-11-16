// Code generated by ent, DO NOT EDIT.

package invitationdenial

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent/predicate"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldID), id))
	})
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldID), id))
	})
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldID), id))
	})
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		v := make([]any, len(ids))
		for i := range v {
			v[i] = ids[i]
		}
		s.Where(sql.In(s.C(FieldID), v...))
	})
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		v := make([]any, len(ids))
		for i := range v {
			v[i] = ids[i]
		}
		s.Where(sql.NotIn(s.C(FieldID), v...))
	})
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.GT(s.C(FieldID), id))
	})
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.GTE(s.C(FieldID), id))
	})
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.LT(s.C(FieldID), id))
	})
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.LTE(s.C(FieldID), id))
	})
}

// UserID applies equality check predicate on the "user_id" field. It's identical to UserIDEQ.
func UserID(v uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldUserID), v))
	})
}

// InvitationID applies equality check predicate on the "invitation_id" field. It's identical to InvitationIDEQ.
func InvitationID(v uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldInvitationID), v))
	})
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldCreatedAt), v))
	})
}

// UserIDEQ applies the EQ predicate on the "user_id" field.
func UserIDEQ(v uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldUserID), v))
	})
}

// UserIDNEQ applies the NEQ predicate on the "user_id" field.
func UserIDNEQ(v uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldUserID), v))
	})
}

// UserIDIn applies the In predicate on the "user_id" field.
func UserIDIn(vs ...uuid.UUID) predicate.InvitationDenial {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.In(s.C(FieldUserID), v...))
	})
}

// UserIDNotIn applies the NotIn predicate on the "user_id" field.
func UserIDNotIn(vs ...uuid.UUID) predicate.InvitationDenial {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.NotIn(s.C(FieldUserID), v...))
	})
}

// InvitationIDEQ applies the EQ predicate on the "invitation_id" field.
func InvitationIDEQ(v uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldInvitationID), v))
	})
}

// InvitationIDNEQ applies the NEQ predicate on the "invitation_id" field.
func InvitationIDNEQ(v uuid.UUID) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldInvitationID), v))
	})
}

// InvitationIDIn applies the In predicate on the "invitation_id" field.
func InvitationIDIn(vs ...uuid.UUID) predicate.InvitationDenial {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.In(s.C(FieldInvitationID), v...))
	})
}

// InvitationIDNotIn applies the NotIn predicate on the "invitation_id" field.
func InvitationIDNotIn(vs ...uuid.UUID) predicate.InvitationDenial {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.NotIn(s.C(FieldInvitationID), v...))
	})
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.InvitationDenial {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.In(s.C(FieldCreatedAt), v...))
	})
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.InvitationDenial {
	v := make([]any, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.NotIn(s.C(FieldCreatedAt), v...))
	})
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.GT(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.GTE(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.LT(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s.Where(sql.LTE(s.C(FieldCreatedAt), v))
	})
}

// HasUser applies the HasEdge predicate on the "user" edge.
func HasUser() predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(UserTable, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, UserTable, UserColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasUserWith applies the HasEdge predicate on the "user" edge with a given conditions (other predicates).
func HasUserWith(preds ...predicate.User) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
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

// HasInvitation applies the HasEdge predicate on the "invitation" edge.
func HasInvitation() predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(InvitationTable, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, InvitationTable, InvitationColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasInvitationWith applies the HasEdge predicate on the "invitation" edge with a given conditions (other predicates).
func HasInvitationWith(preds ...predicate.Invitation) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(InvitationInverseTable, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, InvitationTable, InvitationColumn),
		)
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.InvitationDenial) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		s1 := s.Clone().SetP(nil)
		for _, p := range predicates {
			p(s1)
		}
		s.Where(s1.P())
	})
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.InvitationDenial) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
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
func Not(p predicate.InvitationDenial) predicate.InvitationDenial {
	return predicate.InvitationDenial(func(s *sql.Selector) {
		p(s.Not())
	})
}
