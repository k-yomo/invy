// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
)

// InvitationAcceptanceUpdate is the builder for updating InvitationAcceptance entities.
type InvitationAcceptanceUpdate struct {
	config
	hooks    []Hook
	mutation *InvitationAcceptanceMutation
}

// Where appends a list predicates to the InvitationAcceptanceUpdate builder.
func (iau *InvitationAcceptanceUpdate) Where(ps ...predicate.InvitationAcceptance) *InvitationAcceptanceUpdate {
	iau.mutation.Where(ps...)
	return iau
}

// Mutation returns the InvitationAcceptanceMutation object of the builder.
func (iau *InvitationAcceptanceUpdate) Mutation() *InvitationAcceptanceMutation {
	return iau.mutation
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (iau *InvitationAcceptanceUpdate) Save(ctx context.Context) (int, error) {
	return withHooks[int, InvitationAcceptanceMutation](ctx, iau.sqlSave, iau.mutation, iau.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (iau *InvitationAcceptanceUpdate) SaveX(ctx context.Context) int {
	affected, err := iau.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (iau *InvitationAcceptanceUpdate) Exec(ctx context.Context) error {
	_, err := iau.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (iau *InvitationAcceptanceUpdate) ExecX(ctx context.Context) {
	if err := iau.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (iau *InvitationAcceptanceUpdate) check() error {
	if _, ok := iau.mutation.UserID(); iau.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "InvitationAcceptance.user"`)
	}
	if _, ok := iau.mutation.InvitationID(); iau.mutation.InvitationCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "InvitationAcceptance.invitation"`)
	}
	return nil
}

func (iau *InvitationAcceptanceUpdate) sqlSave(ctx context.Context) (n int, err error) {
	if err := iau.check(); err != nil {
		return n, err
	}
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   invitationacceptance.Table,
			Columns: invitationacceptance.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitationacceptance.FieldID,
			},
		},
	}
	if ps := iau.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if n, err = sqlgraph.UpdateNodes(ctx, iau.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{invitationacceptance.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	iau.mutation.done = true
	return n, nil
}

// InvitationAcceptanceUpdateOne is the builder for updating a single InvitationAcceptance entity.
type InvitationAcceptanceUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *InvitationAcceptanceMutation
}

// Mutation returns the InvitationAcceptanceMutation object of the builder.
func (iauo *InvitationAcceptanceUpdateOne) Mutation() *InvitationAcceptanceMutation {
	return iauo.mutation
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (iauo *InvitationAcceptanceUpdateOne) Select(field string, fields ...string) *InvitationAcceptanceUpdateOne {
	iauo.fields = append([]string{field}, fields...)
	return iauo
}

// Save executes the query and returns the updated InvitationAcceptance entity.
func (iauo *InvitationAcceptanceUpdateOne) Save(ctx context.Context) (*InvitationAcceptance, error) {
	return withHooks[*InvitationAcceptance, InvitationAcceptanceMutation](ctx, iauo.sqlSave, iauo.mutation, iauo.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (iauo *InvitationAcceptanceUpdateOne) SaveX(ctx context.Context) *InvitationAcceptance {
	node, err := iauo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (iauo *InvitationAcceptanceUpdateOne) Exec(ctx context.Context) error {
	_, err := iauo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (iauo *InvitationAcceptanceUpdateOne) ExecX(ctx context.Context) {
	if err := iauo.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (iauo *InvitationAcceptanceUpdateOne) check() error {
	if _, ok := iauo.mutation.UserID(); iauo.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "InvitationAcceptance.user"`)
	}
	if _, ok := iauo.mutation.InvitationID(); iauo.mutation.InvitationCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "InvitationAcceptance.invitation"`)
	}
	return nil
}

func (iauo *InvitationAcceptanceUpdateOne) sqlSave(ctx context.Context) (_node *InvitationAcceptance, err error) {
	if err := iauo.check(); err != nil {
		return _node, err
	}
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   invitationacceptance.Table,
			Columns: invitationacceptance.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitationacceptance.FieldID,
			},
		},
	}
	id, ok := iauo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "InvitationAcceptance.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := iauo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, invitationacceptance.FieldID)
		for _, f := range fields {
			if !invitationacceptance.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != invitationacceptance.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := iauo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	_node = &InvitationAcceptance{config: iauo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, iauo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{invitationacceptance.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	iauo.mutation.done = true
	return _node, nil
}
