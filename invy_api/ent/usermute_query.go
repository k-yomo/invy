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
	"github.com/k-yomo/invy/invy_api/ent/usermute"
)

// UserMuteQuery is the builder for querying UserMute entities.
type UserMuteQuery struct {
	config
	ctx          *QueryContext
	order        []usermute.OrderOption
	inters       []Interceptor
	predicates   []predicate.UserMute
	withUser     *UserQuery
	withMuteUser *UserQuery
	modifiers    []func(*sql.Selector)
	loadTotal    []func(context.Context, []*UserMute) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the UserMuteQuery builder.
func (umq *UserMuteQuery) Where(ps ...predicate.UserMute) *UserMuteQuery {
	umq.predicates = append(umq.predicates, ps...)
	return umq
}

// Limit the number of records to be returned by this query.
func (umq *UserMuteQuery) Limit(limit int) *UserMuteQuery {
	umq.ctx.Limit = &limit
	return umq
}

// Offset to start from.
func (umq *UserMuteQuery) Offset(offset int) *UserMuteQuery {
	umq.ctx.Offset = &offset
	return umq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (umq *UserMuteQuery) Unique(unique bool) *UserMuteQuery {
	umq.ctx.Unique = &unique
	return umq
}

// Order specifies how the records should be ordered.
func (umq *UserMuteQuery) Order(o ...usermute.OrderOption) *UserMuteQuery {
	umq.order = append(umq.order, o...)
	return umq
}

// QueryUser chains the current query on the "user" edge.
func (umq *UserMuteQuery) QueryUser() *UserQuery {
	query := (&UserClient{config: umq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := umq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := umq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(usermute.Table, usermute.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, usermute.UserTable, usermute.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(umq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryMuteUser chains the current query on the "mute_user" edge.
func (umq *UserMuteQuery) QueryMuteUser() *UserQuery {
	query := (&UserClient{config: umq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := umq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := umq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(usermute.Table, usermute.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, usermute.MuteUserTable, usermute.MuteUserColumn),
		)
		fromU = sqlgraph.SetNeighbors(umq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first UserMute entity from the query.
// Returns a *NotFoundError when no UserMute was found.
func (umq *UserMuteQuery) First(ctx context.Context) (*UserMute, error) {
	nodes, err := umq.Limit(1).All(setContextOp(ctx, umq.ctx, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{usermute.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (umq *UserMuteQuery) FirstX(ctx context.Context) *UserMute {
	node, err := umq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first UserMute ID from the query.
// Returns a *NotFoundError when no UserMute ID was found.
func (umq *UserMuteQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = umq.Limit(1).IDs(setContextOp(ctx, umq.ctx, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{usermute.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (umq *UserMuteQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := umq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single UserMute entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one UserMute entity is found.
// Returns a *NotFoundError when no UserMute entities are found.
func (umq *UserMuteQuery) Only(ctx context.Context) (*UserMute, error) {
	nodes, err := umq.Limit(2).All(setContextOp(ctx, umq.ctx, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{usermute.Label}
	default:
		return nil, &NotSingularError{usermute.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (umq *UserMuteQuery) OnlyX(ctx context.Context) *UserMute {
	node, err := umq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only UserMute ID in the query.
// Returns a *NotSingularError when more than one UserMute ID is found.
// Returns a *NotFoundError when no entities are found.
func (umq *UserMuteQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = umq.Limit(2).IDs(setContextOp(ctx, umq.ctx, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{usermute.Label}
	default:
		err = &NotSingularError{usermute.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (umq *UserMuteQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := umq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of UserMutes.
func (umq *UserMuteQuery) All(ctx context.Context) ([]*UserMute, error) {
	ctx = setContextOp(ctx, umq.ctx, "All")
	if err := umq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*UserMute, *UserMuteQuery]()
	return withInterceptors[[]*UserMute](ctx, umq, qr, umq.inters)
}

// AllX is like All, but panics if an error occurs.
func (umq *UserMuteQuery) AllX(ctx context.Context) []*UserMute {
	nodes, err := umq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of UserMute IDs.
func (umq *UserMuteQuery) IDs(ctx context.Context) (ids []uuid.UUID, err error) {
	if umq.ctx.Unique == nil && umq.path != nil {
		umq.Unique(true)
	}
	ctx = setContextOp(ctx, umq.ctx, "IDs")
	if err = umq.Select(usermute.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (umq *UserMuteQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := umq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (umq *UserMuteQuery) Count(ctx context.Context) (int, error) {
	ctx = setContextOp(ctx, umq.ctx, "Count")
	if err := umq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, umq, querierCount[*UserMuteQuery](), umq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (umq *UserMuteQuery) CountX(ctx context.Context) int {
	count, err := umq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (umq *UserMuteQuery) Exist(ctx context.Context) (bool, error) {
	ctx = setContextOp(ctx, umq.ctx, "Exist")
	switch _, err := umq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (umq *UserMuteQuery) ExistX(ctx context.Context) bool {
	exist, err := umq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the UserMuteQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (umq *UserMuteQuery) Clone() *UserMuteQuery {
	if umq == nil {
		return nil
	}
	return &UserMuteQuery{
		config:       umq.config,
		ctx:          umq.ctx.Clone(),
		order:        append([]usermute.OrderOption{}, umq.order...),
		inters:       append([]Interceptor{}, umq.inters...),
		predicates:   append([]predicate.UserMute{}, umq.predicates...),
		withUser:     umq.withUser.Clone(),
		withMuteUser: umq.withMuteUser.Clone(),
		// clone intermediate query.
		sql:  umq.sql.Clone(),
		path: umq.path,
	}
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (umq *UserMuteQuery) WithUser(opts ...func(*UserQuery)) *UserMuteQuery {
	query := (&UserClient{config: umq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	umq.withUser = query
	return umq
}

// WithMuteUser tells the query-builder to eager-load the nodes that are connected to
// the "mute_user" edge. The optional arguments are used to configure the query builder of the edge.
func (umq *UserMuteQuery) WithMuteUser(opts ...func(*UserQuery)) *UserMuteQuery {
	query := (&UserClient{config: umq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	umq.withMuteUser = query
	return umq
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
//	client.UserMute.Query().
//		GroupBy(usermute.FieldUserID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (umq *UserMuteQuery) GroupBy(field string, fields ...string) *UserMuteGroupBy {
	umq.ctx.Fields = append([]string{field}, fields...)
	grbuild := &UserMuteGroupBy{build: umq}
	grbuild.flds = &umq.ctx.Fields
	grbuild.label = usermute.Label
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
//	client.UserMute.Query().
//		Select(usermute.FieldUserID).
//		Scan(ctx, &v)
func (umq *UserMuteQuery) Select(fields ...string) *UserMuteSelect {
	umq.ctx.Fields = append(umq.ctx.Fields, fields...)
	sbuild := &UserMuteSelect{UserMuteQuery: umq}
	sbuild.label = usermute.Label
	sbuild.flds, sbuild.scan = &umq.ctx.Fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a UserMuteSelect configured with the given aggregations.
func (umq *UserMuteQuery) Aggregate(fns ...AggregateFunc) *UserMuteSelect {
	return umq.Select().Aggregate(fns...)
}

func (umq *UserMuteQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range umq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, umq); err != nil {
				return err
			}
		}
	}
	for _, f := range umq.ctx.Fields {
		if !usermute.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if umq.path != nil {
		prev, err := umq.path(ctx)
		if err != nil {
			return err
		}
		umq.sql = prev
	}
	return nil
}

func (umq *UserMuteQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*UserMute, error) {
	var (
		nodes       = []*UserMute{}
		_spec       = umq.querySpec()
		loadedTypes = [2]bool{
			umq.withUser != nil,
			umq.withMuteUser != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*UserMute).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &UserMute{config: umq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(umq.modifiers) > 0 {
		_spec.Modifiers = umq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, umq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := umq.withUser; query != nil {
		if err := umq.loadUser(ctx, query, nodes, nil,
			func(n *UserMute, e *User) { n.Edges.User = e }); err != nil {
			return nil, err
		}
	}
	if query := umq.withMuteUser; query != nil {
		if err := umq.loadMuteUser(ctx, query, nodes, nil,
			func(n *UserMute, e *User) { n.Edges.MuteUser = e }); err != nil {
			return nil, err
		}
	}
	for i := range umq.loadTotal {
		if err := umq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (umq *UserMuteQuery) loadUser(ctx context.Context, query *UserQuery, nodes []*UserMute, init func(*UserMute), assign func(*UserMute, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*UserMute)
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
func (umq *UserMuteQuery) loadMuteUser(ctx context.Context, query *UserQuery, nodes []*UserMute, init func(*UserMute), assign func(*UserMute, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*UserMute)
	for i := range nodes {
		fk := nodes[i].MuteUserID
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
			return fmt.Errorf(`unexpected foreign-key "mute_user_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}

func (umq *UserMuteQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := umq.querySpec()
	if len(umq.modifiers) > 0 {
		_spec.Modifiers = umq.modifiers
	}
	_spec.Node.Columns = umq.ctx.Fields
	if len(umq.ctx.Fields) > 0 {
		_spec.Unique = umq.ctx.Unique != nil && *umq.ctx.Unique
	}
	return sqlgraph.CountNodes(ctx, umq.driver, _spec)
}

func (umq *UserMuteQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := sqlgraph.NewQuerySpec(usermute.Table, usermute.Columns, sqlgraph.NewFieldSpec(usermute.FieldID, field.TypeUUID))
	_spec.From = umq.sql
	if unique := umq.ctx.Unique; unique != nil {
		_spec.Unique = *unique
	} else if umq.path != nil {
		_spec.Unique = true
	}
	if fields := umq.ctx.Fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, usermute.FieldID)
		for i := range fields {
			if fields[i] != usermute.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
		if umq.withUser != nil {
			_spec.Node.AddColumnOnce(usermute.FieldUserID)
		}
		if umq.withMuteUser != nil {
			_spec.Node.AddColumnOnce(usermute.FieldMuteUserID)
		}
	}
	if ps := umq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := umq.ctx.Limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := umq.ctx.Offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := umq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (umq *UserMuteQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(umq.driver.Dialect())
	t1 := builder.Table(usermute.Table)
	columns := umq.ctx.Fields
	if len(columns) == 0 {
		columns = usermute.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if umq.sql != nil {
		selector = umq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if umq.ctx.Unique != nil && *umq.ctx.Unique {
		selector.Distinct()
	}
	for _, p := range umq.predicates {
		p(selector)
	}
	for _, p := range umq.order {
		p(selector)
	}
	if offset := umq.ctx.Offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := umq.ctx.Limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// UserMuteGroupBy is the group-by builder for UserMute entities.
type UserMuteGroupBy struct {
	selector
	build *UserMuteQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (umgb *UserMuteGroupBy) Aggregate(fns ...AggregateFunc) *UserMuteGroupBy {
	umgb.fns = append(umgb.fns, fns...)
	return umgb
}

// Scan applies the selector query and scans the result into the given value.
func (umgb *UserMuteGroupBy) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, umgb.build.ctx, "GroupBy")
	if err := umgb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*UserMuteQuery, *UserMuteGroupBy](ctx, umgb.build, umgb, umgb.build.inters, v)
}

func (umgb *UserMuteGroupBy) sqlScan(ctx context.Context, root *UserMuteQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(umgb.fns))
	for _, fn := range umgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*umgb.flds)+len(umgb.fns))
		for _, f := range *umgb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*umgb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := umgb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// UserMuteSelect is the builder for selecting fields of UserMute entities.
type UserMuteSelect struct {
	*UserMuteQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (ums *UserMuteSelect) Aggregate(fns ...AggregateFunc) *UserMuteSelect {
	ums.fns = append(ums.fns, fns...)
	return ums
}

// Scan applies the selector query and scans the result into the given value.
func (ums *UserMuteSelect) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, ums.ctx, "Select")
	if err := ums.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*UserMuteQuery, *UserMuteSelect](ctx, ums.UserMuteQuery, ums, ums.inters, v)
}

func (ums *UserMuteSelect) sqlScan(ctx context.Context, root *UserMuteQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(ums.fns))
	for _, fn := range ums.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*ums.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ums.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
