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
	"github.com/k-yomo/invy/invy_api/ent/invitationuser"
	"github.com/k-yomo/invy/invy_api/ent/predicate"
	"github.com/k-yomo/invy/invy_api/ent/user"
)

// InvitationUserQuery is the builder for querying InvitationUser entities.
type InvitationUserQuery struct {
	config
	ctx            *QueryContext
	order          []invitationuser.OrderOption
	inters         []Interceptor
	predicates     []predicate.InvitationUser
	withInvitation *InvitationQuery
	withUser       *UserQuery
	modifiers      []func(*sql.Selector)
	loadTotal      []func(context.Context, []*InvitationUser) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the InvitationUserQuery builder.
func (iuq *InvitationUserQuery) Where(ps ...predicate.InvitationUser) *InvitationUserQuery {
	iuq.predicates = append(iuq.predicates, ps...)
	return iuq
}

// Limit the number of records to be returned by this query.
func (iuq *InvitationUserQuery) Limit(limit int) *InvitationUserQuery {
	iuq.ctx.Limit = &limit
	return iuq
}

// Offset to start from.
func (iuq *InvitationUserQuery) Offset(offset int) *InvitationUserQuery {
	iuq.ctx.Offset = &offset
	return iuq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (iuq *InvitationUserQuery) Unique(unique bool) *InvitationUserQuery {
	iuq.ctx.Unique = &unique
	return iuq
}

// Order specifies how the records should be ordered.
func (iuq *InvitationUserQuery) Order(o ...invitationuser.OrderOption) *InvitationUserQuery {
	iuq.order = append(iuq.order, o...)
	return iuq
}

// QueryInvitation chains the current query on the "invitation" edge.
func (iuq *InvitationUserQuery) QueryInvitation() *InvitationQuery {
	query := (&InvitationClient{config: iuq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := iuq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := iuq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(invitationuser.Table, invitationuser.FieldID, selector),
			sqlgraph.To(invitation.Table, invitation.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, invitationuser.InvitationTable, invitationuser.InvitationColumn),
		)
		fromU = sqlgraph.SetNeighbors(iuq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryUser chains the current query on the "user" edge.
func (iuq *InvitationUserQuery) QueryUser() *UserQuery {
	query := (&UserClient{config: iuq.config}).Query()
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := iuq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := iuq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(invitationuser.Table, invitationuser.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, invitationuser.UserTable, invitationuser.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(iuq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first InvitationUser entity from the query.
// Returns a *NotFoundError when no InvitationUser was found.
func (iuq *InvitationUserQuery) First(ctx context.Context) (*InvitationUser, error) {
	nodes, err := iuq.Limit(1).All(setContextOp(ctx, iuq.ctx, "First"))
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{invitationuser.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (iuq *InvitationUserQuery) FirstX(ctx context.Context) *InvitationUser {
	node, err := iuq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first InvitationUser ID from the query.
// Returns a *NotFoundError when no InvitationUser ID was found.
func (iuq *InvitationUserQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = iuq.Limit(1).IDs(setContextOp(ctx, iuq.ctx, "FirstID")); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{invitationuser.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (iuq *InvitationUserQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := iuq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single InvitationUser entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one InvitationUser entity is found.
// Returns a *NotFoundError when no InvitationUser entities are found.
func (iuq *InvitationUserQuery) Only(ctx context.Context) (*InvitationUser, error) {
	nodes, err := iuq.Limit(2).All(setContextOp(ctx, iuq.ctx, "Only"))
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{invitationuser.Label}
	default:
		return nil, &NotSingularError{invitationuser.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (iuq *InvitationUserQuery) OnlyX(ctx context.Context) *InvitationUser {
	node, err := iuq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only InvitationUser ID in the query.
// Returns a *NotSingularError when more than one InvitationUser ID is found.
// Returns a *NotFoundError when no entities are found.
func (iuq *InvitationUserQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = iuq.Limit(2).IDs(setContextOp(ctx, iuq.ctx, "OnlyID")); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{invitationuser.Label}
	default:
		err = &NotSingularError{invitationuser.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (iuq *InvitationUserQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := iuq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of InvitationUsers.
func (iuq *InvitationUserQuery) All(ctx context.Context) ([]*InvitationUser, error) {
	ctx = setContextOp(ctx, iuq.ctx, "All")
	if err := iuq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	qr := querierAll[[]*InvitationUser, *InvitationUserQuery]()
	return withInterceptors[[]*InvitationUser](ctx, iuq, qr, iuq.inters)
}

// AllX is like All, but panics if an error occurs.
func (iuq *InvitationUserQuery) AllX(ctx context.Context) []*InvitationUser {
	nodes, err := iuq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of InvitationUser IDs.
func (iuq *InvitationUserQuery) IDs(ctx context.Context) (ids []uuid.UUID, err error) {
	if iuq.ctx.Unique == nil && iuq.path != nil {
		iuq.Unique(true)
	}
	ctx = setContextOp(ctx, iuq.ctx, "IDs")
	if err = iuq.Select(invitationuser.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (iuq *InvitationUserQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := iuq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (iuq *InvitationUserQuery) Count(ctx context.Context) (int, error) {
	ctx = setContextOp(ctx, iuq.ctx, "Count")
	if err := iuq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return withInterceptors[int](ctx, iuq, querierCount[*InvitationUserQuery](), iuq.inters)
}

// CountX is like Count, but panics if an error occurs.
func (iuq *InvitationUserQuery) CountX(ctx context.Context) int {
	count, err := iuq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (iuq *InvitationUserQuery) Exist(ctx context.Context) (bool, error) {
	ctx = setContextOp(ctx, iuq.ctx, "Exist")
	switch _, err := iuq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

// ExistX is like Exist, but panics if an error occurs.
func (iuq *InvitationUserQuery) ExistX(ctx context.Context) bool {
	exist, err := iuq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the InvitationUserQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (iuq *InvitationUserQuery) Clone() *InvitationUserQuery {
	if iuq == nil {
		return nil
	}
	return &InvitationUserQuery{
		config:         iuq.config,
		ctx:            iuq.ctx.Clone(),
		order:          append([]invitationuser.OrderOption{}, iuq.order...),
		inters:         append([]Interceptor{}, iuq.inters...),
		predicates:     append([]predicate.InvitationUser{}, iuq.predicates...),
		withInvitation: iuq.withInvitation.Clone(),
		withUser:       iuq.withUser.Clone(),
		// clone intermediate query.
		sql:  iuq.sql.Clone(),
		path: iuq.path,
	}
}

// WithInvitation tells the query-builder to eager-load the nodes that are connected to
// the "invitation" edge. The optional arguments are used to configure the query builder of the edge.
func (iuq *InvitationUserQuery) WithInvitation(opts ...func(*InvitationQuery)) *InvitationUserQuery {
	query := (&InvitationClient{config: iuq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	iuq.withInvitation = query
	return iuq
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (iuq *InvitationUserQuery) WithUser(opts ...func(*UserQuery)) *InvitationUserQuery {
	query := (&UserClient{config: iuq.config}).Query()
	for _, opt := range opts {
		opt(query)
	}
	iuq.withUser = query
	return iuq
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
//	client.InvitationUser.Query().
//		GroupBy(invitationuser.FieldInvitationID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (iuq *InvitationUserQuery) GroupBy(field string, fields ...string) *InvitationUserGroupBy {
	iuq.ctx.Fields = append([]string{field}, fields...)
	grbuild := &InvitationUserGroupBy{build: iuq}
	grbuild.flds = &iuq.ctx.Fields
	grbuild.label = invitationuser.Label
	grbuild.scan = grbuild.Scan
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
//	client.InvitationUser.Query().
//		Select(invitationuser.FieldInvitationID).
//		Scan(ctx, &v)
func (iuq *InvitationUserQuery) Select(fields ...string) *InvitationUserSelect {
	iuq.ctx.Fields = append(iuq.ctx.Fields, fields...)
	sbuild := &InvitationUserSelect{InvitationUserQuery: iuq}
	sbuild.label = invitationuser.Label
	sbuild.flds, sbuild.scan = &iuq.ctx.Fields, sbuild.Scan
	return sbuild
}

// Aggregate returns a InvitationUserSelect configured with the given aggregations.
func (iuq *InvitationUserQuery) Aggregate(fns ...AggregateFunc) *InvitationUserSelect {
	return iuq.Select().Aggregate(fns...)
}

func (iuq *InvitationUserQuery) prepareQuery(ctx context.Context) error {
	for _, inter := range iuq.inters {
		if inter == nil {
			return fmt.Errorf("ent: uninitialized interceptor (forgotten import ent/runtime?)")
		}
		if trv, ok := inter.(Traverser); ok {
			if err := trv.Traverse(ctx, iuq); err != nil {
				return err
			}
		}
	}
	for _, f := range iuq.ctx.Fields {
		if !invitationuser.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if iuq.path != nil {
		prev, err := iuq.path(ctx)
		if err != nil {
			return err
		}
		iuq.sql = prev
	}
	return nil
}

func (iuq *InvitationUserQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*InvitationUser, error) {
	var (
		nodes       = []*InvitationUser{}
		_spec       = iuq.querySpec()
		loadedTypes = [2]bool{
			iuq.withInvitation != nil,
			iuq.withUser != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*InvitationUser).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &InvitationUser{config: iuq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(iuq.modifiers) > 0 {
		_spec.Modifiers = iuq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, iuq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := iuq.withInvitation; query != nil {
		if err := iuq.loadInvitation(ctx, query, nodes, nil,
			func(n *InvitationUser, e *Invitation) { n.Edges.Invitation = e }); err != nil {
			return nil, err
		}
	}
	if query := iuq.withUser; query != nil {
		if err := iuq.loadUser(ctx, query, nodes, nil,
			func(n *InvitationUser, e *User) { n.Edges.User = e }); err != nil {
			return nil, err
		}
	}
	for i := range iuq.loadTotal {
		if err := iuq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (iuq *InvitationUserQuery) loadInvitation(ctx context.Context, query *InvitationQuery, nodes []*InvitationUser, init func(*InvitationUser), assign func(*InvitationUser, *Invitation)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*InvitationUser)
	for i := range nodes {
		fk := nodes[i].InvitationID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	if len(ids) == 0 {
		return nil
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
func (iuq *InvitationUserQuery) loadUser(ctx context.Context, query *UserQuery, nodes []*InvitationUser, init func(*InvitationUser), assign func(*InvitationUser, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*InvitationUser)
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

func (iuq *InvitationUserQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := iuq.querySpec()
	if len(iuq.modifiers) > 0 {
		_spec.Modifiers = iuq.modifiers
	}
	_spec.Node.Columns = iuq.ctx.Fields
	if len(iuq.ctx.Fields) > 0 {
		_spec.Unique = iuq.ctx.Unique != nil && *iuq.ctx.Unique
	}
	return sqlgraph.CountNodes(ctx, iuq.driver, _spec)
}

func (iuq *InvitationUserQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := sqlgraph.NewQuerySpec(invitationuser.Table, invitationuser.Columns, sqlgraph.NewFieldSpec(invitationuser.FieldID, field.TypeUUID))
	_spec.From = iuq.sql
	if unique := iuq.ctx.Unique; unique != nil {
		_spec.Unique = *unique
	} else if iuq.path != nil {
		_spec.Unique = true
	}
	if fields := iuq.ctx.Fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, invitationuser.FieldID)
		for i := range fields {
			if fields[i] != invitationuser.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
		if iuq.withInvitation != nil {
			_spec.Node.AddColumnOnce(invitationuser.FieldInvitationID)
		}
		if iuq.withUser != nil {
			_spec.Node.AddColumnOnce(invitationuser.FieldUserID)
		}
	}
	if ps := iuq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := iuq.ctx.Limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := iuq.ctx.Offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := iuq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (iuq *InvitationUserQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(iuq.driver.Dialect())
	t1 := builder.Table(invitationuser.Table)
	columns := iuq.ctx.Fields
	if len(columns) == 0 {
		columns = invitationuser.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if iuq.sql != nil {
		selector = iuq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if iuq.ctx.Unique != nil && *iuq.ctx.Unique {
		selector.Distinct()
	}
	for _, p := range iuq.predicates {
		p(selector)
	}
	for _, p := range iuq.order {
		p(selector)
	}
	if offset := iuq.ctx.Offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := iuq.ctx.Limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// InvitationUserGroupBy is the group-by builder for InvitationUser entities.
type InvitationUserGroupBy struct {
	selector
	build *InvitationUserQuery
}

// Aggregate adds the given aggregation functions to the group-by query.
func (iugb *InvitationUserGroupBy) Aggregate(fns ...AggregateFunc) *InvitationUserGroupBy {
	iugb.fns = append(iugb.fns, fns...)
	return iugb
}

// Scan applies the selector query and scans the result into the given value.
func (iugb *InvitationUserGroupBy) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, iugb.build.ctx, "GroupBy")
	if err := iugb.build.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*InvitationUserQuery, *InvitationUserGroupBy](ctx, iugb.build, iugb, iugb.build.inters, v)
}

func (iugb *InvitationUserGroupBy) sqlScan(ctx context.Context, root *InvitationUserQuery, v any) error {
	selector := root.sqlQuery(ctx).Select()
	aggregation := make([]string, 0, len(iugb.fns))
	for _, fn := range iugb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(*iugb.flds)+len(iugb.fns))
		for _, f := range *iugb.flds {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	selector.GroupBy(selector.Columns(*iugb.flds...)...)
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := iugb.build.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

// InvitationUserSelect is the builder for selecting fields of InvitationUser entities.
type InvitationUserSelect struct {
	*InvitationUserQuery
	selector
}

// Aggregate adds the given aggregation functions to the selector query.
func (ius *InvitationUserSelect) Aggregate(fns ...AggregateFunc) *InvitationUserSelect {
	ius.fns = append(ius.fns, fns...)
	return ius
}

// Scan applies the selector query and scans the result into the given value.
func (ius *InvitationUserSelect) Scan(ctx context.Context, v any) error {
	ctx = setContextOp(ctx, ius.ctx, "Select")
	if err := ius.prepareQuery(ctx); err != nil {
		return err
	}
	return scanWithInterceptors[*InvitationUserQuery, *InvitationUserSelect](ctx, ius.InvitationUserQuery, ius, ius.inters, v)
}

func (ius *InvitationUserSelect) sqlScan(ctx context.Context, root *InvitationUserQuery, v any) error {
	selector := root.sqlQuery(ctx)
	aggregation := make([]string, 0, len(ius.fns))
	for _, fn := range ius.fns {
		aggregation = append(aggregation, fn(selector))
	}
	switch n := len(*ius.selector.flds); {
	case n == 0 && len(aggregation) > 0:
		selector.Select(aggregation...)
	case n != 0 && len(aggregation) > 0:
		selector.AppendSelect(aggregation...)
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := ius.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
