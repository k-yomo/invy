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
	"github.com/k-yomo/bump/bump_api/ent/predicate"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
)

// UserProfileUpdate is the builder for updating UserProfile entities.
type UserProfileUpdate struct {
	config
	hooks    []Hook
	mutation *UserProfileMutation
}

// Where appends a list predicates to the UserProfileUpdate builder.
func (upu *UserProfileUpdate) Where(ps ...predicate.UserProfile) *UserProfileUpdate {
	upu.mutation.Where(ps...)
	return upu
}

// SetNickname sets the "nickname" field.
func (upu *UserProfileUpdate) SetNickname(s string) *UserProfileUpdate {
	upu.mutation.SetNickname(s)
	return upu
}

// SetEmail sets the "email" field.
func (upu *UserProfileUpdate) SetEmail(s string) *UserProfileUpdate {
	upu.mutation.SetEmail(s)
	return upu
}

// SetNillableEmail sets the "email" field if the given value is not nil.
func (upu *UserProfileUpdate) SetNillableEmail(s *string) *UserProfileUpdate {
	if s != nil {
		upu.SetEmail(*s)
	}
	return upu
}

// ClearEmail clears the value of the "email" field.
func (upu *UserProfileUpdate) ClearEmail() *UserProfileUpdate {
	upu.mutation.ClearEmail()
	return upu
}

// SetAvatarURL sets the "avatar_url" field.
func (upu *UserProfileUpdate) SetAvatarURL(s string) *UserProfileUpdate {
	upu.mutation.SetAvatarURL(s)
	return upu
}

// SetNillableAvatarURL sets the "avatar_url" field if the given value is not nil.
func (upu *UserProfileUpdate) SetNillableAvatarURL(s *string) *UserProfileUpdate {
	if s != nil {
		upu.SetAvatarURL(*s)
	}
	return upu
}

// ClearAvatarURL clears the value of the "avatar_url" field.
func (upu *UserProfileUpdate) ClearAvatarURL() *UserProfileUpdate {
	upu.mutation.ClearAvatarURL()
	return upu
}

// SetUpdatedAt sets the "updated_at" field.
func (upu *UserProfileUpdate) SetUpdatedAt(t time.Time) *UserProfileUpdate {
	upu.mutation.SetUpdatedAt(t)
	return upu
}

// Mutation returns the UserProfileMutation object of the builder.
func (upu *UserProfileUpdate) Mutation() *UserProfileMutation {
	return upu.mutation
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (upu *UserProfileUpdate) Save(ctx context.Context) (int, error) {
	var (
		err      error
		affected int
	)
	upu.defaults()
	if len(upu.hooks) == 0 {
		if err = upu.check(); err != nil {
			return 0, err
		}
		affected, err = upu.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*UserProfileMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = upu.check(); err != nil {
				return 0, err
			}
			upu.mutation = mutation
			affected, err = upu.sqlSave(ctx)
			mutation.done = true
			return affected, err
		})
		for i := len(upu.hooks) - 1; i >= 0; i-- {
			if upu.hooks[i] == nil {
				return 0, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = upu.hooks[i](mut)
		}
		if _, err := mut.Mutate(ctx, upu.mutation); err != nil {
			return 0, err
		}
	}
	return affected, err
}

// SaveX is like Save, but panics if an error occurs.
func (upu *UserProfileUpdate) SaveX(ctx context.Context) int {
	affected, err := upu.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (upu *UserProfileUpdate) Exec(ctx context.Context) error {
	_, err := upu.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (upu *UserProfileUpdate) ExecX(ctx context.Context) {
	if err := upu.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (upu *UserProfileUpdate) defaults() {
	if _, ok := upu.mutation.UpdatedAt(); !ok {
		v := userprofile.UpdateDefaultUpdatedAt()
		upu.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (upu *UserProfileUpdate) check() error {
	if _, ok := upu.mutation.UserID(); upu.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "UserProfile.user"`)
	}
	return nil
}

func (upu *UserProfileUpdate) sqlSave(ctx context.Context) (n int, err error) {
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   userprofile.Table,
			Columns: userprofile.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: userprofile.FieldID,
			},
		},
	}
	if ps := upu.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := upu.mutation.Nickname(); ok {
		_spec.SetField(userprofile.FieldNickname, field.TypeString, value)
	}
	if value, ok := upu.mutation.Email(); ok {
		_spec.SetField(userprofile.FieldEmail, field.TypeString, value)
	}
	if upu.mutation.EmailCleared() {
		_spec.ClearField(userprofile.FieldEmail, field.TypeString)
	}
	if value, ok := upu.mutation.AvatarURL(); ok {
		_spec.SetField(userprofile.FieldAvatarURL, field.TypeString, value)
	}
	if upu.mutation.AvatarURLCleared() {
		_spec.ClearField(userprofile.FieldAvatarURL, field.TypeString)
	}
	if value, ok := upu.mutation.UpdatedAt(); ok {
		_spec.SetField(userprofile.FieldUpdatedAt, field.TypeTime, value)
	}
	if n, err = sqlgraph.UpdateNodes(ctx, upu.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{userprofile.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	return n, nil
}

// UserProfileUpdateOne is the builder for updating a single UserProfile entity.
type UserProfileUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *UserProfileMutation
}

// SetNickname sets the "nickname" field.
func (upuo *UserProfileUpdateOne) SetNickname(s string) *UserProfileUpdateOne {
	upuo.mutation.SetNickname(s)
	return upuo
}

// SetEmail sets the "email" field.
func (upuo *UserProfileUpdateOne) SetEmail(s string) *UserProfileUpdateOne {
	upuo.mutation.SetEmail(s)
	return upuo
}

// SetNillableEmail sets the "email" field if the given value is not nil.
func (upuo *UserProfileUpdateOne) SetNillableEmail(s *string) *UserProfileUpdateOne {
	if s != nil {
		upuo.SetEmail(*s)
	}
	return upuo
}

// ClearEmail clears the value of the "email" field.
func (upuo *UserProfileUpdateOne) ClearEmail() *UserProfileUpdateOne {
	upuo.mutation.ClearEmail()
	return upuo
}

// SetAvatarURL sets the "avatar_url" field.
func (upuo *UserProfileUpdateOne) SetAvatarURL(s string) *UserProfileUpdateOne {
	upuo.mutation.SetAvatarURL(s)
	return upuo
}

// SetNillableAvatarURL sets the "avatar_url" field if the given value is not nil.
func (upuo *UserProfileUpdateOne) SetNillableAvatarURL(s *string) *UserProfileUpdateOne {
	if s != nil {
		upuo.SetAvatarURL(*s)
	}
	return upuo
}

// ClearAvatarURL clears the value of the "avatar_url" field.
func (upuo *UserProfileUpdateOne) ClearAvatarURL() *UserProfileUpdateOne {
	upuo.mutation.ClearAvatarURL()
	return upuo
}

// SetUpdatedAt sets the "updated_at" field.
func (upuo *UserProfileUpdateOne) SetUpdatedAt(t time.Time) *UserProfileUpdateOne {
	upuo.mutation.SetUpdatedAt(t)
	return upuo
}

// Mutation returns the UserProfileMutation object of the builder.
func (upuo *UserProfileUpdateOne) Mutation() *UserProfileMutation {
	return upuo.mutation
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (upuo *UserProfileUpdateOne) Select(field string, fields ...string) *UserProfileUpdateOne {
	upuo.fields = append([]string{field}, fields...)
	return upuo
}

// Save executes the query and returns the updated UserProfile entity.
func (upuo *UserProfileUpdateOne) Save(ctx context.Context) (*UserProfile, error) {
	var (
		err  error
		node *UserProfile
	)
	upuo.defaults()
	if len(upuo.hooks) == 0 {
		if err = upuo.check(); err != nil {
			return nil, err
		}
		node, err = upuo.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*UserProfileMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = upuo.check(); err != nil {
				return nil, err
			}
			upuo.mutation = mutation
			node, err = upuo.sqlSave(ctx)
			mutation.done = true
			return node, err
		})
		for i := len(upuo.hooks) - 1; i >= 0; i-- {
			if upuo.hooks[i] == nil {
				return nil, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = upuo.hooks[i](mut)
		}
		v, err := mut.Mutate(ctx, upuo.mutation)
		if err != nil {
			return nil, err
		}
		nv, ok := v.(*UserProfile)
		if !ok {
			return nil, fmt.Errorf("unexpected node type %T returned from UserProfileMutation", v)
		}
		node = nv
	}
	return node, err
}

// SaveX is like Save, but panics if an error occurs.
func (upuo *UserProfileUpdateOne) SaveX(ctx context.Context) *UserProfile {
	node, err := upuo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (upuo *UserProfileUpdateOne) Exec(ctx context.Context) error {
	_, err := upuo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (upuo *UserProfileUpdateOne) ExecX(ctx context.Context) {
	if err := upuo.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (upuo *UserProfileUpdateOne) defaults() {
	if _, ok := upuo.mutation.UpdatedAt(); !ok {
		v := userprofile.UpdateDefaultUpdatedAt()
		upuo.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (upuo *UserProfileUpdateOne) check() error {
	if _, ok := upuo.mutation.UserID(); upuo.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "UserProfile.user"`)
	}
	return nil
}

func (upuo *UserProfileUpdateOne) sqlSave(ctx context.Context) (_node *UserProfile, err error) {
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   userprofile.Table,
			Columns: userprofile.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: userprofile.FieldID,
			},
		},
	}
	id, ok := upuo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "UserProfile.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := upuo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, userprofile.FieldID)
		for _, f := range fields {
			if !userprofile.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != userprofile.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := upuo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := upuo.mutation.Nickname(); ok {
		_spec.SetField(userprofile.FieldNickname, field.TypeString, value)
	}
	if value, ok := upuo.mutation.Email(); ok {
		_spec.SetField(userprofile.FieldEmail, field.TypeString, value)
	}
	if upuo.mutation.EmailCleared() {
		_spec.ClearField(userprofile.FieldEmail, field.TypeString)
	}
	if value, ok := upuo.mutation.AvatarURL(); ok {
		_spec.SetField(userprofile.FieldAvatarURL, field.TypeString, value)
	}
	if upuo.mutation.AvatarURLCleared() {
		_spec.ClearField(userprofile.FieldAvatarURL, field.TypeString)
	}
	if value, ok := upuo.mutation.UpdatedAt(); ok {
		_spec.SetField(userprofile.FieldUpdatedAt, field.TypeTime, value)
	}
	_node = &UserProfile{config: upuo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, upuo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{userprofile.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	return _node, nil
}
