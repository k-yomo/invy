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
)

// FriendGroup is the model entity for the FriendGroup schema.
type FriendGroup struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// UserID holds the value of the "user_id" field.
	UserID uuid.UUID `json:"user_id,omitempty"`
	// Name holds the value of the "name" field.
	Name string `json:"name,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// UpdatedAt holds the value of the "updated_at" field.
	UpdatedAt time.Time `json:"updated_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the FriendGroupQuery when eager-loading is set.
	Edges FriendGroupEdges `json:"edges"`
}

// FriendGroupEdges holds the relations/edges for other nodes in the graph.
type FriendGroupEdges struct {
	// User holds the value of the user edge.
	User *User `json:"user,omitempty"`
	// FriendUsers holds the value of the friend_users edge.
	FriendUsers []*User `json:"friend_users,omitempty"`
	// UserFriendGroups holds the value of the user_friend_groups edge.
	UserFriendGroups []*UserFriendGroup `json:"user_friend_groups,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [3]bool
	// totalCount holds the count of the edges above.
	totalCount [3]map[string]int

	namedFriendUsers      map[string][]*User
	namedUserFriendGroups map[string][]*UserFriendGroup
}

// UserOrErr returns the User value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e FriendGroupEdges) UserOrErr() (*User, error) {
	if e.loadedTypes[0] {
		if e.User == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: user.Label}
		}
		return e.User, nil
	}
	return nil, &NotLoadedError{edge: "user"}
}

// FriendUsersOrErr returns the FriendUsers value or an error if the edge
// was not loaded in eager-loading.
func (e FriendGroupEdges) FriendUsersOrErr() ([]*User, error) {
	if e.loadedTypes[1] {
		return e.FriendUsers, nil
	}
	return nil, &NotLoadedError{edge: "friend_users"}
}

// UserFriendGroupsOrErr returns the UserFriendGroups value or an error if the edge
// was not loaded in eager-loading.
func (e FriendGroupEdges) UserFriendGroupsOrErr() ([]*UserFriendGroup, error) {
	if e.loadedTypes[2] {
		return e.UserFriendGroups, nil
	}
	return nil, &NotLoadedError{edge: "user_friend_groups"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*FriendGroup) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case friendgroup.FieldName:
			values[i] = new(sql.NullString)
		case friendgroup.FieldCreatedAt, friendgroup.FieldUpdatedAt:
			values[i] = new(sql.NullTime)
		case friendgroup.FieldID, friendgroup.FieldUserID:
			values[i] = new(uuid.UUID)
		default:
			return nil, fmt.Errorf("unexpected column %q for type FriendGroup", columns[i])
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the FriendGroup fields.
func (fg *FriendGroup) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case friendgroup.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				fg.ID = *value
			}
		case friendgroup.FieldUserID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field user_id", values[i])
			} else if value != nil {
				fg.UserID = *value
			}
		case friendgroup.FieldName:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field name", values[i])
			} else if value.Valid {
				fg.Name = value.String
			}
		case friendgroup.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				fg.CreatedAt = value.Time
			}
		case friendgroup.FieldUpdatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field updated_at", values[i])
			} else if value.Valid {
				fg.UpdatedAt = value.Time
			}
		}
	}
	return nil
}

// QueryUser queries the "user" edge of the FriendGroup entity.
func (fg *FriendGroup) QueryUser() *UserQuery {
	return (&FriendGroupClient{config: fg.config}).QueryUser(fg)
}

// QueryFriendUsers queries the "friend_users" edge of the FriendGroup entity.
func (fg *FriendGroup) QueryFriendUsers() *UserQuery {
	return (&FriendGroupClient{config: fg.config}).QueryFriendUsers(fg)
}

// QueryUserFriendGroups queries the "user_friend_groups" edge of the FriendGroup entity.
func (fg *FriendGroup) QueryUserFriendGroups() *UserFriendGroupQuery {
	return (&FriendGroupClient{config: fg.config}).QueryUserFriendGroups(fg)
}

// Update returns a builder for updating this FriendGroup.
// Note that you need to call FriendGroup.Unwrap() before calling this method if this FriendGroup
// was returned from a transaction, and the transaction was committed or rolled back.
func (fg *FriendGroup) Update() *FriendGroupUpdateOne {
	return (&FriendGroupClient{config: fg.config}).UpdateOne(fg)
}

// Unwrap unwraps the FriendGroup entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (fg *FriendGroup) Unwrap() *FriendGroup {
	_tx, ok := fg.config.driver.(*txDriver)
	if !ok {
		panic("ent: FriendGroup is not a transactional entity")
	}
	fg.config.driver = _tx.drv
	return fg
}

// String implements the fmt.Stringer.
func (fg *FriendGroup) String() string {
	var builder strings.Builder
	builder.WriteString("FriendGroup(")
	builder.WriteString(fmt.Sprintf("id=%v, ", fg.ID))
	builder.WriteString("user_id=")
	builder.WriteString(fmt.Sprintf("%v", fg.UserID))
	builder.WriteString(", ")
	builder.WriteString("name=")
	builder.WriteString(fg.Name)
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(fg.CreatedAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("updated_at=")
	builder.WriteString(fg.UpdatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// NamedFriendUsers returns the FriendUsers named value or an error if the edge was not
// loaded in eager-loading with this name.
func (fg *FriendGroup) NamedFriendUsers(name string) ([]*User, error) {
	if fg.Edges.namedFriendUsers == nil {
		return nil, &NotLoadedError{edge: name}
	}
	nodes, ok := fg.Edges.namedFriendUsers[name]
	if !ok {
		return nil, &NotLoadedError{edge: name}
	}
	return nodes, nil
}

func (fg *FriendGroup) appendNamedFriendUsers(name string, edges ...*User) {
	if fg.Edges.namedFriendUsers == nil {
		fg.Edges.namedFriendUsers = make(map[string][]*User)
	}
	if len(edges) == 0 {
		fg.Edges.namedFriendUsers[name] = []*User{}
	} else {
		fg.Edges.namedFriendUsers[name] = append(fg.Edges.namedFriendUsers[name], edges...)
	}
}

// NamedUserFriendGroups returns the UserFriendGroups named value or an error if the edge was not
// loaded in eager-loading with this name.
func (fg *FriendGroup) NamedUserFriendGroups(name string) ([]*UserFriendGroup, error) {
	if fg.Edges.namedUserFriendGroups == nil {
		return nil, &NotLoadedError{edge: name}
	}
	nodes, ok := fg.Edges.namedUserFriendGroups[name]
	if !ok {
		return nil, &NotLoadedError{edge: name}
	}
	return nodes, nil
}

func (fg *FriendGroup) appendNamedUserFriendGroups(name string, edges ...*UserFriendGroup) {
	if fg.Edges.namedUserFriendGroups == nil {
		fg.Edges.namedUserFriendGroups = make(map[string][]*UserFriendGroup)
	}
	if len(edges) == 0 {
		fg.Edges.namedUserFriendGroups[name] = []*UserFriendGroup{}
	} else {
		fg.Edges.namedUserFriendGroups[name] = append(fg.Edges.namedUserFriendGroups[name], edges...)
	}
}

// FriendGroups is a parsable slice of FriendGroup.
type FriendGroups []*FriendGroup

func (fg FriendGroups) config(cfg config) {
	for _i := range fg {
		fg[_i].config = cfg
	}
}
