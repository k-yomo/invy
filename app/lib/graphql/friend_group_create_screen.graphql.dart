import '../components/friend_list_item_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Query$friendGroupCreateScreenViewer {
  Query$friendGroupCreateScreenViewer({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$friendGroupCreateScreenViewer.fromJson(
      Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupCreateScreenViewer(
      viewer: Query$friendGroupCreateScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendGroupCreateScreenViewer$viewer viewer;

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
    if (!(other is Query$friendGroupCreateScreenViewer) ||
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

extension UtilityExtension$Query$friendGroupCreateScreenViewer
    on Query$friendGroupCreateScreenViewer {
  CopyWith$Query$friendGroupCreateScreenViewer<
          Query$friendGroupCreateScreenViewer>
      get copyWith => CopyWith$Query$friendGroupCreateScreenViewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupCreateScreenViewer<TRes> {
  factory CopyWith$Query$friendGroupCreateScreenViewer(
    Query$friendGroupCreateScreenViewer instance,
    TRes Function(Query$friendGroupCreateScreenViewer) then,
  ) = _CopyWithImpl$Query$friendGroupCreateScreenViewer;

  factory CopyWith$Query$friendGroupCreateScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendGroupCreateScreenViewer;

  TRes call({
    Query$friendGroupCreateScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$friendGroupCreateScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$friendGroupCreateScreenViewer<TRes>
    implements CopyWith$Query$friendGroupCreateScreenViewer<TRes> {
  _CopyWithImpl$Query$friendGroupCreateScreenViewer(
    this._instance,
    this._then,
  );

  final Query$friendGroupCreateScreenViewer _instance;

  final TRes Function(Query$friendGroupCreateScreenViewer) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupCreateScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$friendGroupCreateScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$friendGroupCreateScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$friendGroupCreateScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupCreateScreenViewer<TRes>
    implements CopyWith$Query$friendGroupCreateScreenViewer<TRes> {
  _CopyWithStubImpl$Query$friendGroupCreateScreenViewer(this._res);

  TRes _res;

  call({
    Query$friendGroupCreateScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendGroupCreateScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$friendGroupCreateScreenViewer$viewer.stub(_res);
}

const documentNodeQueryfriendGroupCreateScreenViewer =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'friendGroupCreateScreenViewer'),
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
            name: NameNode(value: 'friends'),
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
                name: NameNode(value: 'pageInfo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'startCursor'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'endCursor'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'hasNextPage'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'hasPreviousPage'),
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
Query$friendGroupCreateScreenViewer
    _parserFn$Query$friendGroupCreateScreenViewer(Map<String, dynamic> data) =>
        Query$friendGroupCreateScreenViewer.fromJson(data);

class Options$Query$friendGroupCreateScreenViewer
    extends graphql.QueryOptions<Query$friendGroupCreateScreenViewer> {
  Options$Query$friendGroupCreateScreenViewer({
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
          document: documentNodeQueryfriendGroupCreateScreenViewer,
          parserFn: _parserFn$Query$friendGroupCreateScreenViewer,
        );
}

class WatchOptions$Query$friendGroupCreateScreenViewer
    extends graphql.WatchQueryOptions<Query$friendGroupCreateScreenViewer> {
  WatchOptions$Query$friendGroupCreateScreenViewer({
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
          document: documentNodeQueryfriendGroupCreateScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$friendGroupCreateScreenViewer,
        );
}

class FetchMoreOptions$Query$friendGroupCreateScreenViewer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$friendGroupCreateScreenViewer(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryfriendGroupCreateScreenViewer,
        );
}

extension ClientExtension$Query$friendGroupCreateScreenViewer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$friendGroupCreateScreenViewer>>
      query$friendGroupCreateScreenViewer(
              [Options$Query$friendGroupCreateScreenViewer? options]) async =>
          await this
              .query(options ?? Options$Query$friendGroupCreateScreenViewer());
  graphql.ObservableQuery<Query$friendGroupCreateScreenViewer>
      watchQuery$friendGroupCreateScreenViewer(
              [WatchOptions$Query$friendGroupCreateScreenViewer? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$friendGroupCreateScreenViewer());
  void writeQuery$friendGroupCreateScreenViewer({
    required Query$friendGroupCreateScreenViewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryfriendGroupCreateScreenViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$friendGroupCreateScreenViewer? readQuery$friendGroupCreateScreenViewer(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfriendGroupCreateScreenViewer)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$friendGroupCreateScreenViewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$friendGroupCreateScreenViewer>
    useQuery$friendGroupCreateScreenViewer(
            [Options$Query$friendGroupCreateScreenViewer? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$friendGroupCreateScreenViewer());
graphql.ObservableQuery<Query$friendGroupCreateScreenViewer>
    useWatchQuery$friendGroupCreateScreenViewer(
            [WatchOptions$Query$friendGroupCreateScreenViewer? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$friendGroupCreateScreenViewer());

class Query$friendGroupCreateScreenViewer$Widget
    extends graphql_flutter.Query<Query$friendGroupCreateScreenViewer> {
  Query$friendGroupCreateScreenViewer$Widget({
    widgets.Key? key,
    Options$Query$friendGroupCreateScreenViewer? options,
    required graphql_flutter.QueryBuilder<Query$friendGroupCreateScreenViewer>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$friendGroupCreateScreenViewer(),
          builder: builder,
        );
}

class Query$friendGroupCreateScreenViewer$viewer {
  Query$friendGroupCreateScreenViewer$viewer({
    required this.friends,
    required this.$__typename,
  });

  factory Query$friendGroupCreateScreenViewer$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$friends = json['friends'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupCreateScreenViewer$viewer(
      friends: Query$friendGroupCreateScreenViewer$viewer$friends.fromJson(
          (l$friends as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendGroupCreateScreenViewer$viewer$friends friends;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$friends = friends;
    _resultData['friends'] = l$friends.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$friends = friends;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$friends,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$friendGroupCreateScreenViewer$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$friends = friends;
    final lOther$friends = other.friends;
    if (l$friends != lOther$friends) {
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

extension UtilityExtension$Query$friendGroupCreateScreenViewer$viewer
    on Query$friendGroupCreateScreenViewer$viewer {
  CopyWith$Query$friendGroupCreateScreenViewer$viewer<
          Query$friendGroupCreateScreenViewer$viewer>
      get copyWith => CopyWith$Query$friendGroupCreateScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupCreateScreenViewer$viewer<TRes> {
  factory CopyWith$Query$friendGroupCreateScreenViewer$viewer(
    Query$friendGroupCreateScreenViewer$viewer instance,
    TRes Function(Query$friendGroupCreateScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer;

  factory CopyWith$Query$friendGroupCreateScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer;

  TRes call({
    Query$friendGroupCreateScreenViewer$viewer$friends? friends,
    String? $__typename,
  });
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends<TRes> get friends;
}

class _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendGroupCreateScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$friendGroupCreateScreenViewer$viewer _instance;

  final TRes Function(Query$friendGroupCreateScreenViewer$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? friends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupCreateScreenViewer$viewer(
        friends: friends == _undefined || friends == null
            ? _instance.friends
            : (friends as Query$friendGroupCreateScreenViewer$viewer$friends),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends<TRes>
      get friends {
    final local$friends = _instance.friends;
    return CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends(
        local$friends, (e) => call(friends: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendGroupCreateScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer(this._res);

  TRes _res;

  call({
    Query$friendGroupCreateScreenViewer$viewer$friends? friends,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends<TRes>
      get friends =>
          CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends.stub(
              _res);
}

class Query$friendGroupCreateScreenViewer$viewer$friends {
  Query$friendGroupCreateScreenViewer$viewer$friends({
    required this.edges,
    required this.pageInfo,
    required this.$__typename,
  });

  factory Query$friendGroupCreateScreenViewer$viewer$friends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupCreateScreenViewer$viewer$friends(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$friendGroupCreateScreenViewer$viewer$friends$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo:
          Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$friendGroupCreateScreenViewer$viewer$friends$edges> edges;

  final Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$friendGroupCreateScreenViewer$viewer$friends) ||
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
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

extension UtilityExtension$Query$friendGroupCreateScreenViewer$viewer$friends
    on Query$friendGroupCreateScreenViewer$viewer$friends {
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends<
          Query$friendGroupCreateScreenViewer$viewer$friends>
      get copyWith =>
          CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends<
    TRes> {
  factory CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends(
    Query$friendGroupCreateScreenViewer$viewer$friends instance,
    TRes Function(Query$friendGroupCreateScreenViewer$viewer$friends) then,
  ) = _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends;

  factory CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends;

  TRes call({
    List<Query$friendGroupCreateScreenViewer$viewer$friends$edges>? edges,
    Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$friendGroupCreateScreenViewer$viewer$friends$edges> Function(
              Iterable<
                  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges<
                      Query$friendGroupCreateScreenViewer$viewer$friends$edges>>)
          _fn);
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo;
}

class _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends<TRes>
    implements
        CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends<TRes> {
  _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends(
    this._instance,
    this._then,
  );

  final Query$friendGroupCreateScreenViewer$viewer$friends _instance;

  final TRes Function(Query$friendGroupCreateScreenViewer$viewer$friends) _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupCreateScreenViewer$viewer$friends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$friendGroupCreateScreenViewer$viewer$friends$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo
                as Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$friendGroupCreateScreenViewer$viewer$friends$edges> Function(
                  Iterable<
                      CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges<
                          Query$friendGroupCreateScreenViewer$viewer$friends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) =>
              CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends<TRes>
    implements
        CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends<TRes> {
  _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends(
      this._res);

  TRes _res;

  call({
    List<Query$friendGroupCreateScreenViewer$viewer$friends$edges>? edges,
    Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo
              .stub(_res);
}

class Query$friendGroupCreateScreenViewer$viewer$friends$edges {
  Query$friendGroupCreateScreenViewer$viewer$friends$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$friendGroupCreateScreenViewer$viewer$friends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupCreateScreenViewer$viewer$friends$edges(
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
    if (!(other is Query$friendGroupCreateScreenViewer$viewer$friends$edges) ||
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

extension UtilityExtension$Query$friendGroupCreateScreenViewer$viewer$friends$edges
    on Query$friendGroupCreateScreenViewer$viewer$friends$edges {
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges<
          Query$friendGroupCreateScreenViewer$viewer$friends$edges>
      get copyWith =>
          CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges<
    TRes> {
  factory CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges(
    Query$friendGroupCreateScreenViewer$viewer$friends$edges instance,
    TRes Function(Query$friendGroupCreateScreenViewer$viewer$friends$edges)
        then,
  ) = _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends$edges;

  factory CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends$edges;

  TRes call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  });
  CopyWith$Fragment$friendListItemFragment<TRes> get node;
}

class _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends$edges<
        TRes>
    implements
        CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges<
            TRes> {
  _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends$edges(
    this._instance,
    this._then,
  );

  final Query$friendGroupCreateScreenViewer$viewer$friends$edges _instance;

  final TRes Function(Query$friendGroupCreateScreenViewer$viewer$friends$edges)
      _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupCreateScreenViewer$viewer$friends$edges(
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

class _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends$edges<
        TRes>
    implements
        CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$edges<
            TRes> {
  _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends$edges(
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

class Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo {
  Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo({
    this.startCursor,
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.$__typename,
  });

  factory Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo(
      startCursor: (l$startCursor as String?),
      endCursor: (l$endCursor as String?),
      hasNextPage: (l$hasNextPage as bool),
      hasPreviousPage: (l$hasPreviousPage as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String? startCursor;

  final String? endCursor;

  final bool hasNextPage;

  final bool hasPreviousPage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$startCursor = startCursor;
    _resultData['startCursor'] = l$startCursor;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    _resultData['hasPreviousPage'] = l$hasPreviousPage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$startCursor = startCursor;
    final l$endCursor = endCursor;
    final l$hasNextPage = hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$startCursor,
      l$endCursor,
      l$hasNextPage,
      l$hasPreviousPage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$startCursor = startCursor;
    final lOther$startCursor = other.startCursor;
    if (l$startCursor != lOther$startCursor) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$hasPreviousPage = hasPreviousPage;
    final lOther$hasPreviousPage = other.hasPreviousPage;
    if (l$hasPreviousPage != lOther$hasPreviousPage) {
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

extension UtilityExtension$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo
    on Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo {
  CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<
          Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo>
      get copyWith =>
          CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<
    TRes> {
  factory CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo(
    Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo instance,
    TRes Function(Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo)
        then,
  ) = _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo;

  factory CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo;

  TRes call({
    String? startCursor,
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<
        TRes>
    implements
        CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<
            TRes> {
  _CopyWithImpl$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo(
    this._instance,
    this._then,
  );

  final Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo _instance;

  final TRes Function(
      Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo(
        startCursor: startCursor == _undefined
            ? _instance.startCursor
            : (startCursor as String?),
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        hasPreviousPage:
            hasPreviousPage == _undefined || hasPreviousPage == null
                ? _instance.hasPreviousPage
                : (hasPreviousPage as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<
        TRes>
    implements
        CopyWith$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo<
            TRes> {
  _CopyWithStubImpl$Query$friendGroupCreateScreenViewer$viewer$friends$pageInfo(
      this._res);

  TRes _res;

  call({
    String? startCursor,
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$createFriendGroup {
  factory Variables$Mutation$createFriendGroup(
          {required Input$CreateFriendGroupInput input}) =>
      Variables$Mutation$createFriendGroup._({
        r'input': input,
      });

  Variables$Mutation$createFriendGroup._(this._$data);

  factory Variables$Mutation$createFriendGroup.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateFriendGroupInput.fromJson(
        (l$input as Map<String, dynamic>));
    return Variables$Mutation$createFriendGroup._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateFriendGroupInput get input =>
      (_$data['input'] as Input$CreateFriendGroupInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$createFriendGroup<
          Variables$Mutation$createFriendGroup>
      get copyWith => CopyWith$Variables$Mutation$createFriendGroup(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$createFriendGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$createFriendGroup<TRes> {
  factory CopyWith$Variables$Mutation$createFriendGroup(
    Variables$Mutation$createFriendGroup instance,
    TRes Function(Variables$Mutation$createFriendGroup) then,
  ) = _CopyWithImpl$Variables$Mutation$createFriendGroup;

  factory CopyWith$Variables$Mutation$createFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$createFriendGroup;

  TRes call({Input$CreateFriendGroupInput? input});
}

class _CopyWithImpl$Variables$Mutation$createFriendGroup<TRes>
    implements CopyWith$Variables$Mutation$createFriendGroup<TRes> {
  _CopyWithImpl$Variables$Mutation$createFriendGroup(
    this._instance,
    this._then,
  );

  final Variables$Mutation$createFriendGroup _instance;

  final TRes Function(Variables$Mutation$createFriendGroup) _then;

  static const _undefined = {};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$createFriendGroup._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$CreateFriendGroupInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$createFriendGroup<TRes>
    implements CopyWith$Variables$Mutation$createFriendGroup<TRes> {
  _CopyWithStubImpl$Variables$Mutation$createFriendGroup(this._res);

  TRes _res;

  call({Input$CreateFriendGroupInput? input}) => _res;
}

class Mutation$createFriendGroup {
  Mutation$createFriendGroup({
    required this.createFriendGroup,
    required this.$__typename,
  });

  factory Mutation$createFriendGroup.fromJson(Map<String, dynamic> json) {
    final l$createFriendGroup = json['createFriendGroup'];
    final l$$__typename = json['__typename'];
    return Mutation$createFriendGroup(
      createFriendGroup: Mutation$createFriendGroup$createFriendGroup.fromJson(
          (l$createFriendGroup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$createFriendGroup$createFriendGroup createFriendGroup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createFriendGroup = createFriendGroup;
    _resultData['createFriendGroup'] = l$createFriendGroup.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createFriendGroup = createFriendGroup;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createFriendGroup,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$createFriendGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createFriendGroup = createFriendGroup;
    final lOther$createFriendGroup = other.createFriendGroup;
    if (l$createFriendGroup != lOther$createFriendGroup) {
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

extension UtilityExtension$Mutation$createFriendGroup
    on Mutation$createFriendGroup {
  CopyWith$Mutation$createFriendGroup<Mutation$createFriendGroup>
      get copyWith => CopyWith$Mutation$createFriendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$createFriendGroup<TRes> {
  factory CopyWith$Mutation$createFriendGroup(
    Mutation$createFriendGroup instance,
    TRes Function(Mutation$createFriendGroup) then,
  ) = _CopyWithImpl$Mutation$createFriendGroup;

  factory CopyWith$Mutation$createFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$createFriendGroup;

  TRes call({
    Mutation$createFriendGroup$createFriendGroup? createFriendGroup,
    String? $__typename,
  });
  CopyWith$Mutation$createFriendGroup$createFriendGroup<TRes>
      get createFriendGroup;
}

class _CopyWithImpl$Mutation$createFriendGroup<TRes>
    implements CopyWith$Mutation$createFriendGroup<TRes> {
  _CopyWithImpl$Mutation$createFriendGroup(
    this._instance,
    this._then,
  );

  final Mutation$createFriendGroup _instance;

  final TRes Function(Mutation$createFriendGroup) _then;

  static const _undefined = {};

  TRes call({
    Object? createFriendGroup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$createFriendGroup(
        createFriendGroup:
            createFriendGroup == _undefined || createFriendGroup == null
                ? _instance.createFriendGroup
                : (createFriendGroup
                    as Mutation$createFriendGroup$createFriendGroup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$createFriendGroup$createFriendGroup<TRes>
      get createFriendGroup {
    final local$createFriendGroup = _instance.createFriendGroup;
    return CopyWith$Mutation$createFriendGroup$createFriendGroup(
        local$createFriendGroup, (e) => call(createFriendGroup: e));
  }
}

class _CopyWithStubImpl$Mutation$createFriendGroup<TRes>
    implements CopyWith$Mutation$createFriendGroup<TRes> {
  _CopyWithStubImpl$Mutation$createFriendGroup(this._res);

  TRes _res;

  call({
    Mutation$createFriendGroup$createFriendGroup? createFriendGroup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$createFriendGroup$createFriendGroup<TRes>
      get createFriendGroup =>
          CopyWith$Mutation$createFriendGroup$createFriendGroup.stub(_res);
}

const documentNodeMutationcreateFriendGroup = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'createFriendGroup'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateFriendGroupInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createFriendGroup'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'friendGroup'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
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
Mutation$createFriendGroup _parserFn$Mutation$createFriendGroup(
        Map<String, dynamic> data) =>
    Mutation$createFriendGroup.fromJson(data);
typedef OnMutationCompleted$Mutation$createFriendGroup = FutureOr<void>
    Function(
  dynamic,
  Mutation$createFriendGroup?,
);

class Options$Mutation$createFriendGroup
    extends graphql.MutationOptions<Mutation$createFriendGroup> {
  Options$Mutation$createFriendGroup({
    String? operationName,
    required Variables$Mutation$createFriendGroup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$createFriendGroup? onCompleted,
    graphql.OnMutationUpdate<Mutation$createFriendGroup>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$createFriendGroup(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreateFriendGroup,
          parserFn: _parserFn$Mutation$createFriendGroup,
        );

  final OnMutationCompleted$Mutation$createFriendGroup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$createFriendGroup
    extends graphql.WatchQueryOptions<Mutation$createFriendGroup> {
  WatchOptions$Mutation$createFriendGroup({
    String? operationName,
    required Variables$Mutation$createFriendGroup variables,
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
          document: documentNodeMutationcreateFriendGroup,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$createFriendGroup,
        );
}

extension ClientExtension$Mutation$createFriendGroup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$createFriendGroup>>
      mutate$createFriendGroup(
              Options$Mutation$createFriendGroup options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$createFriendGroup>
      watchMutation$createFriendGroup(
              WatchOptions$Mutation$createFriendGroup options) =>
          this.watchMutation(options);
}

class Mutation$createFriendGroup$HookResult {
  Mutation$createFriendGroup$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$createFriendGroup runMutation;

  final graphql.QueryResult<Mutation$createFriendGroup> result;
}

Mutation$createFriendGroup$HookResult useMutation$createFriendGroup(
    [WidgetOptions$Mutation$createFriendGroup? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$createFriendGroup());
  return Mutation$createFriendGroup$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$createFriendGroup>
    useWatchMutation$createFriendGroup(
            WatchOptions$Mutation$createFriendGroup options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$createFriendGroup
    extends graphql.MutationOptions<Mutation$createFriendGroup> {
  WidgetOptions$Mutation$createFriendGroup({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$createFriendGroup? onCompleted,
    graphql.OnMutationUpdate<Mutation$createFriendGroup>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$createFriendGroup(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreateFriendGroup,
          parserFn: _parserFn$Mutation$createFriendGroup,
        );

  final OnMutationCompleted$Mutation$createFriendGroup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$createFriendGroup
    = graphql.MultiSourceResult<Mutation$createFriendGroup> Function(
  Variables$Mutation$createFriendGroup, {
  Object? optimisticResult,
});
typedef Builder$Mutation$createFriendGroup = widgets.Widget Function(
  RunMutation$Mutation$createFriendGroup,
  graphql.QueryResult<Mutation$createFriendGroup>?,
);

class Mutation$createFriendGroup$Widget
    extends graphql_flutter.Mutation<Mutation$createFriendGroup> {
  Mutation$createFriendGroup$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$createFriendGroup? options,
    required Builder$Mutation$createFriendGroup builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$createFriendGroup(),
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

class Mutation$createFriendGroup$createFriendGroup {
  Mutation$createFriendGroup$createFriendGroup({
    required this.friendGroup,
    required this.$__typename,
  });

  factory Mutation$createFriendGroup$createFriendGroup.fromJson(
      Map<String, dynamic> json) {
    final l$friendGroup = json['friendGroup'];
    final l$$__typename = json['__typename'];
    return Mutation$createFriendGroup$createFriendGroup(
      friendGroup:
          Mutation$createFriendGroup$createFriendGroup$friendGroup.fromJson(
              (l$friendGroup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$createFriendGroup$createFriendGroup$friendGroup friendGroup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$friendGroup = friendGroup;
    _resultData['friendGroup'] = l$friendGroup.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$friendGroup = friendGroup;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$friendGroup,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$createFriendGroup$createFriendGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$friendGroup = friendGroup;
    final lOther$friendGroup = other.friendGroup;
    if (l$friendGroup != lOther$friendGroup) {
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

extension UtilityExtension$Mutation$createFriendGroup$createFriendGroup
    on Mutation$createFriendGroup$createFriendGroup {
  CopyWith$Mutation$createFriendGroup$createFriendGroup<
          Mutation$createFriendGroup$createFriendGroup>
      get copyWith => CopyWith$Mutation$createFriendGroup$createFriendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$createFriendGroup$createFriendGroup<TRes> {
  factory CopyWith$Mutation$createFriendGroup$createFriendGroup(
    Mutation$createFriendGroup$createFriendGroup instance,
    TRes Function(Mutation$createFriendGroup$createFriendGroup) then,
  ) = _CopyWithImpl$Mutation$createFriendGroup$createFriendGroup;

  factory CopyWith$Mutation$createFriendGroup$createFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$createFriendGroup$createFriendGroup;

  TRes call({
    Mutation$createFriendGroup$createFriendGroup$friendGroup? friendGroup,
    String? $__typename,
  });
  CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup<TRes>
      get friendGroup;
}

class _CopyWithImpl$Mutation$createFriendGroup$createFriendGroup<TRes>
    implements CopyWith$Mutation$createFriendGroup$createFriendGroup<TRes> {
  _CopyWithImpl$Mutation$createFriendGroup$createFriendGroup(
    this._instance,
    this._then,
  );

  final Mutation$createFriendGroup$createFriendGroup _instance;

  final TRes Function(Mutation$createFriendGroup$createFriendGroup) _then;

  static const _undefined = {};

  TRes call({
    Object? friendGroup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$createFriendGroup$createFriendGroup(
        friendGroup: friendGroup == _undefined || friendGroup == null
            ? _instance.friendGroup
            : (friendGroup
                as Mutation$createFriendGroup$createFriendGroup$friendGroup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup<TRes>
      get friendGroup {
    final local$friendGroup = _instance.friendGroup;
    return CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup(
        local$friendGroup, (e) => call(friendGroup: e));
  }
}

class _CopyWithStubImpl$Mutation$createFriendGroup$createFriendGroup<TRes>
    implements CopyWith$Mutation$createFriendGroup$createFriendGroup<TRes> {
  _CopyWithStubImpl$Mutation$createFriendGroup$createFriendGroup(this._res);

  TRes _res;

  call({
    Mutation$createFriendGroup$createFriendGroup$friendGroup? friendGroup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup<TRes>
      get friendGroup =>
          CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup
              .stub(_res);
}

class Mutation$createFriendGroup$createFriendGroup$friendGroup {
  Mutation$createFriendGroup$createFriendGroup$friendGroup({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$createFriendGroup$createFriendGroup$friendGroup.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$createFriendGroup$createFriendGroup$friendGroup(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$createFriendGroup$createFriendGroup$friendGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$createFriendGroup$createFriendGroup$friendGroup
    on Mutation$createFriendGroup$createFriendGroup$friendGroup {
  CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup<
          Mutation$createFriendGroup$createFriendGroup$friendGroup>
      get copyWith =>
          CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup<
    TRes> {
  factory CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup(
    Mutation$createFriendGroup$createFriendGroup$friendGroup instance,
    TRes Function(Mutation$createFriendGroup$createFriendGroup$friendGroup)
        then,
  ) = _CopyWithImpl$Mutation$createFriendGroup$createFriendGroup$friendGroup;

  factory CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$createFriendGroup$createFriendGroup$friendGroup;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$createFriendGroup$createFriendGroup$friendGroup<
        TRes>
    implements
        CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup<
            TRes> {
  _CopyWithImpl$Mutation$createFriendGroup$createFriendGroup$friendGroup(
    this._instance,
    this._then,
  );

  final Mutation$createFriendGroup$createFriendGroup$friendGroup _instance;

  final TRes Function(Mutation$createFriendGroup$createFriendGroup$friendGroup)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$createFriendGroup$createFriendGroup$friendGroup(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$createFriendGroup$createFriendGroup$friendGroup<
        TRes>
    implements
        CopyWith$Mutation$createFriendGroup$createFriendGroup$friendGroup<
            TRes> {
  _CopyWithStubImpl$Mutation$createFriendGroup$createFriendGroup$friendGroup(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
