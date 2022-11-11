// Code generated by entc, DO NOT EDIT.

package lineauth

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent/predicate"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldID), id))
	})
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldID), id))
	})
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldID), id))
	})
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		// if not arguments were provided, append the FALSE constants,
		// since we can't apply "IN ()". This will make this predicate falsy.
		if len(ids) == 0 {
			s.Where(sql.False())
			return
		}
		v := make([]interface{}, len(ids))
		for i := range v {
			v[i] = ids[i]
		}
		s.Where(sql.In(s.C(FieldID), v...))
	})
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		// if not arguments were provided, append the FALSE constants,
		// since we can't apply "IN ()". This will make this predicate falsy.
		if len(ids) == 0 {
			s.Where(sql.False())
			return
		}
		v := make([]interface{}, len(ids))
		for i := range v {
			v[i] = ids[i]
		}
		s.Where(sql.NotIn(s.C(FieldID), v...))
	})
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.GT(s.C(FieldID), id))
	})
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.GTE(s.C(FieldID), id))
	})
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.LT(s.C(FieldID), id))
	})
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.LTE(s.C(FieldID), id))
	})
}

// LineID applies equality check predicate on the "line_id" field. It's identical to LineIDEQ.
func LineID(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldLineID), v))
	})
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldCreatedAt), v))
	})
}

// LineIDEQ applies the EQ predicate on the "line_id" field.
func LineIDEQ(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldLineID), v))
	})
}

// LineIDNEQ applies the NEQ predicate on the "line_id" field.
func LineIDNEQ(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldLineID), v))
	})
}

// LineIDIn applies the In predicate on the "line_id" field.
func LineIDIn(vs ...string) predicate.LineAuth {
	v := make([]interface{}, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.LineAuth(func(s *sql.Selector) {
		// if not arguments were provided, append the FALSE constants,
		// since we can't apply "IN ()". This will make this predicate falsy.
		if len(v) == 0 {
			s.Where(sql.False())
			return
		}
		s.Where(sql.In(s.C(FieldLineID), v...))
	})
}

// LineIDNotIn applies the NotIn predicate on the "line_id" field.
func LineIDNotIn(vs ...string) predicate.LineAuth {
	v := make([]interface{}, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.LineAuth(func(s *sql.Selector) {
		// if not arguments were provided, append the FALSE constants,
		// since we can't apply "IN ()". This will make this predicate falsy.
		if len(v) == 0 {
			s.Where(sql.False())
			return
		}
		s.Where(sql.NotIn(s.C(FieldLineID), v...))
	})
}

// LineIDGT applies the GT predicate on the "line_id" field.
func LineIDGT(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.GT(s.C(FieldLineID), v))
	})
}

// LineIDGTE applies the GTE predicate on the "line_id" field.
func LineIDGTE(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.GTE(s.C(FieldLineID), v))
	})
}

// LineIDLT applies the LT predicate on the "line_id" field.
func LineIDLT(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.LT(s.C(FieldLineID), v))
	})
}

// LineIDLTE applies the LTE predicate on the "line_id" field.
func LineIDLTE(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.LTE(s.C(FieldLineID), v))
	})
}

// LineIDContains applies the Contains predicate on the "line_id" field.
func LineIDContains(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.Contains(s.C(FieldLineID), v))
	})
}

// LineIDHasPrefix applies the HasPrefix predicate on the "line_id" field.
func LineIDHasPrefix(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.HasPrefix(s.C(FieldLineID), v))
	})
}

// LineIDHasSuffix applies the HasSuffix predicate on the "line_id" field.
func LineIDHasSuffix(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.HasSuffix(s.C(FieldLineID), v))
	})
}

// LineIDEqualFold applies the EqualFold predicate on the "line_id" field.
func LineIDEqualFold(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.EqualFold(s.C(FieldLineID), v))
	})
}

// LineIDContainsFold applies the ContainsFold predicate on the "line_id" field.
func LineIDContainsFold(v string) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.ContainsFold(s.C(FieldLineID), v))
	})
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.EQ(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.NEQ(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.LineAuth {
	v := make([]interface{}, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.LineAuth(func(s *sql.Selector) {
		// if not arguments were provided, append the FALSE constants,
		// since we can't apply "IN ()". This will make this predicate falsy.
		if len(v) == 0 {
			s.Where(sql.False())
			return
		}
		s.Where(sql.In(s.C(FieldCreatedAt), v...))
	})
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.LineAuth {
	v := make([]interface{}, len(vs))
	for i := range v {
		v[i] = vs[i]
	}
	return predicate.LineAuth(func(s *sql.Selector) {
		// if not arguments were provided, append the FALSE constants,
		// since we can't apply "IN ()". This will make this predicate falsy.
		if len(v) == 0 {
			s.Where(sql.False())
			return
		}
		s.Where(sql.NotIn(s.C(FieldCreatedAt), v...))
	})
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.GT(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.GTE(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.LT(s.C(FieldCreatedAt), v))
	})
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s.Where(sql.LTE(s.C(FieldCreatedAt), v))
	})
}

// HasUser applies the HasEdge predicate on the "user" edge.
func HasUser() predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(UserTable, FieldID),
			sqlgraph.Edge(sqlgraph.O2O, true, UserTable, UserColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasUserWith applies the HasEdge predicate on the "user" edge with a given conditions (other predicates).
func HasUserWith(preds ...predicate.User) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.To(UserInverseTable, FieldID),
			sqlgraph.Edge(sqlgraph.O2O, true, UserTable, UserColumn),
		)
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.LineAuth) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		s1 := s.Clone().SetP(nil)
		for _, p := range predicates {
			p(s1)
		}
		s.Where(s1.P())
	})
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.LineAuth) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
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
func Not(p predicate.LineAuth) predicate.LineAuth {
	return predicate.LineAuth(func(s *sql.Selector) {
		p(s.Not())
	})
}
