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
	"github.com/k-yomo/invy/invy_api/ent/userlocation"
	"github.com/k-yomo/invy/pkg/pgutil"
)

// UserLocationCreate is the builder for creating a UserLocation entity.
type UserLocationCreate struct {
	config
	mutation *UserLocationMutation
	hooks    []Hook
	conflict []sql.ConflictOption
}

// SetUserID sets the "user_id" field.
func (ulc *UserLocationCreate) SetUserID(u uuid.UUID) *UserLocationCreate {
	ulc.mutation.SetUserID(u)
	return ulc
}

// SetCoordinate sets the "coordinate" field.
func (ulc *UserLocationCreate) SetCoordinate(pp *pgutil.GeoPoint) *UserLocationCreate {
	ulc.mutation.SetCoordinate(pp)
	return ulc
}

// SetUpdatedAt sets the "updated_at" field.
func (ulc *UserLocationCreate) SetUpdatedAt(t time.Time) *UserLocationCreate {
	ulc.mutation.SetUpdatedAt(t)
	return ulc
}

// SetNillableUpdatedAt sets the "updated_at" field if the given value is not nil.
func (ulc *UserLocationCreate) SetNillableUpdatedAt(t *time.Time) *UserLocationCreate {
	if t != nil {
		ulc.SetUpdatedAt(*t)
	}
	return ulc
}

// SetID sets the "id" field.
func (ulc *UserLocationCreate) SetID(u uuid.UUID) *UserLocationCreate {
	ulc.mutation.SetID(u)
	return ulc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (ulc *UserLocationCreate) SetNillableID(u *uuid.UUID) *UserLocationCreate {
	if u != nil {
		ulc.SetID(*u)
	}
	return ulc
}

// SetUser sets the "user" edge to the User entity.
func (ulc *UserLocationCreate) SetUser(u *User) *UserLocationCreate {
	return ulc.SetUserID(u.ID)
}

// Mutation returns the UserLocationMutation object of the builder.
func (ulc *UserLocationCreate) Mutation() *UserLocationMutation {
	return ulc.mutation
}

// Save creates the UserLocation in the database.
func (ulc *UserLocationCreate) Save(ctx context.Context) (*UserLocation, error) {
	ulc.defaults()
	return withHooks[*UserLocation, UserLocationMutation](ctx, ulc.sqlSave, ulc.mutation, ulc.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (ulc *UserLocationCreate) SaveX(ctx context.Context) *UserLocation {
	v, err := ulc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (ulc *UserLocationCreate) Exec(ctx context.Context) error {
	_, err := ulc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ulc *UserLocationCreate) ExecX(ctx context.Context) {
	if err := ulc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (ulc *UserLocationCreate) defaults() {
	if _, ok := ulc.mutation.UpdatedAt(); !ok {
		v := userlocation.DefaultUpdatedAt()
		ulc.mutation.SetUpdatedAt(v)
	}
	if _, ok := ulc.mutation.ID(); !ok {
		v := userlocation.DefaultID()
		ulc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (ulc *UserLocationCreate) check() error {
	if _, ok := ulc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user_id", err: errors.New(`ent: missing required field "UserLocation.user_id"`)}
	}
	if _, ok := ulc.mutation.Coordinate(); !ok {
		return &ValidationError{Name: "coordinate", err: errors.New(`ent: missing required field "UserLocation.coordinate"`)}
	}
	if _, ok := ulc.mutation.UpdatedAt(); !ok {
		return &ValidationError{Name: "updated_at", err: errors.New(`ent: missing required field "UserLocation.updated_at"`)}
	}
	if _, ok := ulc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user", err: errors.New(`ent: missing required edge "UserLocation.user"`)}
	}
	return nil
}

func (ulc *UserLocationCreate) sqlSave(ctx context.Context) (*UserLocation, error) {
	if err := ulc.check(); err != nil {
		return nil, err
	}
	_node, _spec := ulc.createSpec()
	if err := sqlgraph.CreateNode(ctx, ulc.driver, _spec); err != nil {
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
	ulc.mutation.id = &_node.ID
	ulc.mutation.done = true
	return _node, nil
}

func (ulc *UserLocationCreate) createSpec() (*UserLocation, *sqlgraph.CreateSpec) {
	var (
		_node = &UserLocation{config: ulc.config}
		_spec = &sqlgraph.CreateSpec{
			Table: userlocation.Table,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: userlocation.FieldID,
			},
		}
	)
	_spec.OnConflict = ulc.conflict
	if id, ok := ulc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := ulc.mutation.Coordinate(); ok {
		_spec.SetField(userlocation.FieldCoordinate, field.TypeOther, value)
		_node.Coordinate = value
	}
	if value, ok := ulc.mutation.UpdatedAt(); ok {
		_spec.SetField(userlocation.FieldUpdatedAt, field.TypeTime, value)
		_node.UpdatedAt = value
	}
	if nodes := ulc.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   userlocation.UserTable,
			Columns: []string{userlocation.UserColumn},
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
//	client.UserLocation.Create().
//		SetUserID(v).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.UserLocationUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (ulc *UserLocationCreate) OnConflict(opts ...sql.ConflictOption) *UserLocationUpsertOne {
	ulc.conflict = opts
	return &UserLocationUpsertOne{
		create: ulc,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.UserLocation.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (ulc *UserLocationCreate) OnConflictColumns(columns ...string) *UserLocationUpsertOne {
	ulc.conflict = append(ulc.conflict, sql.ConflictColumns(columns...))
	return &UserLocationUpsertOne{
		create: ulc,
	}
}

type (
	// UserLocationUpsertOne is the builder for "upsert"-ing
	//  one UserLocation node.
	UserLocationUpsertOne struct {
		create *UserLocationCreate
	}

	// UserLocationUpsert is the "OnConflict" setter.
	UserLocationUpsert struct {
		*sql.UpdateSet
	}
)

// SetCoordinate sets the "coordinate" field.
func (u *UserLocationUpsert) SetCoordinate(v *pgutil.GeoPoint) *UserLocationUpsert {
	u.Set(userlocation.FieldCoordinate, v)
	return u
}

// UpdateCoordinate sets the "coordinate" field to the value that was provided on create.
func (u *UserLocationUpsert) UpdateCoordinate() *UserLocationUpsert {
	u.SetExcluded(userlocation.FieldCoordinate)
	return u
}

// SetUpdatedAt sets the "updated_at" field.
func (u *UserLocationUpsert) SetUpdatedAt(v time.Time) *UserLocationUpsert {
	u.Set(userlocation.FieldUpdatedAt, v)
	return u
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *UserLocationUpsert) UpdateUpdatedAt() *UserLocationUpsert {
	u.SetExcluded(userlocation.FieldUpdatedAt)
	return u
}

// UpdateNewValues updates the mutable fields using the new values that were set on create except the ID field.
// Using this option is equivalent to using:
//
//	client.UserLocation.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(userlocation.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *UserLocationUpsertOne) UpdateNewValues() *UserLocationUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		if _, exists := u.create.mutation.ID(); exists {
			s.SetIgnore(userlocation.FieldID)
		}
		if _, exists := u.create.mutation.UserID(); exists {
			s.SetIgnore(userlocation.FieldUserID)
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.UserLocation.Create().
//	    OnConflict(sql.ResolveWithIgnore()).
//	    Exec(ctx)
func (u *UserLocationUpsertOne) Ignore() *UserLocationUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *UserLocationUpsertOne) DoNothing() *UserLocationUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the UserLocationCreate.OnConflict
// documentation for more info.
func (u *UserLocationUpsertOne) Update(set func(*UserLocationUpsert)) *UserLocationUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&UserLocationUpsert{UpdateSet: update})
	}))
	return u
}

// SetCoordinate sets the "coordinate" field.
func (u *UserLocationUpsertOne) SetCoordinate(v *pgutil.GeoPoint) *UserLocationUpsertOne {
	return u.Update(func(s *UserLocationUpsert) {
		s.SetCoordinate(v)
	})
}

// UpdateCoordinate sets the "coordinate" field to the value that was provided on create.
func (u *UserLocationUpsertOne) UpdateCoordinate() *UserLocationUpsertOne {
	return u.Update(func(s *UserLocationUpsert) {
		s.UpdateCoordinate()
	})
}

// SetUpdatedAt sets the "updated_at" field.
func (u *UserLocationUpsertOne) SetUpdatedAt(v time.Time) *UserLocationUpsertOne {
	return u.Update(func(s *UserLocationUpsert) {
		s.SetUpdatedAt(v)
	})
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *UserLocationUpsertOne) UpdateUpdatedAt() *UserLocationUpsertOne {
	return u.Update(func(s *UserLocationUpsert) {
		s.UpdateUpdatedAt()
	})
}

// Exec executes the query.
func (u *UserLocationUpsertOne) Exec(ctx context.Context) error {
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for UserLocationCreate.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *UserLocationUpsertOne) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}

// Exec executes the UPSERT query and returns the inserted/updated ID.
func (u *UserLocationUpsertOne) ID(ctx context.Context) (id uuid.UUID, err error) {
	if u.create.driver.Dialect() == dialect.MySQL {
		// In case of "ON CONFLICT", there is no way to get back non-numeric ID
		// fields from the database since MySQL does not support the RETURNING clause.
		return id, errors.New("ent: UserLocationUpsertOne.ID is not supported by MySQL driver. Use UserLocationUpsertOne.Exec instead")
	}
	node, err := u.create.Save(ctx)
	if err != nil {
		return id, err
	}
	return node.ID, nil
}

// IDX is like ID, but panics if an error occurs.
func (u *UserLocationUpsertOne) IDX(ctx context.Context) uuid.UUID {
	id, err := u.ID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// UserLocationCreateBulk is the builder for creating many UserLocation entities in bulk.
type UserLocationCreateBulk struct {
	config
	builders []*UserLocationCreate
	conflict []sql.ConflictOption
}

// Save creates the UserLocation entities in the database.
func (ulcb *UserLocationCreateBulk) Save(ctx context.Context) ([]*UserLocation, error) {
	specs := make([]*sqlgraph.CreateSpec, len(ulcb.builders))
	nodes := make([]*UserLocation, len(ulcb.builders))
	mutators := make([]Mutator, len(ulcb.builders))
	for i := range ulcb.builders {
		func(i int, root context.Context) {
			builder := ulcb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*UserLocationMutation)
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
					_, err = mutators[i+1].Mutate(root, ulcb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					spec.OnConflict = ulcb.conflict
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, ulcb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, ulcb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (ulcb *UserLocationCreateBulk) SaveX(ctx context.Context) []*UserLocation {
	v, err := ulcb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (ulcb *UserLocationCreateBulk) Exec(ctx context.Context) error {
	_, err := ulcb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ulcb *UserLocationCreateBulk) ExecX(ctx context.Context) {
	if err := ulcb.Exec(ctx); err != nil {
		panic(err)
	}
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.UserLocation.CreateBulk(builders...).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.UserLocationUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (ulcb *UserLocationCreateBulk) OnConflict(opts ...sql.ConflictOption) *UserLocationUpsertBulk {
	ulcb.conflict = opts
	return &UserLocationUpsertBulk{
		create: ulcb,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.UserLocation.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (ulcb *UserLocationCreateBulk) OnConflictColumns(columns ...string) *UserLocationUpsertBulk {
	ulcb.conflict = append(ulcb.conflict, sql.ConflictColumns(columns...))
	return &UserLocationUpsertBulk{
		create: ulcb,
	}
}

// UserLocationUpsertBulk is the builder for "upsert"-ing
// a bulk of UserLocation nodes.
type UserLocationUpsertBulk struct {
	create *UserLocationCreateBulk
}

// UpdateNewValues updates the mutable fields using the new values that
// were set on create. Using this option is equivalent to using:
//
//	client.UserLocation.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(userlocation.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *UserLocationUpsertBulk) UpdateNewValues() *UserLocationUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		for _, b := range u.create.builders {
			if _, exists := b.mutation.ID(); exists {
				s.SetIgnore(userlocation.FieldID)
			}
			if _, exists := b.mutation.UserID(); exists {
				s.SetIgnore(userlocation.FieldUserID)
			}
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.UserLocation.Create().
//		OnConflict(sql.ResolveWithIgnore()).
//		Exec(ctx)
func (u *UserLocationUpsertBulk) Ignore() *UserLocationUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *UserLocationUpsertBulk) DoNothing() *UserLocationUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the UserLocationCreateBulk.OnConflict
// documentation for more info.
func (u *UserLocationUpsertBulk) Update(set func(*UserLocationUpsert)) *UserLocationUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&UserLocationUpsert{UpdateSet: update})
	}))
	return u
}

// SetCoordinate sets the "coordinate" field.
func (u *UserLocationUpsertBulk) SetCoordinate(v *pgutil.GeoPoint) *UserLocationUpsertBulk {
	return u.Update(func(s *UserLocationUpsert) {
		s.SetCoordinate(v)
	})
}

// UpdateCoordinate sets the "coordinate" field to the value that was provided on create.
func (u *UserLocationUpsertBulk) UpdateCoordinate() *UserLocationUpsertBulk {
	return u.Update(func(s *UserLocationUpsert) {
		s.UpdateCoordinate()
	})
}

// SetUpdatedAt sets the "updated_at" field.
func (u *UserLocationUpsertBulk) SetUpdatedAt(v time.Time) *UserLocationUpsertBulk {
	return u.Update(func(s *UserLocationUpsert) {
		s.SetUpdatedAt(v)
	})
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *UserLocationUpsertBulk) UpdateUpdatedAt() *UserLocationUpsertBulk {
	return u.Update(func(s *UserLocationUpsert) {
		s.UpdateUpdatedAt()
	})
}

// Exec executes the query.
func (u *UserLocationUpsertBulk) Exec(ctx context.Context) error {
	for i, b := range u.create.builders {
		if len(b.conflict) != 0 {
			return fmt.Errorf("ent: OnConflict was set for builder %d. Set it on the UserLocationCreateBulk instead", i)
		}
	}
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for UserLocationCreateBulk.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *UserLocationUpsertBulk) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}
