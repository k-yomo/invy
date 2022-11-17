// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent/dialect/sql"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent/user"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
)

// UserProfile is the model entity for the UserProfile schema.
type UserProfile struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// UserID holds the value of the "user_id" field.
	UserID uuid.UUID `json:"user_id,omitempty"`
	// ScreenID holds the value of the "screen_id" field.
	ScreenID string `json:"screen_id,omitempty"`
	// Nickname holds the value of the "nickname" field.
	Nickname string `json:"nickname,omitempty"`
	// Email holds the value of the "email" field.
	Email *string `json:"email,omitempty"`
	// AvatarURL holds the value of the "avatar_url" field.
	AvatarURL string `json:"avatar_url,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// UpdatedAt holds the value of the "updated_at" field.
	UpdatedAt time.Time `json:"updated_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the UserProfileQuery when eager-loading is set.
	Edges UserProfileEdges `json:"edges"`
}

// UserProfileEdges holds the relations/edges for other nodes in the graph.
type UserProfileEdges struct {
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
func (e UserProfileEdges) UserOrErr() (*User, error) {
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
func (*UserProfile) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case userprofile.FieldScreenID, userprofile.FieldNickname, userprofile.FieldEmail, userprofile.FieldAvatarURL:
			values[i] = new(sql.NullString)
		case userprofile.FieldCreatedAt, userprofile.FieldUpdatedAt:
			values[i] = new(sql.NullTime)
		case userprofile.FieldID, userprofile.FieldUserID:
			values[i] = new(uuid.UUID)
		default:
			return nil, fmt.Errorf("unexpected column %q for type UserProfile", columns[i])
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the UserProfile fields.
func (up *UserProfile) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case userprofile.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				up.ID = *value
			}
		case userprofile.FieldUserID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field user_id", values[i])
			} else if value != nil {
				up.UserID = *value
			}
		case userprofile.FieldScreenID:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field screen_id", values[i])
			} else if value.Valid {
				up.ScreenID = value.String
			}
		case userprofile.FieldNickname:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field nickname", values[i])
			} else if value.Valid {
				up.Nickname = value.String
			}
		case userprofile.FieldEmail:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field email", values[i])
			} else if value.Valid {
				up.Email = new(string)
				*up.Email = value.String
			}
		case userprofile.FieldAvatarURL:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field avatar_url", values[i])
			} else if value.Valid {
				up.AvatarURL = value.String
			}
		case userprofile.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				up.CreatedAt = value.Time
			}
		case userprofile.FieldUpdatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field updated_at", values[i])
			} else if value.Valid {
				up.UpdatedAt = value.Time
			}
		}
	}
	return nil
}

// QueryUser queries the "user" edge of the UserProfile entity.
func (up *UserProfile) QueryUser() *UserQuery {
	return (&UserProfileClient{config: up.config}).QueryUser(up)
}

// Update returns a builder for updating this UserProfile.
// Note that you need to call UserProfile.Unwrap() before calling this method if this UserProfile
// was returned from a transaction, and the transaction was committed or rolled back.
func (up *UserProfile) Update() *UserProfileUpdateOne {
	return (&UserProfileClient{config: up.config}).UpdateOne(up)
}

// Unwrap unwraps the UserProfile entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (up *UserProfile) Unwrap() *UserProfile {
	_tx, ok := up.config.driver.(*txDriver)
	if !ok {
		panic("ent: UserProfile is not a transactional entity")
	}
	up.config.driver = _tx.drv
	return up
}

// String implements the fmt.Stringer.
func (up *UserProfile) String() string {
	var builder strings.Builder
	builder.WriteString("UserProfile(")
	builder.WriteString(fmt.Sprintf("id=%v, ", up.ID))
	builder.WriteString("user_id=")
	builder.WriteString(fmt.Sprintf("%v", up.UserID))
	builder.WriteString(", ")
	builder.WriteString("screen_id=")
	builder.WriteString(up.ScreenID)
	builder.WriteString(", ")
	builder.WriteString("nickname=")
	builder.WriteString(up.Nickname)
	builder.WriteString(", ")
	if v := up.Email; v != nil {
		builder.WriteString("email=")
		builder.WriteString(*v)
	}
	builder.WriteString(", ")
	builder.WriteString("avatar_url=")
	builder.WriteString(up.AvatarURL)
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(up.CreatedAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("updated_at=")
	builder.WriteString(up.UpdatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// UserProfiles is a parsable slice of UserProfile.
type UserProfiles []*UserProfile

func (up UserProfiles) config(cfg config) {
	for _i := range up {
		up[_i].config = cfg
	}
}
