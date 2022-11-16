// Code generated by ent, DO NOT EDIT.

package ent

import (
	"time"

	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent/friendgroup"
	"github.com/k-yomo/bump/bump_api/ent/friendship"
	"github.com/k-yomo/bump/bump_api/ent/friendshiprequest"
	"github.com/k-yomo/bump/bump_api/ent/invitation"
	"github.com/k-yomo/bump/bump_api/ent/invitationacceptance"
	"github.com/k-yomo/bump/bump_api/ent/invitationdenial"
	"github.com/k-yomo/bump/bump_api/ent/invitationfriendgroup"
	"github.com/k-yomo/bump/bump_api/ent/invitationuser"
	"github.com/k-yomo/bump/bump_api/ent/schema"
	"github.com/k-yomo/bump/bump_api/ent/user"
	"github.com/k-yomo/bump/bump_api/ent/userfriendgroup"
	"github.com/k-yomo/bump/bump_api/ent/usermute"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
)

// The init function reads all schema descriptors with runtime code
// (default values, validators, hooks and policies) and stitches it
// to their package variables.
func init() {
	friendgroupFields := schema.FriendGroup{}.Fields()
	_ = friendgroupFields
	// friendgroupDescCreatedAt is the schema descriptor for created_at field.
	friendgroupDescCreatedAt := friendgroupFields[3].Descriptor()
	// friendgroup.DefaultCreatedAt holds the default value on creation for the created_at field.
	friendgroup.DefaultCreatedAt = friendgroupDescCreatedAt.Default.(func() time.Time)
	// friendgroupDescUpdatedAt is the schema descriptor for updated_at field.
	friendgroupDescUpdatedAt := friendgroupFields[4].Descriptor()
	// friendgroup.DefaultUpdatedAt holds the default value on creation for the updated_at field.
	friendgroup.DefaultUpdatedAt = friendgroupDescUpdatedAt.Default.(func() time.Time)
	// friendgroup.UpdateDefaultUpdatedAt holds the default value on update for the updated_at field.
	friendgroup.UpdateDefaultUpdatedAt = friendgroupDescUpdatedAt.UpdateDefault.(func() time.Time)
	// friendgroupDescID is the schema descriptor for id field.
	friendgroupDescID := friendgroupFields[0].Descriptor()
	// friendgroup.DefaultID holds the default value on creation for the id field.
	friendgroup.DefaultID = friendgroupDescID.Default.(func() uuid.UUID)
	friendshipFields := schema.Friendship{}.Fields()
	_ = friendshipFields
	// friendshipDescCreatedAt is the schema descriptor for created_at field.
	friendshipDescCreatedAt := friendshipFields[3].Descriptor()
	// friendship.DefaultCreatedAt holds the default value on creation for the created_at field.
	friendship.DefaultCreatedAt = friendshipDescCreatedAt.Default.(func() time.Time)
	// friendshipDescID is the schema descriptor for id field.
	friendshipDescID := friendshipFields[0].Descriptor()
	// friendship.DefaultID holds the default value on creation for the id field.
	friendship.DefaultID = friendshipDescID.Default.(func() uuid.UUID)
	friendshiprequestFields := schema.FriendshipRequest{}.Fields()
	_ = friendshiprequestFields
	// friendshiprequestDescCreatedAt is the schema descriptor for created_at field.
	friendshiprequestDescCreatedAt := friendshiprequestFields[3].Descriptor()
	// friendshiprequest.DefaultCreatedAt holds the default value on creation for the created_at field.
	friendshiprequest.DefaultCreatedAt = friendshiprequestDescCreatedAt.Default.(func() time.Time)
	// friendshiprequestDescID is the schema descriptor for id field.
	friendshiprequestDescID := friendshiprequestFields[0].Descriptor()
	// friendshiprequest.DefaultID holds the default value on creation for the id field.
	friendshiprequest.DefaultID = friendshiprequestDescID.Default.(func() uuid.UUID)
	invitationFields := schema.Invitation{}.Fields()
	_ = invitationFields
	// invitationDescCreatedAt is the schema descriptor for created_at field.
	invitationDescCreatedAt := invitationFields[6].Descriptor()
	// invitation.DefaultCreatedAt holds the default value on creation for the created_at field.
	invitation.DefaultCreatedAt = invitationDescCreatedAt.Default.(func() time.Time)
	// invitationDescUpdatedAt is the schema descriptor for updated_at field.
	invitationDescUpdatedAt := invitationFields[7].Descriptor()
	// invitation.DefaultUpdatedAt holds the default value on creation for the updated_at field.
	invitation.DefaultUpdatedAt = invitationDescUpdatedAt.Default.(func() time.Time)
	// invitation.UpdateDefaultUpdatedAt holds the default value on update for the updated_at field.
	invitation.UpdateDefaultUpdatedAt = invitationDescUpdatedAt.UpdateDefault.(func() time.Time)
	// invitationDescID is the schema descriptor for id field.
	invitationDescID := invitationFields[0].Descriptor()
	// invitation.DefaultID holds the default value on creation for the id field.
	invitation.DefaultID = invitationDescID.Default.(func() uuid.UUID)
	invitationacceptanceFields := schema.InvitationAcceptance{}.Fields()
	_ = invitationacceptanceFields
	// invitationacceptanceDescCreatedAt is the schema descriptor for created_at field.
	invitationacceptanceDescCreatedAt := invitationacceptanceFields[3].Descriptor()
	// invitationacceptance.DefaultCreatedAt holds the default value on creation for the created_at field.
	invitationacceptance.DefaultCreatedAt = invitationacceptanceDescCreatedAt.Default.(func() time.Time)
	// invitationacceptanceDescID is the schema descriptor for id field.
	invitationacceptanceDescID := invitationacceptanceFields[0].Descriptor()
	// invitationacceptance.DefaultID holds the default value on creation for the id field.
	invitationacceptance.DefaultID = invitationacceptanceDescID.Default.(func() uuid.UUID)
	invitationdenialFields := schema.InvitationDenial{}.Fields()
	_ = invitationdenialFields
	// invitationdenialDescCreatedAt is the schema descriptor for created_at field.
	invitationdenialDescCreatedAt := invitationdenialFields[3].Descriptor()
	// invitationdenial.DefaultCreatedAt holds the default value on creation for the created_at field.
	invitationdenial.DefaultCreatedAt = invitationdenialDescCreatedAt.Default.(func() time.Time)
	// invitationdenialDescID is the schema descriptor for id field.
	invitationdenialDescID := invitationdenialFields[0].Descriptor()
	// invitationdenial.DefaultID holds the default value on creation for the id field.
	invitationdenial.DefaultID = invitationdenialDescID.Default.(func() uuid.UUID)
	invitationfriendgroupFields := schema.InvitationFriendGroup{}.Fields()
	_ = invitationfriendgroupFields
	// invitationfriendgroupDescCreatedAt is the schema descriptor for created_at field.
	invitationfriendgroupDescCreatedAt := invitationfriendgroupFields[3].Descriptor()
	// invitationfriendgroup.DefaultCreatedAt holds the default value on creation for the created_at field.
	invitationfriendgroup.DefaultCreatedAt = invitationfriendgroupDescCreatedAt.Default.(func() time.Time)
	// invitationfriendgroupDescID is the schema descriptor for id field.
	invitationfriendgroupDescID := invitationfriendgroupFields[0].Descriptor()
	// invitationfriendgroup.DefaultID holds the default value on creation for the id field.
	invitationfriendgroup.DefaultID = invitationfriendgroupDescID.Default.(func() uuid.UUID)
	invitationuserFields := schema.InvitationUser{}.Fields()
	_ = invitationuserFields
	// invitationuserDescCreatedAt is the schema descriptor for created_at field.
	invitationuserDescCreatedAt := invitationuserFields[3].Descriptor()
	// invitationuser.DefaultCreatedAt holds the default value on creation for the created_at field.
	invitationuser.DefaultCreatedAt = invitationuserDescCreatedAt.Default.(func() time.Time)
	// invitationuserDescID is the schema descriptor for id field.
	invitationuserDescID := invitationuserFields[0].Descriptor()
	// invitationuser.DefaultID holds the default value on creation for the id field.
	invitationuser.DefaultID = invitationuserDescID.Default.(func() uuid.UUID)
	userFields := schema.User{}.Fields()
	_ = userFields
	// userDescCreatedAt is the schema descriptor for created_at field.
	userDescCreatedAt := userFields[2].Descriptor()
	// user.DefaultCreatedAt holds the default value on creation for the created_at field.
	user.DefaultCreatedAt = userDescCreatedAt.Default.(func() time.Time)
	// userDescID is the schema descriptor for id field.
	userDescID := userFields[0].Descriptor()
	// user.DefaultID holds the default value on creation for the id field.
	user.DefaultID = userDescID.Default.(func() uuid.UUID)
	userfriendgroupFields := schema.UserFriendGroup{}.Fields()
	_ = userfriendgroupFields
	// userfriendgroupDescCreatedAt is the schema descriptor for created_at field.
	userfriendgroupDescCreatedAt := userfriendgroupFields[3].Descriptor()
	// userfriendgroup.DefaultCreatedAt holds the default value on creation for the created_at field.
	userfriendgroup.DefaultCreatedAt = userfriendgroupDescCreatedAt.Default.(func() time.Time)
	// userfriendgroupDescID is the schema descriptor for id field.
	userfriendgroupDescID := userfriendgroupFields[0].Descriptor()
	// userfriendgroup.DefaultID holds the default value on creation for the id field.
	userfriendgroup.DefaultID = userfriendgroupDescID.Default.(func() uuid.UUID)
	usermuteFields := schema.UserMute{}.Fields()
	_ = usermuteFields
	// usermuteDescCreatedAt is the schema descriptor for created_at field.
	usermuteDescCreatedAt := usermuteFields[3].Descriptor()
	// usermute.DefaultCreatedAt holds the default value on creation for the created_at field.
	usermute.DefaultCreatedAt = usermuteDescCreatedAt.Default.(func() time.Time)
	// usermuteDescID is the schema descriptor for id field.
	usermuteDescID := usermuteFields[0].Descriptor()
	// usermute.DefaultID holds the default value on creation for the id field.
	usermute.DefaultID = usermuteDescID.Default.(func() uuid.UUID)
	userprofileFields := schema.UserProfile{}.Fields()
	_ = userprofileFields
	// userprofileDescCreatedAt is the schema descriptor for created_at field.
	userprofileDescCreatedAt := userprofileFields[5].Descriptor()
	// userprofile.DefaultCreatedAt holds the default value on creation for the created_at field.
	userprofile.DefaultCreatedAt = userprofileDescCreatedAt.Default.(func() time.Time)
	// userprofileDescUpdatedAt is the schema descriptor for updated_at field.
	userprofileDescUpdatedAt := userprofileFields[6].Descriptor()
	// userprofile.DefaultUpdatedAt holds the default value on creation for the updated_at field.
	userprofile.DefaultUpdatedAt = userprofileDescUpdatedAt.Default.(func() time.Time)
	// userprofile.UpdateDefaultUpdatedAt holds the default value on update for the updated_at field.
	userprofile.UpdateDefaultUpdatedAt = userprofileDescUpdatedAt.UpdateDefault.(func() time.Time)
	// userprofileDescID is the schema descriptor for id field.
	userprofileDescID := userprofileFields[0].Descriptor()
	// userprofile.DefaultID holds the default value on creation for the id field.
	userprofile.DefaultID = userprofileDescID.Default.(func() uuid.UUID)
}
