// Code generated by ent, DO NOT EDIT.

package userblock

import (
	"time"

	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the userblock type in the database.
	Label = "user_block"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldUserID holds the string denoting the user_id field in the database.
	FieldUserID = "user_id"
	// FieldBlockUserID holds the string denoting the block_user_id field in the database.
	FieldBlockUserID = "block_user_id"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// EdgeUser holds the string denoting the user edge name in mutations.
	EdgeUser = "user"
	// EdgeBlockUser holds the string denoting the block_user edge name in mutations.
	EdgeBlockUser = "block_user"
	// Table holds the table name of the userblock in the database.
	Table = "user_blocks"
	// UserTable is the table that holds the user relation/edge.
	UserTable = "user_blocks"
	// UserInverseTable is the table name for the User entity.
	// It exists in this package in order to avoid circular dependency with the "user" package.
	UserInverseTable = "users"
	// UserColumn is the table column denoting the user relation/edge.
	UserColumn = "user_id"
	// BlockUserTable is the table that holds the block_user relation/edge.
	BlockUserTable = "user_blocks"
	// BlockUserInverseTable is the table name for the User entity.
	// It exists in this package in order to avoid circular dependency with the "user" package.
	BlockUserInverseTable = "users"
	// BlockUserColumn is the table column denoting the block_user relation/edge.
	BlockUserColumn = "block_user_id"
)

// Columns holds all SQL columns for userblock fields.
var Columns = []string{
	FieldID,
	FieldUserID,
	FieldBlockUserID,
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
