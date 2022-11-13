// Code generated by ent, DO NOT EDIT.

package migrate

import (
	"entgo.io/ent/dialect/sql/schema"
	"entgo.io/ent/schema/field"
)

var (
	// FriendGroupsColumns holds the columns for the "friend_groups" table.
	FriendGroupsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "name", Type: field.TypeString},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// FriendGroupsTable holds the schema information for the "friend_groups" table.
	FriendGroupsTable = &schema.Table{
		Name:       "friend_groups",
		Columns:    FriendGroupsColumns,
		PrimaryKey: []*schema.Column{FriendGroupsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "friend_groups_users_user",
				Columns:    []*schema.Column{FriendGroupsColumns[4]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// FriendshipsColumns holds the columns for the "friendships" table.
	FriendshipsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
		{Name: "friend_user_id", Type: field.TypeUUID},
	}
	// FriendshipsTable holds the schema information for the "friendships" table.
	FriendshipsTable = &schema.Table{
		Name:       "friendships",
		Columns:    FriendshipsColumns,
		PrimaryKey: []*schema.Column{FriendshipsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "friendships_users_user",
				Columns:    []*schema.Column{FriendshipsColumns[2]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "friendships_users_friend_user",
				Columns:    []*schema.Column{FriendshipsColumns[3]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "friendship_user_id_friend_user_id",
				Unique:  true,
				Columns: []*schema.Column{FriendshipsColumns[2], FriendshipsColumns[3]},
			},
		},
	}
	// FriendshipRequestsColumns holds the columns for the "friendship_requests" table.
	FriendshipRequestsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "from_user_id", Type: field.TypeUUID},
		{Name: "to_user_id", Type: field.TypeUUID},
	}
	// FriendshipRequestsTable holds the schema information for the "friendship_requests" table.
	FriendshipRequestsTable = &schema.Table{
		Name:       "friendship_requests",
		Columns:    FriendshipRequestsColumns,
		PrimaryKey: []*schema.Column{FriendshipRequestsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "friendship_requests_users_from_users",
				Columns:    []*schema.Column{FriendshipRequestsColumns[2]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "friendship_requests_users_to_users",
				Columns:    []*schema.Column{FriendshipRequestsColumns[3]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "friendshiprequest_from_user_id_to_user_id",
				Unique:  true,
				Columns: []*schema.Column{FriendshipRequestsColumns[2], FriendshipRequestsColumns[3]},
			},
		},
	}
	// UsersColumns holds the columns for the "users" table.
	UsersColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "auth_id", Type: field.TypeString, Unique: true},
		{Name: "created_at", Type: field.TypeTime},
	}
	// UsersTable holds the schema information for the "users" table.
	UsersTable = &schema.Table{
		Name:       "users",
		Columns:    UsersColumns,
		PrimaryKey: []*schema.Column{UsersColumns[0]},
	}
	// UserFriendGroupsColumns holds the columns for the "user_friend_groups" table.
	UserFriendGroupsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "friend_group_id", Type: field.TypeUUID},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// UserFriendGroupsTable holds the schema information for the "user_friend_groups" table.
	UserFriendGroupsTable = &schema.Table{
		Name:       "user_friend_groups",
		Columns:    UserFriendGroupsColumns,
		PrimaryKey: []*schema.Column{UserFriendGroupsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "user_friend_groups_friend_groups_friend_group",
				Columns:    []*schema.Column{UserFriendGroupsColumns[2]},
				RefColumns: []*schema.Column{FriendGroupsColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "user_friend_groups_users_user",
				Columns:    []*schema.Column{UserFriendGroupsColumns[3]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "userfriendgroup_friend_group_id_user_id",
				Unique:  true,
				Columns: []*schema.Column{UserFriendGroupsColumns[2], UserFriendGroupsColumns[3]},
			},
		},
	}
	// UserMutesColumns holds the columns for the "user_mutes" table.
	UserMutesColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
		{Name: "mute_user_id", Type: field.TypeUUID},
	}
	// UserMutesTable holds the schema information for the "user_mutes" table.
	UserMutesTable = &schema.Table{
		Name:       "user_mutes",
		Columns:    UserMutesColumns,
		PrimaryKey: []*schema.Column{UserMutesColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "user_mutes_users_user",
				Columns:    []*schema.Column{UserMutesColumns[2]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "user_mutes_users_mute_user",
				Columns:    []*schema.Column{UserMutesColumns[3]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "usermute_user_id_mute_user_id",
				Unique:  true,
				Columns: []*schema.Column{UserMutesColumns[2], UserMutesColumns[3]},
			},
		},
	}
	// UserProfilesColumns holds the columns for the "user_profiles" table.
	UserProfilesColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "nickname", Type: field.TypeString},
		{Name: "email", Type: field.TypeString, Unique: true, Nullable: true},
		{Name: "avatar_url", Type: field.TypeString, Nullable: true},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID, Unique: true},
	}
	// UserProfilesTable holds the schema information for the "user_profiles" table.
	UserProfilesTable = &schema.Table{
		Name:       "user_profiles",
		Columns:    UserProfilesColumns,
		PrimaryKey: []*schema.Column{UserProfilesColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "user_profiles_users_user_profile",
				Columns:    []*schema.Column{UserProfilesColumns[6]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// Tables holds all the tables in the schema.
	Tables = []*schema.Table{
		FriendGroupsTable,
		FriendshipsTable,
		FriendshipRequestsTable,
		UsersTable,
		UserFriendGroupsTable,
		UserMutesTable,
		UserProfilesTable,
	}
)

func init() {
	FriendGroupsTable.ForeignKeys[0].RefTable = UsersTable
	FriendshipsTable.ForeignKeys[0].RefTable = UsersTable
	FriendshipsTable.ForeignKeys[1].RefTable = UsersTable
	FriendshipRequestsTable.ForeignKeys[0].RefTable = UsersTable
	FriendshipRequestsTable.ForeignKeys[1].RefTable = UsersTable
	UserFriendGroupsTable.ForeignKeys[0].RefTable = FriendGroupsTable
	UserFriendGroupsTable.ForeignKeys[1].RefTable = UsersTable
	UserMutesTable.ForeignKeys[0].RefTable = UsersTable
	UserMutesTable.ForeignKeys[1].RefTable = UsersTable
	UserProfilesTable.ForeignKeys[0].RefTable = UsersTable
}
