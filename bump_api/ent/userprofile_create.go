// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"github.com/k-yomo/bump/bump_api/ent/user"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
)

// UserProfileCreate is the builder for creating a UserProfile entity.
type UserProfileCreate struct {
	config
	mutation *UserProfileMutation
	hooks    []Hook
}

// SetUserID sets the "user_id" field.
func (upc *UserProfileCreate) SetUserID(u uuid.UUID) *UserProfileCreate {
	upc.mutation.SetUserID(u)
	return upc
}

// SetNickname sets the "nickname" field.
func (upc *UserProfileCreate) SetNickname(s string) *UserProfileCreate {
	upc.mutation.SetNickname(s)
	return upc
}

// SetEmail sets the "email" field.
func (upc *UserProfileCreate) SetEmail(s string) *UserProfileCreate {
	upc.mutation.SetEmail(s)
	return upc
}

// SetNillableEmail sets the "email" field if the given value is not nil.
func (upc *UserProfileCreate) SetNillableEmail(s *string) *UserProfileCreate {
	if s != nil {
		upc.SetEmail(*s)
	}
	return upc
}

// SetAvatarURL sets the "avatar_url" field.
func (upc *UserProfileCreate) SetAvatarURL(s string) *UserProfileCreate {
	upc.mutation.SetAvatarURL(s)
	return upc
}

// SetNillableAvatarURL sets the "avatar_url" field if the given value is not nil.
func (upc *UserProfileCreate) SetNillableAvatarURL(s *string) *UserProfileCreate {
	if s != nil {
		upc.SetAvatarURL(*s)
	}
	return upc
}

// SetCreatedAt sets the "created_at" field.
func (upc *UserProfileCreate) SetCreatedAt(t time.Time) *UserProfileCreate {
	upc.mutation.SetCreatedAt(t)
	return upc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (upc *UserProfileCreate) SetNillableCreatedAt(t *time.Time) *UserProfileCreate {
	if t != nil {
		upc.SetCreatedAt(*t)
	}
	return upc
}

// SetUpdatedAt sets the "updated_at" field.
func (upc *UserProfileCreate) SetUpdatedAt(t time.Time) *UserProfileCreate {
	upc.mutation.SetUpdatedAt(t)
	return upc
}

// SetNillableUpdatedAt sets the "updated_at" field if the given value is not nil.
func (upc *UserProfileCreate) SetNillableUpdatedAt(t *time.Time) *UserProfileCreate {
	if t != nil {
		upc.SetUpdatedAt(*t)
	}
	return upc
}

// SetID sets the "id" field.
func (upc *UserProfileCreate) SetID(u uuid.UUID) *UserProfileCreate {
	upc.mutation.SetID(u)
	return upc
}

// SetUser sets the "user" edge to the User entity.
func (upc *UserProfileCreate) SetUser(u *User) *UserProfileCreate {
	return upc.SetUserID(u.ID)
}

// Mutation returns the UserProfileMutation object of the builder.
func (upc *UserProfileCreate) Mutation() *UserProfileMutation {
	return upc.mutation
}

// Save creates the UserProfile in the database.
func (upc *UserProfileCreate) Save(ctx context.Context) (*UserProfile, error) {
	var (
		err  error
		node *UserProfile
	)
	upc.defaults()
	if len(upc.hooks) == 0 {
		if err = upc.check(); err != nil {
			return nil, err
		}
		node, err = upc.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*UserProfileMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = upc.check(); err != nil {
				return nil, err
			}
			upc.mutation = mutation
			if node, err = upc.sqlSave(ctx); err != nil {
				return nil, err
			}
			mutation.id = &node.ID
			mutation.done = true
			return node, err
		})
		for i := len(upc.hooks) - 1; i >= 0; i-- {
			if upc.hooks[i] == nil {
				return nil, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = upc.hooks[i](mut)
		}
		v, err := mut.Mutate(ctx, upc.mutation)
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

// SaveX calls Save and panics if Save returns an error.
func (upc *UserProfileCreate) SaveX(ctx context.Context) *UserProfile {
	v, err := upc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (upc *UserProfileCreate) Exec(ctx context.Context) error {
	_, err := upc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (upc *UserProfileCreate) ExecX(ctx context.Context) {
	if err := upc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (upc *UserProfileCreate) defaults() {
	if _, ok := upc.mutation.CreatedAt(); !ok {
		v := userprofile.DefaultCreatedAt()
		upc.mutation.SetCreatedAt(v)
	}
	if _, ok := upc.mutation.UpdatedAt(); !ok {
		v := userprofile.DefaultUpdatedAt()
		upc.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (upc *UserProfileCreate) check() error {
	if _, ok := upc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user_id", err: errors.New(`ent: missing required field "UserProfile.user_id"`)}
	}
	if _, ok := upc.mutation.Nickname(); !ok {
		return &ValidationError{Name: "nickname", err: errors.New(`ent: missing required field "UserProfile.nickname"`)}
	}
	if _, ok := upc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "UserProfile.created_at"`)}
	}
	if _, ok := upc.mutation.UpdatedAt(); !ok {
		return &ValidationError{Name: "updated_at", err: errors.New(`ent: missing required field "UserProfile.updated_at"`)}
	}
	if _, ok := upc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user", err: errors.New(`ent: missing required edge "UserProfile.user"`)}
	}
	return nil
}

func (upc *UserProfileCreate) sqlSave(ctx context.Context) (*UserProfile, error) {
	_node, _spec := upc.createSpec()
	if err := sqlgraph.CreateNode(ctx, upc.driver, _spec); err != nil {
		if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	if _spec.ID.Value != nil {
		if id, ok := _spec.ID.Value.(*uuid.UUID); ok {
			_node.ID = *id
		} else if err := _node.ID.Scan(_spec.ID.Value); err != nil {
			return nil, err
		}
	}
	return _node, nil
}

func (upc *UserProfileCreate) createSpec() (*UserProfile, *sqlgraph.CreateSpec) {
	var (
		_node = &UserProfile{config: upc.config}
		_spec = &sqlgraph.CreateSpec{
			Table: userprofile.Table,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: userprofile.FieldID,
			},
		}
	)
	if id, ok := upc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := upc.mutation.Nickname(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: userprofile.FieldNickname,
		})
		_node.Nickname = value
	}
	if value, ok := upc.mutation.Email(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: userprofile.FieldEmail,
		})
		_node.Email = value
	}
	if value, ok := upc.mutation.AvatarURL(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeString,
			Value:  value,
			Column: userprofile.FieldAvatarURL,
		})
		_node.AvatarURL = &value
	}
	if value, ok := upc.mutation.CreatedAt(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeTime,
			Value:  value,
			Column: userprofile.FieldCreatedAt,
		})
		_node.CreatedAt = value
	}
	if value, ok := upc.mutation.UpdatedAt(); ok {
		_spec.Fields = append(_spec.Fields, &sqlgraph.FieldSpec{
			Type:   field.TypeTime,
			Value:  value,
			Column: userprofile.FieldUpdatedAt,
		})
		_node.UpdatedAt = value
	}
	if nodes := upc.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   userprofile.UserTable,
			Columns: []string{userprofile.UserColumn},
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
		_node.UserID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// UserProfileCreateBulk is the builder for creating many UserProfile entities in bulk.
type UserProfileCreateBulk struct {
	config
	builders []*UserProfileCreate
}

// Save creates the UserProfile entities in the database.
func (upcb *UserProfileCreateBulk) Save(ctx context.Context) ([]*UserProfile, error) {
	specs := make([]*sqlgraph.CreateSpec, len(upcb.builders))
	nodes := make([]*UserProfile, len(upcb.builders))
	mutators := make([]Mutator, len(upcb.builders))
	for i := range upcb.builders {
		func(i int, root context.Context) {
			builder := upcb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*UserProfileMutation)
				if !ok {
					return nil, fmt.Errorf("unexpected mutation type %T", m)
				}
				if err := builder.check(); err != nil {
					return nil, err
				}
				builder.mutation = mutation
				nodes[i], specs[i] = builder.createSpec()
				var err error
				if i < len(mutators)-1 {
					_, err = mutators[i+1].Mutate(root, upcb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, upcb.driver, spec); err != nil {
						if sqlgraph.IsConstraintError(err) {
							err = &ConstraintError{msg: err.Error(), wrap: err}
						}
					}
				}
				if err != nil {
					return nil, err
				}
				mutation.id = &nodes[i].ID
				mutation.done = true
				return nodes[i], nil
			})
			for i := len(builder.hooks) - 1; i >= 0; i-- {
				mut = builder.hooks[i](mut)
			}
			mutators[i] = mut
		}(i, ctx)
	}
	if len(mutators) > 0 {
		if _, err := mutators[0].Mutate(ctx, upcb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (upcb *UserProfileCreateBulk) SaveX(ctx context.Context) []*UserProfile {
	v, err := upcb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (upcb *UserProfileCreateBulk) Exec(ctx context.Context) error {
	_, err := upcb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (upcb *UserProfileCreateBulk) ExecX(ctx context.Context) {
	if err := upcb.Exec(ctx); err != nil {
		panic(err)
	}
}
