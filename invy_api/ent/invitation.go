// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent/dialect/sql"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/pkg/pgutil"
)

// Invitation is the model entity for the Invitation schema.
type Invitation struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// UserID holds the value of the "user_id" field.
	UserID uuid.UUID `json:"user_id,omitempty"`
	// Location holds the value of the "location" field.
	Location string `json:"location,omitempty"`
	// Coordinate holds the value of the "coordinate" field.
	Coordinate *pgutil.GeoPoint `json:"coordinate,omitempty"`
	// Comment holds the value of the "comment" field.
	Comment string `json:"comment,omitempty"`
	// StartsAt holds the value of the "starts_at" field.
	StartsAt time.Time `json:"starts_at,omitempty"`
	// ExpiresAt holds the value of the "expires_at" field.
	ExpiresAt time.Time `json:"expires_at,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// UpdatedAt holds the value of the "updated_at" field.
	UpdatedAt time.Time `json:"updated_at,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the InvitationQuery when eager-loading is set.
	Edges InvitationEdges `json:"edges"`
}

// InvitationEdges holds the relations/edges for other nodes in the graph.
type InvitationEdges struct {
	// User holds the value of the user edge.
	User *User `json:"user,omitempty"`
	// InvitationUsers holds the value of the invitation_users edge.
	InvitationUsers []*InvitationUser `json:"invitation_users,omitempty"`
	// InvitationAcceptances holds the value of the invitation_acceptances edge.
	InvitationAcceptances []*InvitationAcceptance `json:"invitation_acceptances,omitempty"`
	// InvitationDenials holds the value of the invitation_denials edge.
	InvitationDenials []*InvitationDenial `json:"invitation_denials,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [4]bool
	// totalCount holds the count of the edges above.
	totalCount [4]map[string]int

	namedInvitationUsers       map[string][]*InvitationUser
	namedInvitationAcceptances map[string][]*InvitationAcceptance
	namedInvitationDenials     map[string][]*InvitationDenial
}

// UserOrErr returns the User value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e InvitationEdges) UserOrErr() (*User, error) {
	if e.loadedTypes[0] {
		if e.User == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: user.Label}
		}
		return e.User, nil
	}
	return nil, &NotLoadedError{edge: "user"}
}

// InvitationUsersOrErr returns the InvitationUsers value or an error if the edge
// was not loaded in eager-loading.
func (e InvitationEdges) InvitationUsersOrErr() ([]*InvitationUser, error) {
	if e.loadedTypes[1] {
		return e.InvitationUsers, nil
	}
	return nil, &NotLoadedError{edge: "invitation_users"}
}

// InvitationAcceptancesOrErr returns the InvitationAcceptances value or an error if the edge
// was not loaded in eager-loading.
func (e InvitationEdges) InvitationAcceptancesOrErr() ([]*InvitationAcceptance, error) {
	if e.loadedTypes[2] {
		return e.InvitationAcceptances, nil
	}
	return nil, &NotLoadedError{edge: "invitation_acceptances"}
}

// InvitationDenialsOrErr returns the InvitationDenials value or an error if the edge
// was not loaded in eager-loading.
func (e InvitationEdges) InvitationDenialsOrErr() ([]*InvitationDenial, error) {
	if e.loadedTypes[3] {
		return e.InvitationDenials, nil
	}
	return nil, &NotLoadedError{edge: "invitation_denials"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*Invitation) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case invitation.FieldCoordinate:
			values[i] = new(pgutil.GeoPoint)
		case invitation.FieldLocation, invitation.FieldComment:
			values[i] = new(sql.NullString)
		case invitation.FieldStartsAt, invitation.FieldExpiresAt, invitation.FieldCreatedAt, invitation.FieldUpdatedAt:
			values[i] = new(sql.NullTime)
		case invitation.FieldID, invitation.FieldUserID:
			values[i] = new(uuid.UUID)
		default:
			return nil, fmt.Errorf("unexpected column %q for type Invitation", columns[i])
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the Invitation fields.
func (i *Invitation) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for j := range columns {
		switch columns[j] {
		case invitation.FieldID:
			if value, ok := values[j].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[j])
			} else if value != nil {
				i.ID = *value
			}
		case invitation.FieldUserID:
			if value, ok := values[j].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field user_id", values[j])
			} else if value != nil {
				i.UserID = *value
			}
		case invitation.FieldLocation:
			if value, ok := values[j].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field location", values[j])
			} else if value.Valid {
				i.Location = value.String
			}
		case invitation.FieldCoordinate:
			if value, ok := values[j].(*pgutil.GeoPoint); !ok {
				return fmt.Errorf("unexpected type %T for field coordinate", values[j])
			} else if value != nil {
				i.Coordinate = value
			}
		case invitation.FieldComment:
			if value, ok := values[j].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field comment", values[j])
			} else if value.Valid {
				i.Comment = value.String
			}
		case invitation.FieldStartsAt:
			if value, ok := values[j].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field starts_at", values[j])
			} else if value.Valid {
				i.StartsAt = value.Time
			}
		case invitation.FieldExpiresAt:
			if value, ok := values[j].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field expires_at", values[j])
			} else if value.Valid {
				i.ExpiresAt = value.Time
			}
		case invitation.FieldCreatedAt:
			if value, ok := values[j].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[j])
			} else if value.Valid {
				i.CreatedAt = value.Time
			}
		case invitation.FieldUpdatedAt:
			if value, ok := values[j].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field updated_at", values[j])
			} else if value.Valid {
				i.UpdatedAt = value.Time
			}
		}
	}
	return nil
}

// QueryUser queries the "user" edge of the Invitation entity.
func (i *Invitation) QueryUser() *UserQuery {
	return (&InvitationClient{config: i.config}).QueryUser(i)
}

// QueryInvitationUsers queries the "invitation_users" edge of the Invitation entity.
func (i *Invitation) QueryInvitationUsers() *InvitationUserQuery {
	return (&InvitationClient{config: i.config}).QueryInvitationUsers(i)
}

// QueryInvitationAcceptances queries the "invitation_acceptances" edge of the Invitation entity.
func (i *Invitation) QueryInvitationAcceptances() *InvitationAcceptanceQuery {
	return (&InvitationClient{config: i.config}).QueryInvitationAcceptances(i)
}

// QueryInvitationDenials queries the "invitation_denials" edge of the Invitation entity.
func (i *Invitation) QueryInvitationDenials() *InvitationDenialQuery {
	return (&InvitationClient{config: i.config}).QueryInvitationDenials(i)
}

// Update returns a builder for updating this Invitation.
// Note that you need to call Invitation.Unwrap() before calling this method if this Invitation
// was returned from a transaction, and the transaction was committed or rolled back.
func (i *Invitation) Update() *InvitationUpdateOne {
	return (&InvitationClient{config: i.config}).UpdateOne(i)
}

// Unwrap unwraps the Invitation entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (i *Invitation) Unwrap() *Invitation {
	_tx, ok := i.config.driver.(*txDriver)
	if !ok {
		panic("ent: Invitation is not a transactional entity")
	}
	i.config.driver = _tx.drv
	return i
}

// String implements the fmt.Stringer.
func (i *Invitation) String() string {
	var builder strings.Builder
	builder.WriteString("Invitation(")
	builder.WriteString(fmt.Sprintf("id=%v, ", i.ID))
	builder.WriteString("user_id=")
	builder.WriteString(fmt.Sprintf("%v", i.UserID))
	builder.WriteString(", ")
	builder.WriteString("location=")
	builder.WriteString(i.Location)
	builder.WriteString(", ")
	builder.WriteString("coordinate=")
	builder.WriteString(fmt.Sprintf("%v", i.Coordinate))
	builder.WriteString(", ")
	builder.WriteString("comment=")
	builder.WriteString(i.Comment)
	builder.WriteString(", ")
	builder.WriteString("starts_at=")
	builder.WriteString(i.StartsAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("expires_at=")
	builder.WriteString(i.ExpiresAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("created_at=")
	builder.WriteString(i.CreatedAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("updated_at=")
	builder.WriteString(i.UpdatedAt.Format(time.ANSIC))
	builder.WriteByte(')')
	return builder.String()
}

// NamedInvitationUsers returns the InvitationUsers named value or an error if the edge was not
// loaded in eager-loading with this name.
func (i *Invitation) NamedInvitationUsers(name string) ([]*InvitationUser, error) {
	if i.Edges.namedInvitationUsers == nil {
		return nil, &NotLoadedError{edge: name}
	}
	nodes, ok := i.Edges.namedInvitationUsers[name]
	if !ok {
		return nil, &NotLoadedError{edge: name}
	}
	return nodes, nil
}

func (i *Invitation) appendNamedInvitationUsers(name string, edges ...*InvitationUser) {
	if i.Edges.namedInvitationUsers == nil {
		i.Edges.namedInvitationUsers = make(map[string][]*InvitationUser)
	}
	if len(edges) == 0 {
		i.Edges.namedInvitationUsers[name] = []*InvitationUser{}
	} else {
		i.Edges.namedInvitationUsers[name] = append(i.Edges.namedInvitationUsers[name], edges...)
	}
}

// NamedInvitationAcceptances returns the InvitationAcceptances named value or an error if the edge was not
// loaded in eager-loading with this name.
func (i *Invitation) NamedInvitationAcceptances(name string) ([]*InvitationAcceptance, error) {
	if i.Edges.namedInvitationAcceptances == nil {
		return nil, &NotLoadedError{edge: name}
	}
	nodes, ok := i.Edges.namedInvitationAcceptances[name]
	if !ok {
		return nil, &NotLoadedError{edge: name}
	}
	return nodes, nil
}

func (i *Invitation) appendNamedInvitationAcceptances(name string, edges ...*InvitationAcceptance) {
	if i.Edges.namedInvitationAcceptances == nil {
		i.Edges.namedInvitationAcceptances = make(map[string][]*InvitationAcceptance)
	}
	if len(edges) == 0 {
		i.Edges.namedInvitationAcceptances[name] = []*InvitationAcceptance{}
	} else {
		i.Edges.namedInvitationAcceptances[name] = append(i.Edges.namedInvitationAcceptances[name], edges...)
	}
}

// NamedInvitationDenials returns the InvitationDenials named value or an error if the edge was not
// loaded in eager-loading with this name.
func (i *Invitation) NamedInvitationDenials(name string) ([]*InvitationDenial, error) {
	if i.Edges.namedInvitationDenials == nil {
		return nil, &NotLoadedError{edge: name}
	}
	nodes, ok := i.Edges.namedInvitationDenials[name]
	if !ok {
		return nil, &NotLoadedError{edge: name}
	}
	return nodes, nil
}

func (i *Invitation) appendNamedInvitationDenials(name string, edges ...*InvitationDenial) {
	if i.Edges.namedInvitationDenials == nil {
		i.Edges.namedInvitationDenials = make(map[string][]*InvitationDenial)
	}
	if len(edges) == 0 {
		i.Edges.namedInvitationDenials[name] = []*InvitationDenial{}
	} else {
		i.Edges.namedInvitationDenials[name] = append(i.Edges.namedInvitationDenials[name], edges...)
	}
}

// Invitations is a parsable slice of Invitation.
type Invitations []*Invitation

func (i Invitations) config(cfg config) {
	for _i := range i {
		i[_i].config = cfg
	}
}
