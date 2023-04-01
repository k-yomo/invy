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
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/invy_api/ent/user"
	"github.com/k-yomo/invy/invy_api/ent/userlocationhistory"
)

// UserLocationHistoryQuery is the builder for querying UserLocationHistory entities.
type UserLocationHistoryQuery struct {
	config
	limit      *int
	offset     *int
	unique     *bool
	order      []OrderFunc
	fields     []string
	inters     []Interceptor
	predicates []predicate.UserLocationHistory
	withUser   *UserQuery
	modifiers  []func(*sql.Selector)
	loadTotal  []func(context.Context, []*UserLocationHistory) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the UserLocationHistoryQuery builder.
func (ulhq *UserLocationHistoryQuery) Where(ps ...predicate.UserLocationHistory) *UserLocationHistoryQuery {
	ulhq.predicates = append(ulhq.predicates, ps...)
	return ulhq
}

// Limit the number of records to be returned by this query.
func (ulhq *UserLocationHistoryQuery) Limit(limit int) *UserLocationHistoryQuery {
	ulhq.limit = &limit
	return ulhq
}

// Offset to start from.
func (ulhq *UserLocationHistoryQuery) Offset(offset int) *UserLocationHistoryQuery {
	ulhq.offset = &offset
	return ulhq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (ulhq *UserLocationHistoryQuery) Unique(unique bool) *UserLocationHistoryQuery {
	ulhq.unique = &unique
	return ulhq
}

// Order specifies how the records should be ordered.
func (ulhq *UserLocationHistoryQuery) Order(o ...OrderFunc) *UserLocationHistoryQuery {
	ulhq.order = append(ulhq.order, o...)
	return ulhq
}

// QueryUser chains the current query on the "user" edge.
func (ulhq *UserLocationHistoryQuery) QueryUser() *UserQuery {
	query := (&UserClient{config: ulhq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := ulhq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := ulhq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(userlocationhistory.Table, userlocationhistory.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, userlocationhistory.UserTable, userlocationhistory.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(ulhq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first UserLocationHistory entity from the query.
// Returns a *NotFoundError when no UserLocationHistory was found.
func (ulhq *UserLocationHistoryQuery) First(ctx context.Context) (*UserLocationHistory, error) {
	nodes, err := ulhq.Limit(1).All(newQueryContext(ctx, TypeUserLocationHistory, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{userlocationhistory.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (ulhq *UserLocationHistoryQuery) FirstX(ctx context.Context) *UserLocationHistory {
	node, err := ulhq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first UserLocationHistory ID from the query.
// Returns a *NotFoundError when no UserLocationHistory ID was found.
func (ulhq *UserLocationHistoryQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = ulhq.Limit(1).IDs(newQueryContext(ctx, TypeUserLocationHistory, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{userlocationhistory.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (ulhq *UserLocationHistoryQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := ulhq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single UserLocationHistory entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one UserLocationHistory entity is found.
// Returns a *NotFoundError when no UserLocationHistory entities are found.
func (ulhq *UserLocationHistoryQuery) Only(ctx context.Context) (*UserLocationHistory, error) {
	nodes, err := ulhq.Limit(2).All(newQueryContext(ctx, TypeUserLocationHistory, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{userlocationhistory.Label}
	default:
		return nil, &NotSingularError{userlocationhistory.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (ulhq *UserLocationHistoryQuery) OnlyX(ctx context.Context) *UserLocationHistory {
	node, err := ulhq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only UserLocationHistory ID in the query.
// Returns a *NotSingularError when more than one UserLocationHistory ID is found.
// Returns a *NotFoundError when no entities are found.
func (ulhq *UserLocationHistoryQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = ulhq.Limit(2).IDs(newQueryContext(ctx, TypeUserLocationHistory, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{userlocationhistory.Label}
	default:
		err = &NotSingularError{userlocationhistory.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (ulhq *UserLocationHistoryQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := ulhq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of UserLocationHistories.
func (ulhq *UserLocationHistoryQuery) All(ctx context.Context) ([]*UserLocationHistory, error) {
	ctx = newQueryContext(ctx, TypeUserLocationHistory, "All")
	if err := ulhq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*UserLocationHistory, *UserLocationHistoryQuery]()
	return withInterceptors[[]*UserLocationHistory](ctx, ulhq, qr, ulhq.inters)
}

// AllX is like All, but panics if an error occurs.
func (ulhq *UserLocationHistoryQuery) AllX(ctx context.Context) []*UserLocationHistory {
	nodes, err := ulhq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of UserLocationHistory IDs.
func (ulhq *UserLocationHistoryQuery) IDs(ctx context.Context) ([]uuid.UUID, error) {
	var ids []uuid.UUID
	ctx = newQueryContext(ctx, TypeUserLocationHistory, "IDs")
	if err := ulhq.Select(userlocationhistory.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (ulhq *UserLocationHistoryQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := ulhq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (ulhq *UserLocationHistoryQuery) Count(ctx context.Context) (int, error) {
	ctx = newQueryContext(ctx, TypeUserLocationHistory, "Count")
	if err := ulhq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, ulhq, querierCount[*UserLocationHistoryQuery](), ulhq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (ulhq *UserLocationHistoryQuery) CountX(ctx context.Context) int {
	count, err := ulhq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (ulhq *UserLocationHistoryQuery) Exist(ctx context.Context) (bool, error) {
	ctx = newQueryContext(ctx, TypeUserLocationHistory, "Exist")
	switch _, err := ulhq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (ulhq *UserLocationHistoryQuery) ExistX(ctx context.Context) bool {
	exist, err := ulhq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the UserLocationHistoryQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (ulhq *UserLocationHistoryQuery) Clone() *UserLocationHistoryQuery {
	if ulhq == nil {
		return nil
	}
	return &UserLocationHistoryQuery{
		config:     ulhq.config,
		limit:      ulhq.limit,
		offset:     ulhq.offset,
		order:      append([]OrderFunc{}, ulhq.order...),
		inters:     append([]Interceptor{}, ulhq.inters...),
		predicates: append([]predicate.UserLocationHistory{}, ulhq.predicates...),
		withUser:   ulhq.withUser.Clone(),
		// clone intermediate query.
		sql:    ulhq.sql.Clone(),
		path:   ulhq.path,
		unique: ulhq.unique,
	}
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (ulhq *UserLocationHistoryQuery) WithUser(opts ...func(*UserQuery)) *UserLocationHistoryQuery {
	query := (&UserClient{config: ulhq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	ulhq.withUser = query
	return ulhq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		UserID uuid.UUID `json:"user_id,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.UserLocationHistory.Query().
//		GroupBy(userlocationhistory.FieldUserID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (ulhq *UserLocationHistoryQuery) GroupBy(field string, fields ...string) *UserLocationHistoryGroupBy {
	ulhq.fields = append([]string{field}, fields...)
	grbuild := &UserLocationHistoryGroupBy{build: ulhq}
	grbuild.flds = &ulhq.fields
	grbuild.label = userlocationhistory.Label
	grbuild.scan = grbuild.Scan
	return grbuild
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		UserID uuid.UUID `json:"user_id,omitempty"`
//	}
//
//	client.UserLocationHistory.Query().
//		Select(userlocationhistory.FieldUserID).
//		Scan(ctx, &v)
func (ulhq *UserLocationHistoryQuery) Select(fields ...string) *UserLocationHistorySelect {
	ulhq.fields = append(ulhq.fields, fields...)
	sbuild := &UserLocationHistorySelect{UserLocationHistoryQuery: ulhq}
	sbuild.label = userlocationhistory.Label
	sbuild.flds, sbuild.scan = &ulhq.fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a UserLocationHistorySelect configured with the given aggregations.
func (ulhq *UserLocationHistoryQuery) Aggregate(fns ...AggregateFunc) *UserLocationHistorySelect {
	return ulhq.Select().Aggregate(fns...)
}

func (ulhq *UserLocationHistoryQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range ulhq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, ulhq); err != nil {
				return err
			}
		}
	}
	for _, f := range ulhq.fields {
		if !userlocationhistory.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if ulhq.path != nil {
		prev, err := ulhq.path(ctx)
		if err != nil {
			return err
		}
		ulhq.sql = prev
	}
	return nil
}

func (ulhq *UserLocationHistoryQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*UserLocationHistory, error) {
	var (
		nodes       = []*UserLocationHistory{}
		_spec       = ulhq.querySpec()
		loadedTypes = [1]bool{
			ulhq.withUser != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*UserLocationHistory).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &UserLocationHistory{config: ulhq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(ulhq.modifiers) > 0 {
		_spec.Modifiers = ulhq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, ulhq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := ulhq.withUser; query != nil {
		if err := ulhq.loadUser(ctx, query, nodes, nil,
			func(n *UserLocationHistory, e *User) { n.Edges.User = e }); err != nil {
			return nil, err
		}
	}
	for i := range ulhq.loadTotal {
		if err := ulhq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (ulhq *UserLocationHistoryQuery) loadUser(ctx context.Context, query *UserQuery, nodes []*UserLocationHistory, init func(*UserLocationHistory), assign func(*UserLocationHistory, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*UserLocationHistory)
	for i := range nodes {
		fk := nodes[i].UserID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
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

func (ulhq *UserLocationHistoryQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := ulhq.querySpec()
	if len(ulhq.modifiers) > 0 {
		_spec.Modifiers = ulhq.modifiers
	}
	_spec.Node.Columns = ulhq.fields
	if len(ulhq.fields) > 0 {
		_spec.Unique = ulhq.unique != nil && *ulhq.unique
	}
	return sqlgraph.CountNodes(ctx, ulhq.driver, _spec)
}

func (ulhq *UserLocationHistoryQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   userlocationhistory.Table,
			Columns: userlocationhistory.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: userlocationhistory.FieldID,
			},
		},
		From:   ulhq.sql,
		Unique: true,
	}
	if unique := ulhq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := ulhq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, userlocationhistory.FieldID)
		for i := range fields {
			if fields[i] != userlocationhistory.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := ulhq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := ulhq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := ulhq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := ulhq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (ulhq *UserLocationHistoryQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(ulhq.driver.Dialect())
	t1 := builder.Table(userlocationhistory.Table)
	columns := ulhq.fields
	if len(columns) == 0 {
		columns = userlocationhistory.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if ulhq.sql != nil {
		selector = ulhq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if ulhq.unique != nil && *ulhq.unique {
		selector.Distinct()
	}
	for _, p := range ulhq.predicates {
		p(selector)
	}
	for _, p := range ulhq.order {
		p(selector)
	}
	if offset := ulhq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := ulhq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// UserLocationHistoryGroupBy is the group-by builder for UserLocationHistory entities.
type UserLocationHistoryGroupBy struct {
	selector
	build *UserLocationHistoryQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (ulhgb *UserLocationHistoryGroupBy) Aggregate(fns ...AggregateFunc) *UserLocationHistoryGroupBy {
	ulhgb.fns = append(ulhgb.fns, fns...)
	return ulhgb
}

// Scan applies the selector query and scans the result into the given value.
func (ulhgb *UserLocationHistoryGroupBy) Scan(ctx context.Context, v any) error {
	ctx = newQueryContext(ctx, TypeUserLocationHistory, "GroupBy")
	if err := ulhgb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*UserLocationHistoryQuery, *UserLocationHistoryGroupBy](ctx, ulhgb.build, ulhgb, ulhgb.build.inters, v)
}

func (ulhgb *UserLocationHistoryGroupBy) sqlScan(ctx context.Context, root *UserLocationHistoryQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(ulhgb.fns))
	for _, fn := range ulhgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*ulhgb.flds)+len(ulhgb.fns))
		for _, f := range *ulhgb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*ulhgb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ulhgb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// UserLocationHistorySelect is the builder for selecting fields of UserLocationHistory entities.
type UserLocationHistorySelect struct {
	*UserLocationHistoryQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (ulhs *UserLocationHistorySelect) Aggregate(fns ...AggregateFunc) *UserLocationHistorySelect {
	ulhs.fns = append(ulhs.fns, fns...)
	return ulhs
}

// Scan applies the selector query and scans the result into the given value.
func (ulhs *UserLocationHistorySelect) Scan(ctx context.Context, v any) error {
	ctx = newQueryContext(ctx, TypeUserLocationHistory, "Select")
	if err := ulhs.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*UserLocationHistoryQuery, *UserLocationHistorySelect](ctx, ulhs.UserLocationHistoryQuery, ulhs, ulhs.inters, v)
}

func (ulhs *UserLocationHistorySelect) sqlScan(ctx context.Context, root *UserLocationHistoryQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(ulhs.fns))
	for _, fn := range ulhs.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*ulhs.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ulhs.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
