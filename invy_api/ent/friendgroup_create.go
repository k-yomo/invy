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
	"github.com/k-yomo/invy/invy_api/ent/friendgroup"
	"github.com/k-yomo/invy/invy_api/ent/invitationfriendgroup"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userfriendgroup"
)

// FriendGroupCreate is the builder for creating a FriendGroup entity.
type FriendGroupCreate struct {
	config
	mutation *FriendGroupMutation
	hooks    []Hook
	conflict []sql.ConflictOption
}

// SetUserID sets the "user_id" field.
func (fgc *FriendGroupCreate) SetUserID(u uuid.UUID) *FriendGroupCreate {
	fgc.mutation.SetUserID(u)
	return fgc
}

// SetName sets the "name" field.
func (fgc *FriendGroupCreate) SetName(s string) *FriendGroupCreate {
	fgc.mutation.SetName(s)
	return fgc
}

// SetTotalCount sets the "total_count" field.
func (fgc *FriendGroupCreate) SetTotalCount(i int) *FriendGroupCreate {
	fgc.mutation.SetTotalCount(i)
	return fgc
}

// SetNillableTotalCount sets the "total_count" field if the given value is not nil.
func (fgc *FriendGroupCreate) SetNillableTotalCount(i *int) *FriendGroupCreate {
	if i != nil {
		fgc.SetTotalCount(*i)
	}
	return fgc
}

// SetCreatedAt sets the "created_at" field.
func (fgc *FriendGroupCreate) SetCreatedAt(t time.Time) *FriendGroupCreate {
	fgc.mutation.SetCreatedAt(t)
	return fgc
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (fgc *FriendGroupCreate) SetNillableCreatedAt(t *time.Time) *FriendGroupCreate {
	if t != nil {
		fgc.SetCreatedAt(*t)
	}
	return fgc
}

// SetUpdatedAt sets the "updated_at" field.
func (fgc *FriendGroupCreate) SetUpdatedAt(t time.Time) *FriendGroupCreate {
	fgc.mutation.SetUpdatedAt(t)
	return fgc
}

// SetNillableUpdatedAt sets the "updated_at" field if the given value is not nil.
func (fgc *FriendGroupCreate) SetNillableUpdatedAt(t *time.Time) *FriendGroupCreate {
	if t != nil {
		fgc.SetUpdatedAt(*t)
	}
	return fgc
}

// SetID sets the "id" field.
func (fgc *FriendGroupCreate) SetID(u uuid.UUID) *FriendGroupCreate {
	fgc.mutation.SetID(u)
	return fgc
}

// SetNillableID sets the "id" field if the given value is not nil.
func (fgc *FriendGroupCreate) SetNillableID(u *uuid.UUID) *FriendGroupCreate {
	if u != nil {
		fgc.SetID(*u)
	}
	return fgc
}

// SetUser sets the "user" edge to the User entity.
func (fgc *FriendGroupCreate) SetUser(u *User) *FriendGroupCreate {
	return fgc.SetUserID(u.ID)
}

// AddFriendUserIDs adds the "friend_users" edge to the User entity by IDs.
func (fgc *FriendGroupCreate) AddFriendUserIDs(ids ...uuid.UUID) *FriendGroupCreate {
	fgc.mutation.AddFriendUserIDs(ids...)
	return fgc
}

// AddFriendUsers adds the "friend_users" edges to the User entity.
func (fgc *FriendGroupCreate) AddFriendUsers(u ...*User) *FriendGroupCreate {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fgc.AddFriendUserIDs(ids...)
}

// AddInvitationFriendGroupIDs adds the "invitation_friend_groups" edge to the InvitationFriendGroup entity by IDs.
func (fgc *FriendGroupCreate) AddInvitationFriendGroupIDs(ids ...uuid.UUID) *FriendGroupCreate {
	fgc.mutation.AddInvitationFriendGroupIDs(ids...)
	return fgc
}

// AddInvitationFriendGroups adds the "invitation_friend_groups" edges to the InvitationFriendGroup entity.
func (fgc *FriendGroupCreate) AddInvitationFriendGroups(i ...*InvitationFriendGroup) *FriendGroupCreate {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return fgc.AddInvitationFriendGroupIDs(ids...)
}

// AddUserFriendGroupIDs adds the "user_friend_groups" edge to the UserFriendGroup entity by IDs.
func (fgc *FriendGroupCreate) AddUserFriendGroupIDs(ids ...uuid.UUID) *FriendGroupCreate {
	fgc.mutation.AddUserFriendGroupIDs(ids...)
	return fgc
}

// AddUserFriendGroups adds the "user_friend_groups" edges to the UserFriendGroup entity.
func (fgc *FriendGroupCreate) AddUserFriendGroups(u ...*UserFriendGroup) *FriendGroupCreate {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fgc.AddUserFriendGroupIDs(ids...)
}

// Mutation returns the FriendGroupMutation object of the builder.
func (fgc *FriendGroupCreate) Mutation() *FriendGroupMutation {
	return fgc.mutation
}

// Save creates the FriendGroup in the database.
func (fgc *FriendGroupCreate) Save(ctx context.Context) (*FriendGroup, error) {
	var (
		err  error
		node *FriendGroup
	)
	fgc.defaults()
	if len(fgc.hooks) == 0 {
		if err = fgc.check(); err != nil {
			return nil, err
		}
		node, err = fgc.sqlSave(ctx)
	} else {
		var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
			mutation, ok := m.(*FriendGroupMutation)
			if !ok {
				return nil, fmt.Errorf("unexpected mutation type %T", m)
			}
			if err = fgc.check(); err != nil {
				return nil, err
			}
			fgc.mutation = mutation
			if node, err = fgc.sqlSave(ctx); err != nil {
				return nil, err
			}
			mutation.id = &node.ID
			mutation.done = true
			return node, err
		})
		for i := len(fgc.hooks) - 1; i >= 0; i-- {
			if fgc.hooks[i] == nil {
				return nil, fmt.Errorf("ent: uninitialized hook (forgotten import ent/runtime?)")
			}
			mut = fgc.hooks[i](mut)
		}
		v, err := mut.Mutate(ctx, fgc.mutation)
		if err != nil {
			return nil, err
		}
		nv, ok := v.(*FriendGroup)
		if !ok {
			return nil, fmt.Errorf("unexpected node type %T returned from FriendGroupMutation", v)
		}
		node = nv
	}
	return node, err
}

// SaveX calls Save and panics if Save returns an error.
func (fgc *FriendGroupCreate) SaveX(ctx context.Context) *FriendGroup {
	v, err := fgc.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (fgc *FriendGroupCreate) Exec(ctx context.Context) error {
	_, err := fgc.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (fgc *FriendGroupCreate) ExecX(ctx context.Context) {
	if err := fgc.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (fgc *FriendGroupCreate) defaults() {
	if _, ok := fgc.mutation.TotalCount(); !ok {
		v := friendgroup.DefaultTotalCount
		fgc.mutation.SetTotalCount(v)
	}
	if _, ok := fgc.mutation.CreatedAt(); !ok {
		v := friendgroup.DefaultCreatedAt()
		fgc.mutation.SetCreatedAt(v)
	}
	if _, ok := fgc.mutation.UpdatedAt(); !ok {
		v := friendgroup.DefaultUpdatedAt()
		fgc.mutation.SetUpdatedAt(v)
	}
	if _, ok := fgc.mutation.ID(); !ok {
		v := friendgroup.DefaultID()
		fgc.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (fgc *FriendGroupCreate) check() error {
	if _, ok := fgc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user_id", err: errors.New(`ent: missing required field "FriendGroup.user_id"`)}
	}
	if _, ok := fgc.mutation.Name(); !ok {
		return &ValidationError{Name: "name", err: errors.New(`ent: missing required field "FriendGroup.name"`)}
	}
	if _, ok := fgc.mutation.TotalCount(); !ok {
		return &ValidationError{Name: "total_count", err: errors.New(`ent: missing required field "FriendGroup.total_count"`)}
	}
	if _, ok := fgc.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "FriendGroup.created_at"`)}
	}
	if _, ok := fgc.mutation.UpdatedAt(); !ok {
		return &ValidationError{Name: "updated_at", err: errors.New(`ent: missing required field "FriendGroup.updated_at"`)}
	}
	if _, ok := fgc.mutation.UserID(); !ok {
		return &ValidationError{Name: "user", err: errors.New(`ent: missing required edge "FriendGroup.user"`)}
	}
	return nil
}

func (fgc *FriendGroupCreate) sqlSave(ctx context.Context) (*FriendGroup, error) {
	_node, _spec := fgc.createSpec()
	if err := sqlgraph.CreateNode(ctx, fgc.driver, _spec); err != nil {
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

func (fgc *FriendGroupCreate) createSpec() (*FriendGroup, *sqlgraph.CreateSpec) {
	var (
		_node = &FriendGroup{config: fgc.config}
		_spec = &sqlgraph.CreateSpec{
			Table: friendgroup.Table,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: friendgroup.FieldID,
			},
		}
	)
	_spec.OnConflict = fgc.conflict
	if id, ok := fgc.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := fgc.mutation.Name(); ok {
		_spec.SetField(friendgroup.FieldName, field.TypeString, value)
		_node.Name = value
	}
	if value, ok := fgc.mutation.TotalCount(); ok {
		_spec.SetField(friendgroup.FieldTotalCount, field.TypeInt, value)
		_node.TotalCount = value
	}
	if value, ok := fgc.mutation.CreatedAt(); ok {
		_spec.SetField(friendgroup.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if value, ok := fgc.mutation.UpdatedAt(); ok {
		_spec.SetField(friendgroup.FieldUpdatedAt, field.TypeTime, value)
		_node.UpdatedAt = value
	}
	if nodes := fgc.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   friendgroup.UserTable,
			Columns: []string{friendgroup.UserColumn},
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
	if nodes := fgc.mutation.FriendUsersIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2M,
			Inverse: false,
			Table:   friendgroup.FriendUsersTable,
			Columns: friendgroup.FriendUsersPrimaryKey,
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
		createE := &UserFriendGroupCreate{config: fgc.config, mutation: newUserFriendGroupMutation(fgc.config, OpCreate)}
		createE.defaults()
		_, specE := createE.createSpec()
		edge.Target.Fields = specE.Fields
		if specE.ID.Value != nil {
			edge.Target.Fields = append(edge.Target.Fields, specE.ID)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := fgc.mutation.InvitationFriendGroupsIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   friendgroup.InvitationFriendGroupsTable,
			Columns: []string{friendgroup.InvitationFriendGroupsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationfriendgroup.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	if nodes := fgc.mutation.UserFriendGroupsIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   friendgroup.UserFriendGroupsTable,
			Columns: []string{friendgroup.UserFriendGroupsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: userfriendgroup.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.FriendGroup.Create().
//		SetUserID(v).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.FriendGroupUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (fgc *FriendGroupCreate) OnConflict(opts ...sql.ConflictOption) *FriendGroupUpsertOne {
	fgc.conflict = opts
	return &FriendGroupUpsertOne{
		create: fgc,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.FriendGroup.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (fgc *FriendGroupCreate) OnConflictColumns(columns ...string) *FriendGroupUpsertOne {
	fgc.conflict = append(fgc.conflict, sql.ConflictColumns(columns...))
	return &FriendGroupUpsertOne{
		create: fgc,
	}
}

type (
	// FriendGroupUpsertOne is the builder for "upsert"-ing
	//  one FriendGroup node.
	FriendGroupUpsertOne struct {
		create *FriendGroupCreate
	}

	// FriendGroupUpsert is the "OnConflict" setter.
	FriendGroupUpsert struct {
		*sql.UpdateSet
	}
)

// SetName sets the "name" field.
func (u *FriendGroupUpsert) SetName(v string) *FriendGroupUpsert {
	u.Set(friendgroup.FieldName, v)
	return u
}

// UpdateName sets the "name" field to the value that was provided on create.
func (u *FriendGroupUpsert) UpdateName() *FriendGroupUpsert {
	u.SetExcluded(friendgroup.FieldName)
	return u
}

// SetTotalCount sets the "total_count" field.
func (u *FriendGroupUpsert) SetTotalCount(v int) *FriendGroupUpsert {
	u.Set(friendgroup.FieldTotalCount, v)
	return u
}

// UpdateTotalCount sets the "total_count" field to the value that was provided on create.
func (u *FriendGroupUpsert) UpdateTotalCount() *FriendGroupUpsert {
	u.SetExcluded(friendgroup.FieldTotalCount)
	return u
}

// AddTotalCount adds v to the "total_count" field.
func (u *FriendGroupUpsert) AddTotalCount(v int) *FriendGroupUpsert {
	u.Add(friendgroup.FieldTotalCount, v)
	return u
}

// SetUpdatedAt sets the "updated_at" field.
func (u *FriendGroupUpsert) SetUpdatedAt(v time.Time) *FriendGroupUpsert {
	u.Set(friendgroup.FieldUpdatedAt, v)
	return u
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *FriendGroupUpsert) UpdateUpdatedAt() *FriendGroupUpsert {
	u.SetExcluded(friendgroup.FieldUpdatedAt)
	return u
}

// UpdateNewValues updates the mutable fields using the new values that were set on create except the ID field.
// Using this option is equivalent to using:
//
//	client.FriendGroup.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(friendgroup.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *FriendGroupUpsertOne) UpdateNewValues() *FriendGroupUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		if _, exists := u.create.mutation.ID(); exists {
			s.SetIgnore(friendgroup.FieldID)
		}
		if _, exists := u.create.mutation.UserID(); exists {
			s.SetIgnore(friendgroup.FieldUserID)
		}
		if _, exists := u.create.mutation.CreatedAt(); exists {
			s.SetIgnore(friendgroup.FieldCreatedAt)
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.FriendGroup.Create().
//	    OnConflict(sql.ResolveWithIgnore()).
//	    Exec(ctx)
func (u *FriendGroupUpsertOne) Ignore() *FriendGroupUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *FriendGroupUpsertOne) DoNothing() *FriendGroupUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the FriendGroupCreate.OnConflict
// documentation for more info.
func (u *FriendGroupUpsertOne) Update(set func(*FriendGroupUpsert)) *FriendGroupUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&FriendGroupUpsert{UpdateSet: update})
	}))
	return u
}

// SetName sets the "name" field.
func (u *FriendGroupUpsertOne) SetName(v string) *FriendGroupUpsertOne {
	return u.Update(func(s *FriendGroupUpsert) {
		s.SetName(v)
	})
}

// UpdateName sets the "name" field to the value that was provided on create.
func (u *FriendGroupUpsertOne) UpdateName() *FriendGroupUpsertOne {
	return u.Update(func(s *FriendGroupUpsert) {
		s.UpdateName()
	})
}

// SetTotalCount sets the "total_count" field.
func (u *FriendGroupUpsertOne) SetTotalCount(v int) *FriendGroupUpsertOne {
	return u.Update(func(s *FriendGroupUpsert) {
		s.SetTotalCount(v)
	})
}

// AddTotalCount adds v to the "total_count" field.
func (u *FriendGroupUpsertOne) AddTotalCount(v int) *FriendGroupUpsertOne {
	return u.Update(func(s *FriendGroupUpsert) {
		s.AddTotalCount(v)
	})
}

// UpdateTotalCount sets the "total_count" field to the value that was provided on create.
func (u *FriendGroupUpsertOne) UpdateTotalCount() *FriendGroupUpsertOne {
	return u.Update(func(s *FriendGroupUpsert) {
		s.UpdateTotalCount()
	})
}

// SetUpdatedAt sets the "updated_at" field.
func (u *FriendGroupUpsertOne) SetUpdatedAt(v time.Time) *FriendGroupUpsertOne {
	return u.Update(func(s *FriendGroupUpsert) {
		s.SetUpdatedAt(v)
	})
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *FriendGroupUpsertOne) UpdateUpdatedAt() *FriendGroupUpsertOne {
	return u.Update(func(s *FriendGroupUpsert) {
		s.UpdateUpdatedAt()
	})
}

// Exec executes the query.
func (u *FriendGroupUpsertOne) Exec(ctx context.Context) error {
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for FriendGroupCreate.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *FriendGroupUpsertOne) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}

// Exec executes the UPSERT query and returns the inserted/updated ID.
func (u *FriendGroupUpsertOne) ID(ctx context.Context) (id uuid.UUID, err error) {
	if u.create.driver.Dialect() == dialect.MySQL {
		// In case of "ON CONFLICT", there is no way to get back non-numeric ID
		// fields from the database since MySQL does not support the RETURNING clause.
		return id, errors.New("ent: FriendGroupUpsertOne.ID is not supported by MySQL driver. Use FriendGroupUpsertOne.Exec instead")
	}
	node, err := u.create.Save(ctx)
	if err != nil {
		return id, err
	}
	return node.ID, nil
}

// IDX is like ID, but panics if an error occurs.
func (u *FriendGroupUpsertOne) IDX(ctx context.Context) uuid.UUID {
	id, err := u.ID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// FriendGroupCreateBulk is the builder for creating many FriendGroup entities in bulk.
type FriendGroupCreateBulk struct {
	config
	builders []*FriendGroupCreate
	conflict []sql.ConflictOption
}

// Save creates the FriendGroup entities in the database.
func (fgcb *FriendGroupCreateBulk) Save(ctx context.Context) ([]*FriendGroup, error) {
	specs := make([]*sqlgraph.CreateSpec, len(fgcb.builders))
	nodes := make([]*FriendGroup, len(fgcb.builders))
	mutators := make([]Mutator, len(fgcb.builders))
	for i := range fgcb.builders {
		func(i int, root context.Context) {
			builder := fgcb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*FriendGroupMutation)
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
					_, err = mutators[i+1].Mutate(root, fgcb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					spec.OnConflict = fgcb.conflict
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, fgcb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, fgcb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (fgcb *FriendGroupCreateBulk) SaveX(ctx context.Context) []*FriendGroup {
	v, err := fgcb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (fgcb *FriendGroupCreateBulk) Exec(ctx context.Context) error {
	_, err := fgcb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (fgcb *FriendGroupCreateBulk) ExecX(ctx context.Context) {
	if err := fgcb.Exec(ctx); err != nil {
		panic(err)
	}
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.FriendGroup.CreateBulk(builders...).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.FriendGroupUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (fgcb *FriendGroupCreateBulk) OnConflict(opts ...sql.ConflictOption) *FriendGroupUpsertBulk {
	fgcb.conflict = opts
	return &FriendGroupUpsertBulk{
		create: fgcb,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.FriendGroup.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (fgcb *FriendGroupCreateBulk) OnConflictColumns(columns ...string) *FriendGroupUpsertBulk {
	fgcb.conflict = append(fgcb.conflict, sql.ConflictColumns(columns...))
	return &FriendGroupUpsertBulk{
		create: fgcb,
	}
}

// FriendGroupUpsertBulk is the builder for "upsert"-ing
// a bulk of FriendGroup nodes.
type FriendGroupUpsertBulk struct {
	create *FriendGroupCreateBulk
}

// UpdateNewValues updates the mutable fields using the new values that
// were set on create. Using this option is equivalent to using:
//
//	client.FriendGroup.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(friendgroup.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *FriendGroupUpsertBulk) UpdateNewValues() *FriendGroupUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		for _, b := range u.create.builders {
			if _, exists := b.mutation.ID(); exists {
				s.SetIgnore(friendgroup.FieldID)
			}
			if _, exists := b.mutation.UserID(); exists {
				s.SetIgnore(friendgroup.FieldUserID)
			}
			if _, exists := b.mutation.CreatedAt(); exists {
				s.SetIgnore(friendgroup.FieldCreatedAt)
			}
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.FriendGroup.Create().
//		OnConflict(sql.ResolveWithIgnore()).
//		Exec(ctx)
func (u *FriendGroupUpsertBulk) Ignore() *FriendGroupUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *FriendGroupUpsertBulk) DoNothing() *FriendGroupUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the FriendGroupCreateBulk.OnConflict
// documentation for more info.
func (u *FriendGroupUpsertBulk) Update(set func(*FriendGroupUpsert)) *FriendGroupUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&FriendGroupUpsert{UpdateSet: update})
	}))
	return u
}

// SetName sets the "name" field.
func (u *FriendGroupUpsertBulk) SetName(v string) *FriendGroupUpsertBulk {
	return u.Update(func(s *FriendGroupUpsert) {
		s.SetName(v)
	})
}

// UpdateName sets the "name" field to the value that was provided on create.
func (u *FriendGroupUpsertBulk) UpdateName() *FriendGroupUpsertBulk {
	return u.Update(func(s *FriendGroupUpsert) {
		s.UpdateName()
	})
}

// SetTotalCount sets the "total_count" field.
func (u *FriendGroupUpsertBulk) SetTotalCount(v int) *FriendGroupUpsertBulk {
	return u.Update(func(s *FriendGroupUpsert) {
		s.SetTotalCount(v)
	})
}

// AddTotalCount adds v to the "total_count" field.
func (u *FriendGroupUpsertBulk) AddTotalCount(v int) *FriendGroupUpsertBulk {
	return u.Update(func(s *FriendGroupUpsert) {
		s.AddTotalCount(v)
	})
}

// UpdateTotalCount sets the "total_count" field to the value that was provided on create.
func (u *FriendGroupUpsertBulk) UpdateTotalCount() *FriendGroupUpsertBulk {
	return u.Update(func(s *FriendGroupUpsert) {
		s.UpdateTotalCount()
	})
}

// SetUpdatedAt sets the "updated_at" field.
func (u *FriendGroupUpsertBulk) SetUpdatedAt(v time.Time) *FriendGroupUpsertBulk {
	return u.Update(func(s *FriendGroupUpsert) {
		s.SetUpdatedAt(v)
	})
}

// UpdateUpdatedAt sets the "updated_at" field to the value that was provided on create.
func (u *FriendGroupUpsertBulk) UpdateUpdatedAt() *FriendGroupUpsertBulk {
	return u.Update(func(s *FriendGroupUpsert) {
		s.UpdateUpdatedAt()
	})
}

// Exec executes the query.
func (u *FriendGroupUpsertBulk) Exec(ctx context.Context) error {
	for i, b := range u.create.builders {
		if len(b.conflict) != 0 {
			return fmt.Errorf("ent: OnConflict was set for builder %d. Set it on the FriendGroupCreateBulk instead", i)
		}
	}
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for FriendGroupCreateBulk.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *FriendGroupUpsertBulk) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}