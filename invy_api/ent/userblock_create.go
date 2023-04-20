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
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userblock"
)

// UserBlockCreate is the builder for creating a UserBlock entity.
type UserBlockCreate struct {
	config
	mutation *UserBlockMutation
	hooks    []Hook
	conflict []sql.ConflictOption
}

// SetUserID sets the "user_id" field.
func (ubc *UserBlockCreate) SetUserID(u uuid.UUID) *UserBlockCreate {
	ubc.mutation.SetUserID(u)
	return ubc
}

// SetBlockUserID sets the "block_user_id" field.
func (ubc *UserBlockCreate) SetBlockUserID(u uuid.UUID) *UserBlockCreate {
	ubc.mutation.SetBlockUserID(u)
	return ubc
}

// SetCreatedAt sets the "created_at" field.
func (ubc *UserBlockCreate) SetCreatedAt(t time.Time) *UserBlockCreate {
	ubc.mutation.SetCreatedAt(t)
	return ubc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (ubc *UserBlockCreate) SetNillableCreatedAt(t *time.Time) *UserBlockCreate {
	if t != nil {
		ubc.SetCreatedAt(*t)
	}
	return ubc
}

// SetID sets the "id" field.
func (ubc *UserBlockCreate) SetID(u uuid.UUID) *UserBlockCreate {
	ubc.mutation.SetID(u)
	return ubc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (ubc *UserBlockCreate) SetNillableID(u *uuid.UUID) *UserBlockCreate {
	if u != nil {
		ubc.SetID(*u)
	}
	return ubc
}

// SetUser sets the "user" edge to the User entity.
func (ubc *UserBlockCreate) SetUser(u *User) *UserBlockCreate {
	return ubc.SetUserID(u.ID)
}

// SetBlockUser sets the "block_user" edge to the User entity.
func (ubc *UserBlockCreate) SetBlockUser(u *User) *UserBlockCreate {
	return ubc.SetBlockUserID(u.ID)
}

// Mutation returns the UserBlockMutation object of the builder.
func (ubc *UserBlockCreate) Mutation() *UserBlockMutation {
	return ubc.mutation
}

// Save creates the UserBlock in the database.
func (ubc *UserBlockCreate) Save(ctx context.Context) (*UserBlock, error) {
	ubc.defaults()
	return withHooks[*UserBlock, UserBlockMutation](ctx, ubc.sqlSave, ubc.mutation, ubc.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (ubc *UserBlockCreate) SaveX(ctx context.Context) *UserBlock {
	v, err := ubc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (ubc *UserBlockCreate) Exec(ctx context.Context) error {
	_, err := ubc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ubc *UserBlockCreate) ExecX(ctx context.Context) {
	if err := ubc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (ubc *UserBlockCreate) defaults() {
	if _, ok := ubc.mutation.CreatedAt(); !ok {
		v := userblock.DefaultCreatedAt()
		ubc.mutation.SetCreatedAt(v)
	}
	if _, ok := ubc.mutation.ID(); !ok {
		v := userblock.DefaultID()
		ubc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (ubc *UserBlockCreate) check() error {
	if _, ok := ubc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user_id", err: errors.New(`ent: missing required field "UserBlock.user_id"`)}
	}
	if _, ok := ubc.mutation.BlockUserID(); !ok {
		return &ValidationError{Name: "block_user_id", err: errors.New(`ent: missing required field "UserBlock.block_user_id"`)}
	}
	if _, ok := ubc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "UserBlock.created_at"`)}
	}
	if _, ok := ubc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user", err: errors.New(`ent: missing required edge "UserBlock.user"`)}
	}
	if _, ok := ubc.mutation.BlockUserID(); !ok {
		return &ValidationError{Name: "block_user", err: errors.New(`ent: missing required edge "UserBlock.block_user"`)}
	}
	return nil
}

func (ubc *UserBlockCreate) sqlSave(ctx context.Context) (*UserBlock, error) {
	if err := ubc.check(); err != nil {
		return nil, err
	}
	_node, _spec := ubc.createSpec()
	if err := sqlgraph.CreateNode(ctx, ubc.driver, _spec); err != nil {
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
	ubc.mutation.id = &_node.ID
	ubc.mutation.done = true
	return _node, nil
}

func (ubc *UserBlockCreate) createSpec() (*UserBlock, *sqlgraph.CreateSpec) {
	var (
		_node = &UserBlock{config: ubc.config}
		_spec = sqlgraph.NewCreateSpec(userblock.Table, sqlgraph.NewFieldSpec(userblock.FieldID, field.TypeUUID))
	)
	_spec.OnConflict = ubc.conflict
	if id, ok := ubc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := ubc.mutation.CreatedAt(); ok {
		_spec.SetField(userblock.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if nodes := ubc.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   userblock.UserTable,
			Columns: []string{userblock.UserColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.UserID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := ubc.mutation.BlockUserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   userblock.BlockUserTable,
			Columns: []string{userblock.BlockUserColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.BlockUserID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.UserBlock.Create().
//		SetUserID(v).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.UserBlockUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (ubc *UserBlockCreate) OnConflict(opts ...sql.ConflictOption) *UserBlockUpsertOne {
	ubc.conflict = opts
	return &UserBlockUpsertOne{
		create: ubc,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.UserBlock.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (ubc *UserBlockCreate) OnConflictColumns(columns ...string) *UserBlockUpsertOne {
	ubc.conflict = append(ubc.conflict, sql.ConflictColumns(columns...))
	return &UserBlockUpsertOne{
		create: ubc,
	}
}

type (
	// UserBlockUpsertOne is the builder for "upsert"-ing
	//  one UserBlock node.
	UserBlockUpsertOne struct {
		create *UserBlockCreate
	}

	// UserBlockUpsert is the "OnConflict" setter.
	UserBlockUpsert struct {
		*sql.UpdateSet
	}
)

// UpdateNewValues updates the mutable fields using the new values that were set on create except the ID field.
// Using this option is equivalent to using:
//
//	client.UserBlock.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(userblock.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *UserBlockUpsertOne) UpdateNewValues() *UserBlockUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		if _, exists := u.create.mutation.ID(); exists {
			s.SetIgnore(userblock.FieldID)
		}
		if _, exists := u.create.mutation.UserID(); exists {
			s.SetIgnore(userblock.FieldUserID)
		}
		if _, exists := u.create.mutation.BlockUserID(); exists {
			s.SetIgnore(userblock.FieldBlockUserID)
		}
		if _, exists := u.create.mutation.CreatedAt(); exists {
			s.SetIgnore(userblock.FieldCreatedAt)
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.UserBlock.Create().
//	    OnConflict(sql.ResolveWithIgnore()).
//	    Exec(ctx)
func (u *UserBlockUpsertOne) Ignore() *UserBlockUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *UserBlockUpsertOne) DoNothing() *UserBlockUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the UserBlockCreate.OnConflict
// documentation for more info.
func (u *UserBlockUpsertOne) Update(set func(*UserBlockUpsert)) *UserBlockUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&UserBlockUpsert{UpdateSet: update})
	}))
	return u
}

// Exec executes the query.
func (u *UserBlockUpsertOne) Exec(ctx context.Context) error {
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for UserBlockCreate.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *UserBlockUpsertOne) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}

// Exec executes the UPSERT query and returns the inserted/updated ID.
func (u *UserBlockUpsertOne) ID(ctx context.Context) (id uuid.UUID, err error) {
	if u.create.driver.Dialect() == dialect.MySQL {
		// In case of "ON CONFLICT", there is no way to get back non-numeric ID
		// fields from the database since MySQL does not support the RETURNING clause.
		return id, errors.New("ent: UserBlockUpsertOne.ID is not supported by MySQL driver. Use UserBlockUpsertOne.Exec instead")
	}
	node, err := u.create.Save(ctx)
	if err != nil {
		return id, err
	}
	return node.ID, nil
}

// IDX is like ID, but panics if an error occurs.
func (u *UserBlockUpsertOne) IDX(ctx context.Context) uuid.UUID {
	id, err := u.ID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// UserBlockCreateBulk is the builder for creating many UserBlock entities in bulk.
type UserBlockCreateBulk struct {
	config
	builders []*UserBlockCreate
	conflict []sql.ConflictOption
}

// Save creates the UserBlock entities in the database.
func (ubcb *UserBlockCreateBulk) Save(ctx context.Context) ([]*UserBlock, error) {
	specs := make([]*sqlgraph.CreateSpec, len(ubcb.builders))
	nodes := make([]*UserBlock, len(ubcb.builders))
	mutators := make([]Mutator, len(ubcb.builders))
	for i := range ubcb.builders {
		func(i int, root context.Context) {
			builder := ubcb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*UserBlockMutation)
				if !ok {
					return nil, fmt.Errorf("unexpected mutation type %T", m)
				}
				if err := builder.check(); err != nil {
					return nil, err
				}
				builder.mutation = mutation
				var err error
				nodes[i], specs[i] = builder.createSpec()
				if i < len(mutators)-1 {
					_, err = mutators[i+1].Mutate(root, ubcb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					spec.OnConflict = ubcb.conflict
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, ubcb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, ubcb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (ubcb *UserBlockCreateBulk) SaveX(ctx context.Context) []*UserBlock {
	v, err := ubcb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (ubcb *UserBlockCreateBulk) Exec(ctx context.Context) error {
	_, err := ubcb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ubcb *UserBlockCreateBulk) ExecX(ctx context.Context) {
	if err := ubcb.Exec(ctx); err != nil {
		panic(err)
	}
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.UserBlock.CreateBulk(builders...).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.UserBlockUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (ubcb *UserBlockCreateBulk) OnConflict(opts ...sql.ConflictOption) *UserBlockUpsertBulk {
	ubcb.conflict = opts
	return &UserBlockUpsertBulk{
		create: ubcb,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.UserBlock.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (ubcb *UserBlockCreateBulk) OnConflictColumns(columns ...string) *UserBlockUpsertBulk {
	ubcb.conflict = append(ubcb.conflict, sql.ConflictColumns(columns...))
	return &UserBlockUpsertBulk{
		create: ubcb,
	}
}

// UserBlockUpsertBulk is the builder for "upsert"-ing
// a bulk of UserBlock nodes.
type UserBlockUpsertBulk struct {
	create *UserBlockCreateBulk
}

// UpdateNewValues updates the mutable fields using the new values that
// were set on create. Using this option is equivalent to using:
//
//	client.UserBlock.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(userblock.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *UserBlockUpsertBulk) UpdateNewValues() *UserBlockUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		for _, b := range u.create.builders {
			if _, exists := b.mutation.ID(); exists {
				s.SetIgnore(userblock.FieldID)
			}
			if _, exists := b.mutation.UserID(); exists {
				s.SetIgnore(userblock.FieldUserID)
			}
			if _, exists := b.mutation.BlockUserID(); exists {
				s.SetIgnore(userblock.FieldBlockUserID)
			}
			if _, exists := b.mutation.CreatedAt(); exists {
				s.SetIgnore(userblock.FieldCreatedAt)
			}
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.UserBlock.Create().
//		OnConflict(sql.ResolveWithIgnore()).
//		Exec(ctx)
func (u *UserBlockUpsertBulk) Ignore() *UserBlockUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *UserBlockUpsertBulk) DoNothing() *UserBlockUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the UserBlockCreateBulk.OnConflict
// documentation for more info.
func (u *UserBlockUpsertBulk) Update(set func(*UserBlockUpsert)) *UserBlockUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&UserBlockUpsert{UpdateSet: update})
	}))
	return u
}

// Exec executes the query.
func (u *UserBlockUpsertBulk) Exec(ctx context.Context) error {
	for i, b := range u.create.builders {
		if len(b.conflict) != 0 {
			return fmt.Errorf("ent: OnConflict was set for builder %d. Set it on the UserBlockCreateBulk instead", i)
		}
	}
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for UserBlockCreateBulk.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *UserBlockUpsertBulk) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}
