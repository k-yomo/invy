// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/k-yomo/invy/invy_api/ent/invitationawaiting"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
)

// InvitationAwaitingDelete is the builder for deleting a InvitationAwaiting entity.
type InvitationAwaitingDelete struct {
	config
	hooks    []Hook
	mutation *InvitationAwaitingMutation
}

// Where appends a list predicates to the InvitationAwaitingDelete builder.
func (iad *InvitationAwaitingDelete) Where(ps ...predicate.InvitationAwaiting) *InvitationAwaitingDelete {
	iad.mutation.Where(ps...)
	return iad
}

// Exec executes the deletion query and returns how many vertices were deleted.
func (iad *InvitationAwaitingDelete) Exec(ctx context.Context) (int, error) {
	return withHooks[int, InvitationAwaitingMutation](ctx, iad.sqlExec, iad.mutation, iad.hooks)
}

// ExecX is like Exec, but panics if an error occurs.
func (iad *InvitationAwaitingDelete) ExecX(ctx context.Context) int {
	n, err := iad.Exec(ctx)
	if err != nil {
		panic(err)
	}
	return n
}

func (iad *InvitationAwaitingDelete) sqlExec(ctx context.Context) (int, error) {
	_spec := &sqlgraph.DeleteSpec{
		Node: &sqlgraph.NodeSpec{
			Table: invitationawaiting.Table,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitationawaiting.FieldID,
			},
		},
	}
	if ps := iad.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	affected, err := sqlgraph.DeleteNodes(ctx, iad.driver, _spec)
	if err != nil && sqlgraph.IsConstraintError(err) {
		err = &ConstraintError{msg: err.Error(), wrap: err}
	}
	iad.mutation.done = true
	return affected, err
}

// InvitationAwaitingDeleteOne is the builder for deleting a single InvitationAwaiting entity.
type InvitationAwaitingDeleteOne struct {
	iad *InvitationAwaitingDelete
}

// Exec executes the deletion query.
func (iado *InvitationAwaitingDeleteOne) Exec(ctx context.Context) error {
	n, err := iado.iad.Exec(ctx)
	switch {
	case err != nil:
		return err
	case n == 0:
		return &NotFoundError{invitationawaiting.Label}
	default:
		return nil
	}
}

// ExecX is like Exec, but panics if an error occurs.
func (iado *InvitationAwaitingDeleteOne) ExecX(ctx context.Context) {
	iado.iad.ExecX(ctx)
}
