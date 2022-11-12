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
	"github.com/k-yomo/bump/bump_api/ent/predicate"
	"github.com/k-yomo/bump/bump_api/ent/user"
	"github.com/k-yomo/bump/bump_api/ent/userprofile"
)

// UserProfileQuery is the builder for querying UserProfile entities.
type UserProfileQuery struct {
	config
	limit      *int
	offset     *int
	unique     *bool
	order      []OrderFunc
	fields     []string
	predicates []predicate.UserProfile
	withUser   *UserQuery
	modifiers  []func(*sql.Selector)
	loadTotal  []func(context.Context, []*UserProfile) error
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the UserProfileQuery builder.
func (upq *UserProfileQuery) Where(ps ...predicate.UserProfile) *UserProfileQuery {
	upq.predicates = append(upq.predicates, ps...)
	return upq
}

// Limit adds a limit step to the query.
func (upq *UserProfileQuery) Limit(limit int) *UserProfileQuery {
	upq.limit = &limit
	return upq
}

// Offset adds an offset step to the query.
func (upq *UserProfileQuery) Offset(offset int) *UserProfileQuery {
	upq.offset = &offset
	return upq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (upq *UserProfileQuery) Unique(unique bool) *UserProfileQuery {
	upq.unique = &unique
	return upq
}

// Order adds an order step to the query.
func (upq *UserProfileQuery) Order(o ...OrderFunc) *UserProfileQuery {
	upq.order = append(upq.order, o...)
	return upq
}

// QueryUser chains the current query on the "user" edge.
func (upq *UserProfileQuery) QueryUser() *UserQuery {
	query := &UserQuery{config: upq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := upq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := upq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(userprofile.Table, userprofile.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, false, userprofile.UserTable, userprofile.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(upq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first UserProfile entity from the query.
// Returns a *NotFoundError when no UserProfile was found.
func (upq *UserProfileQuery) First(ctx context.Context) (*UserProfile, error) {
	nodes, err := upq.Limit(1).All(ctx)
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{userprofile.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (upq *UserProfileQuery) FirstX(ctx context.Context) *UserProfile {
	node, err := upq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first UserProfile ID from the query.
// Returns a *NotFoundError when no UserProfile ID was found.
func (upq *UserProfileQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = upq.Limit(1).IDs(ctx); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{userprofile.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (upq *UserProfileQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := upq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single UserProfile entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one UserProfile entity is found.
// Returns a *NotFoundError when no UserProfile entities are found.
func (upq *UserProfileQuery) Only(ctx context.Context) (*UserProfile, error) {
	nodes, err := upq.Limit(2).All(ctx)
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{userprofile.Label}
	default:
		return nil, &NotSingularError{userprofile.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (upq *UserProfileQuery) OnlyX(ctx context.Context) *UserProfile {
	node, err := upq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only UserProfile ID in the query.
// Returns a *NotSingularError when more than one UserProfile ID is found.
// Returns a *NotFoundError when no entities are found.
func (upq *UserProfileQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = upq.Limit(2).IDs(ctx); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{userprofile.Label}
	default:
		err = &NotSingularError{userprofile.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (upq *UserProfileQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := upq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of UserProfiles.
func (upq *UserProfileQuery) All(ctx context.Context) ([]*UserProfile, error) {
	if err := upq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	return upq.sqlAll(ctx)
}

// AllX is like All, but panics if an error occurs.
func (upq *UserProfileQuery) AllX(ctx context.Context) []*UserProfile {
	nodes, err := upq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of UserProfile IDs.
func (upq *UserProfileQuery) IDs(ctx context.Context) ([]uuid.UUID, error) {
	var ids []uuid.UUID
	if err := upq.Select(userprofile.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (upq *UserProfileQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := upq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (upq *UserProfileQuery) Count(ctx context.Context) (int, error) {
	if err := upq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return upq.sqlCount(ctx)
}

// CountX is like Count, but panics if an error occurs.
func (upq *UserProfileQuery) CountX(ctx context.Context) int {
	count, err := upq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (upq *UserProfileQuery) Exist(ctx context.Context) (bool, error) {
	if err := upq.prepareQuery(ctx); err != nil {
		return false, err
	}
	return upq.sqlExist(ctx)
}

// ExistX is like Exist, but panics if an error occurs.
func (upq *UserProfileQuery) ExistX(ctx context.Context) bool {
	exist, err := upq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the UserProfileQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (upq *UserProfileQuery) Clone() *UserProfileQuery {
	if upq == nil {
		return nil
	}
	return &UserProfileQuery{
		config:     upq.config,
		limit:      upq.limit,
		offset:     upq.offset,
		order:      append([]OrderFunc{}, upq.order...),
		predicates: append([]predicate.UserProfile{}, upq.predicates...),
		withUser:   upq.withUser.Clone(),
		// clone intermediate query.
		sql:    upq.sql.Clone(),
		path:   upq.path,
		unique: upq.unique,
	}
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (upq *UserProfileQuery) WithUser(opts ...func(*UserQuery)) *UserProfileQuery {
	query := &UserQuery{config: upq.config}
	for _, opt := range opts {
		opt(query)
	}
	upq.withUser = query
	return upq
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
//	client.UserProfile.Query().
//		GroupBy(userprofile.FieldUserID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (upq *UserProfileQuery) GroupBy(field string, fields ...string) *UserProfileGroupBy {
	grbuild := &UserProfileGroupBy{config: upq.config}
	grbuild.fields = append([]string{field}, fields...)
	grbuild.path = func(ctx context.Context) (prev *sql.Selector, err error) {
		if err := upq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		return upq.sqlQuery(ctx), nil
	}
	grbuild.label = userprofile.Label
	grbuild.flds, grbuild.scan = &grbuild.fields, grbuild.Scan
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
//	client.UserProfile.Query().
//		Select(userprofile.FieldUserID).
//		Scan(ctx, &v)
func (upq *UserProfileQuery) Select(fields ...string) *UserProfileSelect {
	upq.fields = append(upq.fields, fields...)
	selbuild := &UserProfileSelect{UserProfileQuery: upq}
	selbuild.label = userprofile.Label
	selbuild.flds, selbuild.scan = &upq.fields, selbuild.Scan
	return selbuild
}

func (upq *UserProfileQuery) prepareQuery(ctx context.Context) error {
	for _, f := range upq.fields {
		if !userprofile.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if upq.path != nil {
		prev, err := upq.path(ctx)
		if err != nil {
			return err
		}
		upq.sql = prev
	}
	return nil
}

func (upq *UserProfileQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*UserProfile, error) {
	var (
		nodes       = []*UserProfile{}
		_spec       = upq.querySpec()
		loadedTypes = [1]bool{
			upq.withUser != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*UserProfile).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &UserProfile{config: upq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if len(upq.modifiers) > 0 {
		_spec.Modifiers = upq.modifiers
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, upq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := upq.withUser; query != nil {
		if err := upq.loadUser(ctx, query, nodes, nil,
			func(n *UserProfile, e *User) { n.Edges.User = e }); err != nil {
			return nil, err
		}
	}
	for i := range upq.loadTotal {
		if err := upq.loadTotal[i](ctx, nodes); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (upq *UserProfileQuery) loadUser(ctx context.Context, query *UserQuery, nodes []*UserProfile, init func(*UserProfile), assign func(*UserProfile, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*UserProfile)
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

func (upq *UserProfileQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := upq.querySpec()
	if len(upq.modifiers) > 0 {
		_spec.Modifiers = upq.modifiers
	}
	_spec.Node.Columns = upq.fields
	if len(upq.fields) > 0 {
		_spec.Unique = upq.unique != nil && *upq.unique
	}
	return sqlgraph.CountNodes(ctx, upq.driver, _spec)
}

func (upq *UserProfileQuery) sqlExist(ctx context.Context) (bool, error) {
	switch _, err := upq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

func (upq *UserProfileQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   userprofile.Table,
			Columns: userprofile.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: userprofile.FieldID,
			},
		},
		From:   upq.sql,
		Unique: true,
	}
	if unique := upq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := upq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, userprofile.FieldID)
		for i := range fields {
			if fields[i] != userprofile.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := upq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := upq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := upq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := upq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (upq *UserProfileQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(upq.driver.Dialect())
	t1 := builder.Table(userprofile.Table)
	columns := upq.fields
	if len(columns) == 0 {
		columns = userprofile.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if upq.sql != nil {
		selector = upq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if upq.unique != nil && *upq.unique {
		selector.Distinct()
	}
	for _, p := range upq.predicates {
		p(selector)
	}
	for _, p := range upq.order {
		p(selector)
	}
	if offset := upq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := upq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// UserProfileGroupBy is the group-by builder for UserProfile entities.
type UserProfileGroupBy struct {
	config
	selector
	fields []string
	fns    []AggregateFunc
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Aggregate adds the given aggregation functions to the group-by query.
func (upgb *UserProfileGroupBy) Aggregate(fns ...AggregateFunc) *UserProfileGroupBy {
	upgb.fns = append(upgb.fns, fns...)
	return upgb
}

// Scan applies the group-by query and scans the result into the given value.
func (upgb *UserProfileGroupBy) Scan(ctx context.Context, v any) error {
	query, err := upgb.path(ctx)
	if err != nil {
		return err
	}
	upgb.sql = query
	return upgb.sqlScan(ctx, v)
}

func (upgb *UserProfileGroupBy) sqlScan(ctx context.Context, v any) error {
	for _, f := range upgb.fields {
		if !userprofile.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("invalid field %q for group-by", f)}
		}
	}
	selector := upgb.sqlQuery()
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := upgb.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

func (upgb *UserProfileGroupBy) sqlQuery() *sql.Selector {
	selector := upgb.sql.Select()
	aggregation := make([]string, 0, len(upgb.fns))
	for _, fn := range upgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	// If no columns were selected in a custom aggregation function, the default
	// selection is the fields used for "group-by", and the aggregation functions.
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(upgb.fields)+len(upgb.fns))
		for _, f := range upgb.fields {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	return selector.GroupBy(selector.Columns(upgb.fields...)...)
}

// UserProfileSelect is the builder for selecting fields of UserProfile entities.
type UserProfileSelect struct {
	*UserProfileQuery
	selector
	// intermediate query (i.e. traversal path).
	sql *sql.Selector
}

// Scan applies the selector query and scans the result into the given value.
func (ups *UserProfileSelect) Scan(ctx context.Context, v any) error {
	if err := ups.prepareQuery(ctx); err != nil {
		return err
	}
	ups.sql = ups.UserProfileQuery.sqlQuery(ctx)
	return ups.sqlScan(ctx, v)
}

func (ups *UserProfileSelect) sqlScan(ctx context.Context, v any) error {
	rows := &sql.Rows{}
	query, args := ups.sql.Query()
	if err := ups.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
