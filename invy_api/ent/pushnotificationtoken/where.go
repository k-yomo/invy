// Code generated by ent, DO NOT EDIT.

package pushnotificationtoken

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
)

// ID filters vertices based on their ID field.
func ID(id uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldID, id))
}

// IDEQ applies the EQ predicate on the ID field.
func IDEQ(id uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldID, id))
}

// IDNEQ applies the NEQ predicate on the ID field.
func IDNEQ(id uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNEQ(FieldID, id))
}

// IDIn applies the In predicate on the ID field.
func IDIn(ids ...uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldIn(FieldID, ids...))
}

// IDNotIn applies the NotIn predicate on the ID field.
func IDNotIn(ids ...uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNotIn(FieldID, ids...))
}

// IDGT applies the GT predicate on the ID field.
func IDGT(id uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGT(FieldID, id))
}

// IDGTE applies the GTE predicate on the ID field.
func IDGTE(id uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGTE(FieldID, id))
}

// IDLT applies the LT predicate on the ID field.
func IDLT(id uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLT(FieldID, id))
}

// IDLTE applies the LTE predicate on the ID field.
func IDLTE(id uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLTE(FieldID, id))
}

// UserID applies equality check predicate on the "user_id" field. It's identical to UserIDEQ.
func UserID(v uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldUserID, v))
}

// DeviceID applies equality check predicate on the "device_id" field. It's identical to DeviceIDEQ.
func DeviceID(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldDeviceID, v))
}

// FcmToken applies equality check predicate on the "fcm_token" field. It's identical to FcmTokenEQ.
func FcmToken(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldFcmToken, v))
}

// CreatedAt applies equality check predicate on the "created_at" field. It's identical to CreatedAtEQ.
func CreatedAt(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldCreatedAt, v))
}

// UpdatedAt applies equality check predicate on the "updated_at" field. It's identical to UpdatedAtEQ.
func UpdatedAt(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldUpdatedAt, v))
}

// UserIDEQ applies the EQ predicate on the "user_id" field.
func UserIDEQ(v uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldUserID, v))
}

// UserIDNEQ applies the NEQ predicate on the "user_id" field.
func UserIDNEQ(v uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNEQ(FieldUserID, v))
}

// UserIDIn applies the In predicate on the "user_id" field.
func UserIDIn(vs ...uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldIn(FieldUserID, vs...))
}

// UserIDNotIn applies the NotIn predicate on the "user_id" field.
func UserIDNotIn(vs ...uuid.UUID) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNotIn(FieldUserID, vs...))
}

// DeviceIDEQ applies the EQ predicate on the "device_id" field.
func DeviceIDEQ(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldDeviceID, v))
}

// DeviceIDNEQ applies the NEQ predicate on the "device_id" field.
func DeviceIDNEQ(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNEQ(FieldDeviceID, v))
}

// DeviceIDIn applies the In predicate on the "device_id" field.
func DeviceIDIn(vs ...string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldIn(FieldDeviceID, vs...))
}

// DeviceIDNotIn applies the NotIn predicate on the "device_id" field.
func DeviceIDNotIn(vs ...string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNotIn(FieldDeviceID, vs...))
}

// DeviceIDGT applies the GT predicate on the "device_id" field.
func DeviceIDGT(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGT(FieldDeviceID, v))
}

// DeviceIDGTE applies the GTE predicate on the "device_id" field.
func DeviceIDGTE(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGTE(FieldDeviceID, v))
}

// DeviceIDLT applies the LT predicate on the "device_id" field.
func DeviceIDLT(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLT(FieldDeviceID, v))
}

// DeviceIDLTE applies the LTE predicate on the "device_id" field.
func DeviceIDLTE(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLTE(FieldDeviceID, v))
}

// DeviceIDContains applies the Contains predicate on the "device_id" field.
func DeviceIDContains(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldContains(FieldDeviceID, v))
}

// DeviceIDHasPrefix applies the HasPrefix predicate on the "device_id" field.
func DeviceIDHasPrefix(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldHasPrefix(FieldDeviceID, v))
}

// DeviceIDHasSuffix applies the HasSuffix predicate on the "device_id" field.
func DeviceIDHasSuffix(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldHasSuffix(FieldDeviceID, v))
}

// DeviceIDEqualFold applies the EqualFold predicate on the "device_id" field.
func DeviceIDEqualFold(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEqualFold(FieldDeviceID, v))
}

// DeviceIDContainsFold applies the ContainsFold predicate on the "device_id" field.
func DeviceIDContainsFold(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldContainsFold(FieldDeviceID, v))
}

// FcmTokenEQ applies the EQ predicate on the "fcm_token" field.
func FcmTokenEQ(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldFcmToken, v))
}

// FcmTokenNEQ applies the NEQ predicate on the "fcm_token" field.
func FcmTokenNEQ(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNEQ(FieldFcmToken, v))
}

// FcmTokenIn applies the In predicate on the "fcm_token" field.
func FcmTokenIn(vs ...string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldIn(FieldFcmToken, vs...))
}

// FcmTokenNotIn applies the NotIn predicate on the "fcm_token" field.
func FcmTokenNotIn(vs ...string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNotIn(FieldFcmToken, vs...))
}

// FcmTokenGT applies the GT predicate on the "fcm_token" field.
func FcmTokenGT(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGT(FieldFcmToken, v))
}

// FcmTokenGTE applies the GTE predicate on the "fcm_token" field.
func FcmTokenGTE(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGTE(FieldFcmToken, v))
}

// FcmTokenLT applies the LT predicate on the "fcm_token" field.
func FcmTokenLT(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLT(FieldFcmToken, v))
}

// FcmTokenLTE applies the LTE predicate on the "fcm_token" field.
func FcmTokenLTE(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLTE(FieldFcmToken, v))
}

// FcmTokenContains applies the Contains predicate on the "fcm_token" field.
func FcmTokenContains(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldContains(FieldFcmToken, v))
}

// FcmTokenHasPrefix applies the HasPrefix predicate on the "fcm_token" field.
func FcmTokenHasPrefix(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldHasPrefix(FieldFcmToken, v))
}

// FcmTokenHasSuffix applies the HasSuffix predicate on the "fcm_token" field.
func FcmTokenHasSuffix(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldHasSuffix(FieldFcmToken, v))
}

// FcmTokenEqualFold applies the EqualFold predicate on the "fcm_token" field.
func FcmTokenEqualFold(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEqualFold(FieldFcmToken, v))
}

// FcmTokenContainsFold applies the ContainsFold predicate on the "fcm_token" field.
func FcmTokenContainsFold(v string) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldContainsFold(FieldFcmToken, v))
}

// CreatedAtEQ applies the EQ predicate on the "created_at" field.
func CreatedAtEQ(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldCreatedAt, v))
}

// CreatedAtNEQ applies the NEQ predicate on the "created_at" field.
func CreatedAtNEQ(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNEQ(FieldCreatedAt, v))
}

// CreatedAtIn applies the In predicate on the "created_at" field.
func CreatedAtIn(vs ...time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldIn(FieldCreatedAt, vs...))
}

// CreatedAtNotIn applies the NotIn predicate on the "created_at" field.
func CreatedAtNotIn(vs ...time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNotIn(FieldCreatedAt, vs...))
}

// CreatedAtGT applies the GT predicate on the "created_at" field.
func CreatedAtGT(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGT(FieldCreatedAt, v))
}

// CreatedAtGTE applies the GTE predicate on the "created_at" field.
func CreatedAtGTE(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGTE(FieldCreatedAt, v))
}

// CreatedAtLT applies the LT predicate on the "created_at" field.
func CreatedAtLT(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLT(FieldCreatedAt, v))
}

// CreatedAtLTE applies the LTE predicate on the "created_at" field.
func CreatedAtLTE(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLTE(FieldCreatedAt, v))
}

// UpdatedAtEQ applies the EQ predicate on the "updated_at" field.
func UpdatedAtEQ(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldEQ(FieldUpdatedAt, v))
}

// UpdatedAtNEQ applies the NEQ predicate on the "updated_at" field.
func UpdatedAtNEQ(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNEQ(FieldUpdatedAt, v))
}

// UpdatedAtIn applies the In predicate on the "updated_at" field.
func UpdatedAtIn(vs ...time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldIn(FieldUpdatedAt, vs...))
}

// UpdatedAtNotIn applies the NotIn predicate on the "updated_at" field.
func UpdatedAtNotIn(vs ...time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldNotIn(FieldUpdatedAt, vs...))
}

// UpdatedAtGT applies the GT predicate on the "updated_at" field.
func UpdatedAtGT(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGT(FieldUpdatedAt, v))
}

// UpdatedAtGTE applies the GTE predicate on the "updated_at" field.
func UpdatedAtGTE(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldGTE(FieldUpdatedAt, v))
}

// UpdatedAtLT applies the LT predicate on the "updated_at" field.
func UpdatedAtLT(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLT(FieldUpdatedAt, v))
}

// UpdatedAtLTE applies the LTE predicate on the "updated_at" field.
func UpdatedAtLTE(v time.Time) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(sql.FieldLTE(FieldUpdatedAt, v))
}

// HasUser applies the HasEdge predicate on the "user" edge.
func HasUser() predicate.PushNotificationToken {
	return predicate.PushNotificationToken(func(s *sql.Selector) {
		step := sqlgraph.NewStep(
			sqlgraph.From(Table, FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, UserTable, UserColumn),
		)
		sqlgraph.HasNeighbors(s, step)
	})
}

// HasUserWith applies the HasEdge predicate on the "user" edge with a given conditions (other predicates).
func HasUserWith(preds ...predicate.User) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(func(s *sql.Selector) {
		step := newUserStep()
		sqlgraph.HasNeighborsWith(s, step, func(s *sql.Selector) {
			for _, p := range preds {
				p(s)
			}
		})
	})
}

// And groups predicates with the AND operator between them.
func And(predicates ...predicate.PushNotificationToken) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(func(s *sql.Selector) {
		s1 := s.Clone().SetP(nil)
		for _, p := range predicates {
			p(s1)
		}
		s.Where(s1.P())
	})
}

// Or groups predicates with the OR operator between them.
func Or(predicates ...predicate.PushNotificationToken) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(func(s *sql.Selector) {
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
func Not(p predicate.PushNotificationToken) predicate.PushNotificationToken {
	return predicate.PushNotificationToken(func(s *sql.Selector) {
		p(s.Not())
	})
}
