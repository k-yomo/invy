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
	"github.com/k-yomo/invy/invy_api/ent/friendgroup"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userfriendgroup"
)

// FriendGroupUpdate is the builder for updating FriendGroup entities.
type FriendGroupUpdate struct {
	config
	hooks    []Hook
	mutation *FriendGroupMutation
}

// Where appends a list predicates to the FriendGroupUpdate builder.
func (fgu *FriendGroupUpdate) Where(ps ...predicate.FriendGroup) *FriendGroupUpdate {
	fgu.mutation.Where(ps...)
	return fgu
}

// SetName sets the "name" field.
func (fgu *FriendGroupUpdate) SetName(s string) *FriendGroupUpdate {
	fgu.mutation.SetName(s)
	return fgu
}

// SetTotalCount sets the "total_count" field.
func (fgu *FriendGroupUpdate) SetTotalCount(i int) *FriendGroupUpdate {
	fgu.mutation.ResetTotalCount()
	fgu.mutation.SetTotalCount(i)
	return fgu
}

// SetNillableTotalCount sets the "total_count" field if the given value is not nil.
func (fgu *FriendGroupUpdate) SetNillableTotalCount(i *int) *FriendGroupUpdate {
	if i != nil {
		fgu.SetTotalCount(*i)
	}
	return fgu
}

// AddTotalCount adds i to the "total_count" field.
func (fgu *FriendGroupUpdate) AddTotalCount(i int) *FriendGroupUpdate {
	fgu.mutation.AddTotalCount(i)
	return fgu
}

// SetUpdatedAt sets the "updated_at" field.
func (fgu *FriendGroupUpdate) SetUpdatedAt(t time.Time) *FriendGroupUpdate {
	fgu.mutation.SetUpdatedAt(t)
	return fgu
}

// AddFriendUserIDs adds the "friend_users" edge to the User entity by IDs.
func (fgu *FriendGroupUpdate) AddFriendUserIDs(ids ...uuid.UUID) *FriendGroupUpdate {
	fgu.mutation.AddFriendUserIDs(ids...)
	return fgu
}

// AddFriendUsers adds the "friend_users" edges to the User entity.
func (fgu *FriendGroupUpdate) AddFriendUsers(u ...*User) *FriendGroupUpdate {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fgu.AddFriendUserIDs(ids...)
}

// AddUserFriendGroupIDs adds the "user_friend_groups" edge to the UserFriendGroup entity by IDs.
func (fgu *FriendGroupUpdate) AddUserFriendGroupIDs(ids ...uuid.UUID) *FriendGroupUpdate {
	fgu.mutation.AddUserFriendGroupIDs(ids...)
	return fgu
}

// AddUserFriendGroups adds the "user_friend_groups" edges to the UserFriendGroup entity.
func (fgu *FriendGroupUpdate) AddUserFriendGroups(u ...*UserFriendGroup) *FriendGroupUpdate {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fgu.AddUserFriendGroupIDs(ids...)
}

// Mutation returns the FriendGroupMutation object of the builder.
func (fgu *FriendGroupUpdate) Mutation() *FriendGroupMutation {
	return fgu.mutation
}

// ClearFriendUsers clears all "friend_users" edges to the User entity.
func (fgu *FriendGroupUpdate) ClearFriendUsers() *FriendGroupUpdate {
	fgu.mutation.ClearFriendUsers()
	return fgu
}

// RemoveFriendUserIDs removes the "friend_users" edge to User entities by IDs.
func (fgu *FriendGroupUpdate) RemoveFriendUserIDs(ids ...uuid.UUID) *FriendGroupUpdate {
	fgu.mutation.RemoveFriendUserIDs(ids...)
	return fgu
}

// RemoveFriendUsers removes "friend_users" edges to User entities.
func (fgu *FriendGroupUpdate) RemoveFriendUsers(u ...*User) *FriendGroupUpdate {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fgu.RemoveFriendUserIDs(ids...)
}

// ClearUserFriendGroups clears all "user_friend_groups" edges to the UserFriendGroup entity.
func (fgu *FriendGroupUpdate) ClearUserFriendGroups() *FriendGroupUpdate {
	fgu.mutation.ClearUserFriendGroups()
	return fgu
}

// RemoveUserFriendGroupIDs removes the "user_friend_groups" edge to UserFriendGroup entities by IDs.
func (fgu *FriendGroupUpdate) RemoveUserFriendGroupIDs(ids ...uuid.UUID) *FriendGroupUpdate {
	fgu.mutation.RemoveUserFriendGroupIDs(ids...)
	return fgu
}

// RemoveUserFriendGroups removes "user_friend_groups" edges to UserFriendGroup entities.
func (fgu *FriendGroupUpdate) RemoveUserFriendGroups(u ...*UserFriendGroup) *FriendGroupUpdate {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fgu.RemoveUserFriendGroupIDs(ids...)
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (fgu *FriendGroupUpdate) Save(ctx context.Context) (int, error) {
	fgu.defaults()
	return withHooks[int, FriendGroupMutation](ctx, fgu.sqlSave, fgu.mutation, fgu.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (fgu *FriendGroupUpdate) SaveX(ctx context.Context) int {
	affected, err := fgu.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (fgu *FriendGroupUpdate) Exec(ctx context.Context) error {
	_, err := fgu.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (fgu *FriendGroupUpdate) ExecX(ctx context.Context) {
	if err := fgu.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (fgu *FriendGroupUpdate) defaults() {
	if _, ok := fgu.mutation.UpdatedAt(); !ok {
		v := friendgroup.UpdateDefaultUpdatedAt()
		fgu.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (fgu *FriendGroupUpdate) check() error {
	if _, ok := fgu.mutation.UserID(); fgu.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "FriendGroup.user"`)
	}
	return nil
}

func (fgu *FriendGroupUpdate) sqlSave(ctx context.Context) (n int, err error) {
	if err := fgu.check(); err != nil {
		return n, err
	}
	_spec := sqlgraph.NewUpdateSpec(friendgroup.Table, friendgroup.Columns, sqlgraph.NewFieldSpec(friendgroup.FieldID, field.TypeUUID))
	if ps := fgu.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := fgu.mutation.Name(); ok {
		_spec.SetField(friendgroup.FieldName, field.TypeString, value)
	}
	if value, ok := fgu.mutation.TotalCount(); ok {
		_spec.SetField(friendgroup.FieldTotalCount, field.TypeInt, value)
	}
	if value, ok := fgu.mutation.AddedTotalCount(); ok {
		_spec.AddField(friendgroup.FieldTotalCount, field.TypeInt, value)
	}
	if value, ok := fgu.mutation.UpdatedAt(); ok {
		_spec.SetField(friendgroup.FieldUpdatedAt, field.TypeTime, value)
	}
	if fgu.mutation.FriendUsersCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2M,
			Inverse: false,
			Table:   friendgroup.FriendUsersTable,
			Columns: friendgroup.FriendUsersPrimaryKey,
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
			},
		}
		createE := &UserFriendGroupCreate{config: fgu.config, mutation: newUserFriendGroupMutation(fgu.config, OpCreate)}
		createE.defaults()
		_, specE := createE.createSpec()
		edge.Target.Fields = specE.Fields
		if specE.ID.Value != nil {
			edge.Target.Fields = append(edge.Target.Fields, specE.ID)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := fgu.mutation.RemovedFriendUsersIDs(); len(nodes) > 0 && !fgu.mutation.FriendUsersCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2M,
			Inverse: false,
			Table:   friendgroup.FriendUsersTable,
			Columns: friendgroup.FriendUsersPrimaryKey,
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		createE := &UserFriendGroupCreate{config: fgu.config, mutation: newUserFriendGroupMutation(fgu.config, OpCreate)}
		createE.defaults()
		_, specE := createE.createSpec()
		edge.Target.Fields = specE.Fields
		if specE.ID.Value != nil {
			edge.Target.Fields = append(edge.Target.Fields, specE.ID)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := fgu.mutation.FriendUsersIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2M,
			Inverse: false,
			Table:   friendgroup.FriendUsersTable,
			Columns: friendgroup.FriendUsersPrimaryKey,
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		createE := &UserFriendGroupCreate{config: fgu.config, mutation: newUserFriendGroupMutation(fgu.config, OpCreate)}
		createE.defaults()
		_, specE := createE.createSpec()
		edge.Target.Fields = specE.Fields
		if specE.ID.Value != nil {
			edge.Target.Fields = append(edge.Target.Fields, specE.ID)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if fgu.mutation.UserFriendGroupsCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   friendgroup.UserFriendGroupsTable,
			Columns: []string{friendgroup.UserFriendGroupsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(userfriendgroup.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := fgu.mutation.RemovedUserFriendGroupsIDs(); len(nodes) > 0 && !fgu.mutation.UserFriendGroupsCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   friendgroup.UserFriendGroupsTable,
			Columns: []string{friendgroup.UserFriendGroupsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(userfriendgroup.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := fgu.mutation.UserFriendGroupsIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   friendgroup.UserFriendGroupsTable,
			Columns: []string{friendgroup.UserFriendGroupsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(userfriendgroup.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if n, err = sqlgraph.UpdateNodes(ctx, fgu.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{friendgroup.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	fgu.mutation.done = true
	return n, nil
}

// FriendGroupUpdateOne is the builder for updating a single FriendGroup entity.
type FriendGroupUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *FriendGroupMutation
}

// SetName sets the "name" field.
func (fguo *FriendGroupUpdateOne) SetName(s string) *FriendGroupUpdateOne {
	fguo.mutation.SetName(s)
	return fguo
}

// SetTotalCount sets the "total_count" field.
func (fguo *FriendGroupUpdateOne) SetTotalCount(i int) *FriendGroupUpdateOne {
	fguo.mutation.ResetTotalCount()
	fguo.mutation.SetTotalCount(i)
	return fguo
}

// SetNillableTotalCount sets the "total_count" field if the given value is not nil.
func (fguo *FriendGroupUpdateOne) SetNillableTotalCount(i *int) *FriendGroupUpdateOne {
	if i != nil {
		fguo.SetTotalCount(*i)
	}
	return fguo
}

// AddTotalCount adds i to the "total_count" field.
func (fguo *FriendGroupUpdateOne) AddTotalCount(i int) *FriendGroupUpdateOne {
	fguo.mutation.AddTotalCount(i)
	return fguo
}

// SetUpdatedAt sets the "updated_at" field.
func (fguo *FriendGroupUpdateOne) SetUpdatedAt(t time.Time) *FriendGroupUpdateOne {
	fguo.mutation.SetUpdatedAt(t)
	return fguo
}

// AddFriendUserIDs adds the "friend_users" edge to the User entity by IDs.
func (fguo *FriendGroupUpdateOne) AddFriendUserIDs(ids ...uuid.UUID) *FriendGroupUpdateOne {
	fguo.mutation.AddFriendUserIDs(ids...)
	return fguo
}

// AddFriendUsers adds the "friend_users" edges to the User entity.
func (fguo *FriendGroupUpdateOne) AddFriendUsers(u ...*User) *FriendGroupUpdateOne {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fguo.AddFriendUserIDs(ids...)
}

// AddUserFriendGroupIDs adds the "user_friend_groups" edge to the UserFriendGroup entity by IDs.
func (fguo *FriendGroupUpdateOne) AddUserFriendGroupIDs(ids ...uuid.UUID) *FriendGroupUpdateOne {
	fguo.mutation.AddUserFriendGroupIDs(ids...)
	return fguo
}

// AddUserFriendGroups adds the "user_friend_groups" edges to the UserFriendGroup entity.
func (fguo *FriendGroupUpdateOne) AddUserFriendGroups(u ...*UserFriendGroup) *FriendGroupUpdateOne {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fguo.AddUserFriendGroupIDs(ids...)
}

// Mutation returns the FriendGroupMutation object of the builder.
func (fguo *FriendGroupUpdateOne) Mutation() *FriendGroupMutation {
	return fguo.mutation
}

// ClearFriendUsers clears all "friend_users" edges to the User entity.
func (fguo *FriendGroupUpdateOne) ClearFriendUsers() *FriendGroupUpdateOne {
	fguo.mutation.ClearFriendUsers()
	return fguo
}

// RemoveFriendUserIDs removes the "friend_users" edge to User entities by IDs.
func (fguo *FriendGroupUpdateOne) RemoveFriendUserIDs(ids ...uuid.UUID) *FriendGroupUpdateOne {
	fguo.mutation.RemoveFriendUserIDs(ids...)
	return fguo
}

// RemoveFriendUsers removes "friend_users" edges to User entities.
func (fguo *FriendGroupUpdateOne) RemoveFriendUsers(u ...*User) *FriendGroupUpdateOne {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fguo.RemoveFriendUserIDs(ids...)
}

// ClearUserFriendGroups clears all "user_friend_groups" edges to the UserFriendGroup entity.
func (fguo *FriendGroupUpdateOne) ClearUserFriendGroups() *FriendGroupUpdateOne {
	fguo.mutation.ClearUserFriendGroups()
	return fguo
}

// RemoveUserFriendGroupIDs removes the "user_friend_groups" edge to UserFriendGroup entities by IDs.
func (fguo *FriendGroupUpdateOne) RemoveUserFriendGroupIDs(ids ...uuid.UUID) *FriendGroupUpdateOne {
	fguo.mutation.RemoveUserFriendGroupIDs(ids...)
	return fguo
}

// RemoveUserFriendGroups removes "user_friend_groups" edges to UserFriendGroup entities.
func (fguo *FriendGroupUpdateOne) RemoveUserFriendGroups(u ...*UserFriendGroup) *FriendGroupUpdateOne {
	ids := make([]uuid.UUID, len(u))
	for i := range u {
		ids[i] = u[i].ID
	}
	return fguo.RemoveUserFriendGroupIDs(ids...)
}

// Where appends a list predicates to the FriendGroupUpdate builder.
func (fguo *FriendGroupUpdateOne) Where(ps ...predicate.FriendGroup) *FriendGroupUpdateOne {
	fguo.mutation.Where(ps...)
	return fguo
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (fguo *FriendGroupUpdateOne) Select(field string, fields ...string) *FriendGroupUpdateOne {
	fguo.fields = append([]string{field}, fields...)
	return fguo
}

// Save executes the query and returns the updated FriendGroup entity.
func (fguo *FriendGroupUpdateOne) Save(ctx context.Context) (*FriendGroup, error) {
	fguo.defaults()
	return withHooks[*FriendGroup, FriendGroupMutation](ctx, fguo.sqlSave, fguo.mutation, fguo.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (fguo *FriendGroupUpdateOne) SaveX(ctx context.Context) *FriendGroup {
	node, err := fguo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (fguo *FriendGroupUpdateOne) Exec(ctx context.Context) error {
	_, err := fguo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (fguo *FriendGroupUpdateOne) ExecX(ctx context.Context) {
	if err := fguo.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (fguo *FriendGroupUpdateOne) defaults() {
	if _, ok := fguo.mutation.UpdatedAt(); !ok {
		v := friendgroup.UpdateDefaultUpdatedAt()
		fguo.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (fguo *FriendGroupUpdateOne) check() error {
	if _, ok := fguo.mutation.UserID(); fguo.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "FriendGroup.user"`)
	}
	return nil
}

func (fguo *FriendGroupUpdateOne) sqlSave(ctx context.Context) (_node *FriendGroup, err error) {
	if err := fguo.check(); err != nil {
		return _node, err
	}
	_spec := sqlgraph.NewUpdateSpec(friendgroup.Table, friendgroup.Columns, sqlgraph.NewFieldSpec(friendgroup.FieldID, field.TypeUUID))
	id, ok := fguo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "FriendGroup.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := fguo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, friendgroup.FieldID)
		for _, f := range fields {
			if !friendgroup.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != friendgroup.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := fguo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := fguo.mutation.Name(); ok {
		_spec.SetField(friendgroup.FieldName, field.TypeString, value)
	}
	if value, ok := fguo.mutation.TotalCount(); ok {
		_spec.SetField(friendgroup.FieldTotalCount, field.TypeInt, value)
	}
	if value, ok := fguo.mutation.AddedTotalCount(); ok {
		_spec.AddField(friendgroup.FieldTotalCount, field.TypeInt, value)
	}
	if value, ok := fguo.mutation.UpdatedAt(); ok {
		_spec.SetField(friendgroup.FieldUpdatedAt, field.TypeTime, value)
	}
	if fguo.mutation.FriendUsersCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2M,
			Inverse: false,
			Table:   friendgroup.FriendUsersTable,
			Columns: friendgroup.FriendUsersPrimaryKey,
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
			},
		}
		createE := &UserFriendGroupCreate{config: fguo.config, mutation: newUserFriendGroupMutation(fguo.config, OpCreate)}
		createE.defaults()
		_, specE := createE.createSpec()
		edge.Target.Fields = specE.Fields
		if specE.ID.Value != nil {
			edge.Target.Fields = append(edge.Target.Fields, specE.ID)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := fguo.mutation.RemovedFriendUsersIDs(); len(nodes) > 0 && !fguo.mutation.FriendUsersCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2M,
			Inverse: false,
			Table:   friendgroup.FriendUsersTable,
			Columns: friendgroup.FriendUsersPrimaryKey,
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		createE := &UserFriendGroupCreate{config: fguo.config, mutation: newUserFriendGroupMutation(fguo.config, OpCreate)}
		createE.defaults()
		_, specE := createE.createSpec()
		edge.Target.Fields = specE.Fields
		if specE.ID.Value != nil {
			edge.Target.Fields = append(edge.Target.Fields, specE.ID)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := fguo.mutation.FriendUsersIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.M2M,
			Inverse: false,
			Table:   friendgroup.FriendUsersTable,
			Columns: friendgroup.FriendUsersPrimaryKey,
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(user.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		createE := &UserFriendGroupCreate{config: fguo.config, mutation: newUserFriendGroupMutation(fguo.config, OpCreate)}
		createE.defaults()
		_, specE := createE.createSpec()
		edge.Target.Fields = specE.Fields
		if specE.ID.Value != nil {
			edge.Target.Fields = append(edge.Target.Fields, specE.ID)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if fguo.mutation.UserFriendGroupsCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   friendgroup.UserFriendGroupsTable,
			Columns: []string{friendgroup.UserFriendGroupsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(userfriendgroup.FieldID, field.TypeUUID),
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := fguo.mutation.RemovedUserFriendGroupsIDs(); len(nodes) > 0 && !fguo.mutation.UserFriendGroupsCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   friendgroup.UserFriendGroupsTable,
			Columns: []string{friendgroup.UserFriendGroupsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(userfriendgroup.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := fguo.mutation.UserFriendGroupsIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   friendgroup.UserFriendGroupsTable,
			Columns: []string{friendgroup.UserFriendGroupsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: sqlgraph.NewFieldSpec(userfriendgroup.FieldID, field.TypeUUID),
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	_node = &FriendGroup{config: fguo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, fguo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{friendgroup.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	fguo.mutation.done = true
	return _node, nil
}
