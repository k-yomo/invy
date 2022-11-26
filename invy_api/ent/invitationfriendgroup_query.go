// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"fmt"
	"math"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"github.com/k-yomo/invy/invy_api/ent/friendgroup"
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationfriendgroup"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
)

// InvitationFriendGroupQuery is the builder for querying InvitationFriendGroup entities.
type InvitationFriendGroupQuery struct {
	config
	limit           *int
	offset          *int
	unique          *bool
	order           []OrderFunc
	fields          []string
	predicates      []predicate.InvitationFriendGroup
	withInvitation  *InvitationQuery
	withFriendGroup *FriendGroupQuery
	modifiers       []func(*sql.Selector)
	loadTotal       []func(context.Context, []*InvitationFriendGroup) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the InvitationFriendGroupQuery builder.
func (ifgq *InvitationFriendGroupQuery) Where(ps ...predicate.InvitationFriendGroup) *InvitationFriendGroupQuery {
	ifgq.predicates = append(ifgq.predicates, ps...)
	return ifgq
}

// Limit adds a limit step to the query.
func (ifgq *InvitationFriendGroupQuery) Limit(limit int) *InvitationFriendGroupQuery {
	ifgq.limit = &limit
	return ifgq
}

// Offset adds an offset step to the query.
func (ifgq *InvitationFriendGroupQuery) Offset(offset int) *InvitationFriendGroupQuery {
	ifgq.offset = &offset
	return ifgq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (ifgq *InvitationFriendGroupQuery) Unique(unique bool) *InvitationFriendGroupQuery {
	ifgq.unique = &unique
	return ifgq
}

// Order adds an order step to the query.
func (ifgq *InvitationFriendGroupQuery) Order(o ...OrderFunc) *InvitationFriendGroupQuery {
	ifgq.order = append(ifgq.order, o...)
	return ifgq
}

// QueryInvitation chains the current query on the "invitation" edge.
func (ifgq *InvitationFriendGroupQuery) QueryInvitation() *InvitationQuery {
	query := &InvitationQuery{config: ifgq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := ifgq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := ifgq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(invitationfriendgroup.Table, invitationfriendgroup.FieldID, selector),
			sqlgraph.To(invitation.Table, invitation.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, invitationfriendgroup.InvitationTable, invitationfriendgroup.InvitationColumn),
		)
		fromU = sqlgraph.SetNeighbors(ifgq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryFriendGroup chains the current query on the "friend_group" edge.
func (ifgq *InvitationFriendGroupQuery) QueryFriendGroup() *FriendGroupQuery {
	query := &FriendGroupQuery{config: ifgq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := ifgq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := ifgq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(invitationfriendgroup.Table, invitationfriendgroup.FieldID, selector),
			sqlgraph.To(friendgroup.Table, friendgroup.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, invitationfriendgroup.FriendGroupTable, invitationfriendgroup.FriendGroupColumn),
		)
		fromU = sqlgraph.SetNeighbors(ifgq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first InvitationFriendGroup entity from the query.
// Returns a *NotFoundError when no InvitationFriendGroup was found.
func (ifgq *InvitationFriendGroupQuery) First(ctx context.Context) (*InvitationFriendGroup, error) {
	nodes, err := ifgq.Limit(1).All(ctx)
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{invitationfriendgroup.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (ifgq *InvitationFriendGroupQuery) FirstX(ctx context.Context) *InvitationFriendGroup {
	node, err := ifgq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first InvitationFriendGroup ID from the query.
// Returns a *NotFoundError when no InvitationFriendGroup ID was found.
func (ifgq *InvitationFriendGroupQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = ifgq.Limit(1).IDs(ctx); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{invitationfriendgroup.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (ifgq *InvitationFriendGroupQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := ifgq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single InvitationFriendGroup entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one InvitationFriendGroup entity is found.
// Returns a *NotFoundError when no InvitationFriendGroup entities are found.
func (ifgq *InvitationFriendGroupQuery) Only(ctx context.Context) (*InvitationFriendGroup, error) {
	nodes, err := ifgq.Limit(2).All(ctx)
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{invitationfriendgroup.Label}
	default:
		return nil, &NotSingularError{invitationfriendgroup.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (ifgq *InvitationFriendGroupQuery) OnlyX(ctx context.Context) *InvitationFriendGroup {
	node, err := ifgq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only InvitationFriendGroup ID in the query.
// Returns a *NotSingularError when more than one InvitationFriendGroup ID is found.
// Returns a *NotFoundError when no entities are found.
func (ifgq *InvitationFriendGroupQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = ifgq.Limit(2).IDs(ctx); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{invitationfriendgroup.Label}
	default:
		err = &NotSingularError{invitationfriendgroup.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (ifgq *InvitationFriendGroupQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := ifgq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of InvitationFriendGroups.
func (ifgq *InvitationFriendGroupQuery) All(ctx context.Context) ([]*InvitationFriendGroup, error) {
	if err := ifgq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	return ifgq.sqlAll(ctx)
}

// AllX is like All, but panics if an error occurs.
func (ifgq *InvitationFriendGroupQuery) AllX(ctx context.Context) []*InvitationFriendGroup {
	nodes, err := ifgq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of InvitationFriendGroup IDs.
func (ifgq *InvitationFriendGroupQuery) IDs(ctx context.Context) ([]uuid.UUID, error) {
	var ids []uuid.UUID
	if err := ifgq.Select(invitationfriendgroup.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (ifgq *InvitationFriendGroupQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := ifgq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (ifgq *InvitationFriendGroupQuery) Count(ctx context.Context) (int, error) {
	if err := ifgq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return ifgq.sqlCount(ctx)
}

// CountX is like Count, but panics if an error occurs.
func (ifgq *InvitationFriendGroupQuery) CountX(ctx context.Context) int {
	count, err := ifgq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (ifgq *InvitationFriendGroupQuery) Exist(ctx context.Context) (bool, error) {
	if err := ifgq.prepareQuery(ctx); err != nil {
		return false, err
	}
	return ifgq.sqlExist(ctx)
}

// ExistX is like Exist, but panics if an error occurs.
func (ifgq *InvitationFriendGroupQuery) ExistX(ctx context.Context) bool {
	exist, err := ifgq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the InvitationFriendGroupQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (ifgq *InvitationFriendGroupQuery) Clone() *InvitationFriendGroupQuery {
	if ifgq == nil {
		return nil
	}
	return &InvitationFriendGroupQuery{
		config:          ifgq.config,
		limit:           ifgq.limit,
		offset:          ifgq.offset,
		order:           append([]OrderFunc{}, ifgq.order...),
		predicates:      append([]predicate.InvitationFriendGroup{}, ifgq.predicates...),
		withInvitation:  ifgq.withInvitation.Clone(),
		withFriendGroup: ifgq.withFriendGroup.Clone(),
		// clone intermediate query.
		sql:    ifgq.sql.Clone(),
		path:   ifgq.path,
		unique: ifgq.unique,
	}
}

// WithInvitation tells the query-builder to eager-load the nodes that are connected to
// the "invitation" edge. The optional arguments are used to configure the query builder of the edge.
func (ifgq *InvitationFriendGroupQuery) WithInvitation(opts ...func(*InvitationQuery)) *InvitationFriendGroupQuery {
	query := &InvitationQuery{config: ifgq.config}
	for _, opt := range opts {
		opt(query)
	}
	ifgq.withInvitation = query
	return ifgq
}

// WithFriendGroup tells the query-builder to eager-load the nodes that are connected to
// the "friend_group" edge. The optional arguments are used to configure the query builder of the edge.
func (ifgq *InvitationFriendGroupQuery) WithFriendGroup(opts ...func(*FriendGroupQuery)) *InvitationFriendGroupQuery {
	query := &FriendGroupQuery{config: ifgq.config}
	for _, opt := range opts {
		opt(query)
	}
	ifgq.withFriendGroup = query
	return ifgq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		InvitationID uuid.UUID `json:"invitation_id,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.InvitationFriendGroup.Query().
//		GroupBy(invitationfriendgroup.FieldInvitationID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (ifgq *InvitationFriendGroupQuery) GroupBy(field string, fields ...string) *InvitationFriendGroupGroupBy {
	grbuild := &InvitationFriendGroupGroupBy{config: ifgq.config}
	grbuild.fields = append([]string{field}, fields...)
	grbuild.path = func(ctx context.Context) (prev *sql.Selector, err error) {
		if err := ifgq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		return ifgq.sqlQuery(ctx), nil
	}
	grbuild.label = invitationfriendgroup.Label
	grbuild.flds, grbuild.scan = &grbuild.fields, grbuild.Scan
	return grbuild
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		InvitationID uuid.UUID `json:"invitation_id,omitempty"`
//	}
//
//	client.InvitationFriendGroup.Query().
//		Select(invitationfriendgroup.FieldInvitationID).
//		Scan(ctx, &v)
func (ifgq *InvitationFriendGroupQuery) Select(fields ...string) *InvitationFriendGroupSelect {
	ifgq.fields = append(ifgq.fields, fields...)
	selbuild := &InvitationFriendGroupSelect{InvitationFriendGroupQuery: ifgq}
	selbuild.label = invitationfriendgroup.Label
	selbuild.flds, selbuild.scan = &ifgq.fields, selbuild.Scan
	return selbuild
}

// Aggregate returns a InvitationFriendGroupSelect configured with the given aggregations.
func (ifgq *InvitationFriendGroupQuery) Aggregate(fns ...AggregateFunc) *InvitationFriendGroupSelect {
	return ifgq.Select().Aggregate(fns...)
}

func (ifgq *InvitationFriendGroupQuery) prepareQuery(ctx context.Context) error {
	for _, f := range ifgq.fields {
		if !invitationfriendgroup.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if ifgq.path != nil {
		prev, err := ifgq.path(ctx)
		if err != nil {
			return err
		}
		ifgq.sql = prev
	}
	return nil
}

func (ifgq *InvitationFriendGroupQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*InvitationFriendGroup, error) {
	var (
		nodes       = []*InvitationFriendGroup{}
		_spec       = ifgq.querySpec()
		loadedTypes = [2]bool{
			ifgq.withInvitation != nil,
			ifgq.withFriendGroup != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*InvitationFriendGroup).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &InvitationFriendGroup{config: ifgq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(ifgq.modifiers) > 0 {
		_spec.Modifiers = ifgq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, ifgq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := ifgq.withInvitation; query != nil {
		if err := ifgq.loadInvitation(ctx, query, nodes, nil,
			func(n *InvitationFriendGroup, e *Invitation) { n.Edges.Invitation = e }); err != nil {
			return nil, err
		}
	}
	if query := ifgq.withFriendGroup; query != nil {
		if err := ifgq.loadFriendGroup(ctx, query, nodes, nil,
			func(n *InvitationFriendGroup, e *FriendGroup) { n.Edges.FriendGroup = e }); err != nil {
			return nil, err
		}
	}
	for i := range ifgq.loadTotal {
		if err := ifgq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (ifgq *InvitationFriendGroupQuery) loadInvitation(ctx context.Context, query *InvitationQuery, nodes []*InvitationFriendGroup, init func(*InvitationFriendGroup), assign func(*InvitationFriendGroup, *Invitation)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*InvitationFriendGroup)
	for i := range nodes {
		fk := nodes[i].InvitationID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	query.Where(invitation.IDIn(ids...))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nodeids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "invitation_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}
func (ifgq *InvitationFriendGroupQuery) loadFriendGroup(ctx context.Context, query *FriendGroupQuery, nodes []*InvitationFriendGroup, init func(*InvitationFriendGroup), assign func(*InvitationFriendGroup, *FriendGroup)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*InvitationFriendGroup)
	for i := range nodes {
		fk := nodes[i].FriendGroupID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	query.Where(friendgroup.IDIn(ids...))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nodeids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "friend_group_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}

func (ifgq *InvitationFriendGroupQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := ifgq.querySpec()
	if len(ifgq.modifiers) > 0 {
		_spec.Modifiers = ifgq.modifiers
	}
	_spec.Node.Columns = ifgq.fields
	if len(ifgq.fields) > 0 {
		_spec.Unique = ifgq.unique != nil && *ifgq.unique
	}
	return sqlgraph.CountNodes(ctx, ifgq.driver, _spec)
}

func (ifgq *InvitationFriendGroupQuery) sqlExist(ctx context.Context) (bool, error) {
	switch _, err := ifgq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

func (ifgq *InvitationFriendGroupQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   invitationfriendgroup.Table,
			Columns: invitationfriendgroup.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitationfriendgroup.FieldID,
			},
		},
		From:   ifgq.sql,
		Unique: true,
	}
	if unique := ifgq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := ifgq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, invitationfriendgroup.FieldID)
		for i := range fields {
			if fields[i] != invitationfriendgroup.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := ifgq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := ifgq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := ifgq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := ifgq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (ifgq *InvitationFriendGroupQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(ifgq.driver.Dialect())
	t1 := builder.Table(invitationfriendgroup.Table)
	columns := ifgq.fields
	if len(columns) == 0 {
		columns = invitationfriendgroup.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if ifgq.sql != nil {
		selector = ifgq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if ifgq.unique != nil && *ifgq.unique {
		selector.Distinct()
	}
	for _, p := range ifgq.predicates {
		p(selector)
	}
	for _, p := range ifgq.order {
		p(selector)
	}
	if offset := ifgq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := ifgq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// InvitationFriendGroupGroupBy is the group-by builder for InvitationFriendGroup entities.
type InvitationFriendGroupGroupBy struct {
	config
	selector
	fields []string
	fns    []AggregateFunc
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Aggregate adds the given aggregation functions to the group-by query.
func (ifggb *InvitationFriendGroupGroupBy) Aggregate(fns ...AggregateFunc) *InvitationFriendGroupGroupBy {
	ifggb.fns = append(ifggb.fns, fns...)
	return ifggb
}

// Scan applies the group-by query and scans the result into the given value.
func (ifggb *InvitationFriendGroupGroupBy) Scan(ctx context.Context, v any) error {
	query, err := ifggb.path(ctx)
	if err != nil {
		return err
	}
	ifggb.sql = query
	return ifggb.sqlScan(ctx, v)
}

func (ifggb *InvitationFriendGroupGroupBy) sqlScan(ctx context.Context, v any) error {
	for _, f := range ifggb.fields {
		if !invitationfriendgroup.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("invalid field %q for group-by", f)}
		}
	}
	selector := ifggb.sqlQuery()
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ifggb.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

func (ifggb *InvitationFriendGroupGroupBy) sqlQuery() *sql.Selector {
	selector := ifggb.sql.Select()
	aggregation := make([]string, 0, len(ifggb.fns))
	for _, fn := range ifggb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(ifggb.fields)+len(ifggb.fns))
		for _, f := range ifggb.fields {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	return selector.GroupBy(selector.Columns(ifggb.fields...)...)
}

// InvitationFriendGroupSelect is the builder for selecting fields of InvitationFriendGroup entities.
type InvitationFriendGroupSelect struct {
	*InvitationFriendGroupQuery
	selector
	// intermediate query (i.e. traversal path).
	sql *sql.Selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (ifgs *InvitationFriendGroupSelect) Aggregate(fns ...AggregateFunc) *InvitationFriendGroupSelect {
	ifgs.fns = append(ifgs.fns, fns...)
	return ifgs
}

// Scan applies the selector query and scans the result into the given value.
func (ifgs *InvitationFriendGroupSelect) Scan(ctx context.Context, v any) error {
	if err := ifgs.prepareQuery(ctx); err != nil {
		return err
	}
	ifgs.sql = ifgs.InvitationFriendGroupQuery.sqlQuery(ctx)
	return ifgs.sqlScan(ctx, v)
}

func (ifgs *InvitationFriendGroupSelect) sqlScan(ctx context.Context, v any) error {
	aggregation := make([]string, 0, len(ifgs.fns))
	for _, fn := range ifgs.fns {
		aggregation = append(aggregation, fn(ifgs.sql))
	}
	switch n := len(*ifgs.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		ifgs.sql.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		ifgs.sql.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := ifgs.sql.Query()
	if err := ifgs.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}