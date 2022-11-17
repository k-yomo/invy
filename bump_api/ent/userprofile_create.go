// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"time"

	"entgo.io/ent/dialect"
	"entgo.io/ent/dialect/sql"
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
	conflict []sql.ConflictOption
}

// SetUserID sets the "user_id" field.
func (upc *UserProfileCreate) SetUserID(u uuid.UUID) *UserProfileCreate {
	upc.mutation.SetUserID(u)
	return upc
}

// SetScreenID sets the "screen_id" field.
func (upc *UserProfileCreate) SetScreenID(s string) *UserProfileCreate {
	upc.mutation.SetScreenID(s)
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

// SetNillableID sets the "id" field if the given value is not nil.
func (upc *UserProfileCreate) SetNillableID(u *uuid.UUID) *UserProfileCreate {
	if u != nil {
		upc.SetID(*u)
	}
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
	if _, ok := upc.mutation.ID(); !ok {
		v := userprofile.DefaultID()
		upc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (upc *UserProfileCreate) check() error {
	if _, ok := upc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user_id", err: errors.New(`ent: missing required field "UserProfile.user_id"`)}
	}
	if _, ok := upc.mutation.ScreenID(); !ok {
		return &ValidationError{Name: "screen_id", err: errors.New(`ent: missing required field "UserProfile.screen_id"`)}
	}
	if _, ok := upc.mutation.Nickname(); !ok {
		return &ValidationError{Name: "nickname", err: errors.New(`ent: missing required field "UserProfile.nickname"`)}
	}
	if _, ok := upc.mutation.AvatarURL(); !ok {
		return &ValidationError{Name: "avatar_url", err: errors.New(`ent: missing required field "UserProfile.avatar_url"`)}
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
	_spec.OnConflict = upc.conflict
	if id, ok := upc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := upc.mutation.ScreenID(); ok {
		_spec.SetField(userprofile.FieldScreenID, field.TypeString, value)
		_node.ScreenID = value
	}
	if value, ok := upc.mutation.Nickname(); ok {
		_spec.SetField(userprofile.FieldNickname, field.TypeString, value)
		_node.Nickname = value
	}
	if value, ok := upc.mutation.Email(); ok {
		_spec.SetField(userprofile.FieldEmail, field.TypeString, value)
		_node.Email = &value
	}
	if value, ok := upc.mutation.AvatarURL(); ok {
		_spec.SetField(userprofile.FieldAvatarURL, field.TypeString, value)
		_node.AvatarURL = value
	}
	if value, ok := upc.mutation.CreatedAt(); ok {
		_spec.SetField(userprofile.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if value, ok := upc.mutation.UpdatedAt(); ok {
		_spec.SetField(userprofile.FieldUpdatedAt, field.TypeTime, value)
		_node.UpdatedAt = value
	}
	if nodes := upc.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2O,
			Inverse: true,
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

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.UserProfile.Create().
//		SetUserID(v).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.UserProfileUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (upc *UserProfileCreate) OnConflict(opts ...sql.ConflictOption) *UserProfileUpsertOne {
	upc.conflict = opts
	return &UserProfileUpsertOne{
		create: upc,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.UserProfile.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (upc *UserProfileCreate) OnConflictColumns(columns ...string) *UserProfileUpsertOne {
	upc.conflict = append(upc.conflict, sql.ConflictColumns(columns...))
	return &UserProfileUpsertOne{
		create: upc,
	}
}

type (
	// UserProfileUpsertOne is the builder for "upsert"-ing
	//  one UserProfile node.
	UserProfileUpsertOne struct {
		create *UserProfileCreate
	}

	// UserProfileUpsert is the "OnConflict" setter.
	UserProfileUpsert struct {
		*sql.UpdateSet
	}
)

// SetScreenID sets the "screen_id" field.
func (u *UserProfileUpsert) SetScreenID(v string) *UserProfileUpsert {
	u.Set(userprofile.FieldScreenID, v)
	return u
}

// UpdateScreenID sets the "screen_id" field to the value that was provided on create.
func (u *UserProfileUpsert) UpdateScreenID() *UserProfileUpsert {
	u.SetExcluded(userprofile.FieldScreenID)
	return u
}

// SetNickname sets the "nickname" field.
func (u *UserProfileUpsert) SetNickname(v string) *UserProfileUpsert {
	u.Set(userprofile.FieldNickname, v)
	return u
}

// UpdateNickname sets the "nickname" field to the value that was provided on create.
func (u *UserProfileUpsert) UpdateNickname() *UserProfileUpsert {
	u.SetExcluded(userprofile.FieldNickname)
	return u
}

// SetEmail sets the "email" field.
func (u *UserProfileUpsert) SetEmail(v string) *UserProfileUpsert {
	u.Set(userprofile.FieldEmail, v)
	return u
}

// UpdateEmail sets the "email" field to the value that was provided on create.
func (u *UserProfileUpsert) UpdateEmail() *UserProfileUpsert {
	u.SetExcluded(userprofile.FieldEmail)
	return u
}

// ClearEmail clears the value of the "email" field.
func (u *UserProfileUpsert) ClearEmail() *UserProfileUpsert {
	u.SetNull(userprofile.FieldEmail)
	return u
}

// SetAvatarURL sets the "avatar_url" field.
func (u *UserProfileUpsert) SetAvatarURL(v string) *UserProfileUpsert {
	u.Set(userprofile.FieldAvatarURL, v)
	return u
}

// UpdateAvatarURL sets the "avatar_url" field to the value that was provided on create.
func (u *UserProfileUpsert) UpdateAvatarURL() *UserProfileUpsert {
	u.SetExcluded(userprofile.FieldAvatarURL)
	return u
}

// SetUpdatedAt sets the "updated_at" field.
func (u *UserProfileUpsert) SetUpdatedAt(v time.Time) *UserProfileUpsert {
	u.Set(userprofile.FieldUpdatedAt, v)
	return u
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *UserProfileUpsert) UpdateUpdatedAt() *UserProfileUpsert {
	u.SetExcluded(userprofile.FieldUpdatedAt)
	return u
}

// UpdateNewValues updates the mutable fields using the new values that were set on create except the ID field.
// Using this option is equivalent to using:
//
//	client.UserProfile.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(userprofile.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *UserProfileUpsertOne) UpdateNewValues() *UserProfileUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		if _, exists := u.create.mutation.ID(); exists {
			s.SetIgnore(userprofile.FieldID)
		}
		if _, exists := u.create.mutation.UserID(); exists {
			s.SetIgnore(userprofile.FieldUserID)
		}
		if _, exists := u.create.mutation.CreatedAt(); exists {
			s.SetIgnore(userprofile.FieldCreatedAt)
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.UserProfile.Create().
//	    OnConflict(sql.ResolveWithIgnore()).
//	    Exec(ctx)
func (u *UserProfileUpsertOne) Ignore() *UserProfileUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *UserProfileUpsertOne) DoNothing() *UserProfileUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the UserProfileCreate.OnConflict
// documentation for more info.
func (u *UserProfileUpsertOne) Update(set func(*UserProfileUpsert)) *UserProfileUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&UserProfileUpsert{UpdateSet: update})
	}))
	return u
}

// SetScreenID sets the "screen_id" field.
func (u *UserProfileUpsertOne) SetScreenID(v string) *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetScreenID(v)
	})
}

// UpdateScreenID sets the "screen_id" field to the value that was provided on create.
func (u *UserProfileUpsertOne) UpdateScreenID() *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateScreenID()
	})
}

// SetNickname sets the "nickname" field.
func (u *UserProfileUpsertOne) SetNickname(v string) *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetNickname(v)
	})
}

// UpdateNickname sets the "nickname" field to the value that was provided on create.
func (u *UserProfileUpsertOne) UpdateNickname() *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateNickname()
	})
}

// SetEmail sets the "email" field.
func (u *UserProfileUpsertOne) SetEmail(v string) *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetEmail(v)
	})
}

// UpdateEmail sets the "email" field to the value that was provided on create.
func (u *UserProfileUpsertOne) UpdateEmail() *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateEmail()
	})
}

// ClearEmail clears the value of the "email" field.
func (u *UserProfileUpsertOne) ClearEmail() *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.ClearEmail()
	})
}

// SetAvatarURL sets the "avatar_url" field.
func (u *UserProfileUpsertOne) SetAvatarURL(v string) *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetAvatarURL(v)
	})
}

// UpdateAvatarURL sets the "avatar_url" field to the value that was provided on create.
func (u *UserProfileUpsertOne) UpdateAvatarURL() *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateAvatarURL()
	})
}

// SetUpdatedAt sets the "updated_at" field.
func (u *UserProfileUpsertOne) SetUpdatedAt(v time.Time) *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetUpdatedAt(v)
	})
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *UserProfileUpsertOne) UpdateUpdatedAt() *UserProfileUpsertOne {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateUpdatedAt()
	})
}

// Exec executes the query.
func (u *UserProfileUpsertOne) Exec(ctx context.Context) error {
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for UserProfileCreate.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *UserProfileUpsertOne) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}

// Exec executes the UPSERT query and returns the inserted/updated ID.
func (u *UserProfileUpsertOne) ID(ctx context.Context) (id uuid.UUID, err error) {
	if u.create.driver.Dialect() == dialect.MySQL {
		// In case of "ON CONFLICT", there is no way to get back non-numeric ID
		// fields from the database since MySQL does not support the RETURNING clause.
		return id, errors.New("ent: UserProfileUpsertOne.ID is not supported by MySQL driver. Use UserProfileUpsertOne.Exec instead")
	}
	node, err := u.create.Save(ctx)
	if err != nil {
		return id, err
	}
	return node.ID, nil
}

// IDX is like ID, but panics if an error occurs.
func (u *UserProfileUpsertOne) IDX(ctx context.Context) uuid.UUID {
	id, err := u.ID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// UserProfileCreateBulk is the builder for creating many UserProfile entities in bulk.
type UserProfileCreateBulk struct {
	config
	builders []*UserProfileCreate
	conflict []sql.ConflictOption
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
					spec.OnConflict = upcb.conflict
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

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.UserProfile.CreateBulk(builders...).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.UserProfileUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (upcb *UserProfileCreateBulk) OnConflict(opts ...sql.ConflictOption) *UserProfileUpsertBulk {
	upcb.conflict = opts
	return &UserProfileUpsertBulk{
		create: upcb,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.UserProfile.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (upcb *UserProfileCreateBulk) OnConflictColumns(columns ...string) *UserProfileUpsertBulk {
	upcb.conflict = append(upcb.conflict, sql.ConflictColumns(columns...))
	return &UserProfileUpsertBulk{
		create: upcb,
	}
}

// UserProfileUpsertBulk is the builder for "upsert"-ing
// a bulk of UserProfile nodes.
type UserProfileUpsertBulk struct {
	create *UserProfileCreateBulk
}

// UpdateNewValues updates the mutable fields using the new values that
// were set on create. Using this option is equivalent to using:
//
//	client.UserProfile.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(userprofile.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *UserProfileUpsertBulk) UpdateNewValues() *UserProfileUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		for _, b := range u.create.builders {
			if _, exists := b.mutation.ID(); exists {
				s.SetIgnore(userprofile.FieldID)
			}
			if _, exists := b.mutation.UserID(); exists {
				s.SetIgnore(userprofile.FieldUserID)
			}
			if _, exists := b.mutation.CreatedAt(); exists {
				s.SetIgnore(userprofile.FieldCreatedAt)
			}
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.UserProfile.Create().
//		OnConflict(sql.ResolveWithIgnore()).
//		Exec(ctx)
func (u *UserProfileUpsertBulk) Ignore() *UserProfileUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *UserProfileUpsertBulk) DoNothing() *UserProfileUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the UserProfileCreateBulk.OnConflict
// documentation for more info.
func (u *UserProfileUpsertBulk) Update(set func(*UserProfileUpsert)) *UserProfileUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&UserProfileUpsert{UpdateSet: update})
	}))
	return u
}

// SetScreenID sets the "screen_id" field.
func (u *UserProfileUpsertBulk) SetScreenID(v string) *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetScreenID(v)
	})
}

// UpdateScreenID sets the "screen_id" field to the value that was provided on create.
func (u *UserProfileUpsertBulk) UpdateScreenID() *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateScreenID()
	})
}

// SetNickname sets the "nickname" field.
func (u *UserProfileUpsertBulk) SetNickname(v string) *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetNickname(v)
	})
}

// UpdateNickname sets the "nickname" field to the value that was provided on create.
func (u *UserProfileUpsertBulk) UpdateNickname() *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateNickname()
	})
}

// SetEmail sets the "email" field.
func (u *UserProfileUpsertBulk) SetEmail(v string) *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetEmail(v)
	})
}

// UpdateEmail sets the "email" field to the value that was provided on create.
func (u *UserProfileUpsertBulk) UpdateEmail() *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateEmail()
	})
}

// ClearEmail clears the value of the "email" field.
func (u *UserProfileUpsertBulk) ClearEmail() *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.ClearEmail()
	})
}

// SetAvatarURL sets the "avatar_url" field.
func (u *UserProfileUpsertBulk) SetAvatarURL(v string) *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetAvatarURL(v)
	})
}

// UpdateAvatarURL sets the "avatar_url" field to the value that was provided on create.
func (u *UserProfileUpsertBulk) UpdateAvatarURL() *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateAvatarURL()
	})
}

// SetUpdatedAt sets the "updated_at" field.
func (u *UserProfileUpsertBulk) SetUpdatedAt(v time.Time) *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.SetUpdatedAt(v)
	})
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *UserProfileUpsertBulk) UpdateUpdatedAt() *UserProfileUpsertBulk {
	return u.Update(func(s *UserProfileUpsert) {
		s.UpdateUpdatedAt()
	})
}

// Exec executes the query.
func (u *UserProfileUpsertBulk) Exec(ctx context.Context) error {
	for i, b := range u.create.builders {
		if len(b.conflict) != 0 {
			return fmt.Errorf("ent: OnConflict was set for builder %d. Set it on the UserProfileCreateBulk instead", i)
		}
	}
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for UserProfileCreateBulk.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *UserProfileUpsertBulk) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}
