// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"encoding/json"
	"fmt"

	"entgo.io/contrib/entgql"
	"github.com/99designs/gqlgen/graphql"
	"github.com/google/uuid"
	"github.com/hashicorp/go-multierror"
	"github.com/k-yomo/bump/bump_api/ent/friendgroup"
	"github.com/k-yomo/bump/bump_api/ent/friendship"
	"github.com/k-yomo/bump/bump_api/ent/friendshiprequest"
	"github.com/k-yomo/bump/bump_api/ent/invitation"
	"github.com/k-yomo/bump/bump_api/ent/invitationacceptance"
	"github.com/k-yomo/bump/bump_api/ent/invitationdenial"
	"github.com/k-yomo/bump/bump_api/ent/invitationfriendgroup"
	"github.com/k-yomo/bump/bump_api/ent/invitationuser"
	"github.com/k-yomo/bump/bump_api/ent/user"
	"github.com/k-yomo/bump/bump_api/ent/userfriendgroup"
	"github.com/k-yomo/bump/bump_api/ent/usermute"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
)

// Noder wraps the basic Node method.
type Noder interface {
	Node(context.Context) (*Node, error)
}

// Node in the graph.
type Node struct {
	ID     uuid.UUID `json:"id,omitempty"`     // node id.
	Type   string    `json:"type,omitempty"`   // node type.
	Fields []*Field  `json:"fields,omitempty"` // node fields.
	Edges  []*Edge   `json:"edges,omitempty"`  // node edges.
}

// Field of a node.
type Field struct {
	Type  string `json:"type,omitempty"`  // field type.
	Name  string `json:"name,omitempty"`  // field name (as in struct).
	Value string `json:"value,omitempty"` // stringified value.
}

// Edges between two nodes.
type Edge struct {
	Type string      `json:"type,omitempty"` // edge type.
	Name string      `json:"name,omitempty"` // edge name.
	IDs  []uuid.UUID `json:"ids,omitempty"`  // node ids (where this edge point to).
}

func (fg *FriendGroup) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     fg.ID,
		Type:   "FriendGroup",
		Fields: make([]*Field, 5),
		Edges:  make([]*Edge, 4),
	}
	var buf []byte
	if buf, err = json.Marshal(fg.UserID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(fg.Name); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "string",
		Name:  "name",
		Value: string(buf),
	}
	if buf, err = json.Marshal(fg.TotalCount); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "int",
		Name:  "total_count",
		Value: string(buf),
	}
	if buf, err = json.Marshal(fg.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[3] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	if buf, err = json.Marshal(fg.UpdatedAt); err != nil {
		return nil, err
	}
	node.Fields[4] = &Field{
		Type:  "time.Time",
		Name:  "updated_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = fg.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "User",
		Name: "friend_users",
	}
	err = fg.QueryFriendUsers().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[2] = &Edge{
		Type: "InvitationFriendGroup",
		Name: "invitation_friend_groups",
	}
	err = fg.QueryInvitationFriendGroups().
		Select(invitationfriendgroup.FieldID).
		Scan(ctx, &node.Edges[2].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[3] = &Edge{
		Type: "UserFriendGroup",
		Name: "user_friend_groups",
	}
	err = fg.QueryUserFriendGroups().
		Select(userfriendgroup.FieldID).
		Scan(ctx, &node.Edges[3].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (f *Friendship) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     f.ID,
		Type:   "Friendship",
		Fields: make([]*Field, 3),
		Edges:  make([]*Edge, 2),
	}
	var buf []byte
	if buf, err = json.Marshal(f.UserID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(f.FriendUserID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "uuid.UUID",
		Name:  "friend_user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(f.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = f.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "User",
		Name: "friend_user",
	}
	err = f.QueryFriendUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (fr *FriendshipRequest) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     fr.ID,
		Type:   "FriendshipRequest",
		Fields: make([]*Field, 3),
		Edges:  make([]*Edge, 2),
	}
	var buf []byte
	if buf, err = json.Marshal(fr.FromUserID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "from_user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(fr.ToUserID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "uuid.UUID",
		Name:  "to_user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(fr.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "User",
		Name: "from_users",
	}
	err = fr.QueryFromUsers().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "User",
		Name: "to_users",
	}
	err = fr.QueryToUsers().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (i *Invitation) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     i.ID,
		Type:   "Invitation",
		Fields: make([]*Field, 7),
		Edges:  make([]*Edge, 5),
	}
	var buf []byte
	if buf, err = json.Marshal(i.UserID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(i.Location); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "string",
		Name:  "location",
		Value: string(buf),
	}
	if buf, err = json.Marshal(i.Comment); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "string",
		Name:  "comment",
		Value: string(buf),
	}
	if buf, err = json.Marshal(i.StartsAt); err != nil {
		return nil, err
	}
	node.Fields[3] = &Field{
		Type:  "time.Time",
		Name:  "starts_at",
		Value: string(buf),
	}
	if buf, err = json.Marshal(i.ExpiresAt); err != nil {
		return nil, err
	}
	node.Fields[4] = &Field{
		Type:  "time.Time",
		Name:  "expires_at",
		Value: string(buf),
	}
	if buf, err = json.Marshal(i.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[5] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	if buf, err = json.Marshal(i.UpdatedAt); err != nil {
		return nil, err
	}
	node.Fields[6] = &Field{
		Type:  "time.Time",
		Name:  "updated_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = i.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "InvitationUser",
		Name: "invitation_users",
	}
	err = i.QueryInvitationUsers().
		Select(invitationuser.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[2] = &Edge{
		Type: "InvitationFriendGroup",
		Name: "invitation_friend_groups",
	}
	err = i.QueryInvitationFriendGroups().
		Select(invitationfriendgroup.FieldID).
		Scan(ctx, &node.Edges[2].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[3] = &Edge{
		Type: "InvitationAcceptance",
		Name: "invitation_acceptances",
	}
	err = i.QueryInvitationAcceptances().
		Select(invitationacceptance.FieldID).
		Scan(ctx, &node.Edges[3].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[4] = &Edge{
		Type: "InvitationDenial",
		Name: "invitation_denials",
	}
	err = i.QueryInvitationDenials().
		Select(invitationdenial.FieldID).
		Scan(ctx, &node.Edges[4].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (ia *InvitationAcceptance) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     ia.ID,
		Type:   "InvitationAcceptance",
		Fields: make([]*Field, 3),
		Edges:  make([]*Edge, 2),
	}
	var buf []byte
	if buf, err = json.Marshal(ia.UserID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(ia.InvitationID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "uuid.UUID",
		Name:  "invitation_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(ia.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = ia.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "Invitation",
		Name: "invitation",
	}
	err = ia.QueryInvitation().
		Select(invitation.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (id *InvitationDenial) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     id.ID,
		Type:   "InvitationDenial",
		Fields: make([]*Field, 3),
		Edges:  make([]*Edge, 2),
	}
	var buf []byte
	if buf, err = json.Marshal(id.UserID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(id.InvitationID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "uuid.UUID",
		Name:  "invitation_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(id.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = id.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "Invitation",
		Name: "invitation",
	}
	err = id.QueryInvitation().
		Select(invitation.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (ifg *InvitationFriendGroup) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     ifg.ID,
		Type:   "InvitationFriendGroup",
		Fields: make([]*Field, 3),
		Edges:  make([]*Edge, 2),
	}
	var buf []byte
	if buf, err = json.Marshal(ifg.InvitationID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "invitation_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(ifg.FriendGroupID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "uuid.UUID",
		Name:  "friend_group_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(ifg.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "Invitation",
		Name: "invitation",
	}
	err = ifg.QueryInvitation().
		Select(invitation.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "FriendGroup",
		Name: "friend_group",
	}
	err = ifg.QueryFriendGroup().
		Select(friendgroup.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (iu *InvitationUser) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     iu.ID,
		Type:   "InvitationUser",
		Fields: make([]*Field, 3),
		Edges:  make([]*Edge, 2),
	}
	var buf []byte
	if buf, err = json.Marshal(iu.InvitationID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "invitation_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(iu.UserID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(iu.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "Invitation",
		Name: "invitation",
	}
	err = iu.QueryInvitation().
		Select(invitation.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = iu.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (u *User) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     u.ID,
		Type:   "User",
		Fields: make([]*Field, 2),
		Edges:  make([]*Edge, 8),
	}
	var buf []byte
	if buf, err = json.Marshal(u.AuthID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "string",
		Name:  "auth_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(u.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "UserProfile",
		Name: "user_profile",
	}
	err = u.QueryUserProfile().
		Select(userprofile.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "User",
		Name: "friend_users",
	}
	err = u.QueryFriendUsers().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[2] = &Edge{
		Type: "FriendGroup",
		Name: "friend_groups",
	}
	err = u.QueryFriendGroups().
		Select(friendgroup.FieldID).
		Scan(ctx, &node.Edges[2].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[3] = &Edge{
		Type: "FriendGroup",
		Name: "belonging_friend_groups",
	}
	err = u.QueryBelongingFriendGroups().
		Select(friendgroup.FieldID).
		Scan(ctx, &node.Edges[3].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[4] = &Edge{
		Type: "InvitationAcceptance",
		Name: "invitation_acceptances",
	}
	err = u.QueryInvitationAcceptances().
		Select(invitationacceptance.FieldID).
		Scan(ctx, &node.Edges[4].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[5] = &Edge{
		Type: "InvitationDenial",
		Name: "invitation_denials",
	}
	err = u.QueryInvitationDenials().
		Select(invitationdenial.FieldID).
		Scan(ctx, &node.Edges[5].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[6] = &Edge{
		Type: "Friendship",
		Name: "friendships",
	}
	err = u.QueryFriendships().
		Select(friendship.FieldID).
		Scan(ctx, &node.Edges[6].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[7] = &Edge{
		Type: "UserFriendGroup",
		Name: "user_friend_groups",
	}
	err = u.QueryUserFriendGroups().
		Select(userfriendgroup.FieldID).
		Scan(ctx, &node.Edges[7].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (ufg *UserFriendGroup) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     ufg.ID,
		Type:   "UserFriendGroup",
		Fields: make([]*Field, 3),
		Edges:  make([]*Edge, 2),
	}
	var buf []byte
	if buf, err = json.Marshal(ufg.FriendGroupID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "friend_group_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(ufg.UserID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(ufg.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "FriendGroup",
		Name: "friend_group",
	}
	err = ufg.QueryFriendGroup().
		Select(friendgroup.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = ufg.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (um *UserMute) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     um.ID,
		Type:   "UserMute",
		Fields: make([]*Field, 3),
		Edges:  make([]*Edge, 2),
	}
	var buf []byte
	if buf, err = json.Marshal(um.UserID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(um.MuteUserID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "uuid.UUID",
		Name:  "mute_user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(um.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = um.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	node.Edges[1] = &Edge{
		Type: "User",
		Name: "mute_user",
	}
	err = um.QueryMuteUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[1].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (up *UserProfile) Node(ctx context.Context) (node *Node, err error) {
	node = &Node{
		ID:     up.ID,
		Type:   "UserProfile",
		Fields: make([]*Field, 7),
		Edges:  make([]*Edge, 1),
	}
	var buf []byte
	if buf, err = json.Marshal(up.UserID); err != nil {
		return nil, err
	}
	node.Fields[0] = &Field{
		Type:  "uuid.UUID",
		Name:  "user_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(up.ScreenID); err != nil {
		return nil, err
	}
	node.Fields[1] = &Field{
		Type:  "string",
		Name:  "screen_id",
		Value: string(buf),
	}
	if buf, err = json.Marshal(up.Nickname); err != nil {
		return nil, err
	}
	node.Fields[2] = &Field{
		Type:  "string",
		Name:  "nickname",
		Value: string(buf),
	}
	if buf, err = json.Marshal(up.Email); err != nil {
		return nil, err
	}
	node.Fields[3] = &Field{
		Type:  "string",
		Name:  "email",
		Value: string(buf),
	}
	if buf, err = json.Marshal(up.AvatarURL); err != nil {
		return nil, err
	}
	node.Fields[4] = &Field{
		Type:  "string",
		Name:  "avatar_url",
		Value: string(buf),
	}
	if buf, err = json.Marshal(up.CreatedAt); err != nil {
		return nil, err
	}
	node.Fields[5] = &Field{
		Type:  "time.Time",
		Name:  "created_at",
		Value: string(buf),
	}
	if buf, err = json.Marshal(up.UpdatedAt); err != nil {
		return nil, err
	}
	node.Fields[6] = &Field{
		Type:  "time.Time",
		Name:  "updated_at",
		Value: string(buf),
	}
	node.Edges[0] = &Edge{
		Type: "User",
		Name: "user",
	}
	err = up.QueryUser().
		Select(user.FieldID).
		Scan(ctx, &node.Edges[0].IDs)
	if err != nil {
		return nil, err
	}
	return node, nil
}

func (c *Client) Node(ctx context.Context, id uuid.UUID) (*Node, error) {
	n, err := c.Noder(ctx, id)
	if err != nil {
		return nil, err
	}
	return n.Node(ctx)
}

var errNodeInvalidID = &NotFoundError{"node"}

// NodeOption allows configuring the Noder execution using functional options.
type NodeOption func(*nodeOptions)

// WithNodeType sets the node Type resolver function (i.e. the table to query).
// If was not provided, the table will be derived from the universal-id
// configuration as described in: https://entgo.io/docs/migrate/#universal-ids.
func WithNodeType(f func(context.Context, uuid.UUID) (string, error)) NodeOption {
	return func(o *nodeOptions) {
		o.nodeType = f
	}
}

// WithFixedNodeType sets the Type of the node to a fixed value.
func WithFixedNodeType(t string) NodeOption {
	return WithNodeType(func(context.Context, uuid.UUID) (string, error) {
		return t, nil
	})
}

type nodeOptions struct {
	nodeType func(context.Context, uuid.UUID) (string, error)
}

func (c *Client) newNodeOpts(opts []NodeOption) *nodeOptions {
	nopts := &nodeOptions{}
	for _, opt := range opts {
		opt(nopts)
	}
	if nopts.nodeType == nil {
		nopts.nodeType = func(ctx context.Context, id uuid.UUID) (string, error) {
			return "", fmt.Errorf("cannot resolve noder (%v) without its type", id)
		}
	}
	return nopts
}

// Noder returns a Node by its id. If the NodeType was not provided, it will
// be derived from the id value according to the universal-id configuration.
//
//	c.Noder(ctx, id)
//	c.Noder(ctx, id, ent.WithNodeType(typeResolver))
func (c *Client) Noder(ctx context.Context, id uuid.UUID, opts ...NodeOption) (_ Noder, err error) {
	defer func() {
		if IsNotFound(err) {
			err = multierror.Append(err, entgql.ErrNodeNotFound(id))
		}
	}()
	table, err := c.newNodeOpts(opts).nodeType(ctx, id)
	if err != nil {
		return nil, err
	}
	return c.noder(ctx, table, id)
}

func (c *Client) noder(ctx context.Context, table string, id uuid.UUID) (Noder, error) {
	switch table {
	case friendgroup.Table:
		query := c.FriendGroup.Query().
			Where(friendgroup.ID(id))
		query, err := query.CollectFields(ctx, "FriendGroup")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case friendship.Table:
		query := c.Friendship.Query().
			Where(friendship.ID(id))
		query, err := query.CollectFields(ctx, "Friendship")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case friendshiprequest.Table:
		query := c.FriendshipRequest.Query().
			Where(friendshiprequest.ID(id))
		query, err := query.CollectFields(ctx, "FriendshipRequest")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case invitation.Table:
		query := c.Invitation.Query().
			Where(invitation.ID(id))
		query, err := query.CollectFields(ctx, "Invitation")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case invitationacceptance.Table:
		query := c.InvitationAcceptance.Query().
			Where(invitationacceptance.ID(id))
		query, err := query.CollectFields(ctx, "InvitationAcceptance")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case invitationdenial.Table:
		query := c.InvitationDenial.Query().
			Where(invitationdenial.ID(id))
		query, err := query.CollectFields(ctx, "InvitationDenial")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case invitationfriendgroup.Table:
		query := c.InvitationFriendGroup.Query().
			Where(invitationfriendgroup.ID(id))
		query, err := query.CollectFields(ctx, "InvitationFriendGroup")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case invitationuser.Table:
		query := c.InvitationUser.Query().
			Where(invitationuser.ID(id))
		query, err := query.CollectFields(ctx, "InvitationUser")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case user.Table:
		query := c.User.Query().
			Where(user.ID(id))
		query, err := query.CollectFields(ctx, "User")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case userfriendgroup.Table:
		query := c.UserFriendGroup.Query().
			Where(userfriendgroup.ID(id))
		query, err := query.CollectFields(ctx, "UserFriendGroup")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case usermute.Table:
		query := c.UserMute.Query().
			Where(usermute.ID(id))
		query, err := query.CollectFields(ctx, "UserMute")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case userprofile.Table:
		query := c.UserProfile.Query().
			Where(userprofile.ID(id))
		query, err := query.CollectFields(ctx, "UserProfile")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	default:
		return nil, fmt.Errorf("cannot resolve noder from table %q: %w", table, errNodeInvalidID)
	}
}

func (c *Client) Noders(ctx context.Context, ids []uuid.UUID, opts ...NodeOption) ([]Noder, error) {
	switch len(ids) {
	case 1:
		noder, err := c.Noder(ctx, ids[0], opts...)
		if err != nil {
			return nil, err
		}
		return []Noder{noder}, nil
	case 0:
		return []Noder{}, nil
	}

	noders := make([]Noder, len(ids))
	errors := make([]error, len(ids))
	tables := make(map[string][]uuid.UUID)
	id2idx := make(map[uuid.UUID][]int, len(ids))
	nopts := c.newNodeOpts(opts)
	for i, id := range ids {
		table, err := nopts.nodeType(ctx, id)
		if err != nil {
			errors[i] = err
			continue
		}
		tables[table] = append(tables[table], id)
		id2idx[id] = append(id2idx[id], i)
	}

	for table, ids := range tables {
		nodes, err := c.noders(ctx, table, ids)
		if err != nil {
			for _, id := range ids {
				for _, idx := range id2idx[id] {
					errors[idx] = err
				}
			}
		} else {
			for i, id := range ids {
				for _, idx := range id2idx[id] {
					noders[idx] = nodes[i]
				}
			}
		}
	}

	for i, id := range ids {
		if errors[i] == nil {
			if noders[i] != nil {
				continue
			}
			errors[i] = entgql.ErrNodeNotFound(id)
		} else if IsNotFound(errors[i]) {
			errors[i] = multierror.Append(errors[i], entgql.ErrNodeNotFound(id))
		}
		ctx := graphql.WithPathContext(ctx,
			graphql.NewPathWithIndex(i),
		)
		graphql.AddError(ctx, errors[i])
	}
	return noders, nil
}

func (c *Client) noders(ctx context.Context, table string, ids []uuid.UUID) ([]Noder, error) {
	noders := make([]Noder, len(ids))
	idmap := make(map[uuid.UUID][]*Noder, len(ids))
	for i, id := range ids {
		idmap[id] = append(idmap[id], &noders[i])
	}
	switch table {
	case friendgroup.Table:
		query := c.FriendGroup.Query().
			Where(friendgroup.IDIn(ids...))
		query, err := query.CollectFields(ctx, "FriendGroup")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case friendship.Table:
		query := c.Friendship.Query().
			Where(friendship.IDIn(ids...))
		query, err := query.CollectFields(ctx, "Friendship")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case friendshiprequest.Table:
		query := c.FriendshipRequest.Query().
			Where(friendshiprequest.IDIn(ids...))
		query, err := query.CollectFields(ctx, "FriendshipRequest")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case invitation.Table:
		query := c.Invitation.Query().
			Where(invitation.IDIn(ids...))
		query, err := query.CollectFields(ctx, "Invitation")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case invitationacceptance.Table:
		query := c.InvitationAcceptance.Query().
			Where(invitationacceptance.IDIn(ids...))
		query, err := query.CollectFields(ctx, "InvitationAcceptance")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case invitationdenial.Table:
		query := c.InvitationDenial.Query().
			Where(invitationdenial.IDIn(ids...))
		query, err := query.CollectFields(ctx, "InvitationDenial")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case invitationfriendgroup.Table:
		query := c.InvitationFriendGroup.Query().
			Where(invitationfriendgroup.IDIn(ids...))
		query, err := query.CollectFields(ctx, "InvitationFriendGroup")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case invitationuser.Table:
		query := c.InvitationUser.Query().
			Where(invitationuser.IDIn(ids...))
		query, err := query.CollectFields(ctx, "InvitationUser")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case user.Table:
		query := c.User.Query().
			Where(user.IDIn(ids...))
		query, err := query.CollectFields(ctx, "User")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case userfriendgroup.Table:
		query := c.UserFriendGroup.Query().
			Where(userfriendgroup.IDIn(ids...))
		query, err := query.CollectFields(ctx, "UserFriendGroup")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case usermute.Table:
		query := c.UserMute.Query().
			Where(usermute.IDIn(ids...))
		query, err := query.CollectFields(ctx, "UserMute")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	case userprofile.Table:
		query := c.UserProfile.Query().
			Where(userprofile.IDIn(ids...))
		query, err := query.CollectFields(ctx, "UserProfile")
		if err != nil {
			return nil, err
		}
		nodes, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, node := range nodes {
			for _, noder := range idmap[node.ID] {
				*noder = node
			}
		}
	default:
		return nil, fmt.Errorf("cannot resolve noders from table %q: %w", table, errNodeInvalidID)
	}
	return noders, nil
}