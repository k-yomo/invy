import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$mapScreenViewer {
  Query$mapScreenViewer({
    required this.viewer,
    this.$__typename = 'Query',
  });

  factory Query$mapScreenViewer.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$mapScreenViewer(
      viewer: Query$mapScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$mapScreenViewer$viewer viewer;

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
    if (!(other is Query$mapScreenViewer) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$mapScreenViewer on Query$mapScreenViewer {
  CopyWith$Query$mapScreenViewer<Query$mapScreenViewer> get copyWith =>
      CopyWith$Query$mapScreenViewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$mapScreenViewer<TRes> {
  factory CopyWith$Query$mapScreenViewer(
    Query$mapScreenViewer instance,
    TRes Function(Query$mapScreenViewer) then,
  ) = _CopyWithImpl$Query$mapScreenViewer;

  factory CopyWith$Query$mapScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$mapScreenViewer;

  TRes call({
    Query$mapScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$mapScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$mapScreenViewer<TRes>
    implements CopyWith$Query$mapScreenViewer<TRes> {
  _CopyWithImpl$Query$mapScreenViewer(
    this._instance,
    this._then,
  );

  final Query$mapScreenViewer _instance;

  final TRes Function(Query$mapScreenViewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$mapScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$mapScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$mapScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$mapScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$mapScreenViewer<TRes>
    implements CopyWith$Query$mapScreenViewer<TRes> {
  _CopyWithStubImpl$Query$mapScreenViewer(this._res);

  TRes _res;

  call({
    Query$mapScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$mapScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$mapScreenViewer$viewer.stub(_res);
}

const documentNodeQuerymapScreenViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'mapScreenViewer'),
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
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'nickname'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'avatarUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'fuzzyCoordinate'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'latitude'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'longitude'),
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
                name: NameNode(value: 'pageInfo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'hasNextPage'),
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
]);
Query$mapScreenViewer _parserFn$Query$mapScreenViewer(
        Map<String, dynamic> data) =>
    Query$mapScreenViewer.fromJson(data);
typedef OnQueryComplete$Query$mapScreenViewer = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$mapScreenViewer?,
);

class Options$Query$mapScreenViewer
    extends graphql.QueryOptions<Query$mapScreenViewer> {
  Options$Query$mapScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$mapScreenViewer? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$mapScreenViewer? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$mapScreenViewer(data),
                  ),
          onError: onError,
          document: documentNodeQuerymapScreenViewer,
          parserFn: _parserFn$Query$mapScreenViewer,
        );

  final OnQueryComplete$Query$mapScreenViewer? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$mapScreenViewer
    extends graphql.WatchQueryOptions<Query$mapScreenViewer> {
  WatchOptions$Query$mapScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$mapScreenViewer? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerymapScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$mapScreenViewer,
        );
}

class FetchMoreOptions$Query$mapScreenViewer extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$mapScreenViewer(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerymapScreenViewer,
        );
}

extension ClientExtension$Query$mapScreenViewer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$mapScreenViewer>> query$mapScreenViewer(
          [Options$Query$mapScreenViewer? options]) async =>
      await this.query(options ?? Options$Query$mapScreenViewer());
  graphql.ObservableQuery<Query$mapScreenViewer> watchQuery$mapScreenViewer(
          [WatchOptions$Query$mapScreenViewer? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$mapScreenViewer());
  void writeQuery$mapScreenViewer({
    required Query$mapScreenViewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerymapScreenViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$mapScreenViewer? readQuery$mapScreenViewer({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerymapScreenViewer)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$mapScreenViewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$mapScreenViewer> useQuery$mapScreenViewer(
        [Options$Query$mapScreenViewer? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$mapScreenViewer());
graphql.ObservableQuery<Query$mapScreenViewer> useWatchQuery$mapScreenViewer(
        [WatchOptions$Query$mapScreenViewer? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$mapScreenViewer());

class Query$mapScreenViewer$Widget
    extends graphql_flutter.Query<Query$mapScreenViewer> {
  Query$mapScreenViewer$Widget({
    widgets.Key? key,
    Options$Query$mapScreenViewer? options,
    required graphql_flutter.QueryBuilder<Query$mapScreenViewer> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$mapScreenViewer(),
          builder: builder,
        );
}

class Query$mapScreenViewer$viewer {
  Query$mapScreenViewer$viewer({
    required this.friends,
    this.$__typename = 'Viewer',
  });

  factory Query$mapScreenViewer$viewer.fromJson(Map<String, dynamic> json) {
    final l$friends = json['friends'];
    final l$$__typename = json['__typename'];
    return Query$mapScreenViewer$viewer(
      friends: Query$mapScreenViewer$viewer$friends.fromJson(
          (l$friends as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$mapScreenViewer$viewer$friends friends;

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
    if (!(other is Query$mapScreenViewer$viewer) ||
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

extension UtilityExtension$Query$mapScreenViewer$viewer
    on Query$mapScreenViewer$viewer {
  CopyWith$Query$mapScreenViewer$viewer<Query$mapScreenViewer$viewer>
      get copyWith => CopyWith$Query$mapScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$mapScreenViewer$viewer<TRes> {
  factory CopyWith$Query$mapScreenViewer$viewer(
    Query$mapScreenViewer$viewer instance,
    TRes Function(Query$mapScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$mapScreenViewer$viewer;

  factory CopyWith$Query$mapScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$mapScreenViewer$viewer;

  TRes call({
    Query$mapScreenViewer$viewer$friends? friends,
    String? $__typename,
  });
  CopyWith$Query$mapScreenViewer$viewer$friends<TRes> get friends;
}

class _CopyWithImpl$Query$mapScreenViewer$viewer<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$mapScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$mapScreenViewer$viewer _instance;

  final TRes Function(Query$mapScreenViewer$viewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? friends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$mapScreenViewer$viewer(
        friends: friends == _undefined || friends == null
            ? _instance.friends
            : (friends as Query$mapScreenViewer$viewer$friends),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$mapScreenViewer$viewer$friends<TRes> get friends {
    final local$friends = _instance.friends;
    return CopyWith$Query$mapScreenViewer$viewer$friends(
        local$friends, (e) => call(friends: e));
  }
}

class _CopyWithStubImpl$Query$mapScreenViewer$viewer<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$mapScreenViewer$viewer(this._res);

  TRes _res;

  call({
    Query$mapScreenViewer$viewer$friends? friends,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$mapScreenViewer$viewer$friends<TRes> get friends =>
      CopyWith$Query$mapScreenViewer$viewer$friends.stub(_res);
}

class Query$mapScreenViewer$viewer$friends {
  Query$mapScreenViewer$viewer$friends({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'UserConnection',
  });

  factory Query$mapScreenViewer$viewer$friends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$mapScreenViewer$viewer$friends(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$mapScreenViewer$viewer$friends$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$mapScreenViewer$viewer$friends$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$mapScreenViewer$viewer$friends$edges> edges;

  final Query$mapScreenViewer$viewer$friends$pageInfo pageInfo;

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
    if (!(other is Query$mapScreenViewer$viewer$friends) ||
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

extension UtilityExtension$Query$mapScreenViewer$viewer$friends
    on Query$mapScreenViewer$viewer$friends {
  CopyWith$Query$mapScreenViewer$viewer$friends<
          Query$mapScreenViewer$viewer$friends>
      get copyWith => CopyWith$Query$mapScreenViewer$viewer$friends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$mapScreenViewer$viewer$friends<TRes> {
  factory CopyWith$Query$mapScreenViewer$viewer$friends(
    Query$mapScreenViewer$viewer$friends instance,
    TRes Function(Query$mapScreenViewer$viewer$friends) then,
  ) = _CopyWithImpl$Query$mapScreenViewer$viewer$friends;

  factory CopyWith$Query$mapScreenViewer$viewer$friends.stub(TRes res) =
      _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends;

  TRes call({
    List<Query$mapScreenViewer$viewer$friends$edges>? edges,
    Query$mapScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$mapScreenViewer$viewer$friends$edges> Function(
              Iterable<
                  CopyWith$Query$mapScreenViewer$viewer$friends$edges<
                      Query$mapScreenViewer$viewer$friends$edges>>)
          _fn);
  CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$mapScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer$friends<TRes> {
  _CopyWithImpl$Query$mapScreenViewer$viewer$friends(
    this._instance,
    this._then,
  );

  final Query$mapScreenViewer$viewer$friends _instance;

  final TRes Function(Query$mapScreenViewer$viewer$friends) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$mapScreenViewer$viewer$friends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$mapScreenViewer$viewer$friends$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$mapScreenViewer$viewer$friends$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$mapScreenViewer$viewer$friends$edges> Function(
                  Iterable<
                      CopyWith$Query$mapScreenViewer$viewer$friends$edges<
                          Query$mapScreenViewer$viewer$friends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$mapScreenViewer$viewer$friends$edges(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer$friends<TRes> {
  _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends(this._res);

  TRes _res;

  call({
    List<Query$mapScreenViewer$viewer$friends$edges>? edges,
    Query$mapScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
  CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo.stub(_res);
}

class Query$mapScreenViewer$viewer$friends$edges {
  Query$mapScreenViewer$viewer$friends$edges({
    required this.node,
    this.$__typename = 'UserEdge',
  });

  factory Query$mapScreenViewer$viewer$friends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$mapScreenViewer$viewer$friends$edges(
      node: Query$mapScreenViewer$viewer$friends$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$mapScreenViewer$viewer$friends$edges$node node;

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
    if (!(other is Query$mapScreenViewer$viewer$friends$edges) ||
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

extension UtilityExtension$Query$mapScreenViewer$viewer$friends$edges
    on Query$mapScreenViewer$viewer$friends$edges {
  CopyWith$Query$mapScreenViewer$viewer$friends$edges<
          Query$mapScreenViewer$viewer$friends$edges>
      get copyWith => CopyWith$Query$mapScreenViewer$viewer$friends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$mapScreenViewer$viewer$friends$edges<TRes> {
  factory CopyWith$Query$mapScreenViewer$viewer$friends$edges(
    Query$mapScreenViewer$viewer$friends$edges instance,
    TRes Function(Query$mapScreenViewer$viewer$friends$edges) then,
  ) = _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges;

  factory CopyWith$Query$mapScreenViewer$viewer$friends$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges;

  TRes call({
    Query$mapScreenViewer$viewer$friends$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$mapScreenViewer$viewer$friends$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges(
    this._instance,
    this._then,
  );

  final Query$mapScreenViewer$viewer$friends$edges _instance;

  final TRes Function(Query$mapScreenViewer$viewer$friends$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$mapScreenViewer$viewer$friends$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$mapScreenViewer$viewer$friends$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$mapScreenViewer$viewer$friends$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$mapScreenViewer$viewer$friends$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges(this._res);

  TRes _res;

  call({
    Query$mapScreenViewer$viewer$friends$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$mapScreenViewer$viewer$friends$edges$node<TRes> get node =>
      CopyWith$Query$mapScreenViewer$viewer$friends$edges$node.stub(_res);
}

class Query$mapScreenViewer$viewer$friends$edges$node {
  Query$mapScreenViewer$viewer$friends$edges$node({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    this.fuzzyCoordinate,
    this.$__typename = 'User',
  });

  factory Query$mapScreenViewer$viewer$friends$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$fuzzyCoordinate = json['fuzzyCoordinate'];
    final l$$__typename = json['__typename'];
    return Query$mapScreenViewer$viewer$friends$edges$node(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      fuzzyCoordinate: l$fuzzyCoordinate == null
          ? null
          : Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
              .fromJson((l$fuzzyCoordinate as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate?
      fuzzyCoordinate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$nickname = nickname;
    _resultData['nickname'] = l$nickname;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$fuzzyCoordinate = fuzzyCoordinate;
    _resultData['fuzzyCoordinate'] = l$fuzzyCoordinate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$fuzzyCoordinate = fuzzyCoordinate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$nickname,
      l$avatarUrl,
      l$fuzzyCoordinate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$mapScreenViewer$viewer$friends$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$nickname = nickname;
    final lOther$nickname = other.nickname;
    if (l$nickname != lOther$nickname) {
      return false;
    }
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (l$avatarUrl != lOther$avatarUrl) {
      return false;
    }
    final l$fuzzyCoordinate = fuzzyCoordinate;
    final lOther$fuzzyCoordinate = other.fuzzyCoordinate;
    if (l$fuzzyCoordinate != lOther$fuzzyCoordinate) {
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

extension UtilityExtension$Query$mapScreenViewer$viewer$friends$edges$node
    on Query$mapScreenViewer$viewer$friends$edges$node {
  CopyWith$Query$mapScreenViewer$viewer$friends$edges$node<
          Query$mapScreenViewer$viewer$friends$edges$node>
      get copyWith => CopyWith$Query$mapScreenViewer$viewer$friends$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$mapScreenViewer$viewer$friends$edges$node<TRes> {
  factory CopyWith$Query$mapScreenViewer$viewer$friends$edges$node(
    Query$mapScreenViewer$viewer$friends$edges$node instance,
    TRes Function(Query$mapScreenViewer$viewer$friends$edges$node) then,
  ) = _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges$node;

  factory CopyWith$Query$mapScreenViewer$viewer$friends$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges$node;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate?
        fuzzyCoordinate,
    String? $__typename,
  });
  CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<TRes>
      get fuzzyCoordinate;
}

class _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges$node<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer$friends$edges$node<TRes> {
  _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges$node(
    this._instance,
    this._then,
  );

  final Query$mapScreenViewer$viewer$friends$edges$node _instance;

  final TRes Function(Query$mapScreenViewer$viewer$friends$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? fuzzyCoordinate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$mapScreenViewer$viewer$friends$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        nickname: nickname == _undefined || nickname == null
            ? _instance.nickname
            : (nickname as String),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        fuzzyCoordinate: fuzzyCoordinate == _undefined
            ? _instance.fuzzyCoordinate
            : (fuzzyCoordinate
                as Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<TRes>
      get fuzzyCoordinate {
    final local$fuzzyCoordinate = _instance.fuzzyCoordinate;
    return local$fuzzyCoordinate == null
        ? CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
            .stub(_then(_instance))
        : CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
            local$fuzzyCoordinate, (e) => call(fuzzyCoordinate: e));
  }
}

class _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges$node<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer$friends$edges$node<TRes> {
  _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate?
        fuzzyCoordinate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<TRes>
      get fuzzyCoordinate =>
          CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
              .stub(_res);
}

class Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate {
  Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate({
    required this.latitude,
    required this.longitude,
    this.$__typename = 'Coordinate',
  });

  factory Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate.fromJson(
      Map<String, dynamic> json) {
    final l$latitude = json['latitude'];
    final l$longitude = json['longitude'];
    final l$$__typename = json['__typename'];
    return Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
      latitude: (l$latitude as num).toDouble(),
      longitude: (l$longitude as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final double latitude;

  final double longitude;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$latitude = latitude;
    _resultData['latitude'] = l$latitude;
    final l$longitude = longitude;
    _resultData['longitude'] = l$longitude;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$latitude = latitude;
    final l$longitude = longitude;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$latitude,
      l$longitude,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$latitude = latitude;
    final lOther$latitude = other.latitude;
    if (l$latitude != lOther$latitude) {
      return false;
    }
    final l$longitude = longitude;
    final lOther$longitude = other.longitude;
    if (l$longitude != lOther$longitude) {
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

extension UtilityExtension$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
    on Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate {
  CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
          Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate>
      get copyWith =>
          CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
    TRes> {
  factory CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
    Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate instance,
    TRes Function(
            Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate)
        then,
  ) = _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate;

  factory CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate;

  TRes call({
    double? latitude,
    double? longitude,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
        TRes>
    implements
        CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
            TRes> {
  _CopyWithImpl$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
    this._instance,
    this._then,
  );

  final Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
      _instance;

  final TRes Function(
      Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? latitude = _undefined,
    Object? longitude = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
        latitude: latitude == _undefined || latitude == null
            ? _instance.latitude
            : (latitude as double),
        longitude: longitude == _undefined || longitude == null
            ? _instance.longitude
            : (longitude as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
        TRes>
    implements
        CopyWith$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
            TRes> {
  _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
      this._res);

  TRes _res;

  call({
    double? latitude,
    double? longitude,
    String? $__typename,
  }) =>
      _res;
}

class Query$mapScreenViewer$viewer$friends$pageInfo {
  Query$mapScreenViewer$viewer$friends$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$mapScreenViewer$viewer$friends$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$mapScreenViewer$viewer$friends$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$endCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$mapScreenViewer$viewer$friends$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
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

extension UtilityExtension$Query$mapScreenViewer$viewer$friends$pageInfo
    on Query$mapScreenViewer$viewer$friends$pageInfo {
  CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo<
          Query$mapScreenViewer$viewer$friends$pageInfo>
      get copyWith => CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo<TRes> {
  factory CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo(
    Query$mapScreenViewer$viewer$friends$pageInfo instance,
    TRes Function(Query$mapScreenViewer$viewer$friends$pageInfo) then,
  ) = _CopyWithImpl$Query$mapScreenViewer$viewer$friends$pageInfo;

  factory CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$pageInfo;

  TRes call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$mapScreenViewer$viewer$friends$pageInfo<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo<TRes> {
  _CopyWithImpl$Query$mapScreenViewer$viewer$friends$pageInfo(
    this._instance,
    this._then,
  );

  final Query$mapScreenViewer$viewer$friends$pageInfo _instance;

  final TRes Function(Query$mapScreenViewer$viewer$friends$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$mapScreenViewer$viewer$friends$pageInfo(
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$pageInfo<TRes>
    implements CopyWith$Query$mapScreenViewer$viewer$friends$pageInfo<TRes> {
  _CopyWithStubImpl$Query$mapScreenViewer$viewer$friends$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  }) =>
      _res;
}
