// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"

	"github.com/99designs/gqlgen/graphql"
)

func (fg *FriendGroup) User(ctx context.Context) (*User, error) {
	result, err := fg.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = fg.QueryUser().Only(ctx)
	}
	return result, err
}

func (fg *FriendGroup) FriendUsers(ctx context.Context) (result []*User, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = fg.NamedFriendUsers(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = fg.Edges.FriendUsersOrErr()
	}
	if IsNotLoaded(err) {
		result, err = fg.QueryFriendUsers().All(ctx)
	}
	return result, err
}

func (fg *FriendGroup) InvitationFriendGroups(ctx context.Context) (result []*InvitationFriendGroup, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = fg.NamedInvitationFriendGroups(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = fg.Edges.InvitationFriendGroupsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = fg.QueryInvitationFriendGroups().All(ctx)
	}
	return result, err
}

func (fg *FriendGroup) UserFriendGroups(ctx context.Context) (result []*UserFriendGroup, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = fg.NamedUserFriendGroups(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = fg.Edges.UserFriendGroupsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = fg.QueryUserFriendGroups().All(ctx)
	}
	return result, err
}

func (f *Friendship) User(ctx context.Context) (*User, error) {
	result, err := f.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = f.QueryUser().Only(ctx)
	}
	return result, err
}

func (f *Friendship) FriendUser(ctx context.Context) (*User, error) {
	result, err := f.Edges.FriendUserOrErr()
	if IsNotLoaded(err) {
		result, err = f.QueryFriendUser().Only(ctx)
	}
	return result, err
}

func (fr *FriendshipRequest) FromUsers(ctx context.Context) (*User, error) {
	result, err := fr.Edges.FromUsersOrErr()
	if IsNotLoaded(err) {
		result, err = fr.QueryFromUsers().Only(ctx)
	}
	return result, err
}

func (fr *FriendshipRequest) ToUsers(ctx context.Context) (*User, error) {
	result, err := fr.Edges.ToUsersOrErr()
	if IsNotLoaded(err) {
		result, err = fr.QueryToUsers().Only(ctx)
	}
	return result, err
}

func (i *Invitation) User(ctx context.Context) (*User, error) {
	result, err := i.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = i.QueryUser().Only(ctx)
	}
	return result, err
}

func (i *Invitation) InvitationUsers(ctx context.Context) (result []*InvitationUser, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = i.NamedInvitationUsers(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = i.Edges.InvitationUsersOrErr()
	}
	if IsNotLoaded(err) {
		result, err = i.QueryInvitationUsers().All(ctx)
	}
	return result, err
}

func (i *Invitation) InvitationFriendGroups(ctx context.Context) (result []*InvitationFriendGroup, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = i.NamedInvitationFriendGroups(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = i.Edges.InvitationFriendGroupsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = i.QueryInvitationFriendGroups().All(ctx)
	}
	return result, err
}

func (i *Invitation) InvitationAcceptances(ctx context.Context) (result []*InvitationAcceptance, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = i.NamedInvitationAcceptances(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = i.Edges.InvitationAcceptancesOrErr()
	}
	if IsNotLoaded(err) {
		result, err = i.QueryInvitationAcceptances().All(ctx)
	}
	return result, err
}

func (i *Invitation) InvitationDenials(ctx context.Context) (result []*InvitationDenial, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = i.NamedInvitationDenials(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = i.Edges.InvitationDenialsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = i.QueryInvitationDenials().All(ctx)
	}
	return result, err
}

func (ia *InvitationAcceptance) User(ctx context.Context) (*User, error) {
	result, err := ia.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = ia.QueryUser().Only(ctx)
	}
	return result, err
}

func (ia *InvitationAcceptance) Invitation(ctx context.Context) (*Invitation, error) {
	result, err := ia.Edges.InvitationOrErr()
	if IsNotLoaded(err) {
		result, err = ia.QueryInvitation().Only(ctx)
	}
	return result, err
}

func (id *InvitationDenial) User(ctx context.Context) (*User, error) {
	result, err := id.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = id.QueryUser().Only(ctx)
	}
	return result, err
}

func (id *InvitationDenial) Invitation(ctx context.Context) (*Invitation, error) {
	result, err := id.Edges.InvitationOrErr()
	if IsNotLoaded(err) {
		result, err = id.QueryInvitation().Only(ctx)
	}
	return result, err
}

func (ifg *InvitationFriendGroup) Invitation(ctx context.Context) (*Invitation, error) {
	result, err := ifg.Edges.InvitationOrErr()
	if IsNotLoaded(err) {
		result, err = ifg.QueryInvitation().Only(ctx)
	}
	return result, err
}

func (ifg *InvitationFriendGroup) FriendGroup(ctx context.Context) (*FriendGroup, error) {
	result, err := ifg.Edges.FriendGroupOrErr()
	if IsNotLoaded(err) {
		result, err = ifg.QueryFriendGroup().Only(ctx)
	}
	return result, err
}

func (iu *InvitationUser) Invitation(ctx context.Context) (*Invitation, error) {
	result, err := iu.Edges.InvitationOrErr()
	if IsNotLoaded(err) {
		result, err = iu.QueryInvitation().Only(ctx)
	}
	return result, err
}

func (iu *InvitationUser) User(ctx context.Context) (*User, error) {
	result, err := iu.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = iu.QueryUser().Only(ctx)
	}
	return result, err
}

func (u *User) UserProfile(ctx context.Context) (*UserProfile, error) {
	result, err := u.Edges.UserProfileOrErr()
	if IsNotLoaded(err) {
		result, err = u.QueryUserProfile().Only(ctx)
	}
	return result, MaskNotFound(err)
}

func (u *User) FriendUsers(ctx context.Context) (result []*User, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = u.NamedFriendUsers(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = u.Edges.FriendUsersOrErr()
	}
	if IsNotLoaded(err) {
		result, err = u.QueryFriendUsers().All(ctx)
	}
	return result, err
}

func (u *User) FriendGroups(ctx context.Context) (result []*FriendGroup, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = u.NamedFriendGroups(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = u.Edges.FriendGroupsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = u.QueryFriendGroups().All(ctx)
	}
	return result, err
}

func (u *User) BelongingFriendGroups(ctx context.Context) (result []*FriendGroup, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = u.NamedBelongingFriendGroups(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = u.Edges.BelongingFriendGroupsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = u.QueryBelongingFriendGroups().All(ctx)
	}
	return result, err
}

func (u *User) InvitationAcceptances(ctx context.Context) (result []*InvitationAcceptance, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = u.NamedInvitationAcceptances(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = u.Edges.InvitationAcceptancesOrErr()
	}
	if IsNotLoaded(err) {
		result, err = u.QueryInvitationAcceptances().All(ctx)
	}
	return result, err
}

func (u *User) InvitationDenials(ctx context.Context) (result []*InvitationDenial, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = u.NamedInvitationDenials(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = u.Edges.InvitationDenialsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = u.QueryInvitationDenials().All(ctx)
	}
	return result, err
}

func (u *User) Friendships(ctx context.Context) (result []*Friendship, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = u.NamedFriendships(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = u.Edges.FriendshipsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = u.QueryFriendships().All(ctx)
	}
	return result, err
}

func (u *User) UserFriendGroups(ctx context.Context) (result []*UserFriendGroup, err error) {
	if fc := graphql.GetFieldContext(ctx); fc != nil && fc.Field.Alias != "" {
		result, err = u.NamedUserFriendGroups(graphql.GetFieldContext(ctx).Field.Alias)
	} else {
		result, err = u.Edges.UserFriendGroupsOrErr()
	}
	if IsNotLoaded(err) {
		result, err = u.QueryUserFriendGroups().All(ctx)
	}
	return result, err
}

func (ufg *UserFriendGroup) FriendGroup(ctx context.Context) (*FriendGroup, error) {
	result, err := ufg.Edges.FriendGroupOrErr()
	if IsNotLoaded(err) {
		result, err = ufg.QueryFriendGroup().Only(ctx)
	}
	return result, err
}

func (ufg *UserFriendGroup) User(ctx context.Context) (*User, error) {
	result, err := ufg.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = ufg.QueryUser().Only(ctx)
	}
	return result, err
}

func (um *UserMute) User(ctx context.Context) (*User, error) {
	result, err := um.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = um.QueryUser().Only(ctx)
	}
	return result, err
}

func (um *UserMute) MuteUser(ctx context.Context) (*User, error) {
	result, err := um.Edges.MuteUserOrErr()
	if IsNotLoaded(err) {
		result, err = um.QueryMuteUser().Only(ctx)
	}
	return result, err
}

func (up *UserProfile) User(ctx context.Context) (*User, error) {
	result, err := up.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = up.QueryUser().Only(ctx)
	}
	return result, err
}