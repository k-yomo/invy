import '../components/friend_list_item_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$blockedFriendScreenViewer {
  Query$blockedFriendScreenViewer({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$blockedFriendScreenViewer.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$blockedFriendScreenViewer(
      viewer: Query$blockedFriendScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$blockedFriendScreenViewer$viewer viewer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$viewer = viewer;
    _resultData['viewer'] = l$viewer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$viewer = viewer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$viewer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$blockedFriendScreenViewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$viewer = viewer;
    final lOther$viewer = other.viewer;
    if (l$viewer != lOther$viewer) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$blockedFriendScreenViewer
    on Query$blockedFriendScreenViewer {
  CopyWith$Query$blockedFriendScreenViewer<Query$blockedFriendScreenViewer>
      get copyWith => CopyWith$Query$blockedFriendScreenViewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$blockedFriendScreenViewer<TRes> {
  factory CopyWith$Query$blockedFriendScreenViewer(
    Query$blockedFriendScreenViewer instance,
    TRes Function(Query$blockedFriendScreenViewer) then,
  ) = _CopyWithImpl$Query$blockedFriendScreenViewer;

  factory CopyWith$Query$blockedFriendScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$blockedFriendScreenViewer;

  TRes call({
    Query$blockedFriendScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$blockedFriendScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$blockedFriendScreenViewer<TRes>
    implements CopyWith$Query$blockedFriendScreenViewer<TRes> {
  _CopyWithImpl$Query$blockedFriendScreenViewer(
    this._instance,
    this._then,
  );

  final Query$blockedFriendScreenViewer _instance;

  final TRes Function(Query$blockedFriendScreenViewer) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$blockedFriendScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$blockedFriendScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$blockedFriendScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$blockedFriendScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$blockedFriendScreenViewer<TRes>
    implements CopyWith$Query$blockedFriendScreenViewer<TRes> {
  _CopyWithStubImpl$Query$blockedFriendScreenViewer(this._res);

  TRes _res;

  call({
    Query$blockedFriendScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$blockedFriendScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$blockedFriendScreenViewer$viewer.stub(_res);
}

const documentNodeQueryblockedFriendScreenViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'blockedFriendScreenViewer'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'viewer'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'blockedFriends'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '100'),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'friendListItemFragment'),
                        directives: [],
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionfriendListItemFragment,
]);
Query$blockedFriendScreenViewer _parserFn$Query$blockedFriendScreenViewer(
        Map<String, dynamic> data) =>
    Query$blockedFriendScreenViewer.fromJson(data);

class Options$Query$blockedFriendScreenViewer
    extends graphql.QueryOptions<Query$blockedFriendScreenViewer> {
  Options$Query$blockedFriendScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryblockedFriendScreenViewer,
          parserFn: _parserFn$Query$blockedFriendScreenViewer,
        );
}

class WatchOptions$Query$blockedFriendScreenViewer
    extends graphql.WatchQueryOptions<Query$blockedFriendScreenViewer> {
  WatchOptions$Query$blockedFriendScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryblockedFriendScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$blockedFriendScreenViewer,
        );
}

class FetchMoreOptions$Query$blockedFriendScreenViewer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$blockedFriendScreenViewer(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryblockedFriendScreenViewer,
        );
}

extension ClientExtension$Query$blockedFriendScreenViewer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$blockedFriendScreenViewer>>
      query$blockedFriendScreenViewer(
              [Options$Query$blockedFriendScreenViewer? options]) async =>
          await this
              .query(options ?? Options$Query$blockedFriendScreenViewer());
  graphql.ObservableQuery<Query$blockedFriendScreenViewer>
      watchQuery$blockedFriendScreenViewer(
              [WatchOptions$Query$blockedFriendScreenViewer? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$blockedFriendScreenViewer());
  void writeQuery$blockedFriendScreenViewer({
    required Query$blockedFriendScreenViewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryblockedFriendScreenViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$blockedFriendScreenViewer? readQuery$blockedFriendScreenViewer(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryblockedFriendScreenViewer)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$blockedFriendScreenViewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$blockedFriendScreenViewer>
    useQuery$blockedFriendScreenViewer(
            [Options$Query$blockedFriendScreenViewer? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$blockedFriendScreenViewer());
graphql.ObservableQuery<Query$blockedFriendScreenViewer>
    useWatchQuery$blockedFriendScreenViewer(
            [WatchOptions$Query$blockedFriendScreenViewer? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$blockedFriendScreenViewer());

class Query$blockedFriendScreenViewer$Widget
    extends graphql_flutter.Query<Query$blockedFriendScreenViewer> {
  Query$blockedFriendScreenViewer$Widget({
    widgets.Key? key,
    Options$Query$blockedFriendScreenViewer? options,
    required graphql_flutter.QueryBuilder<Query$blockedFriendScreenViewer>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$blockedFriendScreenViewer(),
          builder: builder,
        );
}

class Query$blockedFriendScreenViewer$viewer {
  Query$blockedFriendScreenViewer$viewer({
    required this.blockedFriends,
    required this.$__typename,
  });

  factory Query$blockedFriendScreenViewer$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$blockedFriends = json['blockedFriends'];
    final l$$__typename = json['__typename'];
    return Query$blockedFriendScreenViewer$viewer(
      blockedFriends:
          Query$blockedFriendScreenViewer$viewer$blockedFriends.fromJson(
              (l$blockedFriends as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$blockedFriendScreenViewer$viewer$blockedFriends blockedFriends;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$blockedFriends = blockedFriends;
    _resultData['blockedFriends'] = l$blockedFriends.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$blockedFriends = blockedFriends;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$blockedFriends,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$blockedFriendScreenViewer$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$blockedFriends = blockedFriends;
    final lOther$blockedFriends = other.blockedFriends;
    if (l$blockedFriends != lOther$blockedFriends) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$blockedFriendScreenViewer$viewer
    on Query$blockedFriendScreenViewer$viewer {
  CopyWith$Query$blockedFriendScreenViewer$viewer<
          Query$blockedFriendScreenViewer$viewer>
      get copyWith => CopyWith$Query$blockedFriendScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$blockedFriendScreenViewer$viewer<TRes> {
  factory CopyWith$Query$blockedFriendScreenViewer$viewer(
    Query$blockedFriendScreenViewer$viewer instance,
    TRes Function(Query$blockedFriendScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$blockedFriendScreenViewer$viewer;

  factory CopyWith$Query$blockedFriendScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer;

  TRes call({
    Query$blockedFriendScreenViewer$viewer$blockedFriends? blockedFriends,
    String? $__typename,
  });
  CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends<TRes>
      get blockedFriends;
}

class _CopyWithImpl$Query$blockedFriendScreenViewer$viewer<TRes>
    implements CopyWith$Query$blockedFriendScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$blockedFriendScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$blockedFriendScreenViewer$viewer _instance;

  final TRes Function(Query$blockedFriendScreenViewer$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? blockedFriends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$blockedFriendScreenViewer$viewer(
        blockedFriends: blockedFriends == _undefined || blockedFriends == null
            ? _instance.blockedFriends
            : (blockedFriends
                as Query$blockedFriendScreenViewer$viewer$blockedFriends),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends<TRes>
      get blockedFriends {
    final local$blockedFriends = _instance.blockedFriends;
    return CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends(
        local$blockedFriends, (e) => call(blockedFriends: e));
  }
}

class _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer<TRes>
    implements CopyWith$Query$blockedFriendScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer(this._res);

  TRes _res;

  call({
    Query$blockedFriendScreenViewer$viewer$blockedFriends? blockedFriends,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends<TRes>
      get blockedFriends =>
          CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends.stub(
              _res);
}

class Query$blockedFriendScreenViewer$viewer$blockedFriends {
  Query$blockedFriendScreenViewer$viewer$blockedFriends({
    required this.edges,
    required this.$__typename,
  });

  factory Query$blockedFriendScreenViewer$viewer$blockedFriends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$blockedFriendScreenViewer$viewer$blockedFriends(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$blockedFriendScreenViewer$viewer$blockedFriends$edges
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$blockedFriendScreenViewer$viewer$blockedFriends$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$blockedFriendScreenViewer$viewer$blockedFriends) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$blockedFriendScreenViewer$viewer$blockedFriends
    on Query$blockedFriendScreenViewer$viewer$blockedFriends {
  CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends<
          Query$blockedFriendScreenViewer$viewer$blockedFriends>
      get copyWith =>
          CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends<
    TRes> {
  factory CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends(
    Query$blockedFriendScreenViewer$viewer$blockedFriends instance,
    TRes Function(Query$blockedFriendScreenViewer$viewer$blockedFriends) then,
  ) = _CopyWithImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends;

  factory CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends.stub(
          TRes res) =
      _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends;

  TRes call({
    List<Query$blockedFriendScreenViewer$viewer$blockedFriends$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$blockedFriendScreenViewer$viewer$blockedFriends$edges> Function(
              Iterable<
                  CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges<
                      Query$blockedFriendScreenViewer$viewer$blockedFriends$edges>>)
          _fn);
}

class _CopyWithImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends<TRes>
    implements
        CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends<TRes> {
  _CopyWithImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends(
    this._instance,
    this._then,
  );

  final Query$blockedFriendScreenViewer$viewer$blockedFriends _instance;

  final TRes Function(Query$blockedFriendScreenViewer$viewer$blockedFriends)
      _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$blockedFriendScreenViewer$viewer$blockedFriends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$blockedFriendScreenViewer$viewer$blockedFriends$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$blockedFriendScreenViewer$viewer$blockedFriends$edges> Function(
                  Iterable<
                      CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges<
                          Query$blockedFriendScreenViewer$viewer$blockedFriends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) =>
              CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends<
        TRes>
    implements
        CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends<TRes> {
  _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends(
      this._res);

  TRes _res;

  call({
    List<Query$blockedFriendScreenViewer$viewer$blockedFriends$edges>? edges,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
}

class Query$blockedFriendScreenViewer$viewer$blockedFriends$edges {
  Query$blockedFriendScreenViewer$viewer$blockedFriends$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$blockedFriendScreenViewer$viewer$blockedFriends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$blockedFriendScreenViewer$viewer$blockedFriends$edges(
      node: Fragment$friendListItemFragment.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$friendListItemFragment node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$blockedFriendScreenViewer$viewer$blockedFriends$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges
    on Query$blockedFriendScreenViewer$viewer$blockedFriends$edges {
  CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges<
          Query$blockedFriendScreenViewer$viewer$blockedFriends$edges>
      get copyWith =>
          CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges<
    TRes> {
  factory CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges(
    Query$blockedFriendScreenViewer$viewer$blockedFriends$edges instance,
    TRes Function(Query$blockedFriendScreenViewer$viewer$blockedFriends$edges)
        then,
  ) = _CopyWithImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges;

  factory CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges;

  TRes call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  });
  CopyWith$Fragment$friendListItemFragment<TRes> get node;
}

class _CopyWithImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges<
        TRes>
    implements
        CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges<
            TRes> {
  _CopyWithImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges(
    this._instance,
    this._then,
  );

  final Query$blockedFriendScreenViewer$viewer$blockedFriends$edges _instance;

  final TRes Function(
      Query$blockedFriendScreenViewer$viewer$blockedFriends$edges) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$blockedFriendScreenViewer$viewer$blockedFriends$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Fragment$friendListItemFragment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$friendListItemFragment<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Fragment$friendListItemFragment(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges<
        TRes>
    implements
        CopyWith$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges<
            TRes> {
  _CopyWithStubImpl$Query$blockedFriendScreenViewer$viewer$blockedFriends$edges(
      this._res);

  TRes _res;

  call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$friendListItemFragment<TRes> get node =>
      CopyWith$Fragment$friendListItemFragment.stub(_res);
}

class Variables$Mutation$unblockUser {
  factory Variables$Mutation$unblockUser({required String userId}) =>
      Variables$Mutation$unblockUser._({
        r'userId': userId,
      });

  Variables$Mutation$unblockUser._(this._$data);

  factory Variables$Mutation$unblockUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Mutation$unblockUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Mutation$unblockUser<Variables$Mutation$unblockUser>
      get copyWith => CopyWith$Variables$Mutation$unblockUser(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$unblockUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

abstract class CopyWith$Variables$Mutation$unblockUser<TRes> {
  factory CopyWith$Variables$Mutation$unblockUser(
    Variables$Mutation$unblockUser instance,
    TRes Function(Variables$Mutation$unblockUser) then,
  ) = _CopyWithImpl$Variables$Mutation$unblockUser;

  factory CopyWith$Variables$Mutation$unblockUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$unblockUser;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Mutation$unblockUser<TRes>
    implements CopyWith$Variables$Mutation$unblockUser<TRes> {
  _CopyWithImpl$Variables$Mutation$unblockUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$unblockUser _instance;

  final TRes Function(Variables$Mutation$unblockUser) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Mutation$unblockUser._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$unblockUser<TRes>
    implements CopyWith$Variables$Mutation$unblockUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$unblockUser(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Mutation$unblockUser {
  Mutation$unblockUser({
    required this.unblockUser,
    required this.$__typename,
  });

  factory Mutation$unblockUser.fromJson(Map<String, dynamic> json) {
    final l$unblockUser = json['unblockUser'];
    final l$$__typename = json['__typename'];
    return Mutation$unblockUser(
      unblockUser: Mutation$unblockUser$unblockUser.fromJson(
          (l$unblockUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$unblockUser$unblockUser unblockUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unblockUser = unblockUser;
    _resultData['unblockUser'] = l$unblockUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unblockUser = unblockUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$unblockUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$unblockUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$unblockUser = unblockUser;
    final lOther$unblockUser = other.unblockUser;
    if (l$unblockUser != lOther$unblockUser) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$unblockUser on Mutation$unblockUser {
  CopyWith$Mutation$unblockUser<Mutation$unblockUser> get copyWith =>
      CopyWith$Mutation$unblockUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$unblockUser<TRes> {
  factory CopyWith$Mutation$unblockUser(
    Mutation$unblockUser instance,
    TRes Function(Mutation$unblockUser) then,
  ) = _CopyWithImpl$Mutation$unblockUser;

  factory CopyWith$Mutation$unblockUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$unblockUser;

  TRes call({
    Mutation$unblockUser$unblockUser? unblockUser,
    String? $__typename,
  });
  CopyWith$Mutation$unblockUser$unblockUser<TRes> get unblockUser;
}

class _CopyWithImpl$Mutation$unblockUser<TRes>
    implements CopyWith$Mutation$unblockUser<TRes> {
  _CopyWithImpl$Mutation$unblockUser(
    this._instance,
    this._then,
  );

  final Mutation$unblockUser _instance;

  final TRes Function(Mutation$unblockUser) _then;

  static const _undefined = {};

  TRes call({
    Object? unblockUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$unblockUser(
        unblockUser: unblockUser == _undefined || unblockUser == null
            ? _instance.unblockUser
            : (unblockUser as Mutation$unblockUser$unblockUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$unblockUser$unblockUser<TRes> get unblockUser {
    final local$unblockUser = _instance.unblockUser;
    return CopyWith$Mutation$unblockUser$unblockUser(
        local$unblockUser, (e) => call(unblockUser: e));
  }
}

class _CopyWithStubImpl$Mutation$unblockUser<TRes>
    implements CopyWith$Mutation$unblockUser<TRes> {
  _CopyWithStubImpl$Mutation$unblockUser(this._res);

  TRes _res;

  call({
    Mutation$unblockUser$unblockUser? unblockUser,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$unblockUser$unblockUser<TRes> get unblockUser =>
      CopyWith$Mutation$unblockUser$unblockUser.stub(_res);
}

const documentNodeMutationunblockUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unblockUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'unblockUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'unblockedUserId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$unblockUser _parserFn$Mutation$unblockUser(
        Map<String, dynamic> data) =>
    Mutation$unblockUser.fromJson(data);
typedef OnMutationCompleted$Mutation$unblockUser = FutureOr<void> Function(
  dynamic,
  Mutation$unblockUser?,
);

class Options$Mutation$unblockUser
    extends graphql.MutationOptions<Mutation$unblockUser> {
  Options$Mutation$unblockUser({
    String? operationName,
    required Variables$Mutation$unblockUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$unblockUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$unblockUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$unblockUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationunblockUser,
          parserFn: _parserFn$Mutation$unblockUser,
        );

  final OnMutationCompleted$Mutation$unblockUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$unblockUser
    extends graphql.WatchQueryOptions<Mutation$unblockUser> {
  WatchOptions$Mutation$unblockUser({
    String? operationName,
    required Variables$Mutation$unblockUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationunblockUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$unblockUser,
        );
}

extension ClientExtension$Mutation$unblockUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$unblockUser>> mutate$unblockUser(
          Options$Mutation$unblockUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$unblockUser> watchMutation$unblockUser(
          WatchOptions$Mutation$unblockUser options) =>
      this.watchMutation(options);
}

class Mutation$unblockUser$HookResult {
  Mutation$unblockUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$unblockUser runMutation;

  final graphql.QueryResult<Mutation$unblockUser> result;
}

Mutation$unblockUser$HookResult useMutation$unblockUser(
    [WidgetOptions$Mutation$unblockUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$unblockUser());
  return Mutation$unblockUser$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$unblockUser> useWatchMutation$unblockUser(
        WatchOptions$Mutation$unblockUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$unblockUser
    extends graphql.MutationOptions<Mutation$unblockUser> {
  WidgetOptions$Mutation$unblockUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$unblockUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$unblockUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$unblockUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationunblockUser,
          parserFn: _parserFn$Mutation$unblockUser,
        );

  final OnMutationCompleted$Mutation$unblockUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$unblockUser
    = graphql.MultiSourceResult<Mutation$unblockUser> Function(
  Variables$Mutation$unblockUser, {
  Object? optimisticResult,
});
typedef Builder$Mutation$unblockUser = widgets.Widget Function(
  RunMutation$Mutation$unblockUser,
  graphql.QueryResult<Mutation$unblockUser>?,
);

class Mutation$unblockUser$Widget
    extends graphql_flutter.Mutation<Mutation$unblockUser> {
  Mutation$unblockUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$unblockUser? options,
    required Builder$Mutation$unblockUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$unblockUser(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult: optimisticResult,
            ),
            result,
          ),
        );
}

class Mutation$unblockUser$unblockUser {
  Mutation$unblockUser$unblockUser({
    required this.unblockedUserId,
    required this.$__typename,
  });

  factory Mutation$unblockUser$unblockUser.fromJson(Map<String, dynamic> json) {
    final l$unblockedUserId = json['unblockedUserId'];
    final l$$__typename = json['__typename'];
    return Mutation$unblockUser$unblockUser(
      unblockedUserId: (l$unblockedUserId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String unblockedUserId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unblockedUserId = unblockedUserId;
    _resultData['unblockedUserId'] = l$unblockedUserId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unblockedUserId = unblockedUserId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$unblockedUserId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$unblockUser$unblockUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$unblockedUserId = unblockedUserId;
    final lOther$unblockedUserId = other.unblockedUserId;
    if (l$unblockedUserId != lOther$unblockedUserId) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$unblockUser$unblockUser
    on Mutation$unblockUser$unblockUser {
  CopyWith$Mutation$unblockUser$unblockUser<Mutation$unblockUser$unblockUser>
      get copyWith => CopyWith$Mutation$unblockUser$unblockUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$unblockUser$unblockUser<TRes> {
  factory CopyWith$Mutation$unblockUser$unblockUser(
    Mutation$unblockUser$unblockUser instance,
    TRes Function(Mutation$unblockUser$unblockUser) then,
  ) = _CopyWithImpl$Mutation$unblockUser$unblockUser;

  factory CopyWith$Mutation$unblockUser$unblockUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$unblockUser$unblockUser;

  TRes call({
    String? unblockedUserId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$unblockUser$unblockUser<TRes>
    implements CopyWith$Mutation$unblockUser$unblockUser<TRes> {
  _CopyWithImpl$Mutation$unblockUser$unblockUser(
    this._instance,
    this._then,
  );

  final Mutation$unblockUser$unblockUser _instance;

  final TRes Function(Mutation$unblockUser$unblockUser) _then;

  static const _undefined = {};

  TRes call({
    Object? unblockedUserId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$unblockUser$unblockUser(
        unblockedUserId:
            unblockedUserId == _undefined || unblockedUserId == null
                ? _instance.unblockedUserId
                : (unblockedUserId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$unblockUser$unblockUser<TRes>
    implements CopyWith$Mutation$unblockUser$unblockUser<TRes> {
  _CopyWithStubImpl$Mutation$unblockUser$unblockUser(this._res);

  TRes _res;

  call({
    String? unblockedUserId,
    String? $__typename,
  }) =>
      _res;
}
