// Code generated by ent, DO NOT EDIT.

package invitationacceptance

import (
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the invitationacceptance type in the database.
	Label = "invitation_acceptance"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldUserID holds the string denoting the user_id field in the database.
	FieldUserID = "user_id"
	// FieldInvitationID holds the string denoting the invitation_id field in the database.
	FieldInvitationID = "invitation_id"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// EdgeUser holds the string denoting the user edge name in mutations.
	EdgeUser = "user"
	// EdgeInvitation holds the string denoting the invitation edge name in mutations.
	EdgeInvitation = "invitation"
	// Table holds the table name of the invitationacceptance in the database.
	Table = "invitation_acceptances"
	// UserTable is the table that holds the user relation/edge.
	UserTable = "invitation_acceptances"
	// UserInverseTable is the table name for the User entity.
	// It exists in this package in order to avoid circular dependency with the "user" package.
	UserInverseTable = "users"
	// UserColumn is the table column denoting the user relation/edge.
	UserColumn = "user_id"
	// InvitationTable is the table that holds the invitation relation/edge.
	InvitationTable = "invitation_acceptances"
	// InvitationInverseTable is the table name for the Invitation entity.
	// It exists in this package in order to avoid circular dependency with the "invitation" package.
	InvitationInverseTable = "invitations"
	// InvitationColumn is the table column denoting the invitation relation/edge.
	InvitationColumn = "invitation_id"
)

// Columns holds all SQL columns for invitationacceptance fields.
var Columns = []string{
	FieldID,
	FieldUserID,
	FieldInvitationID,
	FieldCreatedAt,
}

// ValidColumn reports if the column name is valid (part of the table columns).
func ValidColumn(column string) bool {
	for i := range Columns {
		if column == Columns[i] {
			return true
		}
	}
	return false
}

var (
	// DefaultCreatedAt holds the default value on creation for the "created_at" field.
	DefaultCreatedAt func() time.Time
	// DefaultID holds the default value on creation for the "id" field.
	DefaultID func() uuid.UUID
)

// OrderOption defines the ordering options for the InvitationAcceptance queries.
type OrderOption func(*sql.Selector)

// ByID orders the results by the id field.
func ByID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldID, opts...).ToFunc()
}

// ByUserID orders the results by the user_id field.
func ByUserID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldUserID, opts...).ToFunc()
}

// ByInvitationID orders the results by the invitation_id field.
func ByInvitationID(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldInvitationID, opts...).ToFunc()
}

// ByCreatedAt orders the results by the created_at field.
func ByCreatedAt(opts ...sql.OrderTermOption) OrderOption {
	return sql.OrderByField(FieldCreatedAt, opts...).ToFunc()
}

// ByUserField orders the results by user field.
func ByUserField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newUserStep(), sql.OrderByField(field, opts...))
	}
}

// ByInvitationField orders the results by invitation field.
func ByInvitationField(field string, opts ...sql.OrderTermOption) OrderOption {
	return func(s *sql.Selector) {
		sqlgraph.OrderByNeighborTerms(s, newInvitationStep(), sql.OrderByField(field, opts...))
	}
}
func newUserStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(UserInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, false, UserTable, UserColumn),
	)
}
func newInvitationStep() *sqlgraph.Step {
	return sqlgraph.NewStep(
		sqlgraph.From(Table, FieldID),
		sqlgraph.To(InvitationInverseTable, FieldID),
		sqlgraph.Edge(sqlgraph.M2O, false, InvitationTable, InvitationColumn),
	)
}
