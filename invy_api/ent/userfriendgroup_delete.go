// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/invy_api/ent/userfriendgroup"
)

// UserFriendGroupDelete is the builder for deleting a UserFriendGroup entity.
type UserFriendGroupDelete struct {
	config
	hooks    []Hook
	mutation *UserFriendGroupMutation
}

// Where appends a list predicates to the UserFriendGroupDelete builder.
func (ufgd *UserFriendGroupDelete) Where(ps ...predicate.UserFriendGroup) *UserFriendGroupDelete {
	ufgd.mutation.Where(ps...)
	return ufgd
}

// Exec executes the deletion query and returns how many vertices were deleted.
func (ufgd *UserFriendGroupDelete) Exec(ctx context.Context) (int, error) {
	return withHooks[int, UserFriendGroupMutation](ctx, ufgd.sqlExec, ufgd.mutation, ufgd.hooks)
}

// ExecX is like Exec, but panics if an error occurs.
func (ufgd *UserFriendGroupDelete) ExecX(ctx context.Context) int {
	n, err := ufgd.Exec(ctx)
	if err != nil {
		panic(err)
	}
	return n
}

func (ufgd *UserFriendGroupDelete) sqlExec(ctx context.Context) (int, error) {
	_spec := sqlgraph.NewDeleteSpec(userfriendgroup.Table, sqlgraph.NewFieldSpec(userfriendgroup.FieldID, field.TypeUUID))
	if ps := ufgd.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	affected, err := sqlgraph.DeleteNodes(ctx, ufgd.driver, _spec)
	if err != nil && sqlgraph.IsConstraintError(err) {
		err = &ConstraintError{msg: err.Error(), wrap: err}
	}
	ufgd.mutation.done = true
	return affected, err
}

// UserFriendGroupDeleteOne is the builder for deleting a single UserFriendGroup entity.
type UserFriendGroupDeleteOne struct {
	ufgd *UserFriendGroupDelete
}

// Where appends a list predicates to the UserFriendGroupDelete builder.
func (ufgdo *UserFriendGroupDeleteOne) Where(ps ...predicate.UserFriendGroup) *UserFriendGroupDeleteOne {
	ufgdo.ufgd.mutation.Where(ps...)
	return ufgdo
}

// Exec executes the deletion query.
func (ufgdo *UserFriendGroupDeleteOne) Exec(ctx context.Context) error {
	n, err := ufgdo.ufgd.Exec(ctx)
	switch {
	case err != nil:
		return err
	case n == 0:
		return &NotFoundError{userfriendgroup.Label}
	default:
		return nil
	}
}

// ExecX is like Exec, but panics if an error occurs.
func (ufgdo *UserFriendGroupDeleteOne) ExecX(ctx context.Context) {
	if err := ufgdo.Exec(ctx); err != nil {
		panic(err)
	}
}
