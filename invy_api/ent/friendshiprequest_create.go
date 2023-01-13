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
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// FriendshipRequestCreate is the builder for creating a FriendshipRequest entity.
type FriendshipRequestCreate struct {
	config
	mutation *FriendshipRequestMutation
	hooks    []Hook
	conflict []sql.ConflictOption
}

// SetFromUserID sets the "from_user_id" field.
func (frc *FriendshipRequestCreate) SetFromUserID(u uuid.UUID) *FriendshipRequestCreate {
	frc.mutation.SetFromUserID(u)
	return frc
}

// SetToUserID sets the "to_user_id" field.
func (frc *FriendshipRequestCreate) SetToUserID(u uuid.UUID) *FriendshipRequestCreate {
	frc.mutation.SetToUserID(u)
	return frc
}

// SetCreatedAt sets the "created_at" field.
func (frc *FriendshipRequestCreate) SetCreatedAt(t time.Time) *FriendshipRequestCreate {
	frc.mutation.SetCreatedAt(t)
	return frc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (frc *FriendshipRequestCreate) SetNillableCreatedAt(t *time.Time) *FriendshipRequestCreate {
	if t != nil {
		frc.SetCreatedAt(*t)
	}
	return frc
}

// SetID sets the "id" field.
func (frc *FriendshipRequestCreate) SetID(u uuid.UUID) *FriendshipRequestCreate {
	frc.mutation.SetID(u)
	return frc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (frc *FriendshipRequestCreate) SetNillableID(u *uuid.UUID) *FriendshipRequestCreate {
	if u != nil {
		frc.SetID(*u)
	}
	return frc
}

// SetFromUsersID sets the "from_users" edge to the User entity by ID.
func (frc *FriendshipRequestCreate) SetFromUsersID(id uuid.UUID) *FriendshipRequestCreate {
	frc.mutation.SetFromUsersID(id)
	return frc
}

// SetFromUsers sets the "from_users" edge to the User entity.
func (frc *FriendshipRequestCreate) SetFromUsers(u *User) *FriendshipRequestCreate {
	return frc.SetFromUsersID(u.ID)
}

// SetToUsersID sets the "to_users" edge to the User entity by ID.
func (frc *FriendshipRequestCreate) SetToUsersID(id uuid.UUID) *FriendshipRequestCreate {
	frc.mutation.SetToUsersID(id)
	return frc
}

// SetToUsers sets the "to_users" edge to the User entity.
func (frc *FriendshipRequestCreate) SetToUsers(u *User) *FriendshipRequestCreate {
	return frc.SetToUsersID(u.ID)
}

// Mutation returns the FriendshipRequestMutation object of the builder.
func (frc *FriendshipRequestCreate) Mutation() *FriendshipRequestMutation {
	return frc.mutation
}

// Save creates the FriendshipRequest in the database.
func (frc *FriendshipRequestCreate) Save(ctx context.Context) (*FriendshipRequest, error) {
	frc.defaults()
	return withHooks[*FriendshipRequest, FriendshipRequestMutation](ctx, frc.sqlSave, frc.mutation, frc.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (frc *FriendshipRequestCreate) SaveX(ctx context.Context) *FriendshipRequest {
	v, err := frc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (frc *FriendshipRequestCreate) Exec(ctx context.Context) error {
	_, err := frc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (frc *FriendshipRequestCreate) ExecX(ctx context.Context) {
	if err := frc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (frc *FriendshipRequestCreate) defaults() {
	if _, ok := frc.mutation.CreatedAt(); !ok {
		v := friendshiprequest.DefaultCreatedAt()
		frc.mutation.SetCreatedAt(v)
	}
	if _, ok := frc.mutation.ID(); !ok {
		v := friendshiprequest.DefaultID()
		frc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (frc *FriendshipRequestCreate) check() error {
	if _, ok := frc.mutation.FromUserID(); !ok {
		return &ValidationError{Name: "from_user_id", err: errors.New(`ent: missing required field "FriendshipRequest.from_user_id"`)}
	}
	if _, ok := frc.mutation.ToUserID(); !ok {
		return &ValidationError{Name: "to_user_id", err: errors.New(`ent: missing required field "FriendshipRequest.to_user_id"`)}
	}
	if _, ok := frc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "FriendshipRequest.created_at"`)}
	}
	if _, ok := frc.mutation.FromUsersID(); !ok {
		return &ValidationError{Name: "from_users", err: errors.New(`ent: missing required edge "FriendshipRequest.from_users"`)}
	}
	if _, ok := frc.mutation.ToUsersID(); !ok {
		return &ValidationError{Name: "to_users", err: errors.New(`ent: missing required edge "FriendshipRequest.to_users"`)}
	}
	return nil
}

func (frc *FriendshipRequestCreate) sqlSave(ctx context.Context) (*FriendshipRequest, error) {
	if err := frc.check(); err != nil {
		return nil, err
	}
	_node, _spec := frc.createSpec()
	if err := sqlgraph.CreateNode(ctx, frc.driver, _spec); err != nil {
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
	frc.mutation.id = &_node.ID
	frc.mutation.done = true
	return _node, nil
}

func (frc *FriendshipRequestCreate) createSpec() (*FriendshipRequest, *sqlgraph.CreateSpec) {
	var (
		_node = &FriendshipRequest{config: frc.config}
		_spec = &sqlgraph.CreateSpec{
			Table: friendshiprequest.Table,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: friendshiprequest.FieldID,
			},
		}
	)
	_spec.OnConflict = frc.conflict
	if id, ok := frc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := frc.mutation.CreatedAt(); ok {
		_spec.SetField(friendshiprequest.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if nodes := frc.mutation.FromUsersIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   friendshiprequest.FromUsersTable,
			Columns: []string{friendshiprequest.FromUsersColumn},
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
		_node.FromUserID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := frc.mutation.ToUsersIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   friendshiprequest.ToUsersTable,
			Columns: []string{friendshiprequest.ToUsersColumn},
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
		_node.ToUserID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.FriendshipRequest.Create().
//		SetFromUserID(v).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.FriendshipRequestUpsert) {
//			SetFromUserID(v+v).
//		}).
//		Exec(ctx)
func (frc *FriendshipRequestCreate) OnConflict(opts ...sql.ConflictOption) *FriendshipRequestUpsertOne {
	frc.conflict = opts
	return &FriendshipRequestUpsertOne{
		create: frc,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.FriendshipRequest.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (frc *FriendshipRequestCreate) OnConflictColumns(columns ...string) *FriendshipRequestUpsertOne {
	frc.conflict = append(frc.conflict, sql.ConflictColumns(columns...))
	return &FriendshipRequestUpsertOne{
		create: frc,
	}
}

type (
	// FriendshipRequestUpsertOne is the builder for "upsert"-ing
	//  one FriendshipRequest node.
	FriendshipRequestUpsertOne struct {
		create *FriendshipRequestCreate
	}

	// FriendshipRequestUpsert is the "OnConflict" setter.
	FriendshipRequestUpsert struct {
		*sql.UpdateSet
	}
)

// UpdateNewValues updates the mutable fields using the new values that were set on create except the ID field.
// Using this option is equivalent to using:
//
//	client.FriendshipRequest.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(friendshiprequest.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *FriendshipRequestUpsertOne) UpdateNewValues() *FriendshipRequestUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		if _, exists := u.create.mutation.ID(); exists {
			s.SetIgnore(friendshiprequest.FieldID)
		}
		if _, exists := u.create.mutation.FromUserID(); exists {
			s.SetIgnore(friendshiprequest.FieldFromUserID)
		}
		if _, exists := u.create.mutation.ToUserID(); exists {
			s.SetIgnore(friendshiprequest.FieldToUserID)
		}
		if _, exists := u.create.mutation.CreatedAt(); exists {
			s.SetIgnore(friendshiprequest.FieldCreatedAt)
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.FriendshipRequest.Create().
//	    OnConflict(sql.ResolveWithIgnore()).
//	    Exec(ctx)
func (u *FriendshipRequestUpsertOne) Ignore() *FriendshipRequestUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *FriendshipRequestUpsertOne) DoNothing() *FriendshipRequestUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the FriendshipRequestCreate.OnConflict
// documentation for more info.
func (u *FriendshipRequestUpsertOne) Update(set func(*FriendshipRequestUpsert)) *FriendshipRequestUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&FriendshipRequestUpsert{UpdateSet: update})
	}))
	return u
}

// Exec executes the query.
func (u *FriendshipRequestUpsertOne) Exec(ctx context.Context) error {
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for FriendshipRequestCreate.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *FriendshipRequestUpsertOne) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}

// Exec executes the UPSERT query and returns the inserted/updated ID.
func (u *FriendshipRequestUpsertOne) ID(ctx context.Context) (id uuid.UUID, err error) {
	if u.create.driver.Dialect() == dialect.MySQL {
		// In case of "ON CONFLICT", there is no way to get back non-numeric ID
		// fields from the database since MySQL does not support the RETURNING clause.
		return id, errors.New("ent: FriendshipRequestUpsertOne.ID is not supported by MySQL driver. Use FriendshipRequestUpsertOne.Exec instead")
	}
	node, err := u.create.Save(ctx)
	if err != nil {
		return id, err
	}
	return node.ID, nil
}

// IDX is like ID, but panics if an error occurs.
func (u *FriendshipRequestUpsertOne) IDX(ctx context.Context) uuid.UUID {
	id, err := u.ID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// FriendshipRequestCreateBulk is the builder for creating many FriendshipRequest entities in bulk.
type FriendshipRequestCreateBulk struct {
	config
	builders []*FriendshipRequestCreate
	conflict []sql.ConflictOption
}

// Save creates the FriendshipRequest entities in the database.
func (frcb *FriendshipRequestCreateBulk) Save(ctx context.Context) ([]*FriendshipRequest, error) {
	specs := make([]*sqlgraph.CreateSpec, len(frcb.builders))
	nodes := make([]*FriendshipRequest, len(frcb.builders))
	mutators := make([]Mutator, len(frcb.builders))
	for i := range frcb.builders {
		func(i int, root context.Context) {
			builder := frcb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*FriendshipRequestMutation)
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
					_, err = mutators[i+1].Mutate(root, frcb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					spec.OnConflict = frcb.conflict
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, frcb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, frcb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (frcb *FriendshipRequestCreateBulk) SaveX(ctx context.Context) []*FriendshipRequest {
	v, err := frcb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (frcb *FriendshipRequestCreateBulk) Exec(ctx context.Context) error {
	_, err := frcb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (frcb *FriendshipRequestCreateBulk) ExecX(ctx context.Context) {
	if err := frcb.Exec(ctx); err != nil {
		panic(err)
	}
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.FriendshipRequest.CreateBulk(builders...).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.FriendshipRequestUpsert) {
//			SetFromUserID(v+v).
//		}).
//		Exec(ctx)
func (frcb *FriendshipRequestCreateBulk) OnConflict(opts ...sql.ConflictOption) *FriendshipRequestUpsertBulk {
	frcb.conflict = opts
	return &FriendshipRequestUpsertBulk{
		create: frcb,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.FriendshipRequest.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (frcb *FriendshipRequestCreateBulk) OnConflictColumns(columns ...string) *FriendshipRequestUpsertBulk {
	frcb.conflict = append(frcb.conflict, sql.ConflictColumns(columns...))
	return &FriendshipRequestUpsertBulk{
		create: frcb,
	}
}

// FriendshipRequestUpsertBulk is the builder for "upsert"-ing
// a bulk of FriendshipRequest nodes.
type FriendshipRequestUpsertBulk struct {
	create *FriendshipRequestCreateBulk
}

// UpdateNewValues updates the mutable fields using the new values that
// were set on create. Using this option is equivalent to using:
//
//	client.FriendshipRequest.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(friendshiprequest.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *FriendshipRequestUpsertBulk) UpdateNewValues() *FriendshipRequestUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		for _, b := range u.create.builders {
			if _, exists := b.mutation.ID(); exists {
				s.SetIgnore(friendshiprequest.FieldID)
			}
			if _, exists := b.mutation.FromUserID(); exists {
				s.SetIgnore(friendshiprequest.FieldFromUserID)
			}
			if _, exists := b.mutation.ToUserID(); exists {
				s.SetIgnore(friendshiprequest.FieldToUserID)
			}
			if _, exists := b.mutation.CreatedAt(); exists {
				s.SetIgnore(friendshiprequest.FieldCreatedAt)
			}
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.FriendshipRequest.Create().
//		OnConflict(sql.ResolveWithIgnore()).
//		Exec(ctx)
func (u *FriendshipRequestUpsertBulk) Ignore() *FriendshipRequestUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *FriendshipRequestUpsertBulk) DoNothing() *FriendshipRequestUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the FriendshipRequestCreateBulk.OnConflict
// documentation for more info.
func (u *FriendshipRequestUpsertBulk) Update(set func(*FriendshipRequestUpsert)) *FriendshipRequestUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&FriendshipRequestUpsert{UpdateSet: update})
	}))
	return u
}

// Exec executes the query.
func (u *FriendshipRequestUpsertBulk) Exec(ctx context.Context) error {
	for i, b := range u.create.builders {
		if len(b.conflict) != 0 {
			return fmt.Errorf("ent: OnConflict was set for builder %d. Set it on the FriendshipRequestCreateBulk instead", i)
		}
	}
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for FriendshipRequestCreateBulk.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *FriendshipRequestUpsertBulk) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}
