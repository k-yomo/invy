import '../components/friend_fragment.graphql.dart';
import '../components/friend_group_fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$friendScreenViewer {
  Query$friendScreenViewer({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$friendScreenViewer.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenViewer(
      viewer: Query$friendScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendScreenViewer$viewer viewer;

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
    if (!(other is Query$friendScreenViewer) ||
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

extension UtilityExtension$Query$friendScreenViewer
    on Query$friendScreenViewer {
  CopyWith$Query$friendScreenViewer<Query$friendScreenViewer> get copyWith =>
      CopyWith$Query$friendScreenViewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$friendScreenViewer<TRes> {
  factory CopyWith$Query$friendScreenViewer(
    Query$friendScreenViewer instance,
    TRes Function(Query$friendScreenViewer) then,
  ) = _CopyWithImpl$Query$friendScreenViewer;

  factory CopyWith$Query$friendScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendScreenViewer;

  TRes call({
    Query$friendScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$friendScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$friendScreenViewer<TRes>
    implements CopyWith$Query$friendScreenViewer<TRes> {
  _CopyWithImpl$Query$friendScreenViewer(
    this._instance,
    this._then,
  );

  final Query$friendScreenViewer _instance;

  final TRes Function(Query$friendScreenViewer) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$friendScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$friendScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$friendScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$friendScreenViewer<TRes>
    implements CopyWith$Query$friendScreenViewer<TRes> {
  _CopyWithStubImpl$Query$friendScreenViewer(this._res);

  TRes _res;

  call({
    Query$friendScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$friendScreenViewer$viewer.stub(_res);
}

const documentNodeQueryfriendScreenViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'friendScreenViewer'),
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
            name: NameNode(value: 'friendGroups'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'friendGroupListItemFragment'),
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
  fragmentDefinitionfriendGroupListItemFragment,
  fragmentDefinitionfriendListItemFragment,
]);
Query$friendScreenViewer _parserFn$Query$friendScreenViewer(
        Map<String, dynamic> data) =>
    Query$friendScreenViewer.fromJson(data);

class Options$Query$friendScreenViewer
    extends graphql.QueryOptions<Query$friendScreenViewer> {
  Options$Query$friendScreenViewer({
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
          document: documentNodeQueryfriendScreenViewer,
          parserFn: _parserFn$Query$friendScreenViewer,
        );
}

class WatchOptions$Query$friendScreenViewer
    extends graphql.WatchQueryOptions<Query$friendScreenViewer> {
  WatchOptions$Query$friendScreenViewer({
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
          document: documentNodeQueryfriendScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$friendScreenViewer,
        );
}

class FetchMoreOptions$Query$friendScreenViewer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$friendScreenViewer(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryfriendScreenViewer,
        );
}

extension ClientExtension$Query$friendScreenViewer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$friendScreenViewer>>
      query$friendScreenViewer(
              [Options$Query$friendScreenViewer? options]) async =>
          await this.query(options ?? Options$Query$friendScreenViewer());
  graphql.ObservableQuery<Query$friendScreenViewer>
      watchQuery$friendScreenViewer(
              [WatchOptions$Query$friendScreenViewer? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$friendScreenViewer());
  void writeQuery$friendScreenViewer({
    required Query$friendScreenViewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryfriendScreenViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$friendScreenViewer? readQuery$friendScreenViewer(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryfriendScreenViewer)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$friendScreenViewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$friendScreenViewer>
    useQuery$friendScreenViewer([Options$Query$friendScreenViewer? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$friendScreenViewer());
graphql.ObservableQuery<Query$friendScreenViewer>
    useWatchQuery$friendScreenViewer(
            [WatchOptions$Query$friendScreenViewer? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$friendScreenViewer());

class Query$friendScreenViewer$Widget
    extends graphql_flutter.Query<Query$friendScreenViewer> {
  Query$friendScreenViewer$Widget({
    widgets.Key? key,
    Options$Query$friendScreenViewer? options,
    required graphql_flutter.QueryBuilder<Query$friendScreenViewer> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$friendScreenViewer(),
          builder: builder,
        );
}

class Query$friendScreenViewer$viewer {
  Query$friendScreenViewer$viewer({
    required this.friendGroups,
    required this.friends,
    required this.$__typename,
  });

  factory Query$friendScreenViewer$viewer.fromJson(Map<String, dynamic> json) {
    final l$friendGroups = json['friendGroups'];
    final l$friends = json['friends'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenViewer$viewer(
      friendGroups: (l$friendGroups as List<dynamic>)
          .map((e) => Fragment$friendGroupListItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      friends: Query$friendScreenViewer$viewer$friends.fromJson(
          (l$friends as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$friendGroupListItemFragment> friendGroups;

  final Query$friendScreenViewer$viewer$friends friends;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$friendGroups = friendGroups;
    _resultData['friendGroups'] =
        l$friendGroups.map((e) => e.toJson()).toList();
    final l$friends = friends;
    _resultData['friends'] = l$friends.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$friendGroups = friendGroups;
    final l$friends = friends;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$friendGroups.map((v) => v)),
      l$friends,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$friendScreenViewer$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$friendGroups = friendGroups;
    final lOther$friendGroups = other.friendGroups;
    if (l$friendGroups.length != lOther$friendGroups.length) {
      return false;
    }
    for (int i = 0; i < l$friendGroups.length; i++) {
      final l$friendGroups$entry = l$friendGroups[i];
      final lOther$friendGroups$entry = lOther$friendGroups[i];
      if (l$friendGroups$entry != lOther$friendGroups$entry) {
        return false;
      }
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

extension UtilityExtension$Query$friendScreenViewer$viewer
    on Query$friendScreenViewer$viewer {
  CopyWith$Query$friendScreenViewer$viewer<Query$friendScreenViewer$viewer>
      get copyWith => CopyWith$Query$friendScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendScreenViewer$viewer<TRes> {
  factory CopyWith$Query$friendScreenViewer$viewer(
    Query$friendScreenViewer$viewer instance,
    TRes Function(Query$friendScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$friendScreenViewer$viewer;

  factory CopyWith$Query$friendScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendScreenViewer$viewer;

  TRes call({
    List<Fragment$friendGroupListItemFragment>? friendGroups,
    Query$friendScreenViewer$viewer$friends? friends,
    String? $__typename,
  });
  TRes friendGroups(
      Iterable<Fragment$friendGroupListItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$friendGroupListItemFragment<
                      Fragment$friendGroupListItemFragment>>)
          _fn);
  CopyWith$Query$friendScreenViewer$viewer$friends<TRes> get friends;
}

class _CopyWithImpl$Query$friendScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$friendScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$friendScreenViewer$viewer _instance;

  final TRes Function(Query$friendScreenViewer$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? friendGroups = _undefined,
    Object? friends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenViewer$viewer(
        friendGroups: friendGroups == _undefined || friendGroups == null
            ? _instance.friendGroups
            : (friendGroups as List<Fragment$friendGroupListItemFragment>),
        friends: friends == _undefined || friends == null
            ? _instance.friends
            : (friends as Query$friendScreenViewer$viewer$friends),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes friendGroups(
          Iterable<Fragment$friendGroupListItemFragment> Function(
                  Iterable<
                      CopyWith$Fragment$friendGroupListItemFragment<
                          Fragment$friendGroupListItemFragment>>)
              _fn) =>
      call(
          friendGroups: _fn(_instance.friendGroups
              .map((e) => CopyWith$Fragment$friendGroupListItemFragment(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$friendScreenViewer$viewer$friends<TRes> get friends {
    final local$friends = _instance.friends;
    return CopyWith$Query$friendScreenViewer$viewer$friends(
        local$friends, (e) => call(friends: e));
  }
}

class _CopyWithStubImpl$Query$friendScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$friendScreenViewer$viewer(this._res);

  TRes _res;

  call({
    List<Fragment$friendGroupListItemFragment>? friendGroups,
    Query$friendScreenViewer$viewer$friends? friends,
    String? $__typename,
  }) =>
      _res;
  friendGroups(_fn) => _res;
  CopyWith$Query$friendScreenViewer$viewer$friends<TRes> get friends =>
      CopyWith$Query$friendScreenViewer$viewer$friends.stub(_res);
}

class Query$friendScreenViewer$viewer$friends {
  Query$friendScreenViewer$viewer$friends({
    required this.edges,
    required this.pageInfo,
    required this.$__typename,
  });

  factory Query$friendScreenViewer$viewer$friends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenViewer$viewer$friends(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$friendScreenViewer$viewer$friends$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$friendScreenViewer$viewer$friends$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$friendScreenViewer$viewer$friends$edges> edges;

  final Query$friendScreenViewer$viewer$friends$pageInfo pageInfo;

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
    if (!(other is Query$friendScreenViewer$viewer$friends) ||
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

extension UtilityExtension$Query$friendScreenViewer$viewer$friends
    on Query$friendScreenViewer$viewer$friends {
  CopyWith$Query$friendScreenViewer$viewer$friends<
          Query$friendScreenViewer$viewer$friends>
      get copyWith => CopyWith$Query$friendScreenViewer$viewer$friends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendScreenViewer$viewer$friends<TRes> {
  factory CopyWith$Query$friendScreenViewer$viewer$friends(
    Query$friendScreenViewer$viewer$friends instance,
    TRes Function(Query$friendScreenViewer$viewer$friends) then,
  ) = _CopyWithImpl$Query$friendScreenViewer$viewer$friends;

  factory CopyWith$Query$friendScreenViewer$viewer$friends.stub(TRes res) =
      _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends;

  TRes call({
    List<Query$friendScreenViewer$viewer$friends$edges>? edges,
    Query$friendScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$friendScreenViewer$viewer$friends$edges> Function(
              Iterable<
                  CopyWith$Query$friendScreenViewer$viewer$friends$edges<
                      Query$friendScreenViewer$viewer$friends$edges>>)
          _fn);
  CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$friendScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer$friends<TRes> {
  _CopyWithImpl$Query$friendScreenViewer$viewer$friends(
    this._instance,
    this._then,
  );

  final Query$friendScreenViewer$viewer$friends _instance;

  final TRes Function(Query$friendScreenViewer$viewer$friends) _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenViewer$viewer$friends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$friendScreenViewer$viewer$friends$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$friendScreenViewer$viewer$friends$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$friendScreenViewer$viewer$friends$edges> Function(
                  Iterable<
                      CopyWith$Query$friendScreenViewer$viewer$friends$edges<
                          Query$friendScreenViewer$viewer$friends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map(
              (e) => CopyWith$Query$friendScreenViewer$viewer$friends$edges(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer$friends<TRes> {
  _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends(this._res);

  TRes _res;

  call({
    List<Query$friendScreenViewer$viewer$friends$edges>? edges,
    Query$friendScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
  CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo.stub(_res);
}

class Query$friendScreenViewer$viewer$friends$edges {
  Query$friendScreenViewer$viewer$friends$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$friendScreenViewer$viewer$friends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenViewer$viewer$friends$edges(
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
    if (!(other is Query$friendScreenViewer$viewer$friends$edges) ||
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

extension UtilityExtension$Query$friendScreenViewer$viewer$friends$edges
    on Query$friendScreenViewer$viewer$friends$edges {
  CopyWith$Query$friendScreenViewer$viewer$friends$edges<
          Query$friendScreenViewer$viewer$friends$edges>
      get copyWith => CopyWith$Query$friendScreenViewer$viewer$friends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendScreenViewer$viewer$friends$edges<TRes> {
  factory CopyWith$Query$friendScreenViewer$viewer$friends$edges(
    Query$friendScreenViewer$viewer$friends$edges instance,
    TRes Function(Query$friendScreenViewer$viewer$friends$edges) then,
  ) = _CopyWithImpl$Query$friendScreenViewer$viewer$friends$edges;

  factory CopyWith$Query$friendScreenViewer$viewer$friends$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends$edges;

  TRes call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  });
  CopyWith$Fragment$friendListItemFragment<TRes> get node;
}

class _CopyWithImpl$Query$friendScreenViewer$viewer$friends$edges<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithImpl$Query$friendScreenViewer$viewer$friends$edges(
    this._instance,
    this._then,
  );

  final Query$friendScreenViewer$viewer$friends$edges _instance;

  final TRes Function(Query$friendScreenViewer$viewer$friends$edges) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenViewer$viewer$friends$edges(
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

class _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends$edges<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends$edges(this._res);

  TRes _res;

  call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$friendListItemFragment<TRes> get node =>
      CopyWith$Fragment$friendListItemFragment.stub(_res);
}

class Query$friendScreenViewer$viewer$friends$pageInfo {
  Query$friendScreenViewer$viewer$friends$pageInfo({
    this.startCursor,
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.$__typename,
  });

  factory Query$friendScreenViewer$viewer$friends$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenViewer$viewer$friends$pageInfo(
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
    if (!(other is Query$friendScreenViewer$viewer$friends$pageInfo) ||
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

extension UtilityExtension$Query$friendScreenViewer$viewer$friends$pageInfo
    on Query$friendScreenViewer$viewer$friends$pageInfo {
  CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo<
          Query$friendScreenViewer$viewer$friends$pageInfo>
      get copyWith => CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo<TRes> {
  factory CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo(
    Query$friendScreenViewer$viewer$friends$pageInfo instance,
    TRes Function(Query$friendScreenViewer$viewer$friends$pageInfo) then,
  ) = _CopyWithImpl$Query$friendScreenViewer$viewer$friends$pageInfo;

  factory CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends$pageInfo;

  TRes call({
    String? startCursor,
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$friendScreenViewer$viewer$friends$pageInfo<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo<TRes> {
  _CopyWithImpl$Query$friendScreenViewer$viewer$friends$pageInfo(
    this._instance,
    this._then,
  );

  final Query$friendScreenViewer$viewer$friends$pageInfo _instance;

  final TRes Function(Query$friendScreenViewer$viewer$friends$pageInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenViewer$viewer$friends$pageInfo(
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

class _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends$pageInfo<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer$friends$pageInfo<TRes> {
  _CopyWithStubImpl$Query$friendScreenViewer$viewer$friends$pageInfo(this._res);

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

class Variables$Query$friendScreenFriends {
  factory Variables$Query$friendScreenFriends({
    String? after,
    int? first,
  }) =>
      Variables$Query$friendScreenFriends._({
        if (after != null) r'after': after,
        if (first != null) r'first': first,
      });

  Variables$Query$friendScreenFriends._(this._$data);

  factory Variables$Query$friendScreenFriends.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    return Variables$Query$friendScreenFriends._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get after => (_$data['after'] as String?);
  int? get first => (_$data['first'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    return result$data;
  }

  CopyWith$Variables$Query$friendScreenFriends<
          Variables$Query$friendScreenFriends>
      get copyWith => CopyWith$Variables$Query$friendScreenFriends(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$friendScreenFriends) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$after = after;
    final l$first = first;
    return Object.hashAll([
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('first') ? l$first : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$friendScreenFriends<TRes> {
  factory CopyWith$Variables$Query$friendScreenFriends(
    Variables$Query$friendScreenFriends instance,
    TRes Function(Variables$Query$friendScreenFriends) then,
  ) = _CopyWithImpl$Variables$Query$friendScreenFriends;

  factory CopyWith$Variables$Query$friendScreenFriends.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$friendScreenFriends;

  TRes call({
    String? after,
    int? first,
  });
}

class _CopyWithImpl$Variables$Query$friendScreenFriends<TRes>
    implements CopyWith$Variables$Query$friendScreenFriends<TRes> {
  _CopyWithImpl$Variables$Query$friendScreenFriends(
    this._instance,
    this._then,
  );

  final Variables$Query$friendScreenFriends _instance;

  final TRes Function(Variables$Query$friendScreenFriends) _then;

  static const _undefined = {};

  TRes call({
    Object? after = _undefined,
    Object? first = _undefined,
  }) =>
      _then(Variables$Query$friendScreenFriends._({
        ..._instance._$data,
        if (after != _undefined) 'after': (after as String?),
        if (first != _undefined) 'first': (first as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$friendScreenFriends<TRes>
    implements CopyWith$Variables$Query$friendScreenFriends<TRes> {
  _CopyWithStubImpl$Variables$Query$friendScreenFriends(this._res);

  TRes _res;

  call({
    String? after,
    int? first,
  }) =>
      _res;
}

class Query$friendScreenFriends {
  Query$friendScreenFriends({
    required this.friends,
    required this.$__typename,
  });

  factory Query$friendScreenFriends.fromJson(Map<String, dynamic> json) {
    final l$friends = json['friends'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenFriends(
      friends: Query$friendScreenFriends$friends.fromJson(
          (l$friends as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendScreenFriends$friends friends;

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
    if (!(other is Query$friendScreenFriends) ||
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

extension UtilityExtension$Query$friendScreenFriends
    on Query$friendScreenFriends {
  CopyWith$Query$friendScreenFriends<Query$friendScreenFriends> get copyWith =>
      CopyWith$Query$friendScreenFriends(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$friendScreenFriends<TRes> {
  factory CopyWith$Query$friendScreenFriends(
    Query$friendScreenFriends instance,
    TRes Function(Query$friendScreenFriends) then,
  ) = _CopyWithImpl$Query$friendScreenFriends;

  factory CopyWith$Query$friendScreenFriends.stub(TRes res) =
      _CopyWithStubImpl$Query$friendScreenFriends;

  TRes call({
    Query$friendScreenFriends$friends? friends,
    String? $__typename,
  });
  CopyWith$Query$friendScreenFriends$friends<TRes> get friends;
}

class _CopyWithImpl$Query$friendScreenFriends<TRes>
    implements CopyWith$Query$friendScreenFriends<TRes> {
  _CopyWithImpl$Query$friendScreenFriends(
    this._instance,
    this._then,
  );

  final Query$friendScreenFriends _instance;

  final TRes Function(Query$friendScreenFriends) _then;

  static const _undefined = {};

  TRes call({
    Object? friends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenFriends(
        friends: friends == _undefined || friends == null
            ? _instance.friends
            : (friends as Query$friendScreenFriends$friends),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$friendScreenFriends$friends<TRes> get friends {
    final local$friends = _instance.friends;
    return CopyWith$Query$friendScreenFriends$friends(
        local$friends, (e) => call(friends: e));
  }
}

class _CopyWithStubImpl$Query$friendScreenFriends<TRes>
    implements CopyWith$Query$friendScreenFriends<TRes> {
  _CopyWithStubImpl$Query$friendScreenFriends(this._res);

  TRes _res;

  call({
    Query$friendScreenFriends$friends? friends,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendScreenFriends$friends<TRes> get friends =>
      CopyWith$Query$friendScreenFriends$friends.stub(_res);
}

const documentNodeQueryfriendScreenFriends = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'friendScreenFriends'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'Cursor'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'friends'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
          ),
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: VariableNode(name: NameNode(value: 'first')),
          ),
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
  fragmentDefinitionfriendListItemFragment,
]);
Query$friendScreenFriends _parserFn$Query$friendScreenFriends(
        Map<String, dynamic> data) =>
    Query$friendScreenFriends.fromJson(data);

class Options$Query$friendScreenFriends
    extends graphql.QueryOptions<Query$friendScreenFriends> {
  Options$Query$friendScreenFriends({
    String? operationName,
    Variables$Query$friendScreenFriends? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryfriendScreenFriends,
          parserFn: _parserFn$Query$friendScreenFriends,
        );
}

class WatchOptions$Query$friendScreenFriends
    extends graphql.WatchQueryOptions<Query$friendScreenFriends> {
  WatchOptions$Query$friendScreenFriends({
    String? operationName,
    Variables$Query$friendScreenFriends? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryfriendScreenFriends,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$friendScreenFriends,
        );
}

class FetchMoreOptions$Query$friendScreenFriends
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$friendScreenFriends({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$friendScreenFriends? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryfriendScreenFriends,
        );
}

extension ClientExtension$Query$friendScreenFriends on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$friendScreenFriends>>
      query$friendScreenFriends(
              [Options$Query$friendScreenFriends? options]) async =>
          await this.query(options ?? Options$Query$friendScreenFriends());
  graphql.ObservableQuery<Query$friendScreenFriends>
      watchQuery$friendScreenFriends(
              [WatchOptions$Query$friendScreenFriends? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$friendScreenFriends());
  void writeQuery$friendScreenFriends({
    required Query$friendScreenFriends data,
    Variables$Query$friendScreenFriends? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryfriendScreenFriends),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$friendScreenFriends? readQuery$friendScreenFriends({
    Variables$Query$friendScreenFriends? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryfriendScreenFriends),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$friendScreenFriends.fromJson(result);
  }
}

graphql_flutter
    .QueryHookResult<Query$friendScreenFriends> useQuery$friendScreenFriends(
        [Options$Query$friendScreenFriends? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$friendScreenFriends());
graphql.ObservableQuery<Query$friendScreenFriends>
    useWatchQuery$friendScreenFriends(
            [WatchOptions$Query$friendScreenFriends? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$friendScreenFriends());

class Query$friendScreenFriends$Widget
    extends graphql_flutter.Query<Query$friendScreenFriends> {
  Query$friendScreenFriends$Widget({
    widgets.Key? key,
    Options$Query$friendScreenFriends? options,
    required graphql_flutter.QueryBuilder<Query$friendScreenFriends> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$friendScreenFriends(),
          builder: builder,
        );
}

class Query$friendScreenFriends$friends {
  Query$friendScreenFriends$friends({
    required this.edges,
    required this.pageInfo,
    required this.$__typename,
  });

  factory Query$friendScreenFriends$friends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenFriends$friends(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$friendScreenFriends$friends$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$friendScreenFriends$friends$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$friendScreenFriends$friends$edges> edges;

  final Query$friendScreenFriends$friends$pageInfo pageInfo;

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
    if (!(other is Query$friendScreenFriends$friends) ||
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

extension UtilityExtension$Query$friendScreenFriends$friends
    on Query$friendScreenFriends$friends {
  CopyWith$Query$friendScreenFriends$friends<Query$friendScreenFriends$friends>
      get copyWith => CopyWith$Query$friendScreenFriends$friends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendScreenFriends$friends<TRes> {
  factory CopyWith$Query$friendScreenFriends$friends(
    Query$friendScreenFriends$friends instance,
    TRes Function(Query$friendScreenFriends$friends) then,
  ) = _CopyWithImpl$Query$friendScreenFriends$friends;

  factory CopyWith$Query$friendScreenFriends$friends.stub(TRes res) =
      _CopyWithStubImpl$Query$friendScreenFriends$friends;

  TRes call({
    List<Query$friendScreenFriends$friends$edges>? edges,
    Query$friendScreenFriends$friends$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$friendScreenFriends$friends$edges> Function(
              Iterable<
                  CopyWith$Query$friendScreenFriends$friends$edges<
                      Query$friendScreenFriends$friends$edges>>)
          _fn);
  CopyWith$Query$friendScreenFriends$friends$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$friendScreenFriends$friends<TRes>
    implements CopyWith$Query$friendScreenFriends$friends<TRes> {
  _CopyWithImpl$Query$friendScreenFriends$friends(
    this._instance,
    this._then,
  );

  final Query$friendScreenFriends$friends _instance;

  final TRes Function(Query$friendScreenFriends$friends) _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenFriends$friends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$friendScreenFriends$friends$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$friendScreenFriends$friends$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$friendScreenFriends$friends$edges> Function(
                  Iterable<
                      CopyWith$Query$friendScreenFriends$friends$edges<
                          Query$friendScreenFriends$friends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$friendScreenFriends$friends$edges(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$friendScreenFriends$friends$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$friendScreenFriends$friends$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$friendScreenFriends$friends<TRes>
    implements CopyWith$Query$friendScreenFriends$friends<TRes> {
  _CopyWithStubImpl$Query$friendScreenFriends$friends(this._res);

  TRes _res;

  call({
    List<Query$friendScreenFriends$friends$edges>? edges,
    Query$friendScreenFriends$friends$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
  CopyWith$Query$friendScreenFriends$friends$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$friendScreenFriends$friends$pageInfo.stub(_res);
}

class Query$friendScreenFriends$friends$edges {
  Query$friendScreenFriends$friends$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$friendScreenFriends$friends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenFriends$friends$edges(
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
    if (!(other is Query$friendScreenFriends$friends$edges) ||
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

extension UtilityExtension$Query$friendScreenFriends$friends$edges
    on Query$friendScreenFriends$friends$edges {
  CopyWith$Query$friendScreenFriends$friends$edges<
          Query$friendScreenFriends$friends$edges>
      get copyWith => CopyWith$Query$friendScreenFriends$friends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendScreenFriends$friends$edges<TRes> {
  factory CopyWith$Query$friendScreenFriends$friends$edges(
    Query$friendScreenFriends$friends$edges instance,
    TRes Function(Query$friendScreenFriends$friends$edges) then,
  ) = _CopyWithImpl$Query$friendScreenFriends$friends$edges;

  factory CopyWith$Query$friendScreenFriends$friends$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$friendScreenFriends$friends$edges;

  TRes call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  });
  CopyWith$Fragment$friendListItemFragment<TRes> get node;
}

class _CopyWithImpl$Query$friendScreenFriends$friends$edges<TRes>
    implements CopyWith$Query$friendScreenFriends$friends$edges<TRes> {
  _CopyWithImpl$Query$friendScreenFriends$friends$edges(
    this._instance,
    this._then,
  );

  final Query$friendScreenFriends$friends$edges _instance;

  final TRes Function(Query$friendScreenFriends$friends$edges) _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenFriends$friends$edges(
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

class _CopyWithStubImpl$Query$friendScreenFriends$friends$edges<TRes>
    implements CopyWith$Query$friendScreenFriends$friends$edges<TRes> {
  _CopyWithStubImpl$Query$friendScreenFriends$friends$edges(this._res);

  TRes _res;

  call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$friendListItemFragment<TRes> get node =>
      CopyWith$Fragment$friendListItemFragment.stub(_res);
}

class Query$friendScreenFriends$friends$pageInfo {
  Query$friendScreenFriends$friends$pageInfo({
    this.startCursor,
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.$__typename,
  });

  factory Query$friendScreenFriends$friends$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenFriends$friends$pageInfo(
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
    if (!(other is Query$friendScreenFriends$friends$pageInfo) ||
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

extension UtilityExtension$Query$friendScreenFriends$friends$pageInfo
    on Query$friendScreenFriends$friends$pageInfo {
  CopyWith$Query$friendScreenFriends$friends$pageInfo<
          Query$friendScreenFriends$friends$pageInfo>
      get copyWith => CopyWith$Query$friendScreenFriends$friends$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendScreenFriends$friends$pageInfo<TRes> {
  factory CopyWith$Query$friendScreenFriends$friends$pageInfo(
    Query$friendScreenFriends$friends$pageInfo instance,
    TRes Function(Query$friendScreenFriends$friends$pageInfo) then,
  ) = _CopyWithImpl$Query$friendScreenFriends$friends$pageInfo;

  factory CopyWith$Query$friendScreenFriends$friends$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$friendScreenFriends$friends$pageInfo;

  TRes call({
    String? startCursor,
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$friendScreenFriends$friends$pageInfo<TRes>
    implements CopyWith$Query$friendScreenFriends$friends$pageInfo<TRes> {
  _CopyWithImpl$Query$friendScreenFriends$friends$pageInfo(
    this._instance,
    this._then,
  );

  final Query$friendScreenFriends$friends$pageInfo _instance;

  final TRes Function(Query$friendScreenFriends$friends$pageInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenFriends$friends$pageInfo(
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

class _CopyWithStubImpl$Query$friendScreenFriends$friends$pageInfo<TRes>
    implements CopyWith$Query$friendScreenFriends$friends$pageInfo<TRes> {
  _CopyWithStubImpl$Query$friendScreenFriends$friends$pageInfo(this._res);

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
