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
	"github.com/k-yomo/invy/invy_api/ent/invitation"
	"github.com/k-yomo/invy/invy_api/ent/invitationdenial"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// InvitationDenialQuery is the builder for querying InvitationDenial entities.
type InvitationDenialQuery struct {
	config
	limit          *int
	offset         *int
	unique         *bool
	order          []OrderFunc
	fields         []string
	inters         []Interceptor
	predicates     []predicate.InvitationDenial
	withUser       *UserQuery
	withInvitation *InvitationQuery
	modifiers      []func(*sql.Selector)
	loadTotal      []func(context.Context, []*InvitationDenial) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the InvitationDenialQuery builder.
func (idq *InvitationDenialQuery) Where(ps ...predicate.InvitationDenial) *InvitationDenialQuery {
	idq.predicates = append(idq.predicates, ps...)
	return idq
}

// Limit the number of records to be returned by this query.
func (idq *InvitationDenialQuery) Limit(limit int) *InvitationDenialQuery {
	idq.limit = &limit
	return idq
}

// Offset to start from.
func (idq *InvitationDenialQuery) Offset(offset int) *InvitationDenialQuery {
	idq.offset = &offset
	return idq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (idq *InvitationDenialQuery) Unique(unique bool) *InvitationDenialQuery {
	idq.unique = &unique
	return idq
}

// Order specifies how the records should be ordered.
func (idq *InvitationDenialQuery) Order(o ...OrderFunc) *InvitationDenialQuery {
	idq.order = append(idq.order, o...)
	return idq
}

// QueryUser chains the current query on the "user" edge.
func (idq *InvitationDenialQuery) QueryUser() *UserQuery {
	query := (&UserClient{config: idq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := idq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := idq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(invitationdenial.Table, invitationdenial.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, invitationdenial.UserTable, invitationdenial.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(idq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryInvitation chains the current query on the "invitation" edge.
func (idq *InvitationDenialQuery) QueryInvitation() *InvitationQuery {
	query := (&InvitationClient{config: idq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := idq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := idq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(invitationdenial.Table, invitationdenial.FieldID, selector),
			sqlgraph.To(invitation.Table, invitation.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, invitationdenial.InvitationTable, invitationdenial.InvitationColumn),
		)
		fromU = sqlgraph.SetNeighbors(idq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first InvitationDenial entity from the query.
// Returns a *NotFoundError when no InvitationDenial was found.
func (idq *InvitationDenialQuery) First(ctx context.Context) (*InvitationDenial, error) {
	nodes, err := idq.Limit(1).All(newQueryContext(ctx, TypeInvitationDenial, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{invitationdenial.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (idq *InvitationDenialQuery) FirstX(ctx context.Context) *InvitationDenial {
	node, err := idq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first InvitationDenial ID from the query.
// Returns a *NotFoundError when no InvitationDenial ID was found.
func (idq *InvitationDenialQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = idq.Limit(1).IDs(newQueryContext(ctx, TypeInvitationDenial, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{invitationdenial.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (idq *InvitationDenialQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := idq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single InvitationDenial entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one InvitationDenial entity is found.
// Returns a *NotFoundError when no InvitationDenial entities are found.
func (idq *InvitationDenialQuery) Only(ctx context.Context) (*InvitationDenial, error) {
	nodes, err := idq.Limit(2).All(newQueryContext(ctx, TypeInvitationDenial, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{invitationdenial.Label}
	default:
		return nil, &NotSingularError{invitationdenial.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (idq *InvitationDenialQuery) OnlyX(ctx context.Context) *InvitationDenial {
	node, err := idq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only InvitationDenial ID in the query.
// Returns a *NotSingularError when more than one InvitationDenial ID is found.
// Returns a *NotFoundError when no entities are found.
func (idq *InvitationDenialQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = idq.Limit(2).IDs(newQueryContext(ctx, TypeInvitationDenial, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{invitationdenial.Label}
	default:
		err = &NotSingularError{invitationdenial.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (idq *InvitationDenialQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := idq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of InvitationDenials.
func (idq *InvitationDenialQuery) All(ctx context.Context) ([]*InvitationDenial, error) {
	ctx = newQueryContext(ctx, TypeInvitationDenial, "All")
	if err := idq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*InvitationDenial, *InvitationDenialQuery]()
	return withInterceptors[[]*InvitationDenial](ctx, idq, qr, idq.inters)
}

// AllX is like All, but panics if an error occurs.
func (idq *InvitationDenialQuery) AllX(ctx context.Context) []*InvitationDenial {
	nodes, err := idq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of InvitationDenial IDs.
func (idq *InvitationDenialQuery) IDs(ctx context.Context) ([]uuid.UUID, error) {
	var ids []uuid.UUID
	ctx = newQueryContext(ctx, TypeInvitationDenial, "IDs")
	if err := idq.Select(invitationdenial.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (idq *InvitationDenialQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := idq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (idq *InvitationDenialQuery) Count(ctx context.Context) (int, error) {
	ctx = newQueryContext(ctx, TypeInvitationDenial, "Count")
	if err := idq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, idq, querierCount[*InvitationDenialQuery](), idq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (idq *InvitationDenialQuery) CountX(ctx context.Context) int {
	count, err := idq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (idq *InvitationDenialQuery) Exist(ctx context.Context) (bool, error) {
	ctx = newQueryContext(ctx, TypeInvitationDenial, "Exist")
	switch _, err := idq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (idq *InvitationDenialQuery) ExistX(ctx context.Context) bool {
	exist, err := idq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the InvitationDenialQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (idq *InvitationDenialQuery) Clone() *InvitationDenialQuery {
	if idq == nil {
		return nil
	}
	return &InvitationDenialQuery{
		config:         idq.config,
		limit:          idq.limit,
		offset:         idq.offset,
		order:          append([]OrderFunc{}, idq.order...),
		inters:         append([]Interceptor{}, idq.inters...),
		predicates:     append([]predicate.InvitationDenial{}, idq.predicates...),
		withUser:       idq.withUser.Clone(),
		withInvitation: idq.withInvitation.Clone(),
		// clone intermediate query.
		sql:    idq.sql.Clone(),
		path:   idq.path,
		unique: idq.unique,
	}
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (idq *InvitationDenialQuery) WithUser(opts ...func(*UserQuery)) *InvitationDenialQuery {
	query := (&UserClient{config: idq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	idq.withUser = query
	return idq
}

// WithInvitation tells the query-builder to eager-load the nodes that are connected to
// the "invitation" edge. The optional arguments are used to configure the query builder of the edge.
func (idq *InvitationDenialQuery) WithInvitation(opts ...func(*InvitationQuery)) *InvitationDenialQuery {
	query := (&InvitationClient{config: idq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	idq.withInvitation = query
	return idq
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
//	client.InvitationDenial.Query().
//		GroupBy(invitationdenial.FieldUserID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (idq *InvitationDenialQuery) GroupBy(field string, fields ...string) *InvitationDenialGroupBy {
	idq.fields = append([]string{field}, fields...)
	grbuild := &InvitationDenialGroupBy{build: idq}
	grbuild.flds = &idq.fields
	grbuild.label = invitationdenial.Label
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
//	client.InvitationDenial.Query().
//		Select(invitationdenial.FieldUserID).
//		Scan(ctx, &v)
func (idq *InvitationDenialQuery) Select(fields ...string) *InvitationDenialSelect {
	idq.fields = append(idq.fields, fields...)
	sbuild := &InvitationDenialSelect{InvitationDenialQuery: idq}
	sbuild.label = invitationdenial.Label
	sbuild.flds, sbuild.scan = &idq.fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a InvitationDenialSelect configured with the given aggregations.
func (idq *InvitationDenialQuery) Aggregate(fns ...AggregateFunc) *InvitationDenialSelect {
	return idq.Select().Aggregate(fns...)
}

func (idq *InvitationDenialQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range idq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, idq); err != nil {
				return err
			}
		}
	}
	for _, f := range idq.fields {
		if !invitationdenial.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if idq.path != nil {
		prev, err := idq.path(ctx)
		if err != nil {
			return err
		}
		idq.sql = prev
	}
	return nil
}

func (idq *InvitationDenialQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*InvitationDenial, error) {
	var (
		nodes       = []*InvitationDenial{}
		_spec       = idq.querySpec()
		loadedTypes = [2]bool{
			idq.withUser != nil,
			idq.withInvitation != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*InvitationDenial).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &InvitationDenial{config: idq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(idq.modifiers) > 0 {
		_spec.Modifiers = idq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, idq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := idq.withUser; query != nil {
		if err := idq.loadUser(ctx, query, nodes, nil,
			func(n *InvitationDenial, e *User) { n.Edges.User = e }); err != nil {
			return nil, err
		}
	}
	if query := idq.withInvitation; query != nil {
		if err := idq.loadInvitation(ctx, query, nodes, nil,
			func(n *InvitationDenial, e *Invitation) { n.Edges.Invitation = e }); err != nil {
			return nil, err
		}
	}
	for i := range idq.loadTotal {
		if err := idq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (idq *InvitationDenialQuery) loadUser(ctx context.Context, query *UserQuery, nodes []*InvitationDenial, init func(*InvitationDenial), assign func(*InvitationDenial, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*InvitationDenial)
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
func (idq *InvitationDenialQuery) loadInvitation(ctx context.Context, query *InvitationQuery, nodes []*InvitationDenial, init func(*InvitationDenial), assign func(*InvitationDenial, *Invitation)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*InvitationDenial)
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

func (idq *InvitationDenialQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := idq.querySpec()
	if len(idq.modifiers) > 0 {
		_spec.Modifiers = idq.modifiers
	}
	_spec.Node.Columns = idq.fields
	if len(idq.fields) > 0 {
		_spec.Unique = idq.unique != nil && *idq.unique
	}
	return sqlgraph.CountNodes(ctx, idq.driver, _spec)
}

func (idq *InvitationDenialQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   invitationdenial.Table,
			Columns: invitationdenial.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: invitationdenial.FieldID,
			},
		},
		From:   idq.sql,
		Unique: true,
	}
	if unique := idq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := idq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, invitationdenial.FieldID)
		for i := range fields {
			if fields[i] != invitationdenial.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := idq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := idq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := idq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := idq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (idq *InvitationDenialQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(idq.driver.Dialect())
	t1 := builder.Table(invitationdenial.Table)
	columns := idq.fields
	if len(columns) == 0 {
		columns = invitationdenial.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if idq.sql != nil {
		selector = idq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if idq.unique != nil && *idq.unique {
		selector.Distinct()
	}
	for _, p := range idq.predicates {
		p(selector)
	}
	for _, p := range idq.order {
		p(selector)
	}
	if offset := idq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := idq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// InvitationDenialGroupBy is the group-by builder for InvitationDenial entities.
type InvitationDenialGroupBy struct {
	selector
	build *InvitationDenialQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (idgb *InvitationDenialGroupBy) Aggregate(fns ...AggregateFunc) *InvitationDenialGroupBy {
	idgb.fns = append(idgb.fns, fns...)
	return idgb
}

// Scan applies the selector query and scans the result into the given value.
func (idgb *InvitationDenialGroupBy) Scan(ctx context.Context, v any) error {
	ctx = newQueryContext(ctx, TypeInvitationDenial, "GroupBy")
	if err := idgb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*InvitationDenialQuery, *InvitationDenialGroupBy](ctx, idgb.build, idgb, idgb.build.inters, v)
}

func (idgb *InvitationDenialGroupBy) sqlScan(ctx context.Context, root *InvitationDenialQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(idgb.fns))
	for _, fn := range idgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*idgb.flds)+len(idgb.fns))
		for _, f := range *idgb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*idgb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := idgb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// InvitationDenialSelect is the builder for selecting fields of InvitationDenial entities.
type InvitationDenialSelect struct {
	*InvitationDenialQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (ids *InvitationDenialSelect) Aggregate(fns ...AggregateFunc) *InvitationDenialSelect {
	ids.fns = append(ids.fns, fns...)
	return ids
}

// Scan applies the selector query and scans the result into the given value.
func (ids *InvitationDenialSelect) Scan(ctx context.Context, v any) error {
	ctx = newQueryContext(ctx, TypeInvitationDenial, "Select")
	if err := ids.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*InvitationDenialQuery, *InvitationDenialSelect](ctx, ids.InvitationDenialQuery, ids, ids.inters, v)
}

func (ids *InvitationDenialSelect) sqlScan(ctx context.Context, root *InvitationDenialQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(ids.fns))
	for _, fn := range ids.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*ids.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ids.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
