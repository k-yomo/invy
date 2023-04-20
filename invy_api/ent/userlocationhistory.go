// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent"
	"entgo.io/ent/dialect/sql"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userlocationhistory"
	"github.com/k-yomo/invy/pkg/pgutil"
)

// UserLocationHistory is the model entity for the UserLocationHistory schema.
type UserLocationHistory struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// UserID holds the value of the "user_id" field.
	UserID uuid.UUID `json:"user_id,omitempty"`
	// Coordinate holds the value of the "coordinate" field.
	Coordinate *pgutil.GeoPoint `json:"coordinate,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the UserLocationHistoryQuery when eager-loading is set.
	Edges        UserLocationHistoryEdges `json:"edges"`
	selectValues sql.SelectValues
}

// UserLocationHistoryEdges holds the relations/edges for other nodes in the graph.
type UserLocationHistoryEdges struct {
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
func (e UserLocationHistoryEdges) UserOrErr() (*User, error) {
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
func (*UserLocationHistory) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case userlocationhistory.FieldCoordinate:
			values[i] = new(pgutil.GeoPoint)
		case userlocationhistory.FieldCreatedAt:
			values[i] = new(sql.NullTime)
		case userlocationhistory.FieldID, userlocationhistory.FieldUserID:
			values[i] = new(uuid.UUID)
		default:
			values[i] = new(sql.UnknownType)
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the UserLocationHistory fields.
func (ulh *UserLocationHistory) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case userlocationhistory.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				ulh.ID = *value
			}
		case userlocationhistory.FieldUserID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field user_id", values[i])
			} else if value != nil {
				ulh.UserID = *value
			}
		case userlocationhistory.FieldCoordinate:
			if value, ok := values[i].(*pgutil.GeoPoint); !ok {
				return fmt.Errorf("unexpected type %T for field coordinate", values[i])
			} else if value != nil {
				ulh.Coordinate = value
			}
		case userlocationhistory.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				ulh.CreatedAt = value.Time
			}
		default:
			ulh.selectValues.Set(columns[i], values[i])
		}
	}
	return nil
}

// Value returns the ent.Value that was dynamically selected and assigned to the UserLocationHistory.
// This includes values selected through modifiers, order, etc.
func (ulh *UserLocationHistory) Value(name string) (ent.Value, error) {
	return ulh.selectValues.Get(name)
}

// QueryUser queries the "user" edge of the UserLocationHistory entity.
func (ulh *UserLocationHistory) QueryUser() *UserQuery {
	return NewUserLocationHistoryClient(ulh.config).QueryUser(ulh)
}

// Update returns a builder for updating this UserLocationHistory.
// Note that you need to call UserLocationHistory.Unwrap() before calling this method if this UserLocationHistory
// was returned from a transaction, and the transaction was committed or rolled back.
func (ulh *UserLocationHistory) Update() *UserLocationHistoryUpdateOne {
	return NewUserLocationHistoryClient(ulh.config).UpdateOne(ulh)
}

// Unwrap unwraps the UserLocationHistory entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (ulh *UserLocationHistory) Unwrap() *UserLocationHistory {
	_tx, ok := ulh.config.driver.(*txDriver)
	if !ok {
		panic("ent: UserLocationHistory is not a transactional entity")
	}
	ulh.config.driver = _tx.drv
	return ulh
}

// String implements the fmt.Stringer.
func (ulh *UserLocationHistory) String() string {
	var builder strings.Builder
	builder.WriteString("UserLocationHistory(")
	builder.WriteString(fmt.Sprintf("id=%v, ", ulh.ID))
	builder.WriteString("user_id=")
	builder.WriteString(fmt.Sprintf("%v", ulh.UserID))
	builder.WriteString(", ")
	builder.WriteString("coordinate=")
	builder.WriteString(fmt.Sprintf("%v", ulh.Coordinate))
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(ulh.CreatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// UserLocationHistories is a parsable slice of UserLocationHistory.
type UserLocationHistories []*UserLocationHistory
