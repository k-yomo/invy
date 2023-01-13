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
	"github.com/k-yomo/invy/invy_api/ent/pushnotificationtoken"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// PushNotificationTokenQuery is the builder for querying PushNotificationToken entities.
type PushNotificationTokenQuery struct {
	config
	limit      *int
	offset     *int
	unique     *bool
	order      []OrderFunc
	fields     []string
	inters     []Interceptor
	predicates []predicate.PushNotificationToken
	withUser   *UserQuery
	modifiers  []func(*sql.Selector)
	loadTotal  []func(context.Context, []*PushNotificationToken) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the PushNotificationTokenQuery builder.
func (pntq *PushNotificationTokenQuery) Where(ps ...predicate.PushNotificationToken) *PushNotificationTokenQuery {
	pntq.predicates = append(pntq.predicates, ps...)
	return pntq
}

// Limit the number of records to be returned by this query.
func (pntq *PushNotificationTokenQuery) Limit(limit int) *PushNotificationTokenQuery {
	pntq.limit = &limit
	return pntq
}

// Offset to start from.
func (pntq *PushNotificationTokenQuery) Offset(offset int) *PushNotificationTokenQuery {
	pntq.offset = &offset
	return pntq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (pntq *PushNotificationTokenQuery) Unique(unique bool) *PushNotificationTokenQuery {
	pntq.unique = &unique
	return pntq
}

// Order specifies how the records should be ordered.
func (pntq *PushNotificationTokenQuery) Order(o ...OrderFunc) *PushNotificationTokenQuery {
	pntq.order = append(pntq.order, o...)
	return pntq
}

// QueryUser chains the current query on the "user" edge.
func (pntq *PushNotificationTokenQuery) QueryUser() *UserQuery {
	query := (&UserClient{config: pntq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := pntq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := pntq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(pushnotificationtoken.Table, pushnotificationtoken.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, pushnotificationtoken.UserTable, pushnotificationtoken.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(pntq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first PushNotificationToken entity from the query.
// Returns a *NotFoundError when no PushNotificationToken was found.
func (pntq *PushNotificationTokenQuery) First(ctx context.Context) (*PushNotificationToken, error) {
	nodes, err := pntq.Limit(1).All(newQueryContext(ctx, TypePushNotificationToken, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{pushnotificationtoken.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (pntq *PushNotificationTokenQuery) FirstX(ctx context.Context) *PushNotificationToken {
	node, err := pntq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first PushNotificationToken ID from the query.
// Returns a *NotFoundError when no PushNotificationToken ID was found.
func (pntq *PushNotificationTokenQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = pntq.Limit(1).IDs(newQueryContext(ctx, TypePushNotificationToken, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{pushnotificationtoken.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (pntq *PushNotificationTokenQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := pntq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single PushNotificationToken entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one PushNotificationToken entity is found.
// Returns a *NotFoundError when no PushNotificationToken entities are found.
func (pntq *PushNotificationTokenQuery) Only(ctx context.Context) (*PushNotificationToken, error) {
	nodes, err := pntq.Limit(2).All(newQueryContext(ctx, TypePushNotificationToken, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{pushnotificationtoken.Label}
	default:
		return nil, &NotSingularError{pushnotificationtoken.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (pntq *PushNotificationTokenQuery) OnlyX(ctx context.Context) *PushNotificationToken {
	node, err := pntq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only PushNotificationToken ID in the query.
// Returns a *NotSingularError when more than one PushNotificationToken ID is found.
// Returns a *NotFoundError when no entities are found.
func (pntq *PushNotificationTokenQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = pntq.Limit(2).IDs(newQueryContext(ctx, TypePushNotificationToken, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{pushnotificationtoken.Label}
	default:
		err = &NotSingularError{pushnotificationtoken.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (pntq *PushNotificationTokenQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := pntq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of PushNotificationTokens.
func (pntq *PushNotificationTokenQuery) All(ctx context.Context) ([]*PushNotificationToken, error) {
	ctx = newQueryContext(ctx, TypePushNotificationToken, "All")
	if err := pntq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*PushNotificationToken, *PushNotificationTokenQuery]()
	return withInterceptors[[]*PushNotificationToken](ctx, pntq, qr, pntq.inters)
}

// AllX is like All, but panics if an error occurs.
func (pntq *PushNotificationTokenQuery) AllX(ctx context.Context) []*PushNotificationToken {
	nodes, err := pntq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of PushNotificationToken IDs.
func (pntq *PushNotificationTokenQuery) IDs(ctx context.Context) ([]uuid.UUID, error) {
	var ids []uuid.UUID
	ctx = newQueryContext(ctx, TypePushNotificationToken, "IDs")
	if err := pntq.Select(pushnotificationtoken.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (pntq *PushNotificationTokenQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := pntq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (pntq *PushNotificationTokenQuery) Count(ctx context.Context) (int, error) {
	ctx = newQueryContext(ctx, TypePushNotificationToken, "Count")
	if err := pntq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, pntq, querierCount[*PushNotificationTokenQuery](), pntq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (pntq *PushNotificationTokenQuery) CountX(ctx context.Context) int {
	count, err := pntq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (pntq *PushNotificationTokenQuery) Exist(ctx context.Context) (bool, error) {
	ctx = newQueryContext(ctx, TypePushNotificationToken, "Exist")
	switch _, err := pntq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (pntq *PushNotificationTokenQuery) ExistX(ctx context.Context) bool {
	exist, err := pntq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the PushNotificationTokenQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (pntq *PushNotificationTokenQuery) Clone() *PushNotificationTokenQuery {
	if pntq == nil {
		return nil
	}
	return &PushNotificationTokenQuery{
		config:     pntq.config,
		limit:      pntq.limit,
		offset:     pntq.offset,
		order:      append([]OrderFunc{}, pntq.order...),
		inters:     append([]Interceptor{}, pntq.inters...),
		predicates: append([]predicate.PushNotificationToken{}, pntq.predicates...),
		withUser:   pntq.withUser.Clone(),
		// clone intermediate query.
		sql:    pntq.sql.Clone(),
		path:   pntq.path,
		unique: pntq.unique,
	}
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (pntq *PushNotificationTokenQuery) WithUser(opts ...func(*UserQuery)) *PushNotificationTokenQuery {
	query := (&UserClient{config: pntq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	pntq.withUser = query
	return pntq
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
//	client.PushNotificationToken.Query().
//		GroupBy(pushnotificationtoken.FieldUserID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (pntq *PushNotificationTokenQuery) GroupBy(field string, fields ...string) *PushNotificationTokenGroupBy {
	pntq.fields = append([]string{field}, fields...)
	grbuild := &PushNotificationTokenGroupBy{build: pntq}
	grbuild.flds = &pntq.fields
	grbuild.label = pushnotificationtoken.Label
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
//	client.PushNotificationToken.Query().
//		Select(pushnotificationtoken.FieldUserID).
//		Scan(ctx, &v)
func (pntq *PushNotificationTokenQuery) Select(fields ...string) *PushNotificationTokenSelect {
	pntq.fields = append(pntq.fields, fields...)
	sbuild := &PushNotificationTokenSelect{PushNotificationTokenQuery: pntq}
	sbuild.label = pushnotificationtoken.Label
	sbuild.flds, sbuild.scan = &pntq.fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a PushNotificationTokenSelect configured with the given aggregations.
func (pntq *PushNotificationTokenQuery) Aggregate(fns ...AggregateFunc) *PushNotificationTokenSelect {
	return pntq.Select().Aggregate(fns...)
}

func (pntq *PushNotificationTokenQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range pntq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, pntq); err != nil {
				return err
			}
		}
	}
	for _, f := range pntq.fields {
		if !pushnotificationtoken.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if pntq.path != nil {
		prev, err := pntq.path(ctx)
		if err != nil {
			return err
		}
		pntq.sql = prev
	}
	return nil
}

func (pntq *PushNotificationTokenQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*PushNotificationToken, error) {
	var (
		nodes       = []*PushNotificationToken{}
		_spec       = pntq.querySpec()
		loadedTypes = [1]bool{
			pntq.withUser != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*PushNotificationToken).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &PushNotificationToken{config: pntq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(pntq.modifiers) > 0 {
		_spec.Modifiers = pntq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, pntq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := pntq.withUser; query != nil {
		if err := pntq.loadUser(ctx, query, nodes, nil,
			func(n *PushNotificationToken, e *User) { n.Edges.User = e }); err != nil {
			return nil, err
		}
	}
	for i := range pntq.loadTotal {
		if err := pntq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (pntq *PushNotificationTokenQuery) loadUser(ctx context.Context, query *UserQuery, nodes []*PushNotificationToken, init func(*PushNotificationToken), assign func(*PushNotificationToken, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*PushNotificationToken)
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

func (pntq *PushNotificationTokenQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := pntq.querySpec()
	if len(pntq.modifiers) > 0 {
		_spec.Modifiers = pntq.modifiers
	}
	_spec.Node.Columns = pntq.fields
	if len(pntq.fields) > 0 {
		_spec.Unique = pntq.unique != nil && *pntq.unique
	}
	return sqlgraph.CountNodes(ctx, pntq.driver, _spec)
}

func (pntq *PushNotificationTokenQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   pushnotificationtoken.Table,
			Columns: pushnotificationtoken.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: pushnotificationtoken.FieldID,
			},
		},
		From:   pntq.sql,
		Unique: true,
	}
	if unique := pntq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := pntq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, pushnotificationtoken.FieldID)
		for i := range fields {
			if fields[i] != pushnotificationtoken.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := pntq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := pntq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := pntq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := pntq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (pntq *PushNotificationTokenQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(pntq.driver.Dialect())
	t1 := builder.Table(pushnotificationtoken.Table)
	columns := pntq.fields
	if len(columns) == 0 {
		columns = pushnotificationtoken.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if pntq.sql != nil {
		selector = pntq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if pntq.unique != nil && *pntq.unique {
		selector.Distinct()
	}
	for _, p := range pntq.predicates {
		p(selector)
	}
	for _, p := range pntq.order {
		p(selector)
	}
	if offset := pntq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := pntq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// PushNotificationTokenGroupBy is the group-by builder for PushNotificationToken entities.
type PushNotificationTokenGroupBy struct {
	selector
	build *PushNotificationTokenQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (pntgb *PushNotificationTokenGroupBy) Aggregate(fns ...AggregateFunc) *PushNotificationTokenGroupBy {
	pntgb.fns = append(pntgb.fns, fns...)
	return pntgb
}

// Scan applies the selector query and scans the result into the given value.
func (pntgb *PushNotificationTokenGroupBy) Scan(ctx context.Context, v any) error {
	ctx = newQueryContext(ctx, TypePushNotificationToken, "GroupBy")
	if err := pntgb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*PushNotificationTokenQuery, *PushNotificationTokenGroupBy](ctx, pntgb.build, pntgb, pntgb.build.inters, v)
}

func (pntgb *PushNotificationTokenGroupBy) sqlScan(ctx context.Context, root *PushNotificationTokenQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(pntgb.fns))
	for _, fn := range pntgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*pntgb.flds)+len(pntgb.fns))
		for _, f := range *pntgb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*pntgb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := pntgb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// PushNotificationTokenSelect is the builder for selecting fields of PushNotificationToken entities.
type PushNotificationTokenSelect struct {
	*PushNotificationTokenQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (pnts *PushNotificationTokenSelect) Aggregate(fns ...AggregateFunc) *PushNotificationTokenSelect {
	pnts.fns = append(pnts.fns, fns...)
	return pnts
}

// Scan applies the selector query and scans the result into the given value.
func (pnts *PushNotificationTokenSelect) Scan(ctx context.Context, v any) error {
	ctx = newQueryContext(ctx, TypePushNotificationToken, "Select")
	if err := pnts.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*PushNotificationTokenQuery, *PushNotificationTokenSelect](ctx, pnts.PushNotificationTokenQuery, pnts, pnts.inters, v)
}

func (pnts *PushNotificationTokenSelect) sqlScan(ctx context.Context, root *PushNotificationTokenQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(pnts.fns))
	for _, fn := range pnts.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*pnts.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := pnts.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
