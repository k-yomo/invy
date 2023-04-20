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
	"github.com/k-yomo/invy/invy_api/ent/account"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// AccountCreate is the builder for creating a Account entity.
type AccountCreate struct {
	config
	mutation *AccountMutation
	hooks    []Hook
	conflict []sql.ConflictOption
}

// SetAuthID sets the "auth_id" field.
func (ac *AccountCreate) SetAuthID(s string) *AccountCreate {
	ac.mutation.SetAuthID(s)
	return ac
}

// SetEmail sets the "email" field.
func (ac *AccountCreate) SetEmail(s string) *AccountCreate {
	ac.mutation.SetEmail(s)
	return ac
}

// SetNillableEmail sets the "email" field if the given value is not nil.
func (ac *AccountCreate) SetNillableEmail(s *string) *AccountCreate {
	if s != nil {
		ac.SetEmail(*s)
	}
	return ac
}

// SetPhoneNumber sets the "phone_number" field.
func (ac *AccountCreate) SetPhoneNumber(s string) *AccountCreate {
	ac.mutation.SetPhoneNumber(s)
	return ac
}

// SetNillablePhoneNumber sets the "phone_number" field if the given value is not nil.
func (ac *AccountCreate) SetNillablePhoneNumber(s *string) *AccountCreate {
	if s != nil {
		ac.SetPhoneNumber(*s)
	}
	return ac
}

// SetStatus sets the "status" field.
func (ac *AccountCreate) SetStatus(a account.Status) *AccountCreate {
	ac.mutation.SetStatus(a)
	return ac
}

// SetNillableStatus sets the "status" field if the given value is not nil.
func (ac *AccountCreate) SetNillableStatus(a *account.Status) *AccountCreate {
	if a != nil {
		ac.SetStatus(*a)
	}
	return ac
}

// SetCreatedAt sets the "created_at" field.
func (ac *AccountCreate) SetCreatedAt(t time.Time) *AccountCreate {
	ac.mutation.SetCreatedAt(t)
	return ac
}

// SetNillableCreatedAt sets the "created_at" field if the given value is not nil.
func (ac *AccountCreate) SetNillableCreatedAt(t *time.Time) *AccountCreate {
	if t != nil {
		ac.SetCreatedAt(*t)
	}
	return ac
}

// SetID sets the "id" field.
func (ac *AccountCreate) SetID(u uuid.UUID) *AccountCreate {
	ac.mutation.SetID(u)
	return ac
}

// SetNillableID sets the "id" field if the given value is not nil.
func (ac *AccountCreate) SetNillableID(u *uuid.UUID) *AccountCreate {
	if u != nil {
		ac.SetID(*u)
	}
	return ac
}

// AddUserIDs adds the "users" edge to the User entity by IDs.
func (ac *AccountCreate) AddUserIDs(ids ...uuid.UUID) *AccountCreate {
	ac.mutation.AddUserIDs(ids...)
	return ac
}

// AddUsers adds the "users" edges to the User entity.
func (ac *AccountCreate) AddUsers(u ...*User) *AccountCreate {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return ac.AddUserIDs(ids...)
}

// Mutation returns the AccountMutation object of the builder.
func (ac *AccountCreate) Mutation() *AccountMutation {
	return ac.mutation
}

// Save creates the Account in the database.
func (ac *AccountCreate) Save(ctx context.Context) (*Account, error) {
	ac.defaults()
	return withHooks[*Account, AccountMutation](ctx, ac.sqlSave, ac.mutation, ac.hooks)
}

// SaveX calls Save and panics if Save returns an error.
func (ac *AccountCreate) SaveX(ctx context.Context) *Account {
	v, err := ac.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (ac *AccountCreate) Exec(ctx context.Context) error {
	_, err := ac.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (ac *AccountCreate) ExecX(ctx context.Context) {
	if err := ac.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (ac *AccountCreate) defaults() {
	if _, ok := ac.mutation.Status(); !ok {
		v := account.DefaultStatus
		ac.mutation.SetStatus(v)
	}
	if _, ok := ac.mutation.CreatedAt(); !ok {
		v := account.DefaultCreatedAt()
		ac.mutation.SetCreatedAt(v)
	}
	if _, ok := ac.mutation.ID(); !ok {
		v := account.DefaultID()
		ac.mutation.SetID(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (ac *AccountCreate) check() error {
	if _, ok := ac.mutation.AuthID(); !ok {
		return &ValidationError{Name: "auth_id", err: errors.New(`ent: missing required field "Account.auth_id"`)}
	}
	if _, ok := ac.mutation.Status(); !ok {
		return &ValidationError{Name: "status", err: errors.New(`ent: missing required field "Account.status"`)}
	}
	if v, ok := ac.mutation.Status(); ok {
		if err := account.StatusValidator(v); err != nil {
			return &ValidationError{Name: "status", err: fmt.Errorf(`ent: validator failed for field "Account.status": %w`, err)}
		}
	}
	if _, ok := ac.mutation.CreatedAt(); !ok {
		return &ValidationError{Name: "created_at", err: errors.New(`ent: missing required field "Account.created_at"`)}
	}
	return nil
}

func (ac *AccountCreate) sqlSave(ctx context.Context) (*Account, error) {
	if err := ac.check(); err != nil {
		return nil, err
	}
	_node, _spec := ac.createSpec()
	if err := sqlgraph.CreateNode(ctx, ac.driver, _spec); err != nil {
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
	ac.mutation.id = &_node.ID
	ac.mutation.done = true
	return _node, nil
}

func (ac *AccountCreate) createSpec() (*Account, *sqlgraph.CreateSpec) {
	var (
		_node = &Account{config: ac.config}
		_spec = sqlgraph.NewCreateSpec(account.Table, sqlgraph.NewFieldSpec(account.FieldID, field.TypeUUID))
	)
	_spec.OnConflict = ac.conflict
	if id, ok := ac.mutation.ID(); ok {
		_node.ID = id
		_spec.ID.Value = &id
	}
	if value, ok := ac.mutation.AuthID(); ok {
		_spec.SetField(account.FieldAuthID, field.TypeString, value)
		_node.AuthID = value
	}
	if value, ok := ac.mutation.Email(); ok {
		_spec.SetField(account.FieldEmail, field.TypeString, value)
		_node.Email = &value
	}
	if value, ok := ac.mutation.PhoneNumber(); ok {
		_spec.SetField(account.FieldPhoneNumber, field.TypeString, value)
		_node.PhoneNumber = &value
	}
	if value, ok := ac.mutation.Status(); ok {
		_spec.SetField(account.FieldStatus, field.TypeEnum, value)
		_node.Status = value
	}
	if value, ok := ac.mutation.CreatedAt(); ok {
		_spec.SetField(account.FieldCreatedAt, field.TypeTime, value)
		_node.CreatedAt = value
	}
	if nodes := ac.mutation.UsersIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   account.UsersTable,
			Columns: []string{account.UsersColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
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
//	client.Account.Create().
//		SetAuthID(v).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.AccountUpsert) {
//			SetAuthID(v+v).
//		}).
//		Exec(ctx)
func (ac *AccountCreate) OnConflict(opts ...sql.ConflictOption) *AccountUpsertOne {
	ac.conflict = opts
	return &AccountUpsertOne{
		create: ac,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.Account.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (ac *AccountCreate) OnConflictColumns(columns ...string) *AccountUpsertOne {
	ac.conflict = append(ac.conflict, sql.ConflictColumns(columns...))
	return &AccountUpsertOne{
		create: ac,
	}
}

type (
	// AccountUpsertOne is the builder for "upsert"-ing
	//  one Account node.
	AccountUpsertOne struct {
		create *AccountCreate
	}

	// AccountUpsert is the "OnConflict" setter.
	AccountUpsert struct {
		*sql.UpdateSet
	}
)

// SetEmail sets the "email" field.
func (u *AccountUpsert) SetEmail(v string) *AccountUpsert {
	u.Set(account.FieldEmail, v)
	return u
}

// UpdateEmail sets the "email" field to the value that was provided on create.
func (u *AccountUpsert) UpdateEmail() *AccountUpsert {
	u.SetExcluded(account.FieldEmail)
	return u
}

// ClearEmail clears the value of the "email" field.
func (u *AccountUpsert) ClearEmail() *AccountUpsert {
	u.SetNull(account.FieldEmail)
	return u
}

// SetPhoneNumber sets the "phone_number" field.
func (u *AccountUpsert) SetPhoneNumber(v string) *AccountUpsert {
	u.Set(account.FieldPhoneNumber, v)
	return u
}

// UpdatePhoneNumber sets the "phone_number" field to the value that was provided on create.
func (u *AccountUpsert) UpdatePhoneNumber() *AccountUpsert {
	u.SetExcluded(account.FieldPhoneNumber)
	return u
}

// ClearPhoneNumber clears the value of the "phone_number" field.
func (u *AccountUpsert) ClearPhoneNumber() *AccountUpsert {
	u.SetNull(account.FieldPhoneNumber)
	return u
}

// SetStatus sets the "status" field.
func (u *AccountUpsert) SetStatus(v account.Status) *AccountUpsert {
	u.Set(account.FieldStatus, v)
	return u
}

// UpdateStatus sets the "status" field to the value that was provided on create.
func (u *AccountUpsert) UpdateStatus() *AccountUpsert {
	u.SetExcluded(account.FieldStatus)
	return u
}

// UpdateNewValues updates the mutable fields using the new values that were set on create except the ID field.
// Using this option is equivalent to using:
//
//	client.Account.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(account.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *AccountUpsertOne) UpdateNewValues() *AccountUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		if _, exists := u.create.mutation.ID(); exists {
			s.SetIgnore(account.FieldID)
		}
		if _, exists := u.create.mutation.AuthID(); exists {
			s.SetIgnore(account.FieldAuthID)
		}
		if _, exists := u.create.mutation.CreatedAt(); exists {
			s.SetIgnore(account.FieldCreatedAt)
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.Account.Create().
//	    OnConflict(sql.ResolveWithIgnore()).
//	    Exec(ctx)
func (u *AccountUpsertOne) Ignore() *AccountUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *AccountUpsertOne) DoNothing() *AccountUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the AccountCreate.OnConflict
// documentation for more info.
func (u *AccountUpsertOne) Update(set func(*AccountUpsert)) *AccountUpsertOne {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&AccountUpsert{UpdateSet: update})
	}))
	return u
}

// SetEmail sets the "email" field.
func (u *AccountUpsertOne) SetEmail(v string) *AccountUpsertOne {
	return u.Update(func(s *AccountUpsert) {
		s.SetEmail(v)
	})
}

// UpdateEmail sets the "email" field to the value that was provided on create.
func (u *AccountUpsertOne) UpdateEmail() *AccountUpsertOne {
	return u.Update(func(s *AccountUpsert) {
		s.UpdateEmail()
	})
}

// ClearEmail clears the value of the "email" field.
func (u *AccountUpsertOne) ClearEmail() *AccountUpsertOne {
	return u.Update(func(s *AccountUpsert) {
		s.ClearEmail()
	})
}

// SetPhoneNumber sets the "phone_number" field.
func (u *AccountUpsertOne) SetPhoneNumber(v string) *AccountUpsertOne {
	return u.Update(func(s *AccountUpsert) {
		s.SetPhoneNumber(v)
	})
}

// UpdatePhoneNumber sets the "phone_number" field to the value that was provided on create.
func (u *AccountUpsertOne) UpdatePhoneNumber() *AccountUpsertOne {
	return u.Update(func(s *AccountUpsert) {
		s.UpdatePhoneNumber()
	})
}

// ClearPhoneNumber clears the value of the "phone_number" field.
func (u *AccountUpsertOne) ClearPhoneNumber() *AccountUpsertOne {
	return u.Update(func(s *AccountUpsert) {
		s.ClearPhoneNumber()
	})
}

// SetStatus sets the "status" field.
func (u *AccountUpsertOne) SetStatus(v account.Status) *AccountUpsertOne {
	return u.Update(func(s *AccountUpsert) {
		s.SetStatus(v)
	})
}

// UpdateStatus sets the "status" field to the value that was provided on create.
func (u *AccountUpsertOne) UpdateStatus() *AccountUpsertOne {
	return u.Update(func(s *AccountUpsert) {
		s.UpdateStatus()
	})
}

// Exec executes the query.
func (u *AccountUpsertOne) Exec(ctx context.Context) error {
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for AccountCreate.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *AccountUpsertOne) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}

// Exec executes the UPSERT query and returns the inserted/updated ID.
func (u *AccountUpsertOne) ID(ctx context.Context) (id uuid.UUID, err error) {
	if u.create.driver.Dialect() == dialect.MySQL {
		// In case of "ON CONFLICT", there is no way to get back non-numeric ID
		// fields from the database since MySQL does not support the RETURNING clause.
		return id, errors.New("ent: AccountUpsertOne.ID is not supported by MySQL driver. Use AccountUpsertOne.Exec instead")
	}
	node, err := u.create.Save(ctx)
	if err != nil {
		return id, err
	}
	return node.ID, nil
}

// IDX is like ID, but panics if an error occurs.
func (u *AccountUpsertOne) IDX(ctx context.Context) uuid.UUID {
	id, err := u.ID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// AccountCreateBulk is the builder for creating many Account entities in bulk.
type AccountCreateBulk struct {
	config
	builders []*AccountCreate
	conflict []sql.ConflictOption
}

// Save creates the Account entities in the database.
func (acb *AccountCreateBulk) Save(ctx context.Context) ([]*Account, error) {
	specs := make([]*sqlgraph.CreateSpec, len(acb.builders))
	nodes := make([]*Account, len(acb.builders))
	mutators := make([]Mutator, len(acb.builders))
	for i := range acb.builders {
		func(i int, root context.Context) {
			builder := acb.builders[i]
			builder.defaults()
			var mut Mutator = MutateFunc(func(ctx context.Context, m Mutation) (Value, error) {
				mutation, ok := m.(*AccountMutation)
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
					_, err = mutators[i+1].Mutate(root, acb.builders[i+1].mutation)
				} else {
					spec := &sqlgraph.BatchCreateSpec{Nodes: specs}
					spec.OnConflict = acb.conflict
					// Invoke the actual operation on the latest mutation in the chain.
					if err = sqlgraph.BatchCreate(ctx, acb.driver, spec); err != nil {
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
		if _, err := mutators[0].Mutate(ctx, acb.builders[0].mutation); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

// SaveX is like Save, but panics if an error occurs.
func (acb *AccountCreateBulk) SaveX(ctx context.Context) []*Account {
	v, err := acb.Save(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Exec executes the query.
func (acb *AccountCreateBulk) Exec(ctx context.Context) error {
	_, err := acb.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (acb *AccountCreateBulk) ExecX(ctx context.Context) {
	if err := acb.Exec(ctx); err != nil {
		panic(err)
	}
}

// OnConflict allows configuring the `ON CONFLICT` / `ON DUPLICATE KEY` clause
// of the `INSERT` statement. For example:
//
//	client.Account.CreateBulk(builders...).
//		OnConflict(
//			// Update the row with the new values
//			// the was proposed for insertion.
//			sql.ResolveWithNewValues(),
//		).
//		// Override some of the fields with custom
//		// update values.
//		Update(func(u *ent.AccountUpsert) {
//			SetAuthID(v+v).
//		}).
//		Exec(ctx)
func (acb *AccountCreateBulk) OnConflict(opts ...sql.ConflictOption) *AccountUpsertBulk {
	acb.conflict = opts
	return &AccountUpsertBulk{
		create: acb,
	}
}

// OnConflictColumns calls `OnConflict` and configures the columns
// as conflict target. Using this option is equivalent to using:
//
//	client.Account.Create().
//		OnConflict(sql.ConflictColumns(columns...)).
//		Exec(ctx)
func (acb *AccountCreateBulk) OnConflictColumns(columns ...string) *AccountUpsertBulk {
	acb.conflict = append(acb.conflict, sql.ConflictColumns(columns...))
	return &AccountUpsertBulk{
		create: acb,
	}
}

// AccountUpsertBulk is the builder for "upsert"-ing
// a bulk of Account nodes.
type AccountUpsertBulk struct {
	create *AccountCreateBulk
}

// UpdateNewValues updates the mutable fields using the new values that
// were set on create. Using this option is equivalent to using:
//
//	client.Account.Create().
//		OnConflict(
//			sql.ResolveWithNewValues(),
//			sql.ResolveWith(func(u *sql.UpdateSet) {
//				u.SetIgnore(account.FieldID)
//			}),
//		).
//		Exec(ctx)
func (u *AccountUpsertBulk) UpdateNewValues() *AccountUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithNewValues())
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(s *sql.UpdateSet) {
		for _, b := range u.create.builders {
			if _, exists := b.mutation.ID(); exists {
				s.SetIgnore(account.FieldID)
			}
			if _, exists := b.mutation.AuthID(); exists {
				s.SetIgnore(account.FieldAuthID)
			}
			if _, exists := b.mutation.CreatedAt(); exists {
				s.SetIgnore(account.FieldCreatedAt)
			}
		}
	}))
	return u
}

// Ignore sets each column to itself in case of conflict.
// Using this option is equivalent to using:
//
//	client.Account.Create().
//		OnConflict(sql.ResolveWithIgnore()).
//		Exec(ctx)
func (u *AccountUpsertBulk) Ignore() *AccountUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWithIgnore())
	return u
}

// DoNothing configures the conflict_action to `DO NOTHING`.
// Supported only by SQLite and PostgreSQL.
func (u *AccountUpsertBulk) DoNothing() *AccountUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.DoNothing())
	return u
}

// Update allows overriding fields `UPDATE` values. See the AccountCreateBulk.OnConflict
// documentation for more info.
func (u *AccountUpsertBulk) Update(set func(*AccountUpsert)) *AccountUpsertBulk {
	u.create.conflict = append(u.create.conflict, sql.ResolveWith(func(update *sql.UpdateSet) {
		set(&AccountUpsert{UpdateSet: update})
	}))
	return u
}

// SetEmail sets the "email" field.
func (u *AccountUpsertBulk) SetEmail(v string) *AccountUpsertBulk {
	return u.Update(func(s *AccountUpsert) {
		s.SetEmail(v)
	})
}

// UpdateEmail sets the "email" field to the value that was provided on create.
func (u *AccountUpsertBulk) UpdateEmail() *AccountUpsertBulk {
	return u.Update(func(s *AccountUpsert) {
		s.UpdateEmail()
	})
}

// ClearEmail clears the value of the "email" field.
func (u *AccountUpsertBulk) ClearEmail() *AccountUpsertBulk {
	return u.Update(func(s *AccountUpsert) {
		s.ClearEmail()
	})
}

// SetPhoneNumber sets the "phone_number" field.
func (u *AccountUpsertBulk) SetPhoneNumber(v string) *AccountUpsertBulk {
	return u.Update(func(s *AccountUpsert) {
		s.SetPhoneNumber(v)
	})
}

// UpdatePhoneNumber sets the "phone_number" field to the value that was provided on create.
func (u *AccountUpsertBulk) UpdatePhoneNumber() *AccountUpsertBulk {
	return u.Update(func(s *AccountUpsert) {
		s.UpdatePhoneNumber()
	})
}

// ClearPhoneNumber clears the value of the "phone_number" field.
func (u *AccountUpsertBulk) ClearPhoneNumber() *AccountUpsertBulk {
	return u.Update(func(s *AccountUpsert) {
		s.ClearPhoneNumber()
	})
}

// SetStatus sets the "status" field.
func (u *AccountUpsertBulk) SetStatus(v account.Status) *AccountUpsertBulk {
	return u.Update(func(s *AccountUpsert) {
		s.SetStatus(v)
	})
}

// UpdateStatus sets the "status" field to the value that was provided on create.
func (u *AccountUpsertBulk) UpdateStatus() *AccountUpsertBulk {
	return u.Update(func(s *AccountUpsert) {
		s.UpdateStatus()
	})
}

// Exec executes the query.
func (u *AccountUpsertBulk) Exec(ctx context.Context) error {
	for i, b := range u.create.builders {
		if len(b.conflict) != 0 {
			return fmt.Errorf("ent: OnConflict was set for builder %d. Set it on the AccountCreateBulk instead", i)
		}
	}
	if len(u.create.conflict) == 0 {
		return errors.New("ent: missing options for AccountCreateBulk.OnConflict")
	}
	return u.create.Exec(ctx)
}

// ExecX is like Exec, but panics if an error occurs.
func (u *AccountUpsertBulk) ExecX(ctx context.Context) {
	if err := u.create.Exec(ctx); err != nil {
		panic(err)
	}
}
