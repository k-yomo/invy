// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/k-yomo/invy/invy_api/ent/invitationfriendgroup"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
)

// InvitationFriendGroupUpdate is the builder for updating InvitationFriendGroup entities.
type InvitationFriendGroupUpdate struct {
	config
	hooks    []Hook
	mutation *InvitationFriendGroupMutation
}

// Where appends a list predicates to the InvitationFriendGroupUpdate builder.
func (ifgu *InvitationFriendGroupUpdate) Where(ps ...predicate.InvitationFriendGroup) *InvitationFriendGroupUpdate {
	ifgu.mutation.Where(ps...)
	return ifgu
}

// Mutation returns the InvitationFriendGroupMutation object of the builder.
func (ifgu *InvitationFriendGroupUpdate) Mutation() *InvitationFriendGroupMutation {
	return ifgu.mutation
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (ifgu *InvitationFriendGroupUpdate) Save(ctx context.Context) (int, error) {
	var (
		err      error
		affected int
	)
	if len(ifgu.hooks) == 0 {
		if err = ifgu.check(); err != nil {
			return 0, err
		}
		affected, err = ifgu.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*InvitationFriendGroupMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = ifgu.check(); err != nil {
				return 0, err
			}
			ifgu.mutation = mutation
			affected, err = ifgu.sqlSave(ctx)
			mutation.done = true
			return affected, err
		})
		for i := len(ifgu.hooks) - 1; i >= 0; i-- {
			if ifgu.hooks[i] == nil {
				return 0, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = ifgu.hooks[i](mut)
		}
		if _, err := mut.Mutate(ctx, ifgu.mutation); err != nil {
			return 0, err
		}
	}
	return affected, err
}

// SaveX is like Save, but panics if an error occurs.
func (ifgu *InvitationFriendGroupUpdate) SaveX(ctx context.Context) int {
	affected, err := ifgu.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (ifgu *InvitationFriendGroupUpdate) Exec(ctx context.Context) error {
	_, err := ifgu.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ifgu *InvitationFriendGroupUpdate) ExecX(ctx context.Context) {
	if err := ifgu.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (ifgu *InvitationFriendGroupUpdate) check() error {
	if _, ok := ifgu.mutation.InvitationID(); ifgu.mutation.InvitationCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "InvitationFriendGroup.invitation"`)
	}
	if _, ok := ifgu.mutation.FriendGroupID(); ifgu.mutation.FriendGroupCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "InvitationFriendGroup.friend_group"`)
	}
	return nil
}

func (ifgu *InvitationFriendGroupUpdate) sqlSave(ctx context.Context) (n int, err error) {
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   invitationfriendgroup.Table,
			Columns: invitationfriendgroup.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitationfriendgroup.FieldID,
			},
		},
	}
	if ps := ifgu.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if n, err = sqlgraph.UpdateNodes(ctx, ifgu.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{invitationfriendgroup.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	return n, nil
}

// InvitationFriendGroupUpdateOne is the builder for updating a single InvitationFriendGroup entity.
type InvitationFriendGroupUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *InvitationFriendGroupMutation
}

// Mutation returns the InvitationFriendGroupMutation object of the builder.
func (ifguo *InvitationFriendGroupUpdateOne) Mutation() *InvitationFriendGroupMutation {
	return ifguo.mutation
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (ifguo *InvitationFriendGroupUpdateOne) Select(field string, fields ...string) *InvitationFriendGroupUpdateOne {
	ifguo.fields = append([]string{field}, fields...)
	return ifguo
}

// Save executes the query and returns the updated InvitationFriendGroup entity.
func (ifguo *InvitationFriendGroupUpdateOne) Save(ctx context.Context) (*InvitationFriendGroup, error) {
	var (
		err  error
		node *InvitationFriendGroup
	)
	if len(ifguo.hooks) == 0 {
		if err = ifguo.check(); err != nil {
			return nil, err
		}
		node, err = ifguo.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*InvitationFriendGroupMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = ifguo.check(); err != nil {
				return nil, err
			}
			ifguo.mutation = mutation
			node, err = ifguo.sqlSave(ctx)
			mutation.done = true
			return node, err
		})
		for i := len(ifguo.hooks) - 1; i >= 0; i-- {
			if ifguo.hooks[i] == nil {
				return nil, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = ifguo.hooks[i](mut)
		}
		v, err := mut.Mutate(ctx, ifguo.mutation)
		if err != nil {
			return nil, err
		}
		nv, ok := v.(*InvitationFriendGroup)
		if !ok {
			return nil, fmt.Errorf("unexpected node type %T returned from InvitationFriendGroupMutation", v)
		}
		node = nv
	}
	return node, err
}

// SaveX is like Save, but panics if an error occurs.
func (ifguo *InvitationFriendGroupUpdateOne) SaveX(ctx context.Context) *InvitationFriendGroup {
	node, err := ifguo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (ifguo *InvitationFriendGroupUpdateOne) Exec(ctx context.Context) error {
	_, err := ifguo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ifguo *InvitationFriendGroupUpdateOne) ExecX(ctx context.Context) {
	if err := ifguo.Exec(ctx); err != nil {
		panic(err)
	}
}

// check runs all checks and user-defined validators on the builder.
func (ifguo *InvitationFriendGroupUpdateOne) check() error {
	if _, ok := ifguo.mutation.InvitationID(); ifguo.mutation.InvitationCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "InvitationFriendGroup.invitation"`)
	}
	if _, ok := ifguo.mutation.FriendGroupID(); ifguo.mutation.FriendGroupCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "InvitationFriendGroup.friend_group"`)
	}
	return nil
}

func (ifguo *InvitationFriendGroupUpdateOne) sqlSave(ctx context.Context) (_node *InvitationFriendGroup, err error) {
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   invitationfriendgroup.Table,
			Columns: invitationfriendgroup.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitationfriendgroup.FieldID,
			},
		},
	}
	id, ok := ifguo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "InvitationFriendGroup.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := ifguo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, invitationfriendgroup.FieldID)
		for _, f := range fields {
			if !invitationfriendgroup.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != invitationfriendgroup.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := ifguo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	_node = &InvitationFriendGroup{config: ifguo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, ifguo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{invitationfriendgroup.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	return _node, nil
}