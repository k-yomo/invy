// Code generated by ent, DO NOT EDIT.

package pushnotificationtoken

import (
	"time"

	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the pushnotificationtoken type in the database.
	Label = "push_notification_token"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldUserID holds the string denoting the user_id field in the database.
	FieldUserID = "user_id"
	// FieldDeviceID holds the string denoting the device_id field in the database.
	FieldDeviceID = "device_id"
	// FieldFcmToken holds the string denoting the fcm_token field in the database.
	FieldFcmToken = "fcm_token"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// FieldUpdatedAt holds the string denoting the updated_at field in the database.
	FieldUpdatedAt = "updated_at"
	// EdgeUser holds the string denoting the user edge name in mutations.
	EdgeUser = "user"
	// Table holds the table name of the pushnotificationtoken in the database.
	Table = "push_notification_tokens"
	// UserTable is the table that holds the user relation/edge.
	UserTable = "push_notification_tokens"
	// UserInverseTable is the table name for the User entity.
	// It exists in this package in order to avoid circular dependency with the "user" package.
	UserInverseTable = "users"
	// UserColumn is the table column denoting the user relation/edge.
	UserColumn = "user_id"
)

// Columns holds all SQL columns for pushnotificationtoken fields.
var Columns = []string{
	FieldID,
	FieldUserID,
	FieldDeviceID,
	FieldFcmToken,
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
