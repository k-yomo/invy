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
	"github.com/k-yomo/invy/invy_api/ent/friendshiprequest"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// FriendshipRequestQuery is the builder for querying FriendshipRequest entities.
type FriendshipRequestQuery struct {
	config
	limit         *int
	offset        *int
	unique        *bool
	order         []OrderFunc
	fields        []string
	inters        []Interceptor
	predicates    []predicate.FriendshipRequest
	withFromUsers *UserQuery
	withToUsers   *UserQuery
	modifiers     []func(*sql.Selector)
	loadTotal     []func(context.Context, []*FriendshipRequest) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the FriendshipRequestQuery builder.
func (frq *FriendshipRequestQuery) Where(ps ...predicate.FriendshipRequest) *FriendshipRequestQuery {
	frq.predicates = append(frq.predicates, ps...)
	return frq
}

// Limit the number of records to be returned by this query.
func (frq *FriendshipRequestQuery) Limit(limit int) *FriendshipRequestQuery {
	frq.limit = &limit
	return frq
}

// Offset to start from.
func (frq *FriendshipRequestQuery) Offset(offset int) *FriendshipRequestQuery {
	frq.offset = &offset
	return frq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (frq *FriendshipRequestQuery) Unique(unique bool) *FriendshipRequestQuery {
	frq.unique = &unique
	return frq
}

// Order specifies how the records should be ordered.
func (frq *FriendshipRequestQuery) Order(o ...OrderFunc) *FriendshipRequestQuery {
	frq.order = append(frq.order, o...)
	return frq
}

// QueryFromUsers chains the current query on the "from_users" edge.
func (frq *FriendshipRequestQuery) QueryFromUsers() *UserQuery {
	query := (&UserClient{config: frq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := frq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := frq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(friendshiprequest.Table, friendshiprequest.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, friendshiprequest.FromUsersTable, friendshiprequest.FromUsersColumn),
		)
		fromU = sqlgraph.SetNeighbors(frq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryToUsers chains the current query on the "to_users" edge.
func (frq *FriendshipRequestQuery) QueryToUsers() *UserQuery {
	query := (&UserClient{config: frq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := frq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := frq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(friendshiprequest.Table, friendshiprequest.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, friendshiprequest.ToUsersTable, friendshiprequest.ToUsersColumn),
		)
		fromU = sqlgraph.SetNeighbors(frq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first FriendshipRequest entity from the query.
// Returns a *NotFoundError when no FriendshipRequest was found.
func (frq *FriendshipRequestQuery) First(ctx context.Context) (*FriendshipRequest, error) {
	nodes, err := frq.Limit(1).All(newQueryContext(ctx, TypeFriendshipRequest, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{friendshiprequest.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (frq *FriendshipRequestQuery) FirstX(ctx context.Context) *FriendshipRequest {
	node, err := frq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first FriendshipRequest ID from the query.
// Returns a *NotFoundError when no FriendshipRequest ID was found.
func (frq *FriendshipRequestQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = frq.Limit(1).IDs(newQueryContext(ctx, TypeFriendshipRequest, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{friendshiprequest.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (frq *FriendshipRequestQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := frq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single FriendshipRequest entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one FriendshipRequest entity is found.
// Returns a *NotFoundError when no FriendshipRequest entities are found.
func (frq *FriendshipRequestQuery) Only(ctx context.Context) (*FriendshipRequest, error) {
	nodes, err := frq.Limit(2).All(newQueryContext(ctx, TypeFriendshipRequest, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{friendshiprequest.Label}
	default:
		return nil, &NotSingularError{friendshiprequest.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (frq *FriendshipRequestQuery) OnlyX(ctx context.Context) *FriendshipRequest {
	node, err := frq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only FriendshipRequest ID in the query.
// Returns a *NotSingularError when more than one FriendshipRequest ID is found.
// Returns a *NotFoundError when no entities are found.
func (frq *FriendshipRequestQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = frq.Limit(2).IDs(newQueryContext(ctx, TypeFriendshipRequest, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{friendshiprequest.Label}
	default:
		err = &NotSingularError{friendshiprequest.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (frq *FriendshipRequestQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := frq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of FriendshipRequests.
func (frq *FriendshipRequestQuery) All(ctx context.Context) ([]*FriendshipRequest, error) {
	ctx = newQueryContext(ctx, TypeFriendshipRequest, "All")
	if err := frq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*FriendshipRequest, *FriendshipRequestQuery]()
	return withInterceptors[[]*FriendshipRequest](ctx, frq, qr, frq.inters)
}

// AllX is like All, but panics if an error occurs.
func (frq *FriendshipRequestQuery) AllX(ctx context.Context) []*FriendshipRequest {
	nodes, err := frq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of FriendshipRequest IDs.
func (frq *FriendshipRequestQuery) IDs(ctx context.Context) ([]uuid.UUID, error) {
	var ids []uuid.UUID
	ctx = newQueryContext(ctx, TypeFriendshipRequest, "IDs")
	if err := frq.Select(friendshiprequest.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (frq *FriendshipRequestQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := frq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (frq *FriendshipRequestQuery) Count(ctx context.Context) (int, error) {
	ctx = newQueryContext(ctx, TypeFriendshipRequest, "Count")
	if err := frq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, frq, querierCount[*FriendshipRequestQuery](), frq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (frq *FriendshipRequestQuery) CountX(ctx context.Context) int {
	count, err := frq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (frq *FriendshipRequestQuery) Exist(ctx context.Context) (bool, error) {
	ctx = newQueryContext(ctx, TypeFriendshipRequest, "Exist")
	switch _, err := frq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (frq *FriendshipRequestQuery) ExistX(ctx context.Context) bool {
	exist, err := frq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the FriendshipRequestQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (frq *FriendshipRequestQuery) Clone() *FriendshipRequestQuery {
	if frq == nil {
		return nil
	}
	return &FriendshipRequestQuery{
		config:        frq.config,
		limit:         frq.limit,
		offset:        frq.offset,
		order:         append([]OrderFunc{}, frq.order...),
		inters:        append([]Interceptor{}, frq.inters...),
		predicates:    append([]predicate.FriendshipRequest{}, frq.predicates...),
		withFromUsers: frq.withFromUsers.Clone(),
		withToUsers:   frq.withToUsers.Clone(),
		// clone intermediate query.
		sql:    frq.sql.Clone(),
		path:   frq.path,
		unique: frq.unique,
	}
}

// WithFromUsers tells the query-builder to eager-load the nodes that are connected to
// the "from_users" edge. The optional arguments are used to configure the query builder of the edge.
func (frq *FriendshipRequestQuery) WithFromUsers(opts ...func(*UserQuery)) *FriendshipRequestQuery {
	query := (&UserClient{config: frq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	frq.withFromUsers = query
	return frq
}

// WithToUsers tells the query-builder to eager-load the nodes that are connected to
// the "to_users" edge. The optional arguments are used to configure the query builder of the edge.
func (frq *FriendshipRequestQuery) WithToUsers(opts ...func(*UserQuery)) *FriendshipRequestQuery {
	query := (&UserClient{config: frq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	frq.withToUsers = query
	return frq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		FromUserID uuid.UUID `json:"from_user_id,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.FriendshipRequest.Query().
//		GroupBy(friendshiprequest.FieldFromUserID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (frq *FriendshipRequestQuery) GroupBy(field string, fields ...string) *FriendshipRequestGroupBy {
	frq.fields = append([]string{field}, fields...)
	grbuild := &FriendshipRequestGroupBy{build: frq}
	grbuild.flds = &frq.fields
	grbuild.label = friendshiprequest.Label
	grbuild.scan = grbuild.Scan
	return grbuild
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		FromUserID uuid.UUID `json:"from_user_id,omitempty"`
//	}
//
//	client.FriendshipRequest.Query().
//		Select(friendshiprequest.FieldFromUserID).
//		Scan(ctx, &v)
func (frq *FriendshipRequestQuery) Select(fields ...string) *FriendshipRequestSelect {
	frq.fields = append(frq.fields, fields...)
	sbuild := &FriendshipRequestSelect{FriendshipRequestQuery: frq}
	sbuild.label = friendshiprequest.Label
	sbuild.flds, sbuild.scan = &frq.fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a FriendshipRequestSelect configured with the given aggregations.
func (frq *FriendshipRequestQuery) Aggregate(fns ...AggregateFunc) *FriendshipRequestSelect {
	return frq.Select().Aggregate(fns...)
}

func (frq *FriendshipRequestQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range frq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, frq); err != nil {
				return err
			}
		}
	}
	for _, f := range frq.fields {
		if !friendshiprequest.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if frq.path != nil {
		prev, err := frq.path(ctx)
		if err != nil {
			return err
		}
		frq.sql = prev
	}
	return nil
}

func (frq *FriendshipRequestQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*FriendshipRequest, error) {
	var (
		nodes       = []*FriendshipRequest{}
		_spec       = frq.querySpec()
		loadedTypes = [2]bool{
			frq.withFromUsers != nil,
			frq.withToUsers != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*FriendshipRequest).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &FriendshipRequest{config: frq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(frq.modifiers) > 0 {
		_spec.Modifiers = frq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, frq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := frq.withFromUsers; query != nil {
		if err := frq.loadFromUsers(ctx, query, nodes, nil,
			func(n *FriendshipRequest, e *User) { n.Edges.FromUsers = e }); err != nil {
			return nil, err
		}
	}
	if query := frq.withToUsers; query != nil {
		if err := frq.loadToUsers(ctx, query, nodes, nil,
			func(n *FriendshipRequest, e *User) { n.Edges.ToUsers = e }); err != nil {
			return nil, err
		}
	}
	for i := range frq.loadTotal {
		if err := frq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (frq *FriendshipRequestQuery) loadFromUsers(ctx context.Context, query *UserQuery, nodes []*FriendshipRequest, init func(*FriendshipRequest), assign func(*FriendshipRequest, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*FriendshipRequest)
	for i := range nodes {
		fk := nodes[i].FromUserID
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
			return fmt.Errorf(`unexpected foreign-key "from_user_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}
func (frq *FriendshipRequestQuery) loadToUsers(ctx context.Context, query *UserQuery, nodes []*FriendshipRequest, init func(*FriendshipRequest), assign func(*FriendshipRequest, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*FriendshipRequest)
	for i := range nodes {
		fk := nodes[i].ToUserID
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
			return fmt.Errorf(`unexpected foreign-key "to_user_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}

func (frq *FriendshipRequestQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := frq.querySpec()
	if len(frq.modifiers) > 0 {
		_spec.Modifiers = frq.modifiers
	}
	_spec.Node.Columns = frq.fields
	if len(frq.fields) > 0 {
		_spec.Unique = frq.unique != nil && *frq.unique
	}
	return sqlgraph.CountNodes(ctx, frq.driver, _spec)
}

func (frq *FriendshipRequestQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   friendshiprequest.Table,
			Columns: friendshiprequest.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: friendshiprequest.FieldID,
			},
		},
		From:   frq.sql,
		Unique: true,
	}
	if unique := frq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := frq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, friendshiprequest.FieldID)
		for i := range fields {
			if fields[i] != friendshiprequest.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := frq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := frq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := frq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := frq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (frq *FriendshipRequestQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(frq.driver.Dialect())
	t1 := builder.Table(friendshiprequest.Table)
	columns := frq.fields
	if len(columns) == 0 {
		columns = friendshiprequest.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if frq.sql != nil {
		selector = frq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if frq.unique != nil && *frq.unique {
		selector.Distinct()
	}
	for _, p := range frq.predicates {
		p(selector)
	}
	for _, p := range frq.order {
		p(selector)
	}
	if offset := frq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := frq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// FriendshipRequestGroupBy is the group-by builder for FriendshipRequest entities.
type FriendshipRequestGroupBy struct {
	selector
	build *FriendshipRequestQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (frgb *FriendshipRequestGroupBy) Aggregate(fns ...AggregateFunc) *FriendshipRequestGroupBy {
	frgb.fns = append(frgb.fns, fns...)
	return frgb
}

// Scan applies the selector query and scans the result into the given value.
func (frgb *FriendshipRequestGroupBy) Scan(ctx context.Context, v any) error {
	ctx = newQueryContext(ctx, TypeFriendshipRequest, "GroupBy")
	if err := frgb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*FriendshipRequestQuery, *FriendshipRequestGroupBy](ctx, frgb.build, frgb, frgb.build.inters, v)
}

func (frgb *FriendshipRequestGroupBy) sqlScan(ctx context.Context, root *FriendshipRequestQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(frgb.fns))
	for _, fn := range frgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*frgb.flds)+len(frgb.fns))
		for _, f := range *frgb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*frgb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := frgb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// FriendshipRequestSelect is the builder for selecting fields of FriendshipRequest entities.
type FriendshipRequestSelect struct {
	*FriendshipRequestQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (frs *FriendshipRequestSelect) Aggregate(fns ...AggregateFunc) *FriendshipRequestSelect {
	frs.fns = append(frs.fns, fns...)
	return frs
}

// Scan applies the selector query and scans the result into the given value.
func (frs *FriendshipRequestSelect) Scan(ctx context.Context, v any) error {
	ctx = newQueryContext(ctx, TypeFriendshipRequest, "Select")
	if err := frs.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*FriendshipRequestQuery, *FriendshipRequestSelect](ctx, frs.FriendshipRequestQuery, frs, frs.inters, v)
}

func (frs *FriendshipRequestSelect) sqlScan(ctx context.Context, root *FriendshipRequestQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(frs.fns))
	for _, fn := range frs.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*frs.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := frs.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
