// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent/dialect/sql"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent/user"
	"github.com/k-yomo/bump/bump_api/ent/usermute"
)

// UserMute is the model entity for the UserMute schema.
type UserMute struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// UserID holds the value of the "user_id" field.
	UserID uuid.UUID `json:"user_id,omitempty"`
	// MuteUserID holds the value of the "mute_user_id" field.
	MuteUserID uuid.UUID `json:"mute_user_id,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the UserMuteQuery when eager-loading is set.
	Edges UserMuteEdges `json:"edges"`
}

// UserMuteEdges holds the relations/edges for other nodes in the graph.
type UserMuteEdges struct {
	// User holds the value of the user edge.
	User *User `json:"user,omitempty"`
	// MuteUser holds the value of the mute_user edge.
	MuteUser *User `json:"mute_user,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [2]bool
	// totalCount holds the count of the edges above.
	totalCount [2]map[string]int
}

// UserOrErr returns the User value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e UserMuteEdges) UserOrErr() (*User, error) {
	if e.loadedTypes[0] {
		if e.User == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: user.Label}
		}
		return e.User, nil
	}
	return nil, &NotLoadedError{edge: "user"}
}

// MuteUserOrErr returns the MuteUser value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e UserMuteEdges) MuteUserOrErr() (*User, error) {
	if e.loadedTypes[1] {
		if e.MuteUser == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: user.Label}
		}
		return e.MuteUser, nil
	}
	return nil, &NotLoadedError{edge: "mute_user"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*UserMute) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case usermute.FieldCreatedAt:
			values[i] = new(sql.NullTime)
		case usermute.FieldID, usermute.FieldUserID, usermute.FieldMuteUserID:
			values[i] = new(uuid.UUID)
		default:
			return nil, fmt.Errorf("unexpected column %q for type UserMute", columns[i])
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the UserMute fields.
func (um *UserMute) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case usermute.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				um.ID = *value
			}
		case usermute.FieldUserID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field user_id", values[i])
			} else if value != nil {
				um.UserID = *value
			}
		case usermute.FieldMuteUserID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field mute_user_id", values[i])
			} else if value != nil {
				um.MuteUserID = *value
			}
		case usermute.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				um.CreatedAt = value.Time
			}
		}
	}
	return nil
}

// QueryUser queries the "user" edge of the UserMute entity.
func (um *UserMute) QueryUser() *UserQuery {
	return (&UserMuteClient{config: um.config}).QueryUser(um)
}

// QueryMuteUser queries the "mute_user" edge of the UserMute entity.
func (um *UserMute) QueryMuteUser() *UserQuery {
	return (&UserMuteClient{config: um.config}).QueryMuteUser(um)
}

// Update returns a builder for updating this UserMute.
// Note that you need to call UserMute.Unwrap() before calling this method if this UserMute
// was returned from a transaction, and the transaction was committed or rolled back.
func (um *UserMute) Update() *UserMuteUpdateOne {
	return (&UserMuteClient{config: um.config}).UpdateOne(um)
}

// Unwrap unwraps the UserMute entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (um *UserMute) Unwrap() *UserMute {
	_tx, ok := um.config.driver.(*txDriver)
	if !ok {
		panic("ent: UserMute is not a transactional entity")
	}
	um.config.driver = _tx.drv
	return um
}

// String implements the fmt.Stringer.
func (um *UserMute) String() string {
	var builder strings.Builder
	builder.WriteString("UserMute(")
	builder.WriteString(fmt.Sprintf("id=%v, ", um.ID))
	builder.WriteString("user_id=")
	builder.WriteString(fmt.Sprintf("%v", um.UserID))
	builder.WriteString(", ")
	builder.WriteString("mute_user_id=")
	builder.WriteString(fmt.Sprintf("%v", um.MuteUserID))
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(um.CreatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// UserMutes is a parsable slice of UserMute.
type UserMutes []*UserMute

func (um UserMutes) config(cfg config) {
	for _i := range um {
		um[_i].config = cfg
	}
}