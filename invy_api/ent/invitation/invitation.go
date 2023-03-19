// Code generated by ent, DO NOT EDIT.

package invitation

import (
	"time"

	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the invitation type in the database.
	Label = "invitation"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldUserID holds the string denoting the user_id field in the database.
	FieldUserID = "user_id"
	// FieldLocation holds the string denoting the location field in the database.
	FieldLocation = "location"
	// FieldCoordinate holds the string denoting the coordinate field in the database.
	FieldCoordinate = "coordinate"
	// FieldComment holds the string denoting the comment field in the database.
	FieldComment = "comment"
	// FieldStartsAt holds the string denoting the starts_at field in the database.
	FieldStartsAt = "starts_at"
	// FieldExpiresAt holds the string denoting the expires_at field in the database.
	FieldExpiresAt = "expires_at"
	// FieldChatRoomID holds the string denoting the chat_room_id field in the database.
	FieldChatRoomID = "chat_room_id"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// FieldUpdatedAt holds the string denoting the updated_at field in the database.
	FieldUpdatedAt = "updated_at"
	// EdgeUser holds the string denoting the user edge name in mutations.
	EdgeUser = "user"
	// EdgeInvitationUsers holds the string denoting the invitation_users edge name in mutations.
	EdgeInvitationUsers = "invitation_users"
	// EdgeInvitationAcceptances holds the string denoting the invitation_acceptances edge name in mutations.
	EdgeInvitationAcceptances = "invitation_acceptances"
	// EdgeInvitationDenials holds the string denoting the invitation_denials edge name in mutations.
	EdgeInvitationDenials = "invitation_denials"
	// Table holds the table name of the invitation in the database.
	Table = "invitations"
	// UserTable is the table that holds the user relation/edge.
	UserTable = "invitations"
	// UserInverseTable is the table name for the User entity.
	// It exists in this package in order to avoid circular dependency with the "user" package.
	UserInverseTable = "users"
	// UserColumn is the table column denoting the user relation/edge.
	UserColumn = "user_id"
	// InvitationUsersTable is the table that holds the invitation_users relation/edge.
	InvitationUsersTable = "invitation_users"
	// InvitationUsersInverseTable is the table name for the InvitationUser entity.
	// It exists in this package in order to avoid circular dependency with the "invitationuser" package.
	InvitationUsersInverseTable = "invitation_users"
	// InvitationUsersColumn is the table column denoting the invitation_users relation/edge.
	InvitationUsersColumn = "invitation_id"
	// InvitationAcceptancesTable is the table that holds the invitation_acceptances relation/edge.
	InvitationAcceptancesTable = "invitation_acceptances"
	// InvitationAcceptancesInverseTable is the table name for the InvitationAcceptance entity.
	// It exists in this package in order to avoid circular dependency with the "invitationacceptance" package.
	InvitationAcceptancesInverseTable = "invitation_acceptances"
	// InvitationAcceptancesColumn is the table column denoting the invitation_acceptances relation/edge.
	InvitationAcceptancesColumn = "invitation_id"
	// InvitationDenialsTable is the table that holds the invitation_denials relation/edge.
	InvitationDenialsTable = "invitation_denials"
	// InvitationDenialsInverseTable is the table name for the InvitationDenial entity.
	// It exists in this package in order to avoid circular dependency with the "invitationdenial" package.
	InvitationDenialsInverseTable = "invitation_denials"
	// InvitationDenialsColumn is the table column denoting the invitation_denials relation/edge.
	InvitationDenialsColumn = "invitation_id"
)

// Columns holds all SQL columns for invitation fields.
var Columns = []string{
	FieldID,
	FieldUserID,
	FieldLocation,
	FieldCoordinate,
	FieldComment,
	FieldStartsAt,
	FieldExpiresAt,
	FieldChatRoomID,
	FieldCreatedAt,
	FieldUpdatedAt,
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
	// DefaultUpdatedAt holds the default value on creation for the "updated_at" field.
	DefaultUpdatedAt func() time.Time
	// UpdateDefaultUpdatedAt holds the default value on update for the "updated_at" field.
	UpdateDefaultUpdatedAt func() time.Time
	// DefaultID holds the default value on creation for the "id" field.
	DefaultID func() uuid.UUID
)
