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
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationacceptance"
	"github.com/k-yomo/invy/invy_api/ent/invitationdenial"
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/pkg/pgutil"
)

// InvitationUpdate is the builder for updating Invitation entities.
type InvitationUpdate struct {
	config
	hooks    []Hook
	mutation *InvitationMutation
}

// Where appends a list predicates to the InvitationUpdate builder.
func (iu *InvitationUpdate) Where(ps ...predicate.Invitation) *InvitationUpdate {
	iu.mutation.Where(ps...)
	return iu
}

// SetLocation sets the "location" field.
func (iu *InvitationUpdate) SetLocation(s string) *InvitationUpdate {
	iu.mutation.SetLocation(s)
	return iu
}

// SetCoordinate sets the "coordinate" field.
func (iu *InvitationUpdate) SetCoordinate(pp *pgutil.GeoPoint) *InvitationUpdate {
	iu.mutation.SetCoordinate(pp)
	return iu
}

// ClearCoordinate clears the value of the "coordinate" field.
func (iu *InvitationUpdate) ClearCoordinate() *InvitationUpdate {
	iu.mutation.ClearCoordinate()
	return iu
}

// SetComment sets the "comment" field.
func (iu *InvitationUpdate) SetComment(s string) *InvitationUpdate {
	iu.mutation.SetComment(s)
	return iu
}

// SetStartsAt sets the "starts_at" field.
func (iu *InvitationUpdate) SetStartsAt(t time.Time) *InvitationUpdate {
	iu.mutation.SetStartsAt(t)
	return iu
}

// SetStatus sets the "status" field.
func (iu *InvitationUpdate) SetStatus(i invitation.Status) *InvitationUpdate {
	iu.mutation.SetStatus(i)
	return iu
}

// SetNillableStatus sets the "status" field if the given value is not nil.
func (iu *InvitationUpdate) SetNillableStatus(i *invitation.Status) *InvitationUpdate {
	if i != nil {
		iu.SetStatus(*i)
	}
	return iu
}

// SetUpdatedAt sets the "updated_at" field.
func (iu *InvitationUpdate) SetUpdatedAt(t time.Time) *InvitationUpdate {
	iu.mutation.SetUpdatedAt(t)
	return iu
}

// AddInvitationUserIDs adds the "invitation_users" edge to the InvitationUser entity by IDs.
func (iu *InvitationUpdate) AddInvitationUserIDs(ids ...uuid.UUID) *InvitationUpdate {
	iu.mutation.AddInvitationUserIDs(ids...)
	return iu
}

// AddInvitationUsers adds the "invitation_users" edges to the InvitationUser entity.
func (iu *InvitationUpdate) AddInvitationUsers(i ...*InvitationUser) *InvitationUpdate {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iu.AddInvitationUserIDs(ids...)
}

// AddInvitationAcceptanceIDs adds the "invitation_acceptances" edge to the InvitationAcceptance entity by IDs.
func (iu *InvitationUpdate) AddInvitationAcceptanceIDs(ids ...uuid.UUID) *InvitationUpdate {
	iu.mutation.AddInvitationAcceptanceIDs(ids...)
	return iu
}

// AddInvitationAcceptances adds the "invitation_acceptances" edges to the InvitationAcceptance entity.
func (iu *InvitationUpdate) AddInvitationAcceptances(i ...*InvitationAcceptance) *InvitationUpdate {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iu.AddInvitationAcceptanceIDs(ids...)
}

// AddInvitationDenialIDs adds the "invitation_denials" edge to the InvitationDenial entity by IDs.
func (iu *InvitationUpdate) AddInvitationDenialIDs(ids ...uuid.UUID) *InvitationUpdate {
	iu.mutation.AddInvitationDenialIDs(ids...)
	return iu
}

// AddInvitationDenials adds the "invitation_denials" edges to the InvitationDenial entity.
func (iu *InvitationUpdate) AddInvitationDenials(i ...*InvitationDenial) *InvitationUpdate {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iu.AddInvitationDenialIDs(ids...)
}

// Mutation returns the InvitationMutation object of the builder.
func (iu *InvitationUpdate) Mutation() *InvitationMutation {
	return iu.mutation
}

// ClearInvitationUsers clears all "invitation_users" edges to the InvitationUser entity.
func (iu *InvitationUpdate) ClearInvitationUsers() *InvitationUpdate {
	iu.mutation.ClearInvitationUsers()
	return iu
}

// RemoveInvitationUserIDs removes the "invitation_users" edge to InvitationUser entities by IDs.
func (iu *InvitationUpdate) RemoveInvitationUserIDs(ids ...uuid.UUID) *InvitationUpdate {
	iu.mutation.RemoveInvitationUserIDs(ids...)
	return iu
}

// RemoveInvitationUsers removes "invitation_users" edges to InvitationUser entities.
func (iu *InvitationUpdate) RemoveInvitationUsers(i ...*InvitationUser) *InvitationUpdate {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iu.RemoveInvitationUserIDs(ids...)
}

// ClearInvitationAcceptances clears all "invitation_acceptances" edges to the InvitationAcceptance entity.
func (iu *InvitationUpdate) ClearInvitationAcceptances() *InvitationUpdate {
	iu.mutation.ClearInvitationAcceptances()
	return iu
}

// RemoveInvitationAcceptanceIDs removes the "invitation_acceptances" edge to InvitationAcceptance entities by IDs.
func (iu *InvitationUpdate) RemoveInvitationAcceptanceIDs(ids ...uuid.UUID) *InvitationUpdate {
	iu.mutation.RemoveInvitationAcceptanceIDs(ids...)
	return iu
}

// RemoveInvitationAcceptances removes "invitation_acceptances" edges to InvitationAcceptance entities.
func (iu *InvitationUpdate) RemoveInvitationAcceptances(i ...*InvitationAcceptance) *InvitationUpdate {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iu.RemoveInvitationAcceptanceIDs(ids...)
}

// ClearInvitationDenials clears all "invitation_denials" edges to the InvitationDenial entity.
func (iu *InvitationUpdate) ClearInvitationDenials() *InvitationUpdate {
	iu.mutation.ClearInvitationDenials()
	return iu
}

// RemoveInvitationDenialIDs removes the "invitation_denials" edge to InvitationDenial entities by IDs.
func (iu *InvitationUpdate) RemoveInvitationDenialIDs(ids ...uuid.UUID) *InvitationUpdate {
	iu.mutation.RemoveInvitationDenialIDs(ids...)
	return iu
}

// RemoveInvitationDenials removes "invitation_denials" edges to InvitationDenial entities.
func (iu *InvitationUpdate) RemoveInvitationDenials(i ...*InvitationDenial) *InvitationUpdate {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iu.RemoveInvitationDenialIDs(ids...)
}

// Save executes the query and returns the number of nodes affected by the update operation.
func (iu *InvitationUpdate) Save(ctx context.Context) (int, error) {
	iu.defaults()
	return withHooks[int, InvitationMutation](ctx, iu.sqlSave, iu.mutation, iu.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (iu *InvitationUpdate) SaveX(ctx context.Context) int {
	affected, err := iu.Save(ctx)
	if err != nil {
		panic(err)
	}
	return affected
}

// Exec executes the query.
func (iu *InvitationUpdate) Exec(ctx context.Context) error {
	_, err := iu.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (iu *InvitationUpdate) ExecX(ctx context.Context) {
	if err := iu.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (iu *InvitationUpdate) defaults() {
	if _, ok := iu.mutation.UpdatedAt(); !ok {
		v := invitation.UpdateDefaultUpdatedAt()
		iu.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (iu *InvitationUpdate) check() error {
	if v, ok := iu.mutation.Status(); ok {
		if err := invitation.StatusValidator(v); err != nil {
			return &ValidationError{Name: "status", err: fmt.Errorf(`ent: validator failed for field "Invitation.status": %w`, err)}
		}
	}
	if _, ok := iu.mutation.UserID(); iu.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "Invitation.user"`)
	}
	return nil
}

func (iu *InvitationUpdate) sqlSave(ctx context.Context) (n int, err error) {
	if err := iu.check(); err != nil {
		return n, err
	}
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   invitation.Table,
			Columns: invitation.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitation.FieldID,
			},
		},
	}
	if ps := iu.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := iu.mutation.Location(); ok {
		_spec.SetField(invitation.FieldLocation, field.TypeString, value)
	}
	if value, ok := iu.mutation.Coordinate(); ok {
		_spec.SetField(invitation.FieldCoordinate, field.TypeOther, value)
	}
	if iu.mutation.CoordinateCleared() {
		_spec.ClearField(invitation.FieldCoordinate, field.TypeOther)
	}
	if value, ok := iu.mutation.Comment(); ok {
		_spec.SetField(invitation.FieldComment, field.TypeString, value)
	}
	if value, ok := iu.mutation.StartsAt(); ok {
		_spec.SetField(invitation.FieldStartsAt, field.TypeTime, value)
	}
	if iu.mutation.ChatRoomIDCleared() {
		_spec.ClearField(invitation.FieldChatRoomID, field.TypeUUID)
	}
	if value, ok := iu.mutation.Status(); ok {
		_spec.SetField(invitation.FieldStatus, field.TypeEnum, value)
	}
	if value, ok := iu.mutation.UpdatedAt(); ok {
		_spec.SetField(invitation.FieldUpdatedAt, field.TypeTime, value)
	}
	if iu.mutation.InvitationUsersCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationUsersTable,
			Columns: []string{invitation.InvitationUsersColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationuser.FieldID,
				},
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iu.mutation.RemovedInvitationUsersIDs(); len(nodes) > 0 && !iu.mutation.InvitationUsersCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationUsersTable,
			Columns: []string{invitation.InvitationUsersColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationuser.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iu.mutation.InvitationUsersIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationUsersTable,
			Columns: []string{invitation.InvitationUsersColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationuser.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if iu.mutation.InvitationAcceptancesCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationAcceptancesTable,
			Columns: []string{invitation.InvitationAcceptancesColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationacceptance.FieldID,
				},
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iu.mutation.RemovedInvitationAcceptancesIDs(); len(nodes) > 0 && !iu.mutation.InvitationAcceptancesCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationAcceptancesTable,
			Columns: []string{invitation.InvitationAcceptancesColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationacceptance.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iu.mutation.InvitationAcceptancesIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationAcceptancesTable,
			Columns: []string{invitation.InvitationAcceptancesColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationacceptance.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if iu.mutation.InvitationDenialsCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationDenialsTable,
			Columns: []string{invitation.InvitationDenialsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationdenial.FieldID,
				},
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iu.mutation.RemovedInvitationDenialsIDs(); len(nodes) > 0 && !iu.mutation.InvitationDenialsCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationDenialsTable,
			Columns: []string{invitation.InvitationDenialsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationdenial.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iu.mutation.InvitationDenialsIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationDenialsTable,
			Columns: []string{invitation.InvitationDenialsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationdenial.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if n, err = sqlgraph.UpdateNodes(ctx, iu.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{invitation.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return 0, err
	}
	iu.mutation.done = true
	return n, nil
}

// InvitationUpdateOne is the builder for updating a single Invitation entity.
type InvitationUpdateOne struct {
	config
	fields   []string
	hooks    []Hook
	mutation *InvitationMutation
}

// SetLocation sets the "location" field.
func (iuo *InvitationUpdateOne) SetLocation(s string) *InvitationUpdateOne {
	iuo.mutation.SetLocation(s)
	return iuo
}

// SetCoordinate sets the "coordinate" field.
func (iuo *InvitationUpdateOne) SetCoordinate(pp *pgutil.GeoPoint) *InvitationUpdateOne {
	iuo.mutation.SetCoordinate(pp)
	return iuo
}

// ClearCoordinate clears the value of the "coordinate" field.
func (iuo *InvitationUpdateOne) ClearCoordinate() *InvitationUpdateOne {
	iuo.mutation.ClearCoordinate()
	return iuo
}

// SetComment sets the "comment" field.
func (iuo *InvitationUpdateOne) SetComment(s string) *InvitationUpdateOne {
	iuo.mutation.SetComment(s)
	return iuo
}

// SetStartsAt sets the "starts_at" field.
func (iuo *InvitationUpdateOne) SetStartsAt(t time.Time) *InvitationUpdateOne {
	iuo.mutation.SetStartsAt(t)
	return iuo
}

// SetStatus sets the "status" field.
func (iuo *InvitationUpdateOne) SetStatus(i invitation.Status) *InvitationUpdateOne {
	iuo.mutation.SetStatus(i)
	return iuo
}

// SetNillableStatus sets the "status" field if the given value is not nil.
func (iuo *InvitationUpdateOne) SetNillableStatus(i *invitation.Status) *InvitationUpdateOne {
	if i != nil {
		iuo.SetStatus(*i)
	}
	return iuo
}

// SetUpdatedAt sets the "updated_at" field.
func (iuo *InvitationUpdateOne) SetUpdatedAt(t time.Time) *InvitationUpdateOne {
	iuo.mutation.SetUpdatedAt(t)
	return iuo
}

// AddInvitationUserIDs adds the "invitation_users" edge to the InvitationUser entity by IDs.
func (iuo *InvitationUpdateOne) AddInvitationUserIDs(ids ...uuid.UUID) *InvitationUpdateOne {
	iuo.mutation.AddInvitationUserIDs(ids...)
	return iuo
}

// AddInvitationUsers adds the "invitation_users" edges to the InvitationUser entity.
func (iuo *InvitationUpdateOne) AddInvitationUsers(i ...*InvitationUser) *InvitationUpdateOne {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iuo.AddInvitationUserIDs(ids...)
}

// AddInvitationAcceptanceIDs adds the "invitation_acceptances" edge to the InvitationAcceptance entity by IDs.
func (iuo *InvitationUpdateOne) AddInvitationAcceptanceIDs(ids ...uuid.UUID) *InvitationUpdateOne {
	iuo.mutation.AddInvitationAcceptanceIDs(ids...)
	return iuo
}

// AddInvitationAcceptances adds the "invitation_acceptances" edges to the InvitationAcceptance entity.
func (iuo *InvitationUpdateOne) AddInvitationAcceptances(i ...*InvitationAcceptance) *InvitationUpdateOne {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iuo.AddInvitationAcceptanceIDs(ids...)
}

// AddInvitationDenialIDs adds the "invitation_denials" edge to the InvitationDenial entity by IDs.
func (iuo *InvitationUpdateOne) AddInvitationDenialIDs(ids ...uuid.UUID) *InvitationUpdateOne {
	iuo.mutation.AddInvitationDenialIDs(ids...)
	return iuo
}

// AddInvitationDenials adds the "invitation_denials" edges to the InvitationDenial entity.
func (iuo *InvitationUpdateOne) AddInvitationDenials(i ...*InvitationDenial) *InvitationUpdateOne {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iuo.AddInvitationDenialIDs(ids...)
}

// Mutation returns the InvitationMutation object of the builder.
func (iuo *InvitationUpdateOne) Mutation() *InvitationMutation {
	return iuo.mutation
}

// ClearInvitationUsers clears all "invitation_users" edges to the InvitationUser entity.
func (iuo *InvitationUpdateOne) ClearInvitationUsers() *InvitationUpdateOne {
	iuo.mutation.ClearInvitationUsers()
	return iuo
}

// RemoveInvitationUserIDs removes the "invitation_users" edge to InvitationUser entities by IDs.
func (iuo *InvitationUpdateOne) RemoveInvitationUserIDs(ids ...uuid.UUID) *InvitationUpdateOne {
	iuo.mutation.RemoveInvitationUserIDs(ids...)
	return iuo
}

// RemoveInvitationUsers removes "invitation_users" edges to InvitationUser entities.
func (iuo *InvitationUpdateOne) RemoveInvitationUsers(i ...*InvitationUser) *InvitationUpdateOne {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iuo.RemoveInvitationUserIDs(ids...)
}

// ClearInvitationAcceptances clears all "invitation_acceptances" edges to the InvitationAcceptance entity.
func (iuo *InvitationUpdateOne) ClearInvitationAcceptances() *InvitationUpdateOne {
	iuo.mutation.ClearInvitationAcceptances()
	return iuo
}

// RemoveInvitationAcceptanceIDs removes the "invitation_acceptances" edge to InvitationAcceptance entities by IDs.
func (iuo *InvitationUpdateOne) RemoveInvitationAcceptanceIDs(ids ...uuid.UUID) *InvitationUpdateOne {
	iuo.mutation.RemoveInvitationAcceptanceIDs(ids...)
	return iuo
}

// RemoveInvitationAcceptances removes "invitation_acceptances" edges to InvitationAcceptance entities.
func (iuo *InvitationUpdateOne) RemoveInvitationAcceptances(i ...*InvitationAcceptance) *InvitationUpdateOne {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iuo.RemoveInvitationAcceptanceIDs(ids...)
}

// ClearInvitationDenials clears all "invitation_denials" edges to the InvitationDenial entity.
func (iuo *InvitationUpdateOne) ClearInvitationDenials() *InvitationUpdateOne {
	iuo.mutation.ClearInvitationDenials()
	return iuo
}

// RemoveInvitationDenialIDs removes the "invitation_denials" edge to InvitationDenial entities by IDs.
func (iuo *InvitationUpdateOne) RemoveInvitationDenialIDs(ids ...uuid.UUID) *InvitationUpdateOne {
	iuo.mutation.RemoveInvitationDenialIDs(ids...)
	return iuo
}

// RemoveInvitationDenials removes "invitation_denials" edges to InvitationDenial entities.
func (iuo *InvitationUpdateOne) RemoveInvitationDenials(i ...*InvitationDenial) *InvitationUpdateOne {
	ids := make([]uuid.UUID, len(i))
	for j := range i {
		ids[j] = i[j].ID
	}
	return iuo.RemoveInvitationDenialIDs(ids...)
}

// Select allows selecting one or more fields (columns) of the returned entity.
// The default is selecting all fields defined in the entity schema.
func (iuo *InvitationUpdateOne) Select(field string, fields ...string) *InvitationUpdateOne {
	iuo.fields = append([]string{field}, fields...)
	return iuo
}

// Save executes the query and returns the updated Invitation entity.
func (iuo *InvitationUpdateOne) Save(ctx context.Context) (*Invitation, error) {
	iuo.defaults()
	return withHooks[*Invitation, InvitationMutation](ctx, iuo.sqlSave, iuo.mutation, iuo.hooks)
}

// SaveX is like Save, but panics if an error occurs.
func (iuo *InvitationUpdateOne) SaveX(ctx context.Context) *Invitation {
	node, err := iuo.Save(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// Exec executes the query on the entity.
func (iuo *InvitationUpdateOne) Exec(ctx context.Context) error {
	_, err := iuo.Save(ctx)
	return err
}

// ExecX is like Exec, but panics if an error occurs.
func (iuo *InvitationUpdateOne) ExecX(ctx context.Context) {
	if err := iuo.Exec(ctx); err != nil {
		panic(err)
	}
}

// defaults sets the default values of the builder before save.
func (iuo *InvitationUpdateOne) defaults() {
	if _, ok := iuo.mutation.UpdatedAt(); !ok {
		v := invitation.UpdateDefaultUpdatedAt()
		iuo.mutation.SetUpdatedAt(v)
	}
}

// check runs all checks and user-defined validators on the builder.
func (iuo *InvitationUpdateOne) check() error {
	if v, ok := iuo.mutation.Status(); ok {
		if err := invitation.StatusValidator(v); err != nil {
			return &ValidationError{Name: "status", err: fmt.Errorf(`ent: validator failed for field "Invitation.status": %w`, err)}
		}
	}
	if _, ok := iuo.mutation.UserID(); iuo.mutation.UserCleared() && !ok {
		return errors.New(`ent: clearing a required unique edge "Invitation.user"`)
	}
	return nil
}

func (iuo *InvitationUpdateOne) sqlSave(ctx context.Context) (_node *Invitation, err error) {
	if err := iuo.check(); err != nil {
		return _node, err
	}
	_spec := &sqlgraph.UpdateSpec{
		Node: &sqlgraph.NodeSpec{
			Table:   invitation.Table,
			Columns: invitation.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitation.FieldID,
			},
		},
	}
	id, ok := iuo.mutation.ID()
	if !ok {
		return nil, &ValidationError{Name: "id", err: errors.New(`ent: missing "Invitation.id" for update`)}
	}
	_spec.Node.ID.Value = id
	if fields := iuo.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, invitation.FieldID)
		for _, f := range fields {
			if !invitation.ValidColumn(f) {
				return nil, &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
			}
			if f != invitation.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, f)
			}
		}
	}
	if ps := iuo.mutation.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if value, ok := iuo.mutation.Location(); ok {
		_spec.SetField(invitation.FieldLocation, field.TypeString, value)
	}
	if value, ok := iuo.mutation.Coordinate(); ok {
		_spec.SetField(invitation.FieldCoordinate, field.TypeOther, value)
	}
	if iuo.mutation.CoordinateCleared() {
		_spec.ClearField(invitation.FieldCoordinate, field.TypeOther)
	}
	if value, ok := iuo.mutation.Comment(); ok {
		_spec.SetField(invitation.FieldComment, field.TypeString, value)
	}
	if value, ok := iuo.mutation.StartsAt(); ok {
		_spec.SetField(invitation.FieldStartsAt, field.TypeTime, value)
	}
	if iuo.mutation.ChatRoomIDCleared() {
		_spec.ClearField(invitation.FieldChatRoomID, field.TypeUUID)
	}
	if value, ok := iuo.mutation.Status(); ok {
		_spec.SetField(invitation.FieldStatus, field.TypeEnum, value)
	}
	if value, ok := iuo.mutation.UpdatedAt(); ok {
		_spec.SetField(invitation.FieldUpdatedAt, field.TypeTime, value)
	}
	if iuo.mutation.InvitationUsersCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationUsersTable,
			Columns: []string{invitation.InvitationUsersColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationuser.FieldID,
				},
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iuo.mutation.RemovedInvitationUsersIDs(); len(nodes) > 0 && !iuo.mutation.InvitationUsersCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationUsersTable,
			Columns: []string{invitation.InvitationUsersColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationuser.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iuo.mutation.InvitationUsersIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationUsersTable,
			Columns: []string{invitation.InvitationUsersColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationuser.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if iuo.mutation.InvitationAcceptancesCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationAcceptancesTable,
			Columns: []string{invitation.InvitationAcceptancesColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationacceptance.FieldID,
				},
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iuo.mutation.RemovedInvitationAcceptancesIDs(); len(nodes) > 0 && !iuo.mutation.InvitationAcceptancesCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationAcceptancesTable,
			Columns: []string{invitation.InvitationAcceptancesColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationacceptance.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iuo.mutation.InvitationAcceptancesIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationAcceptancesTable,
			Columns: []string{invitation.InvitationAcceptancesColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationacceptance.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	if iuo.mutation.InvitationDenialsCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationDenialsTable,
			Columns: []string{invitation.InvitationDenialsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationdenial.FieldID,
				},
			},
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iuo.mutation.RemovedInvitationDenialsIDs(); len(nodes) > 0 && !iuo.mutation.InvitationDenialsCleared() {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationDenialsTable,
			Columns: []string{invitation.InvitationDenialsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationdenial.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Clear = append(_spec.Edges.Clear, edge)
	}
	if nodes := iuo.mutation.InvitationDenialsIDs(); len(nodes) > 0 {
		edge := &sqlgraph.EdgeSpec{
			Rel:     sqlgraph.O2M,
			Inverse: true,
			Table:   invitation.InvitationDenialsTable,
			Columns: []string{invitation.InvitationDenialsColumn},
			Bidi:    false,
			Target: &sqlgraph.EdgeTarget{
				IDSpec: &sqlgraph.FieldSpec{
					Type:   field.TypeUUID,
					Column: invitationdenial.FieldID,
				},
			},
		}
		for _, k := range nodes {
			edge.Target.Nodes = append(edge.Target.Nodes, k)
		}
		_spec.Edges.Add = append(_spec.Edges.Add, edge)
	}
	_node = &Invitation{config: iuo.config}
	_spec.Assign = _node.assignValues
	_spec.ScanValues = _node.scanValues
	if err = sqlgraph.UpdateNode(ctx, iuo.driver, _spec); err != nil {
		if _, ok := err.(*sqlgraph.NotFoundError); ok {
			err = &NotFoundError{invitation.Label}
		} else if sqlgraph.IsConstraintError(err) {
			err = &ConstraintError{msg: err.Error(), wrap: err}
		}
		return nil, err
	}
	iuo.mutation.done = true
	return _node, nil
}
