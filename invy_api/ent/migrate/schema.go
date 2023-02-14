// Code generated by ent, DO NOT EDIT.

package migrate

import (
	"entgo.io/ent/dialect/sql/schema"
	"entgo.io/ent/schema/field"
)

var (
	// AccountsColumns holds the columns for the "accounts" table.
	AccountsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "auth_id", Type: field.TypeString, Unique: true},
		{Name: "email", Type: field.TypeString, Nullable: true},
		{Name: "phone_number", Type: field.TypeString, Nullable: true},
		{Name: "status", Type: field.TypeEnum, Enums: []string{"active", "suspended", "deleted"}, Default: "active"},
		{Name: "created_at", Type: field.TypeTime},
	}
	// AccountsTable holds the schema information for the "accounts" table.
	AccountsTable = &schema.Table{
		Name:       "accounts",
		Columns:    AccountsColumns,
		PrimaryKey: []*schema.Column{AccountsColumns[0]},
		Indexes: []*schema.Index{
			{
				Name:    "account_phone_number_status",
				Unique:  true,
				Columns: []*schema.Column{AccountsColumns[3], AccountsColumns[4]},
			},
		},
	}
	// FriendGroupsColumns holds the columns for the "friend_groups" table.
	FriendGroupsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "name", Type: field.TypeString},
		{Name: "total_count", Type: field.TypeInt, Default: 0},
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
				Columns:    []*schema.Column{FriendGroupsColumns[5]},
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
	// InvitationsColumns holds the columns for the "invitations" table.
	InvitationsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "location", Type: field.TypeString},
		{Name: "coordinate", Type: field.TypeOther, Nullable: true, SchemaType: map[string]string{"postgres": "geometry(Point,4326)"}},
		{Name: "comment", Type: field.TypeString},
		{Name: "starts_at", Type: field.TypeTime},
		{Name: "expires_at", Type: field.TypeTime},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// InvitationsTable holds the schema information for the "invitations" table.
	InvitationsTable = &schema.Table{
		Name:       "invitations",
		Columns:    InvitationsColumns,
		PrimaryKey: []*schema.Column{InvitationsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "invitations_users_user",
				Columns:    []*schema.Column{InvitationsColumns[8]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// InvitationAcceptancesColumns holds the columns for the "invitation_acceptances" table.
	InvitationAcceptancesColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
		{Name: "invitation_id", Type: field.TypeUUID},
	}
	// InvitationAcceptancesTable holds the schema information for the "invitation_acceptances" table.
	InvitationAcceptancesTable = &schema.Table{
		Name:       "invitation_acceptances",
		Columns:    InvitationAcceptancesColumns,
		PrimaryKey: []*schema.Column{InvitationAcceptancesColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "invitation_acceptances_users_user",
				Columns:    []*schema.Column{InvitationAcceptancesColumns[2]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "invitation_acceptances_invitations_invitation",
				Columns:    []*schema.Column{InvitationAcceptancesColumns[3]},
				RefColumns: []*schema.Column{InvitationsColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "invitationacceptance_user_id_invitation_id",
				Unique:  true,
				Columns: []*schema.Column{InvitationAcceptancesColumns[2], InvitationAcceptancesColumns[3]},
			},
		},
	}
	// InvitationAwaitingsColumns holds the columns for the "invitation_awaitings" table.
	InvitationAwaitingsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "starts_at", Type: field.TypeTime},
		{Name: "ends_at", Type: field.TypeTime},
		{Name: "comment", Type: field.TypeString},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// InvitationAwaitingsTable holds the schema information for the "invitation_awaitings" table.
	InvitationAwaitingsTable = &schema.Table{
		Name:       "invitation_awaitings",
		Columns:    InvitationAwaitingsColumns,
		PrimaryKey: []*schema.Column{InvitationAwaitingsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "invitation_awaitings_users_user",
				Columns:    []*schema.Column{InvitationAwaitingsColumns[6]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// InvitationDenialsColumns holds the columns for the "invitation_denials" table.
	InvitationDenialsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
		{Name: "invitation_id", Type: field.TypeUUID},
	}
	// InvitationDenialsTable holds the schema information for the "invitation_denials" table.
	InvitationDenialsTable = &schema.Table{
		Name:       "invitation_denials",
		Columns:    InvitationDenialsColumns,
		PrimaryKey: []*schema.Column{InvitationDenialsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "invitation_denials_users_user",
				Columns:    []*schema.Column{InvitationDenialsColumns[2]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "invitation_denials_invitations_invitation",
				Columns:    []*schema.Column{InvitationDenialsColumns[3]},
				RefColumns: []*schema.Column{InvitationsColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "invitationdenial_user_id_invitation_id",
				Unique:  true,
				Columns: []*schema.Column{InvitationDenialsColumns[2], InvitationDenialsColumns[3]},
			},
		},
	}
	// InvitationUsersColumns holds the columns for the "invitation_users" table.
	InvitationUsersColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "invitation_id", Type: field.TypeUUID},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// InvitationUsersTable holds the schema information for the "invitation_users" table.
	InvitationUsersTable = &schema.Table{
		Name:       "invitation_users",
		Columns:    InvitationUsersColumns,
		PrimaryKey: []*schema.Column{InvitationUsersColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "invitation_users_invitations_invitation",
				Columns:    []*schema.Column{InvitationUsersColumns[2]},
				RefColumns: []*schema.Column{InvitationsColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "invitation_users_users_user",
				Columns:    []*schema.Column{InvitationUsersColumns[3]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// PushNotificationTokensColumns holds the columns for the "push_notification_tokens" table.
	PushNotificationTokensColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "device_id", Type: field.TypeString, Unique: true},
		{Name: "fcm_token", Type: field.TypeString, Unique: true},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// PushNotificationTokensTable holds the schema information for the "push_notification_tokens" table.
	PushNotificationTokensTable = &schema.Table{
		Name:       "push_notification_tokens",
		Columns:    PushNotificationTokensColumns,
		PrimaryKey: []*schema.Column{PushNotificationTokensColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "push_notification_tokens_users_user",
				Columns:    []*schema.Column{PushNotificationTokensColumns[5]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// UsersColumns holds the columns for the "users" table.
	UsersColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "status", Type: field.TypeEnum, Enums: []string{"active", "suspended", "deleted"}, Default: "active"},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "account_id", Type: field.TypeUUID},
	}
	// UsersTable holds the schema information for the "users" table.
	UsersTable = &schema.Table{
		Name:       "users",
		Columns:    UsersColumns,
		PrimaryKey: []*schema.Column{UsersColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "users_accounts_account",
				Columns:    []*schema.Column{UsersColumns[3]},
				RefColumns: []*schema.Column{AccountsColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
	}
	// UserBlocksColumns holds the columns for the "user_blocks" table.
	UserBlocksColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
		{Name: "block_user_id", Type: field.TypeUUID},
	}
	// UserBlocksTable holds the schema information for the "user_blocks" table.
	UserBlocksTable = &schema.Table{
		Name:       "user_blocks",
		Columns:    UserBlocksColumns,
		PrimaryKey: []*schema.Column{UserBlocksColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "user_blocks_users_user",
				Columns:    []*schema.Column{UserBlocksColumns[2]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
			{
				Symbol:     "user_blocks_users_block_user",
				Columns:    []*schema.Column{UserBlocksColumns[3]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "userblock_user_id_block_user_id",
				Unique:  true,
				Columns: []*schema.Column{UserBlocksColumns[2], UserBlocksColumns[3]},
			},
		},
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
				OnDelete:   schema.Cascade,
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
	// UserLocationsColumns holds the columns for the "user_locations" table.
	UserLocationsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "coordinate", Type: field.TypeOther, SchemaType: map[string]string{"postgres": "geometry(Point,4326)"}},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// UserLocationsTable holds the schema information for the "user_locations" table.
	UserLocationsTable = &schema.Table{
		Name:       "user_locations",
		Columns:    UserLocationsColumns,
		PrimaryKey: []*schema.Column{UserLocationsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "user_locations_users_user",
				Columns:    []*schema.Column{UserLocationsColumns[3]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.NoAction,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "userlocation_user_id",
				Unique:  true,
				Columns: []*schema.Column{UserLocationsColumns[3]},
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
		{Name: "screen_id", Type: field.TypeString, Unique: true},
		{Name: "nickname", Type: field.TypeString},
		{Name: "avatar_url", Type: field.TypeString},
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
		AccountsTable,
		FriendGroupsTable,
		FriendshipsTable,
		FriendshipRequestsTable,
		InvitationsTable,
		InvitationAcceptancesTable,
		InvitationAwaitingsTable,
		InvitationDenialsTable,
		InvitationUsersTable,
		PushNotificationTokensTable,
		UsersTable,
		UserBlocksTable,
		UserFriendGroupsTable,
		UserLocationsTable,
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
	InvitationsTable.ForeignKeys[0].RefTable = UsersTable
	InvitationAcceptancesTable.ForeignKeys[0].RefTable = UsersTable
	InvitationAcceptancesTable.ForeignKeys[1].RefTable = InvitationsTable
	InvitationAwaitingsTable.ForeignKeys[0].RefTable = UsersTable
	InvitationDenialsTable.ForeignKeys[0].RefTable = UsersTable
	InvitationDenialsTable.ForeignKeys[1].RefTable = InvitationsTable
	InvitationUsersTable.ForeignKeys[0].RefTable = InvitationsTable
	InvitationUsersTable.ForeignKeys[1].RefTable = UsersTable
	PushNotificationTokensTable.ForeignKeys[0].RefTable = UsersTable
	UsersTable.ForeignKeys[0].RefTable = AccountsTable
	UserBlocksTable.ForeignKeys[0].RefTable = UsersTable
	UserBlocksTable.ForeignKeys[1].RefTable = UsersTable
	UserFriendGroupsTable.ForeignKeys[0].RefTable = FriendGroupsTable
	UserFriendGroupsTable.ForeignKeys[1].RefTable = UsersTable
	UserLocationsTable.ForeignKeys[0].RefTable = UsersTable
	UserMutesTable.ForeignKeys[0].RefTable = UsersTable
	UserMutesTable.ForeignKeys[1].RefTable = UsersTable
	UserProfilesTable.ForeignKeys[0].RefTable = UsersTable
}
