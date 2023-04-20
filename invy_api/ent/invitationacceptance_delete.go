// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
)

// InvitationAcceptanceDelete is the builder for deleting a InvitationAcceptance entity.
type InvitationAcceptanceDelete struct {
	config
	hooks    []Hook
	mutation *InvitationAcceptanceMutation
}

// Where appends a list predicates to the InvitationAcceptanceDelete builder.
func (iad *InvitationAcceptanceDelete) Where(ps ...predicate.InvitationAcceptance) *InvitationAcceptanceDelete {
	iad.mutation.Where(ps...)
	return iad
}

// Exec executes the deletion query and returns how many vertices were deleted.
func (iad *InvitationAcceptanceDelete) Exec(ctx context.Context) (int, error) {
	return withHooks[int, InvitationAcceptanceMutation](ctx, iad.sqlExec, iad.mutation, iad.hooks)
}

// ExecX is like Exec, but panics if an error occurs.
func (iad *InvitationAcceptanceDelete) ExecX(ctx context.Context) int {
	n, err := iad.Exec(ctx)
	if err != nil {
		panic(err)
	}
	return n
}

func (iad *InvitationAcceptanceDelete) sqlExec(ctx context.Context) (int, error) {
	_spec := sqlgraph.NewDeleteSpec(invitationacceptance.Table, sqlgraph.NewFieldSpec(invitationacceptance.FieldID, field.TypeUUID))
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

// InvitationAcceptanceDeleteOne is the builder for deleting a single InvitationAcceptance entity.
type InvitationAcceptanceDeleteOne struct {
	iad *InvitationAcceptanceDelete
}

// Where appends a list predicates to the InvitationAcceptanceDelete builder.
func (iado *InvitationAcceptanceDeleteOne) Where(ps ...predicate.InvitationAcceptance) *InvitationAcceptanceDeleteOne {
	iado.iad.mutation.Where(ps...)
	return iado
}

// Exec executes the deletion query.
func (iado *InvitationAcceptanceDeleteOne) Exec(ctx context.Context) error {
	n, err := iado.iad.Exec(ctx)
	switch {
	case err != nil:
		return err
	case n == 0:
		return &NotFoundError{invitationacceptance.Label}
	default:
		return nil
	}
}

// ExecX is like Exec, but panics if an error occurs.
func (iado *InvitationAcceptanceDeleteOne) ExecX(ctx context.Context) {
	if err := iado.Exec(ctx); err != nil {
		panic(err)
	}
}
