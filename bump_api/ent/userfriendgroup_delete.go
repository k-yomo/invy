// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"fmt"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/k-yomo/bump/bump_api/ent/predicate"
	"github.com/k-yomo/bump/bump_api/ent/userfriendgroup"
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
	var (
		err      error
		affected int
	)
	if len(ufgd.hooks) == 0 {
		affected, err = ufgd.sqlExec(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*UserFriendGroupMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			ufgd.mutation = mutation
			affected, err = ufgd.sqlExec(ctx)
			mutation.done = true
			return affected, err
		})
		for i := len(ufgd.hooks) - 1; i >= 0; i-- {
			if ufgd.hooks[i] == nil {
				return 0, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = ufgd.hooks[i](mut)
		}
		if _, err := mut.Mutate(ctx, ufgd.mutation); err != nil {
			return 0, err
		}
	}
	return affected, err
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
	_spec := &sqlgraph.DeleteSpec{
		Node: &sqlgraph.NodeSpec{
			Table: userfriendgroup.Table,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: userfriendgroup.FieldID,
			},
		},
	}
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
	return affected, err
}

// UserFriendGroupDeleteOne is the builder for deleting a single UserFriendGroup entity.
type UserFriendGroupDeleteOne struct {
	ufgd *UserFriendGroupDelete
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
	ufgdo.ufgd.ExecX(ctx)
}
