// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"fmt"

	"entgo.io/contrib/entgql"
	"github.com/99designs/gqlgen/graphql"
	"github.com/google/uuid"
	"github.com/hashicorp/go-multierror"
	"github.com/k-yomo/invy/invy_api/ent/account"
	"github.com/k-yomo/invy/invy_api/ent/friendgroup"
	"github.com/k-yomo/invy/invy_api/ent/friendship"
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/invitationdenial"
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
	"github.com/k-yomo/invy/invy_api/ent/pushnotificationtoken"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userblock"
	"github.com/k-yomo/invy/invy_api/ent/userfriendgroup"
	"github.com/k-yomo/invy/invy_api/ent/userlocation"
	"github.com/k-yomo/invy/invy_api/ent/userlocationhistory"
	"github.com/k-yomo/invy/invy_api/ent/usermute"
	"github.com/k-yomo/invy/invy_api/ent/userprofile"
)

// Noder wraps the basic Node method.
type Noder interface {
	IsNode()
}

// IsNode implements the Node interface check for GQLGen.
func (n *Account) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *FriendGroup) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *Friendship) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *FriendshipRequest) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *Invitation) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *InvitationAcceptance) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *InvitationDenial) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *InvitationUser) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *PushNotificationToken) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *User) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *UserBlock) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *UserFriendGroup) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *UserLocation) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *UserLocationHistory) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *UserMute) IsNode() {}

// IsNode implements the Node interface check for GQLGen.
func (n *UserProfile) IsNode() {}

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
	case account.Table:
		query := c.Account.Query().
			Where(account.ID(id))
		query, err := query.CollectFields(ctx, "Account")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
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
	case pushnotificationtoken.Table:
		query := c.PushNotificationToken.Query().
			Where(pushnotificationtoken.ID(id))
		query, err := query.CollectFields(ctx, "PushNotificationToken")
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
	case userblock.Table:
		query := c.UserBlock.Query().
			Where(userblock.ID(id))
		query, err := query.CollectFields(ctx, "UserBlock")
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
	case userlocation.Table:
		query := c.UserLocation.Query().
			Where(userlocation.ID(id))
		query, err := query.CollectFields(ctx, "UserLocation")
		if err != nil {
			return nil, err
		}
		n, err := query.Only(ctx)
		if err != nil {
			return nil, err
		}
		return n, nil
	case userlocationhistory.Table:
		query := c.UserLocationHistory.Query().
			Where(userlocationhistory.ID(id))
		query, err := query.CollectFields(ctx, "UserLocationHistory")
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
	case account.Table:
		query := c.Account.Query().
			Where(account.IDIn(ids...))
		query, err := query.CollectFields(ctx, "Account")
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
	case pushnotificationtoken.Table:
		query := c.PushNotificationToken.Query().
			Where(pushnotificationtoken.IDIn(ids...))
		query, err := query.CollectFields(ctx, "PushNotificationToken")
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
	case userblock.Table:
		query := c.UserBlock.Query().
			Where(userblock.IDIn(ids...))
		query, err := query.CollectFields(ctx, "UserBlock")
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
	case userlocation.Table:
		query := c.UserLocation.Query().
			Where(userlocation.IDIn(ids...))
		query, err := query.CollectFields(ctx, "UserLocation")
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
	case userlocationhistory.Table:
		query := c.UserLocationHistory.Query().
			Where(userlocationhistory.IDIn(ids...))
		query, err := query.CollectFields(ctx, "UserLocationHistory")
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
