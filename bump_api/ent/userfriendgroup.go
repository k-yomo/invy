// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent/dialect/sql"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent/friendgroup"
	"github.com/k-yomo/bump/bump_api/ent/user"
	"github.com/k-yomo/bump/bump_api/ent/userfriendgroup"
)

// UserFriendGroup is the model entity for the UserFriendGroup schema.
type UserFriendGroup struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// FriendGroupID holds the value of the "friend_group_id" field.
	FriendGroupID uuid.UUID `json:"friend_group_id,omitempty"`
	// UserID holds the value of the "user_id" field.
	UserID uuid.UUID `json:"user_id,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the UserFriendGroupQuery when eager-loading is set.
	Edges UserFriendGroupEdges `json:"edges"`
}

// UserFriendGroupEdges holds the relations/edges for other nodes in the graph.
type UserFriendGroupEdges struct {
	// FriendGroup holds the value of the friend_group edge.
	FriendGroup *FriendGroup `json:"friend_group,omitempty"`
	// User holds the value of the user edge.
	User *User `json:"user,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [2]bool
	// totalCount holds the count of the edges above.
	totalCount [2]map[string]int
}

// FriendGroupOrErr returns the FriendGroup value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e UserFriendGroupEdges) FriendGroupOrErr() (*FriendGroup, error) {
	if e.loadedTypes[0] {
		if e.FriendGroup == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: friendgroup.Label}
		}
		return e.FriendGroup, nil
	}
	return nil, &NotLoadedError{edge: "friend_group"}
}

// UserOrErr returns the User value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e UserFriendGroupEdges) UserOrErr() (*User, error) {
	if e.loadedTypes[1] {
		if e.User == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: user.Label}
		}
		return e.User, nil
	}
	return nil, &NotLoadedError{edge: "user"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*UserFriendGroup) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case userfriendgroup.FieldCreatedAt:
			values[i] = new(sql.NullTime)
		case userfriendgroup.FieldID, userfriendgroup.FieldFriendGroupID, userfriendgroup.FieldUserID:
			values[i] = new(uuid.UUID)
		default:
			return nil, fmt.Errorf("unexpected column %q for type UserFriendGroup", columns[i])
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the UserFriendGroup fields.
func (ufg *UserFriendGroup) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case userfriendgroup.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				ufg.ID = *value
			}
		case userfriendgroup.FieldFriendGroupID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field friend_group_id", values[i])
			} else if value != nil {
				ufg.FriendGroupID = *value
			}
		case userfriendgroup.FieldUserID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field user_id", values[i])
			} else if value != nil {
				ufg.UserID = *value
			}
		case userfriendgroup.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				ufg.CreatedAt = value.Time
			}
		}
	}
	return nil
}

// QueryFriendGroup queries the "friend_group" edge of the UserFriendGroup entity.
func (ufg *UserFriendGroup) QueryFriendGroup() *FriendGroupQuery {
	return (&UserFriendGroupClient{config: ufg.config}).QueryFriendGroup(ufg)
}

// QueryUser queries the "user" edge of the UserFriendGroup entity.
func (ufg *UserFriendGroup) QueryUser() *UserQuery {
	return (&UserFriendGroupClient{config: ufg.config}).QueryUser(ufg)
}

// Update returns a builder for updating this UserFriendGroup.
// Note that you need to call UserFriendGroup.Unwrap() before calling this method if this UserFriendGroup
// was returned from a transaction, and the transaction was committed or rolled back.
func (ufg *UserFriendGroup) Update() *UserFriendGroupUpdateOne {
	return (&UserFriendGroupClient{config: ufg.config}).UpdateOne(ufg)
}

// Unwrap unwraps the UserFriendGroup entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (ufg *UserFriendGroup) Unwrap() *UserFriendGroup {
	_tx, ok := ufg.config.driver.(*txDriver)
	if !ok {
		panic("ent: UserFriendGroup is not a transactional entity")
	}
	ufg.config.driver = _tx.drv
	return ufg
}

// String implements the fmt.Stringer.
func (ufg *UserFriendGroup) String() string {
	var builder strings.Builder
	builder.WriteString("UserFriendGroup(")
	builder.WriteString(fmt.Sprintf("id=%v, ", ufg.ID))
	builder.WriteString("friend_group_id=")
	builder.WriteString(fmt.Sprintf("%v", ufg.FriendGroupID))
	builder.WriteString(", ")
	builder.WriteString("user_id=")
	builder.WriteString(fmt.Sprintf("%v", ufg.UserID))
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(ufg.CreatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// UserFriendGroups is a parsable slice of UserFriendGroup.
type UserFriendGroups []*UserFriendGroup

func (ufg UserFriendGroups) config(cfg config) {
	for _i := range ufg {
		ufg[_i].config = cfg
	}
}