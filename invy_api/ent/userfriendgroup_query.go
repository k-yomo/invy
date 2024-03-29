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
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userfriendgroup"
)

// UserFriendGroupQuery is the builder for querying UserFriendGroup entities.
type UserFriendGroupQuery struct {
	config
	ctx             *QueryContext
	order           []userfriendgroup.OrderOption
	inters          []Interceptor
	predicates      []predicate.UserFriendGroup
	withFriendGroup *FriendGroupQuery
	withUser        *UserQuery
	modifiers       []func(*sql.Selector)
	loadTotal       []func(context.Context, []*UserFriendGroup) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the UserFriendGroupQuery builder.
func (ufgq *UserFriendGroupQuery) Where(ps ...predicate.UserFriendGroup) *UserFriendGroupQuery {
	ufgq.predicates = append(ufgq.predicates, ps...)
	return ufgq
}

// Limit the number of records to be returned by this query.
func (ufgq *UserFriendGroupQuery) Limit(limit int) *UserFriendGroupQuery {
	ufgq.ctx.Limit = &limit
	return ufgq
}

// Offset to start from.
func (ufgq *UserFriendGroupQuery) Offset(offset int) *UserFriendGroupQuery {
	ufgq.ctx.Offset = &offset
	return ufgq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (ufgq *UserFriendGroupQuery) Unique(unique bool) *UserFriendGroupQuery {
	ufgq.ctx.Unique = &unique
	return ufgq
}

// Order specifies how the records should be ordered.
func (ufgq *UserFriendGroupQuery) Order(o ...userfriendgroup.OrderOption) *UserFriendGroupQuery {
	ufgq.order = append(ufgq.order, o...)
	return ufgq
}

// QueryFriendGroup chains the current query on the "friend_group" edge.
func (ufgq *UserFriendGroupQuery) QueryFriendGroup() *FriendGroupQuery {
	query := (&FriendGroupClient{config: ufgq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := ufgq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := ufgq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(userfriendgroup.Table, userfriendgroup.FieldID, selector),
			sqlgraph.To(friendgroup.Table, friendgroup.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, userfriendgroup.FriendGroupTable, userfriendgroup.FriendGroupColumn),
		)
		fromU = sqlgraph.SetNeighbors(ufgq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryUser chains the current query on the "user" edge.
func (ufgq *UserFriendGroupQuery) QueryUser() *UserQuery {
	query := (&UserClient{config: ufgq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := ufgq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := ufgq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(userfriendgroup.Table, userfriendgroup.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, userfriendgroup.UserTable, userfriendgroup.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(ufgq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first UserFriendGroup entity from the query.
// Returns a *NotFoundError when no UserFriendGroup was found.
func (ufgq *UserFriendGroupQuery) First(ctx context.Context) (*UserFriendGroup, error) {
	nodes, err := ufgq.Limit(1).All(setContextOp(ctx, ufgq.ctx, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{userfriendgroup.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (ufgq *UserFriendGroupQuery) FirstX(ctx context.Context) *UserFriendGroup {
	node, err := ufgq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first UserFriendGroup ID from the query.
// Returns a *NotFoundError when no UserFriendGroup ID was found.
func (ufgq *UserFriendGroupQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = ufgq.Limit(1).IDs(setContextOp(ctx, ufgq.ctx, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{userfriendgroup.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (ufgq *UserFriendGroupQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := ufgq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single UserFriendGroup entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one UserFriendGroup entity is found.
// Returns a *NotFoundError when no UserFriendGroup entities are found.
func (ufgq *UserFriendGroupQuery) Only(ctx context.Context) (*UserFriendGroup, error) {
	nodes, err := ufgq.Limit(2).All(setContextOp(ctx, ufgq.ctx, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{userfriendgroup.Label}
	default:
		return nil, &NotSingularError{userfriendgroup.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (ufgq *UserFriendGroupQuery) OnlyX(ctx context.Context) *UserFriendGroup {
	node, err := ufgq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only UserFriendGroup ID in the query.
// Returns a *NotSingularError when more than one UserFriendGroup ID is found.
// Returns a *NotFoundError when no entities are found.
func (ufgq *UserFriendGroupQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = ufgq.Limit(2).IDs(setContextOp(ctx, ufgq.ctx, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{userfriendgroup.Label}
	default:
		err = &NotSingularError{userfriendgroup.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (ufgq *UserFriendGroupQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := ufgq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of UserFriendGroups.
func (ufgq *UserFriendGroupQuery) All(ctx context.Context) ([]*UserFriendGroup, error) {
	ctx = setContextOp(ctx, ufgq.ctx, "All")
	if err := ufgq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*UserFriendGroup, *UserFriendGroupQuery]()
	return withInterceptors[[]*UserFriendGroup](ctx, ufgq, qr, ufgq.inters)
}

// AllX is like All, but panics if an error occurs.
func (ufgq *UserFriendGroupQuery) AllX(ctx context.Context) []*UserFriendGroup {
	nodes, err := ufgq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of UserFriendGroup IDs.
func (ufgq *UserFriendGroupQuery) IDs(ctx context.Context) (ids []uuid.UUID, err error) {
	if ufgq.ctx.Unique == nil && ufgq.path != nil {
		ufgq.Unique(true)
	}
	ctx = setContextOp(ctx, ufgq.ctx, "IDs")
	if err = ufgq.Select(userfriendgroup.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (ufgq *UserFriendGroupQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := ufgq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (ufgq *UserFriendGroupQuery) Count(ctx context.Context) (int, error) {
	ctx = setContextOp(ctx, ufgq.ctx, "Count")
	if err := ufgq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, ufgq, querierCount[*UserFriendGroupQuery](), ufgq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (ufgq *UserFriendGroupQuery) CountX(ctx context.Context) int {
	count, err := ufgq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (ufgq *UserFriendGroupQuery) Exist(ctx context.Context) (bool, error) {
	ctx = setContextOp(ctx, ufgq.ctx, "Exist")
	switch _, err := ufgq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (ufgq *UserFriendGroupQuery) ExistX(ctx context.Context) bool {
	exist, err := ufgq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the UserFriendGroupQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (ufgq *UserFriendGroupQuery) Clone() *UserFriendGroupQuery {
	if ufgq == nil {
		return nil
	}
	return &UserFriendGroupQuery{
		config:          ufgq.config,
		ctx:             ufgq.ctx.Clone(),
		order:           append([]userfriendgroup.OrderOption{}, ufgq.order...),
		inters:          append([]Interceptor{}, ufgq.inters...),
		predicates:      append([]predicate.UserFriendGroup{}, ufgq.predicates...),
		withFriendGroup: ufgq.withFriendGroup.Clone(),
		withUser:        ufgq.withUser.Clone(),
		// clone intermediate query.
		sql:  ufgq.sql.Clone(),
		path: ufgq.path,
	}
}

// WithFriendGroup tells the query-builder to eager-load the nodes that are connected to
// the "friend_group" edge. The optional arguments are used to configure the query builder of the edge.
func (ufgq *UserFriendGroupQuery) WithFriendGroup(opts ...func(*FriendGroupQuery)) *UserFriendGroupQuery {
	query := (&FriendGroupClient{config: ufgq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	ufgq.withFriendGroup = query
	return ufgq
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (ufgq *UserFriendGroupQuery) WithUser(opts ...func(*UserQuery)) *UserFriendGroupQuery {
	query := (&UserClient{config: ufgq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	ufgq.withUser = query
	return ufgq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		FriendGroupID uuid.UUID `json:"friend_group_id,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.UserFriendGroup.Query().
//		GroupBy(userfriendgroup.FieldFriendGroupID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (ufgq *UserFriendGroupQuery) GroupBy(field string, fields ...string) *UserFriendGroupGroupBy {
	ufgq.ctx.Fields = append([]string{field}, fields...)
	grbuild := &UserFriendGroupGroupBy{build: ufgq}
	grbuild.flds = &ufgq.ctx.Fields
	grbuild.label = userfriendgroup.Label
	grbuild.scan = grbuild.Scan
	return grbuild
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		FriendGroupID uuid.UUID `json:"friend_group_id,omitempty"`
//	}
//
//	client.UserFriendGroup.Query().
//		Select(userfriendgroup.FieldFriendGroupID).
//		Scan(ctx, &v)
func (ufgq *UserFriendGroupQuery) Select(fields ...string) *UserFriendGroupSelect {
	ufgq.ctx.Fields = append(ufgq.ctx.Fields, fields...)
	sbuild := &UserFriendGroupSelect{UserFriendGroupQuery: ufgq}
	sbuild.label = userfriendgroup.Label
	sbuild.flds, sbuild.scan = &ufgq.ctx.Fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a UserFriendGroupSelect configured with the given aggregations.
func (ufgq *UserFriendGroupQuery) Aggregate(fns ...AggregateFunc) *UserFriendGroupSelect {
	return ufgq.Select().Aggregate(fns...)
}

func (ufgq *UserFriendGroupQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range ufgq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, ufgq); err != nil {
				return err
			}
		}
	}
	for _, f := range ufgq.ctx.Fields {
		if !userfriendgroup.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if ufgq.path != nil {
		prev, err := ufgq.path(ctx)
		if err != nil {
			return err
		}
		ufgq.sql = prev
	}
	return nil
}

func (ufgq *UserFriendGroupQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*UserFriendGroup, error) {
	var (
		nodes       = []*UserFriendGroup{}
		_spec       = ufgq.querySpec()
		loadedTypes = [2]bool{
			ufgq.withFriendGroup != nil,
			ufgq.withUser != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*UserFriendGroup).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &UserFriendGroup{config: ufgq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(ufgq.modifiers) > 0 {
		_spec.Modifiers = ufgq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, ufgq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := ufgq.withFriendGroup; query != nil {
		if err := ufgq.loadFriendGroup(ctx, query, nodes, nil,
			func(n *UserFriendGroup, e *FriendGroup) { n.Edges.FriendGroup = e }); err != nil {
			return nil, err
		}
	}
	if query := ufgq.withUser; query != nil {
		if err := ufgq.loadUser(ctx, query, nodes, nil,
			func(n *UserFriendGroup, e *User) { n.Edges.User = e }); err != nil {
			return nil, err
		}
	}
	for i := range ufgq.loadTotal {
		if err := ufgq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (ufgq *UserFriendGroupQuery) loadFriendGroup(ctx context.Context, query *FriendGroupQuery, nodes []*UserFriendGroup, init func(*UserFriendGroup), assign func(*UserFriendGroup, *FriendGroup)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*UserFriendGroup)
	for i := range nodes {
		fk := nodes[i].FriendGroupID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	if len(ids) == 0 {
		return nil
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
func (ufgq *UserFriendGroupQuery) loadUser(ctx context.Context, query *UserQuery, nodes []*UserFriendGroup, init func(*UserFriendGroup), assign func(*UserFriendGroup, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*UserFriendGroup)
	for i := range nodes {
		fk := nodes[i].UserID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	if len(ids) == 0 {
		return nil
	}
	query.Where(user.IDIn(ids...))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nodeids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "user_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}

func (ufgq *UserFriendGroupQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := ufgq.querySpec()
	if len(ufgq.modifiers) > 0 {
		_spec.Modifiers = ufgq.modifiers
	}
	_spec.Node.Columns = ufgq.ctx.Fields
	if len(ufgq.ctx.Fields) > 0 {
		_spec.Unique = ufgq.ctx.Unique != nil && *ufgq.ctx.Unique
	}
	return sqlgraph.CountNodes(ctx, ufgq.driver, _spec)
}

func (ufgq *UserFriendGroupQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := sqlgraph.NewQuerySpec(userfriendgroup.Table, userfriendgroup.Columns, sqlgraph.NewFieldSpec(userfriendgroup.FieldID, field.TypeUUID))
	_spec.From = ufgq.sql
	if unique := ufgq.ctx.Unique; unique != nil {
		_spec.Unique = *unique
	} else if ufgq.path != nil {
		_spec.Unique = true
	}
	if fields := ufgq.ctx.Fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, userfriendgroup.FieldID)
		for i := range fields {
			if fields[i] != userfriendgroup.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
		if ufgq.withFriendGroup != nil {
			_spec.Node.AddColumnOnce(userfriendgroup.FieldFriendGroupID)
		}
		if ufgq.withUser != nil {
			_spec.Node.AddColumnOnce(userfriendgroup.FieldUserID)
		}
	}
	if ps := ufgq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := ufgq.ctx.Limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := ufgq.ctx.Offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := ufgq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (ufgq *UserFriendGroupQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(ufgq.driver.Dialect())
	t1 := builder.Table(userfriendgroup.Table)
	columns := ufgq.ctx.Fields
	if len(columns) == 0 {
		columns = userfriendgroup.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if ufgq.sql != nil {
		selector = ufgq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if ufgq.ctx.Unique != nil && *ufgq.ctx.Unique {
		selector.Distinct()
	}
	for _, p := range ufgq.predicates {
		p(selector)
	}
	for _, p := range ufgq.order {
		p(selector)
	}
	if offset := ufgq.ctx.Offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := ufgq.ctx.Limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// UserFriendGroupGroupBy is the group-by builder for UserFriendGroup entities.
type UserFriendGroupGroupBy struct {
	selector
	build *UserFriendGroupQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (ufggb *UserFriendGroupGroupBy) Aggregate(fns ...AggregateFunc) *UserFriendGroupGroupBy {
	ufggb.fns = append(ufggb.fns, fns...)
	return ufggb
}

// Scan applies the selector query and scans the result into the given value.
func (ufggb *UserFriendGroupGroupBy) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, ufggb.build.ctx, "GroupBy")
	if err := ufggb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*UserFriendGroupQuery, *UserFriendGroupGroupBy](ctx, ufggb.build, ufggb, ufggb.build.inters, v)
}

func (ufggb *UserFriendGroupGroupBy) sqlScan(ctx context.Context, root *UserFriendGroupQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(ufggb.fns))
	for _, fn := range ufggb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*ufggb.flds)+len(ufggb.fns))
		for _, f := range *ufggb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*ufggb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ufggb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// UserFriendGroupSelect is the builder for selecting fields of UserFriendGroup entities.
type UserFriendGroupSelect struct {
	*UserFriendGroupQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (ufgs *UserFriendGroupSelect) Aggregate(fns ...AggregateFunc) *UserFriendGroupSelect {
	ufgs.fns = append(ufgs.fns, fns...)
	return ufgs
}

// Scan applies the selector query and scans the result into the given value.
func (ufgs *UserFriendGroupSelect) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, ufgs.ctx, "Select")
	if err := ufgs.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*UserFriendGroupQuery, *UserFriendGroupSelect](ctx, ufgs.UserFriendGroupQuery, ufgs, ufgs.inters, v)
}

func (ufgs *UserFriendGroupSelect) sqlScan(ctx context.Context, root *UserFriendGroupQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(ufgs.fns))
	for _, fn := range ufgs.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*ufgs.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ufgs.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
