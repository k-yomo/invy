// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/invy_api/ent/pushnotificationtoken"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// PushNotificationTokenUpdate is the builder for updating PushNotificationToken entities.
type PushNotificationTokenUpdate struct {
	config
	hooks    []Hook
	mutation *PushNotificationTokenMutation
}

// Where appends a list predicates to the PushNotificationTokenUpdate builder.
func (pntu *PushNotificationTokenUpdate) Where(ps ...predicate.PushNotificationToken) *PushNotificationTokenUpdate {
	pntu.mutation.Where(ps...)
	return pntu
}

// SetUserID sets the "user_id" field.
func (pntu *PushNotificationTokenUpdate) SetUserID(u uuid.UUID) *PushNotificationTokenUpdate {
	pntu.mutation.SetUserID(u)
	return pntu
}

// SetFcmToken sets the "fcm_token" field.
func (pntu *PushNotificationTokenUpdate) SetFcmToken(s string) *PushNotificationTokenUpdate {
	pntu.mutation.SetFcmToken(s)
	return pntu
}

// SetUpdatedAt sets the "updated_at" field.
func (pntu *PushNotificationTokenUpdate) SetUpdatedAt(t time.Time) *PushNotificationTokenUpdate {
	pntu.mutation.SetUpdatedAt(t)
	return pntu
}

// SetUser sets the "user" edge to the User entity.
func (pntu *PushNotificationTokenUpdate) SetUser(u *User) *PushNotificationTokenUpdate {
	return pntu.SetUserID(u.ID)
}

// Mutation returns the PushNotificationTokenMutation object of the builder.
func (pntu *PushNotificationTokenUpdate) Mutation() *PushNotificationTokenMutation {
	return pntu.mutation
}

// ClearUser clears the "user" edge to the User entity.
func (pntu *PushNotificationTokenUpdate) ClearUser() *PushNotificationTokenUpdate {
	pntu.mutation.ClearUser()
	return pntu
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (pntu *PushNotificationTokenUpdate) Save(ctx context.Context) (int, error) {
	var (
		err      error
		affected int
	)
	pntu.defaults()
	if len(pntu.hooks) == 0 {
		if err = pntu.check(); err != nil {
			return 0, err
		}
		affected, err = pntu.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*PushNotificationTokenMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = pntu.check(); err != nil {
				return 0, err
			}
			pntu.mutation = mutation
			affected, err = pntu.sqlSave(ctx)
			mutation.done = true
			return affected, err
		})
		for i := len(pntu.hooks) - 1; i >= 0; i-- {
			if pntu.hooks[i] == nil {
				return 0, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = pntu.hooks[i](mut)
		}
		if _, err := mut.Mutate(ctx, pntu.mutation); err != nil {
			return 0, err
		}
	}
	return affected, err
}

// SaveX is like Save, but panics if an error occurs.
func (pntu *PushNotificationTokenUpdate) SaveX(ctx context.Context) int {
	affected, err := pntu.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (pntu *PushNotificationTokenUpdate) Exec(ctx context.Context) error {
	_, err := pntu.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (pntu *PushNotificationTokenUpdate) ExecX(ctx context.Context) {
	if err := pntu.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (pntu *PushNotificationTokenUpdate) defaults() {
	if _, ok := pntu.mutation.UpdatedAt(); !ok {
		v := pushnotificationtoken.UpdateDefaultUpdatedAt()
		pntu.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (pntu *PushNotificationTokenUpdate) check() error {
	if _, ok := pntu.mutation.UserID(); pntu.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "PushNotificationToken.user"`)
	}
	return nil
}

func (pntu *PushNotificationTokenUpdate) sqlSave(ctx context.Context) (n int, err error) {
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   pushnotificationtoken.Table,
			Columns: pushnotificationtoken.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: pushnotificationtoken.FieldID,
			},
		},
	}
	if ps := pntu.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := pntu.mutation.FcmToken(); ok {
		_spec.SetField(pushnotificationtoken.FieldFcmToken, field.TypeString, value)
	}
	if value, ok := pntu.mutation.UpdatedAt(); ok {
		_spec.SetField(pushnotificationtoken.FieldUpdatedAt, field.TypeTime, value)
	}
	if pntu.mutation.UserCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   pushnotificationtoken.UserTable,
			Columns: []string{pushnotificationtoken.UserColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: user.FieldID,
				},
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := pntu.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   pushnotificationtoken.UserTable,
			Columns: []string{pushnotificationtoken.UserColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: user.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if n, err = sqlgraph.UpdateNodes(ctx, pntu.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{pushnotificationtoken.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	return n, nil
}

// PushNotificationTokenUpdateOne is the builder for updating a single PushNotificationToken entity.
type PushNotificationTokenUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *PushNotificationTokenMutation
}

// SetUserID sets the "user_id" field.
func (pntuo *PushNotificationTokenUpdateOne) SetUserID(u uuid.UUID) *PushNotificationTokenUpdateOne {
	pntuo.mutation.SetUserID(u)
	return pntuo
}

// SetFcmToken sets the "fcm_token" field.
func (pntuo *PushNotificationTokenUpdateOne) SetFcmToken(s string) *PushNotificationTokenUpdateOne {
	pntuo.mutation.SetFcmToken(s)
	return pntuo
}

// SetUpdatedAt sets the "updated_at" field.
func (pntuo *PushNotificationTokenUpdateOne) SetUpdatedAt(t time.Time) *PushNotificationTokenUpdateOne {
	pntuo.mutation.SetUpdatedAt(t)
	return pntuo
}

// SetUser sets the "user" edge to the User entity.
func (pntuo *PushNotificationTokenUpdateOne) SetUser(u *User) *PushNotificationTokenUpdateOne {
	return pntuo.SetUserID(u.ID)
}

// Mutation returns the PushNotificationTokenMutation object of the builder.
func (pntuo *PushNotificationTokenUpdateOne) Mutation() *PushNotificationTokenMutation {
	return pntuo.mutation
}

// ClearUser clears the "user" edge to the User entity.
func (pntuo *PushNotificationTokenUpdateOne) ClearUser() *PushNotificationTokenUpdateOne {
	pntuo.mutation.ClearUser()
	return pntuo
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (pntuo *PushNotificationTokenUpdateOne) Select(field string, fields ...string) *PushNotificationTokenUpdateOne {
	pntuo.fields = append([]string{field}, fields...)
	return pntuo
}

// Save executes the query and returns the updated PushNotificationToken entity.
func (pntuo *PushNotificationTokenUpdateOne) Save(ctx context.Context) (*PushNotificationToken, error) {
	var (
		err  error
		node *PushNotificationToken
	)
	pntuo.defaults()
	if len(pntuo.hooks) == 0 {
		if err = pntuo.check(); err != nil {
			return nil, err
		}
		node, err = pntuo.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*PushNotificationTokenMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = pntuo.check(); err != nil {
				return nil, err
			}
			pntuo.mutation = mutation
			node, err = pntuo.sqlSave(ctx)
			mutation.done = true
			return node, err
		})
		for i := len(pntuo.hooks) - 1; i >= 0; i-- {
			if pntuo.hooks[i] == nil {
				return nil, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = pntuo.hooks[i](mut)
		}
		v, err := mut.Mutate(ctx, pntuo.mutation)
		if err != nil {
			return nil, err
		}
		nv, ok := v.(*PushNotificationToken)
		if !ok {
			return nil, fmt.Errorf("unexpected node type %T returned from PushNotificationTokenMutation", v)
		}
		node = nv
	}
	return node, err
}

// SaveX is like Save, but panics if an error occurs.
func (pntuo *PushNotificationTokenUpdateOne) SaveX(ctx context.Context) *PushNotificationToken {
	node, err := pntuo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (pntuo *PushNotificationTokenUpdateOne) Exec(ctx context.Context) error {
	_, err := pntuo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (pntuo *PushNotificationTokenUpdateOne) ExecX(ctx context.Context) {
	if err := pntuo.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (pntuo *PushNotificationTokenUpdateOne) defaults() {
	if _, ok := pntuo.mutation.UpdatedAt(); !ok {
		v := pushnotificationtoken.UpdateDefaultUpdatedAt()
		pntuo.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (pntuo *PushNotificationTokenUpdateOne) check() error {
	if _, ok := pntuo.mutation.UserID(); pntuo.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "PushNotificationToken.user"`)
	}
	return nil
}

func (pntuo *PushNotificationTokenUpdateOne) sqlSave(ctx context.Context) (_node *PushNotificationToken, err error) {
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   pushnotificationtoken.Table,
			Columns: pushnotificationtoken.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: pushnotificationtoken.FieldID,
			},
		},
	}
	id, ok := pntuo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "PushNotificationToken.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := pntuo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, pushnotificationtoken.FieldID)
		for _, f := range fields {
			if !pushnotificationtoken.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != pushnotificationtoken.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := pntuo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := pntuo.mutation.FcmToken(); ok {
		_spec.SetField(pushnotificationtoken.FieldFcmToken, field.TypeString, value)
	}
	if value, ok := pntuo.mutation.UpdatedAt(); ok {
		_spec.SetField(pushnotificationtoken.FieldUpdatedAt, field.TypeTime, value)
	}
	if pntuo.mutation.UserCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   pushnotificationtoken.UserTable,
			Columns: []string{pushnotificationtoken.UserColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: user.FieldID,
				},
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := pntuo.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   pushnotificationtoken.UserTable,
			Columns: []string{pushnotificationtoken.UserColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: user.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	_node = &PushNotificationToken{config: pntuo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, pntuo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{pushnotificationtoken.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	return _node, nil
}
