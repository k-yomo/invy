// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent/dialect/sql"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent/pushnotificationtoken"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// PushNotificationToken is the model entity for the PushNotificationToken schema.
type PushNotificationToken struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// UserID holds the value of the "user_id" field.
	UserID uuid.UUID `json:"user_id,omitempty"`
	// DeviceID holds the value of the "device_id" field.
	DeviceID string `json:"device_id,omitempty"`
	// FcmToken holds the value of the "fcm_token" field.
	FcmToken string `json:"fcm_token,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// UpdatedAt holds the value of the "updated_at" field.
	UpdatedAt time.Time `json:"updated_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the PushNotificationTokenQuery when eager-loading is set.
	Edges PushNotificationTokenEdges `json:"edges"`
}

// PushNotificationTokenEdges holds the relations/edges for other nodes in the graph.
type PushNotificationTokenEdges struct {
	// User holds the value of the user edge.
	User *User `json:"user,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [1]bool
	// totalCount holds the count of the edges above.
	totalCount [1]map[string]int
}

// UserOrErr returns the User value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e PushNotificationTokenEdges) UserOrErr() (*User, error) {
	if e.loadedTypes[0] {
		if e.User == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: user.Label}
		}
		return e.User, nil
	}
	return nil, &NotLoadedError{edge: "user"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*PushNotificationToken) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case pushnotificationtoken.FieldDeviceID, pushnotificationtoken.FieldFcmToken:
			values[i] = new(sql.NullString)
		case pushnotificationtoken.FieldCreatedAt, pushnotificationtoken.FieldUpdatedAt:
			values[i] = new(sql.NullTime)
		case pushnotificationtoken.FieldID, pushnotificationtoken.FieldUserID:
			values[i] = new(uuid.UUID)
		default:
			return nil, fmt.Errorf("unexpected column %q for type PushNotificationToken", columns[i])
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the PushNotificationToken fields.
func (pnt *PushNotificationToken) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case pushnotificationtoken.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				pnt.ID = *value
			}
		case pushnotificationtoken.FieldUserID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field user_id", values[i])
			} else if value != nil {
				pnt.UserID = *value
			}
		case pushnotificationtoken.FieldDeviceID:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field device_id", values[i])
			} else if value.Valid {
				pnt.DeviceID = value.String
			}
		case pushnotificationtoken.FieldFcmToken:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field fcm_token", values[i])
			} else if value.Valid {
				pnt.FcmToken = value.String
			}
		case pushnotificationtoken.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				pnt.CreatedAt = value.Time
			}
		case pushnotificationtoken.FieldUpdatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field updated_at", values[i])
			} else if value.Valid {
				pnt.UpdatedAt = value.Time
			}
		}
	}
	return nil
}

// QueryUser queries the "user" edge of the PushNotificationToken entity.
func (pnt *PushNotificationToken) QueryUser() *UserQuery {
	return (&PushNotificationTokenClient{config: pnt.config}).QueryUser(pnt)
}

// Update returns a builder for updating this PushNotificationToken.
// Note that you need to call PushNotificationToken.Unwrap() before calling this method if this PushNotificationToken
// was returned from a transaction, and the transaction was committed or rolled back.
func (pnt *PushNotificationToken) Update() *PushNotificationTokenUpdateOne {
	return (&PushNotificationTokenClient{config: pnt.config}).UpdateOne(pnt)
}

// Unwrap unwraps the PushNotificationToken entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (pnt *PushNotificationToken) Unwrap() *PushNotificationToken {
	_tx, ok := pnt.config.driver.(*txDriver)
	if !ok {
		panic("ent: PushNotificationToken is not a transactional entity")
	}
	pnt.config.driver = _tx.drv
	return pnt
}

// String implements the fmt.Stringer.
func (pnt *PushNotificationToken) String() string {
	var builder strings.Builder
	builder.WriteString("PushNotificationToken(")
	builder.WriteString(fmt.Sprintf("id=%v, ", pnt.ID))
	builder.WriteString("user_id=")
	builder.WriteString(fmt.Sprintf("%v", pnt.UserID))
	builder.WriteString(", ")
	builder.WriteString("device_id=")
	builder.WriteString(pnt.DeviceID)
	builder.WriteString(", ")
	builder.WriteString("fcm_token=")
	builder.WriteString(pnt.FcmToken)
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(pnt.CreatedAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("updated_at=")
	builder.WriteString(pnt.UpdatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// PushNotificationTokens is a parsable slice of PushNotificationToken.
type PushNotificationTokens []*PushNotificationToken

func (pnt PushNotificationTokens) config(cfg config) {
	for _i := range pnt {
		pnt[_i].config = cfg
	}
}
