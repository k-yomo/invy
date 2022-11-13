// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"

	"github.com/99designs/gqlgen/graphql"
)

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

func (up *UserProfile) User(ctx context.Context) (*User, error) {
	result, err := up.Edges.UserOrErr()
	if IsNotLoaded(err) {
		result, err = up.QueryUser().Only(ctx)
	}
	return result, err
}
