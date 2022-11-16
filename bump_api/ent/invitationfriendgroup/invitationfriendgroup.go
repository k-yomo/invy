// Code generated by ent, DO NOT EDIT.

package invitationfriendgroup

import (
	"time"

	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the invitationfriendgroup type in the database.
	Label = "invitation_friend_group"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldInvitationID holds the string denoting the invitation_id field in the database.
	FieldInvitationID = "invitation_id"
	// FieldFriendGroupID holds the string denoting the friend_group_id field in the database.
	FieldFriendGroupID = "friend_group_id"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// EdgeInvitation holds the string denoting the invitation edge name in mutations.
	EdgeInvitation = "invitation"
	// EdgeFriendGroup holds the string denoting the friend_group edge name in mutations.
	EdgeFriendGroup = "friend_group"
	// Table holds the table name of the invitationfriendgroup in the database.
	Table = "invitation_friend_groups"
	// InvitationTable is the table that holds the invitation relation/edge.
	InvitationTable = "invitation_friend_groups"
	// InvitationInverseTable is the table name for the Invitation entity.
	// It exists in this package in order to avoid circular dependency with the "invitation" package.
	InvitationInverseTable = "invitations"
	// InvitationColumn is the table column denoting the invitation relation/edge.
	InvitationColumn = "invitation_id"
	// FriendGroupTable is the table that holds the friend_group relation/edge.
	FriendGroupTable = "invitation_friend_groups"
	// FriendGroupInverseTable is the table name for the FriendGroup entity.
	// It exists in this package in order to avoid circular dependency with the "friendgroup" package.
	FriendGroupInverseTable = "friend_groups"
	// FriendGroupColumn is the table column denoting the friend_group relation/edge.
	FriendGroupColumn = "friend_group_id"
)

// Columns holds all SQL columns for invitationfriendgroup fields.
var Columns = []string{
	FieldID,
	FieldInvitationID,
	FieldFriendGroupID,
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
