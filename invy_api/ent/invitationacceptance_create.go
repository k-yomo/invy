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
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// InvitationAcceptanceCreate is the builder for creating a InvitationAcceptance entity.
type InvitationAcceptanceCreate struct {
	config
	mutation *InvitationAcceptanceMutation
	hooks    []Hook
	conflict []sql.ConflictOption
}

// SetUserID sets the "user_id" field.
func (iac *InvitationAcceptanceCreate) SetUserID(u uuid.UUID) *InvitationAcceptanceCreate {
	iac.mutation.SetUserID(u)
	return iac
}

// SetInvitationID sets the "invitation_id" field.
func (iac *InvitationAcceptanceCreate) SetInvitationID(u uuid.UUID) *InvitationAcceptanceCreate {
	iac.mutation.SetInvitationID(u)
	return iac
}

// SetCreatedAt sets the "created_at" field.
func (iac *InvitationAcceptanceCreate) SetCreatedAt(t time.Time) *InvitationAcceptanceCreate {
	iac.mutation.SetCreatedAt(t)
	return iac
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (iac *InvitationAcceptanceCreate) SetNillableCreatedAt(t *time.Time) *InvitationAcceptanceCreate {
	if t != nil {
		iac.SetCreatedAt(*t)
	}
	return iac
}

// SetID sets the "id" field.
func (iac *InvitationAcceptanceCreate) SetID(u uuid.UUID) *InvitationAcceptanceCreate {
	iac.mutation.SetID(u)
	return iac
}

// SetNillableID sets the "id" field if the given value is not nil.
func (iac *InvitationAcceptanceCreate) SetNillableID(u *uuid.UUID) *InvitationAcceptanceCreate {
	if u != nil {
		iac.SetID(*u)
	}
	return iac
}

// SetUser sets the "user" edge to the User entity.
func (iac *InvitationAcceptanceCreate) SetUser(u *User) *InvitationAcceptanceCreate {
	return iac.SetUserID(u.ID)
}

// SetInvitation sets the "invitation" edge to the Invitation entity.
func (iac *InvitationAcceptanceCreate) SetInvitation(i *Invitation) *InvitationAcceptanceCreate {
	return iac.SetInvitationID(i.ID)
}

// Mutation returns the InvitationAcceptanceMutation object of the builder.
func (iac *InvitationAcceptanceCreate) Mutation() *InvitationAcceptanceMutation {
	return iac.mutation
}

// Save creates the InvitationAcceptance in the database.
func (iac *InvitationAcceptanceCreate) Save(ctx context.Context) (*InvitationAcceptance, error) {
	iac.defaults()
	return withHooks[*InvitationAcceptance, InvitationAcceptanceMutation](ctx, iac.sqlSave, iac.mutation, iac.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (iac *InvitationAcceptanceCreate) SaveX(ctx context.Context) *InvitationAcceptance {
	v, err := iac.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (iac *InvitationAcceptanceCreate) Exec(ctx context.Context) error {
	_, err := iac.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (iac *InvitationAcceptanceCreate) ExecX(ctx context.Context) {
	if err := iac.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (iac *InvitationAcceptanceCreate) defaults() {
	if _, ok := iac.mutation.CreatedAt(); !ok {
		v := invitationacceptance.DefaultCreatedAt()
		iac.mutation.SetCreatedAt(v)
	}
	if _, ok := iac.mutation.ID(); !ok {
		v := invitationacceptance.DefaultID()
		iac.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (iac *InvitationAcceptanceCreate) check() error {
	if _, ok := iac.mutation.UserID(); !ok {
		return &ValidationError{Name: "user_id", err: errors.New(`ent: missing required field "InvitationAcceptance.user_id"`)}
	}
	if _, ok := iac.mutation.InvitationID(); !ok {
		return &ValidationError{Name: "invitation_id", err: errors.New(`ent: missing required field "InvitationAcceptance.invitation_id"`)}
	}
	if _, ok := iac.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "InvitationAcceptance.created_at"`)}
	}
	if _, ok := iac.mutation.UserID(); !ok {
		return &ValidationError{Name: "user", err: errors.New(`ent: missing required edge "InvitationAcceptance.user"`)}
	}
	if _, ok := iac.mutation.InvitationID(); !ok {
		return &ValidationError{Name: "invitation", err: errors.New(`ent: missing required edge "InvitationAcceptance.invitation"`)}
	}
	return nil
}

func (iac *InvitationAcceptanceCreate) sqlSave(ctx context.Context) (*InvitationAcceptance, error) {
	if err := iac.check(); err != nil {
		return nil, err
	}
	_node, _spec := iac.createSpec()
	if err := sqlgraph.CreateNode(ctx, iac.driver, _spec); err != nil {
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
	iac.mutation.id = &_node.ID
	iac.mutation.done = true
	return _node, nil
}

func (iac *InvitationAcceptanceCreate) createSpec() (*InvitationAcceptance, *sqlgraph.CreateSpec) {
	var (
		_node = &InvitationAcceptance{config: iac.config}
		_spec = sqlgraph.NewCreateSpec(invitationacceptance.Table, sqlgraph.NewFieldSpec(invitationacceptance.FieldID, field.TypeUUID))
	)
	_spec.OnConflict = iac.conflict
	if id, ok := iac.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := iac.mutation.CreatedAt(); ok {
		_spec.SetField(invitationacceptance.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if nodes := iac.mutation.UserIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   invitationacceptance.UserTable,
			Columns: []string{invitationacceptance.UserColumn},
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
	if nodes := iac.mutation.InvitationIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2O,
			Inverse: false,
			Table:   invitationacceptance.InvitationTable,
			Columns: []string{invitationacceptance.InvitationColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(invitation.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_node.InvitationID = nodes[0]
		_spec.Edges = append(_spec.Edges, edge)
	}
	return _node, _spec
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.InvitationAcceptance.Create().
//		SetUserID(v).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.InvitationAcceptanceUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (iac *InvitationAcceptanceCreate) OnConflict(opts ...sql.ConflictOption) *InvitationAcceptanceUpsertOne {
	iac.conflict = opts
	return &InvitationAcceptanceUpsertOne{
		create: iac,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.InvitationAcceptance.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (iac *InvitationAcceptanceCreate) OnConflictColumns(columns ...string) *InvitationAcceptanceUpsertOne {
	iac.conflict = append(iac.conflict, sql.ConflictColumns(columns...))
	return &InvitationAcceptanceUpsertOne{
		create: iac,
	}
}

type (
	// InvitationAcceptanceUpsertOne is the builder for "upsert"-ing
	//  one InvitationAcceptance node.
	InvitationAcceptanceUpsertOne struct {
		create *InvitationAcceptanceCreate
	}

	// InvitationAcceptanceUpsert is the "OnConflict" setter.
	InvitationAcceptanceUpsert struct {
		*sql.UpdateSet
	}
)

// UpdateNewValues updates the mutable fields using the new values that were set on create except the ID field.
// Using this option is equivalent to using:
//
//	client.InvitationAcceptance.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(invitationacceptance.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *InvitationAcceptanceUpsertOne) UpdateNewValues() *InvitationAcceptanceUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		if _, exists := u.create.mutation.ID(); exists {
			s.SetIgnore(invitationacceptance.FieldID)
		}
		if _, exists := u.create.mutation.UserID(); exists {
			s.SetIgnore(invitationacceptance.FieldUserID)
		}
		if _, exists := u.create.mutation.InvitationID(); exists {
			s.SetIgnore(invitationacceptance.FieldInvitationID)
		}
		if _, exists := u.create.mutation.CreatedAt(); exists {
			s.SetIgnore(invitationacceptance.FieldCreatedAt)
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.InvitationAcceptance.Create().
//	    OnConflict(sql.ResolveWithIgnore()).
//	    Exec(ctx)
func (u *InvitationAcceptanceUpsertOne) Ignore() *InvitationAcceptanceUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *InvitationAcceptanceUpsertOne) DoNothing() *InvitationAcceptanceUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the InvitationAcceptanceCreate.OnConflict
// documentation for more info.
func (u *InvitationAcceptanceUpsertOne) Update(set func(*InvitationAcceptanceUpsert)) *InvitationAcceptanceUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&InvitationAcceptanceUpsert{UpdateSet: update})
	}))
	return u
}

// Exec executes the query.
func (u *InvitationAcceptanceUpsertOne) Exec(ctx context.Context) error {
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for InvitationAcceptanceCreate.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *InvitationAcceptanceUpsertOne) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}

// Exec executes the UPSERT query and returns the inserted/updated ID.
func (u *InvitationAcceptanceUpsertOne) ID(ctx context.Context) (id uuid.UUID, err error) {
	if u.create.driver.Dialect() == dialect.MySQL {
		// In case of "ON CONFLICT", there is no way to get back non-numeric ID
		// fields from the database since MySQL does not support the RETURNING clause.
		return id, errors.New("ent: InvitationAcceptanceUpsertOne.ID is not supported by MySQL driver. Use InvitationAcceptanceUpsertOne.Exec instead")
	}
	node, err := u.create.Save(ctx)
	if err != nil {
		return id, err
	}
	return node.ID, nil
}

// IDX is like ID, but panics if an error occurs.
func (u *InvitationAcceptanceUpsertOne) IDX(ctx context.Context) uuid.UUID {
	id, err := u.ID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// InvitationAcceptanceCreateBulk is the builder for creating many InvitationAcceptance entities in bulk.
type InvitationAcceptanceCreateBulk struct {
	config
	builders []*InvitationAcceptanceCreate
	conflict []sql.ConflictOption
}

// Save creates the InvitationAcceptance entities in the database.
func (iacb *InvitationAcceptanceCreateBulk) Save(ctx context.Context) ([]*InvitationAcceptance, error) {
	specs := make([]*sqlgraph.CreateSpec, len(iacb.builders))
	nodes := make([]*InvitationAcceptance, len(iacb.builders))
	mutators := make([]Mutator, len(iacb.builders))
	for i := range iacb.builders {
		func(i int, root context.Context) {
			builder := iacb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*InvitationAcceptanceMutation)
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
					_, err = mutators[i+1].Mutate(root, iacb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					spec.OnConflict = iacb.conflict
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, iacb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, iacb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (iacb *InvitationAcceptanceCreateBulk) SaveX(ctx context.Context) []*InvitationAcceptance {
	v, err := iacb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (iacb *InvitationAcceptanceCreateBulk) Exec(ctx context.Context) error {
	_, err := iacb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (iacb *InvitationAcceptanceCreateBulk) ExecX(ctx context.Context) {
	if err := iacb.Exec(ctx); err != nil {
		panic(err)
	}
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.InvitationAcceptance.CreateBulk(builders...).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.InvitationAcceptanceUpsert) {
//			SetUserID(v+v).
//		}).
//		Exec(ctx)
func (iacb *InvitationAcceptanceCreateBulk) OnConflict(opts ...sql.ConflictOption) *InvitationAcceptanceUpsertBulk {
	iacb.conflict = opts
	return &InvitationAcceptanceUpsertBulk{
		create: iacb,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.InvitationAcceptance.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (iacb *InvitationAcceptanceCreateBulk) OnConflictColumns(columns ...string) *InvitationAcceptanceUpsertBulk {
	iacb.conflict = append(iacb.conflict, sql.ConflictColumns(columns...))
	return &InvitationAcceptanceUpsertBulk{
		create: iacb,
	}
}

// InvitationAcceptanceUpsertBulk is the builder for "upsert"-ing
// a bulk of InvitationAcceptance nodes.
type InvitationAcceptanceUpsertBulk struct {
	create *InvitationAcceptanceCreateBulk
}

// UpdateNewValues updates the mutable fields using the new values that
// were set on create. Using this option is equivalent to using:
//
//	client.InvitationAcceptance.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(invitationacceptance.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *InvitationAcceptanceUpsertBulk) UpdateNewValues() *InvitationAcceptanceUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		for _, b := range u.create.builders {
			if _, exists := b.mutation.ID(); exists {
				s.SetIgnore(invitationacceptance.FieldID)
			}
			if _, exists := b.mutation.UserID(); exists {
				s.SetIgnore(invitationacceptance.FieldUserID)
			}
			if _, exists := b.mutation.InvitationID(); exists {
				s.SetIgnore(invitationacceptance.FieldInvitationID)
			}
			if _, exists := b.mutation.CreatedAt(); exists {
				s.SetIgnore(invitationacceptance.FieldCreatedAt)
			}
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.InvitationAcceptance.Create().
//		OnConflict(sql.ResolveWithIgnore()).
//		Exec(ctx)
func (u *InvitationAcceptanceUpsertBulk) Ignore() *InvitationAcceptanceUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *InvitationAcceptanceUpsertBulk) DoNothing() *InvitationAcceptanceUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the InvitationAcceptanceCreateBulk.OnConflict
// documentation for more info.
func (u *InvitationAcceptanceUpsertBulk) Update(set func(*InvitationAcceptanceUpsert)) *InvitationAcceptanceUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&InvitationAcceptanceUpsert{UpdateSet: update})
	}))
	return u
}

// Exec executes the query.
func (u *InvitationAcceptanceUpsertBulk) Exec(ctx context.Context) error {
	for i, b := range u.create.builders {
		if len(b.conflict) != 0 {
			return fmt.Errorf("ent: OnConflict was set for builder %d. Set it on the InvitationAcceptanceCreateBulk instead", i)
		}
	}
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for InvitationAcceptanceCreateBulk.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *InvitationAcceptanceUpsertBulk) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}
