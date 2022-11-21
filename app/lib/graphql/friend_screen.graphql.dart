import '../components/friend_group_fragment.graphql.dart';
import '../components/friend_list_item_fragment.graphql.dart';
import '../components/pending_friendship_request_list_fragment.graphql.dart';
import 'dart:async';
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
            name: NameNode(value: 'pendingFriendshipRequests'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'pendingFriendRequestItemFragment'),
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
  fragmentDefinitionfriendGroupListItemFragment,
  fragmentDefinitionfriendListItemFragment,
  fragmentDefinitionpendingFriendRequestItemFragment,
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
    required this.pendingFriendshipRequests,
    required this.$__typename,
  });

  factory Query$friendScreenViewer$viewer.fromJson(Map<String, dynamic> json) {
    final l$friendGroups = json['friendGroups'];
    final l$friends = json['friends'];
    final l$pendingFriendshipRequests = json['pendingFriendshipRequests'];
    final l$$__typename = json['__typename'];
    return Query$friendScreenViewer$viewer(
      friendGroups: (l$friendGroups as List<dynamic>)
          .map((e) => Fragment$friendGroupListItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      friends: Query$friendScreenViewer$viewer$friends.fromJson(
          (l$friends as Map<String, dynamic>)),
      pendingFriendshipRequests: (l$pendingFriendshipRequests as List<dynamic>)
          .map((e) => Fragment$pendingFriendRequestItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$friendGroupListItemFragment> friendGroups;

  final Query$friendScreenViewer$viewer$friends friends;

  final List<Fragment$pendingFriendRequestItemFragment>
      pendingFriendshipRequests;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$friendGroups = friendGroups;
    _resultData['friendGroups'] =
        l$friendGroups.map((e) => e.toJson()).toList();
    final l$friends = friends;
    _resultData['friends'] = l$friends.toJson();
    final l$pendingFriendshipRequests = pendingFriendshipRequests;
    _resultData['pendingFriendshipRequests'] =
        l$pendingFriendshipRequests.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$friendGroups = friendGroups;
    final l$friends = friends;
    final l$pendingFriendshipRequests = pendingFriendshipRequests;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$friendGroups.map((v) => v)),
      l$friends,
      Object.hashAll(l$pendingFriendshipRequests.map((v) => v)),
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
    final l$pendingFriendshipRequests = pendingFriendshipRequests;
    final lOther$pendingFriendshipRequests = other.pendingFriendshipRequests;
    if (l$pendingFriendshipRequests.length !=
        lOther$pendingFriendshipRequests.length) {
      return false;
    }
    for (int i = 0; i < l$pendingFriendshipRequests.length; i++) {
      final l$pendingFriendshipRequests$entry = l$pendingFriendshipRequests[i];
      final lOther$pendingFriendshipRequests$entry =
          lOther$pendingFriendshipRequests[i];
      if (l$pendingFriendshipRequests$entry !=
          lOther$pendingFriendshipRequests$entry) {
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
    List<Fragment$pendingFriendRequestItemFragment>? pendingFriendshipRequests,
    String? $__typename,
  });
  TRes friendGroups(
      Iterable<Fragment$friendGroupListItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$friendGroupListItemFragment<
                      Fragment$friendGroupListItemFragment>>)
          _fn);
  CopyWith$Query$friendScreenViewer$viewer$friends<TRes> get friends;
  TRes pendingFriendshipRequests(
      Iterable<Fragment$pendingFriendRequestItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$pendingFriendRequestItemFragment<
                      Fragment$pendingFriendRequestItemFragment>>)
          _fn);
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
    Object? pendingFriendshipRequests = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendScreenViewer$viewer(
        friendGroups: friendGroups == _undefined || friendGroups == null
            ? _instance.friendGroups
            : (friendGroups as List<Fragment$friendGroupListItemFragment>),
        friends: friends == _undefined || friends == null
            ? _instance.friends
            : (friends as Query$friendScreenViewer$viewer$friends),
        pendingFriendshipRequests: pendingFriendshipRequests == _undefined ||
                pendingFriendshipRequests == null
            ? _instance.pendingFriendshipRequests
            : (pendingFriendshipRequests
                as List<Fragment$pendingFriendRequestItemFragment>),
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

  TRes pendingFriendshipRequests(
          Iterable<Fragment$pendingFriendRequestItemFragment> Function(
                  Iterable<
                      CopyWith$Fragment$pendingFriendRequestItemFragment<
                          Fragment$pendingFriendRequestItemFragment>>)
              _fn) =>
      call(
          pendingFriendshipRequests: _fn(_instance.pendingFriendshipRequests
              .map((e) => CopyWith$Fragment$pendingFriendRequestItemFragment(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$friendScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$friendScreenViewer$viewer(this._res);

  TRes _res;

  call({
    List<Fragment$friendGroupListItemFragment>? friendGroups,
    Query$friendScreenViewer$viewer$friends? friends,
    List<Fragment$pendingFriendRequestItemFragment>? pendingFriendshipRequests,
    String? $__typename,
  }) =>
      _res;
  friendGroups(_fn) => _res;
  CopyWith$Query$friendScreenViewer$viewer$friends<TRes> get friends =>
      CopyWith$Query$friendScreenViewer$viewer$friends.stub(_res);
  pendingFriendshipRequests(_fn) => _res;
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

class Variables$Mutation$acceptFriendshipRequest {
  factory Variables$Mutation$acceptFriendshipRequest(
          {required String friendshipRequestId}) =>
      Variables$Mutation$acceptFriendshipRequest._({
        r'friendshipRequestId': friendshipRequestId,
      });

  Variables$Mutation$acceptFriendshipRequest._(this._$data);

  factory Variables$Mutation$acceptFriendshipRequest.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$friendshipRequestId = data['friendshipRequestId'];
    result$data['friendshipRequestId'] = (l$friendshipRequestId as String);
    return Variables$Mutation$acceptFriendshipRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get friendshipRequestId => (_$data['friendshipRequestId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$friendshipRequestId = friendshipRequestId;
    result$data['friendshipRequestId'] = l$friendshipRequestId;
    return result$data;
  }

  CopyWith$Variables$Mutation$acceptFriendshipRequest<
          Variables$Mutation$acceptFriendshipRequest>
      get copyWith => CopyWith$Variables$Mutation$acceptFriendshipRequest(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$acceptFriendshipRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$friendshipRequestId = friendshipRequestId;
    final lOther$friendshipRequestId = other.friendshipRequestId;
    if (l$friendshipRequestId != lOther$friendshipRequestId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$friendshipRequestId = friendshipRequestId;
    return Object.hashAll([l$friendshipRequestId]);
  }
}

abstract class CopyWith$Variables$Mutation$acceptFriendshipRequest<TRes> {
  factory CopyWith$Variables$Mutation$acceptFriendshipRequest(
    Variables$Mutation$acceptFriendshipRequest instance,
    TRes Function(Variables$Mutation$acceptFriendshipRequest) then,
  ) = _CopyWithImpl$Variables$Mutation$acceptFriendshipRequest;

  factory CopyWith$Variables$Mutation$acceptFriendshipRequest.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$acceptFriendshipRequest;

  TRes call({String? friendshipRequestId});
}

class _CopyWithImpl$Variables$Mutation$acceptFriendshipRequest<TRes>
    implements CopyWith$Variables$Mutation$acceptFriendshipRequest<TRes> {
  _CopyWithImpl$Variables$Mutation$acceptFriendshipRequest(
    this._instance,
    this._then,
  );

  final Variables$Mutation$acceptFriendshipRequest _instance;

  final TRes Function(Variables$Mutation$acceptFriendshipRequest) _then;

  static const _undefined = {};

  TRes call({Object? friendshipRequestId = _undefined}) =>
      _then(Variables$Mutation$acceptFriendshipRequest._({
        ..._instance._$data,
        if (friendshipRequestId != _undefined && friendshipRequestId != null)
          'friendshipRequestId': (friendshipRequestId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$acceptFriendshipRequest<TRes>
    implements CopyWith$Variables$Mutation$acceptFriendshipRequest<TRes> {
  _CopyWithStubImpl$Variables$Mutation$acceptFriendshipRequest(this._res);

  TRes _res;

  call({String? friendshipRequestId}) => _res;
}

class Mutation$acceptFriendshipRequest {
  Mutation$acceptFriendshipRequest({
    required this.acceptFriendshipRequest,
    required this.$__typename,
  });

  factory Mutation$acceptFriendshipRequest.fromJson(Map<String, dynamic> json) {
    final l$acceptFriendshipRequest = json['acceptFriendshipRequest'];
    final l$$__typename = json['__typename'];
    return Mutation$acceptFriendshipRequest(
      acceptFriendshipRequest: (l$acceptFriendshipRequest as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool acceptFriendshipRequest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$acceptFriendshipRequest = acceptFriendshipRequest;
    _resultData['acceptFriendshipRequest'] = l$acceptFriendshipRequest;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$acceptFriendshipRequest = acceptFriendshipRequest;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$acceptFriendshipRequest,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$acceptFriendshipRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$acceptFriendshipRequest = acceptFriendshipRequest;
    final lOther$acceptFriendshipRequest = other.acceptFriendshipRequest;
    if (l$acceptFriendshipRequest != lOther$acceptFriendshipRequest) {
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

extension UtilityExtension$Mutation$acceptFriendshipRequest
    on Mutation$acceptFriendshipRequest {
  CopyWith$Mutation$acceptFriendshipRequest<Mutation$acceptFriendshipRequest>
      get copyWith => CopyWith$Mutation$acceptFriendshipRequest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$acceptFriendshipRequest<TRes> {
  factory CopyWith$Mutation$acceptFriendshipRequest(
    Mutation$acceptFriendshipRequest instance,
    TRes Function(Mutation$acceptFriendshipRequest) then,
  ) = _CopyWithImpl$Mutation$acceptFriendshipRequest;

  factory CopyWith$Mutation$acceptFriendshipRequest.stub(TRes res) =
      _CopyWithStubImpl$Mutation$acceptFriendshipRequest;

  TRes call({
    bool? acceptFriendshipRequest,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$acceptFriendshipRequest<TRes>
    implements CopyWith$Mutation$acceptFriendshipRequest<TRes> {
  _CopyWithImpl$Mutation$acceptFriendshipRequest(
    this._instance,
    this._then,
  );

  final Mutation$acceptFriendshipRequest _instance;

  final TRes Function(Mutation$acceptFriendshipRequest) _then;

  static const _undefined = {};

  TRes call({
    Object? acceptFriendshipRequest = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$acceptFriendshipRequest(
        acceptFriendshipRequest: acceptFriendshipRequest == _undefined ||
                acceptFriendshipRequest == null
            ? _instance.acceptFriendshipRequest
            : (acceptFriendshipRequest as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$acceptFriendshipRequest<TRes>
    implements CopyWith$Mutation$acceptFriendshipRequest<TRes> {
  _CopyWithStubImpl$Mutation$acceptFriendshipRequest(this._res);

  TRes _res;

  call({
    bool? acceptFriendshipRequest,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationacceptFriendshipRequest = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'acceptFriendshipRequest'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'friendshipRequestId')),
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
        name: NameNode(value: 'acceptFriendshipRequest'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'friendshipRequestId'),
            value: VariableNode(name: NameNode(value: 'friendshipRequestId')),
          )
        ],
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
]);
Mutation$acceptFriendshipRequest _parserFn$Mutation$acceptFriendshipRequest(
        Map<String, dynamic> data) =>
    Mutation$acceptFriendshipRequest.fromJson(data);
typedef OnMutationCompleted$Mutation$acceptFriendshipRequest = FutureOr<void>
    Function(
  dynamic,
  Mutation$acceptFriendshipRequest?,
);

class Options$Mutation$acceptFriendshipRequest
    extends graphql.MutationOptions<Mutation$acceptFriendshipRequest> {
  Options$Mutation$acceptFriendshipRequest({
    String? operationName,
    required Variables$Mutation$acceptFriendshipRequest variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$acceptFriendshipRequest? onCompleted,
    graphql.OnMutationUpdate<Mutation$acceptFriendshipRequest>? update,
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
                        : _parserFn$Mutation$acceptFriendshipRequest(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationacceptFriendshipRequest,
          parserFn: _parserFn$Mutation$acceptFriendshipRequest,
        );

  final OnMutationCompleted$Mutation$acceptFriendshipRequest?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$acceptFriendshipRequest
    extends graphql.WatchQueryOptions<Mutation$acceptFriendshipRequest> {
  WatchOptions$Mutation$acceptFriendshipRequest({
    String? operationName,
    required Variables$Mutation$acceptFriendshipRequest variables,
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
          document: documentNodeMutationacceptFriendshipRequest,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$acceptFriendshipRequest,
        );
}

extension ClientExtension$Mutation$acceptFriendshipRequest
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$acceptFriendshipRequest>>
      mutate$acceptFriendshipRequest(
              Options$Mutation$acceptFriendshipRequest options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$acceptFriendshipRequest>
      watchMutation$acceptFriendshipRequest(
              WatchOptions$Mutation$acceptFriendshipRequest options) =>
          this.watchMutation(options);
}

class Mutation$acceptFriendshipRequest$HookResult {
  Mutation$acceptFriendshipRequest$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$acceptFriendshipRequest runMutation;

  final graphql.QueryResult<Mutation$acceptFriendshipRequest> result;
}

Mutation$acceptFriendshipRequest$HookResult useMutation$acceptFriendshipRequest(
    [WidgetOptions$Mutation$acceptFriendshipRequest? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$acceptFriendshipRequest());
  return Mutation$acceptFriendshipRequest$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$acceptFriendshipRequest>
    useWatchMutation$acceptFriendshipRequest(
            WatchOptions$Mutation$acceptFriendshipRequest options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$acceptFriendshipRequest
    extends graphql.MutationOptions<Mutation$acceptFriendshipRequest> {
  WidgetOptions$Mutation$acceptFriendshipRequest({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$acceptFriendshipRequest? onCompleted,
    graphql.OnMutationUpdate<Mutation$acceptFriendshipRequest>? update,
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
                        : _parserFn$Mutation$acceptFriendshipRequest(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationacceptFriendshipRequest,
          parserFn: _parserFn$Mutation$acceptFriendshipRequest,
        );

  final OnMutationCompleted$Mutation$acceptFriendshipRequest?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$acceptFriendshipRequest
    = graphql.MultiSourceResult<Mutation$acceptFriendshipRequest> Function(
  Variables$Mutation$acceptFriendshipRequest, {
  Object? optimisticResult,
});
typedef Builder$Mutation$acceptFriendshipRequest = widgets.Widget Function(
  RunMutation$Mutation$acceptFriendshipRequest,
  graphql.QueryResult<Mutation$acceptFriendshipRequest>?,
);

class Mutation$acceptFriendshipRequest$Widget
    extends graphql_flutter.Mutation<Mutation$acceptFriendshipRequest> {
  Mutation$acceptFriendshipRequest$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$acceptFriendshipRequest? options,
    required Builder$Mutation$acceptFriendshipRequest builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$acceptFriendshipRequest(),
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

class Variables$Mutation$denyFriendshipRequest {
  factory Variables$Mutation$denyFriendshipRequest(
          {required String friendshipRequestId}) =>
      Variables$Mutation$denyFriendshipRequest._({
        r'friendshipRequestId': friendshipRequestId,
      });

  Variables$Mutation$denyFriendshipRequest._(this._$data);

  factory Variables$Mutation$denyFriendshipRequest.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$friendshipRequestId = data['friendshipRequestId'];
    result$data['friendshipRequestId'] = (l$friendshipRequestId as String);
    return Variables$Mutation$denyFriendshipRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get friendshipRequestId => (_$data['friendshipRequestId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$friendshipRequestId = friendshipRequestId;
    result$data['friendshipRequestId'] = l$friendshipRequestId;
    return result$data;
  }

  CopyWith$Variables$Mutation$denyFriendshipRequest<
          Variables$Mutation$denyFriendshipRequest>
      get copyWith => CopyWith$Variables$Mutation$denyFriendshipRequest(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$denyFriendshipRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$friendshipRequestId = friendshipRequestId;
    final lOther$friendshipRequestId = other.friendshipRequestId;
    if (l$friendshipRequestId != lOther$friendshipRequestId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$friendshipRequestId = friendshipRequestId;
    return Object.hashAll([l$friendshipRequestId]);
  }
}

abstract class CopyWith$Variables$Mutation$denyFriendshipRequest<TRes> {
  factory CopyWith$Variables$Mutation$denyFriendshipRequest(
    Variables$Mutation$denyFriendshipRequest instance,
    TRes Function(Variables$Mutation$denyFriendshipRequest) then,
  ) = _CopyWithImpl$Variables$Mutation$denyFriendshipRequest;

  factory CopyWith$Variables$Mutation$denyFriendshipRequest.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$denyFriendshipRequest;

  TRes call({String? friendshipRequestId});
}

class _CopyWithImpl$Variables$Mutation$denyFriendshipRequest<TRes>
    implements CopyWith$Variables$Mutation$denyFriendshipRequest<TRes> {
  _CopyWithImpl$Variables$Mutation$denyFriendshipRequest(
    this._instance,
    this._then,
  );

  final Variables$Mutation$denyFriendshipRequest _instance;

  final TRes Function(Variables$Mutation$denyFriendshipRequest) _then;

  static const _undefined = {};

  TRes call({Object? friendshipRequestId = _undefined}) =>
      _then(Variables$Mutation$denyFriendshipRequest._({
        ..._instance._$data,
        if (friendshipRequestId != _undefined && friendshipRequestId != null)
          'friendshipRequestId': (friendshipRequestId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$denyFriendshipRequest<TRes>
    implements CopyWith$Variables$Mutation$denyFriendshipRequest<TRes> {
  _CopyWithStubImpl$Variables$Mutation$denyFriendshipRequest(this._res);

  TRes _res;

  call({String? friendshipRequestId}) => _res;
}

class Mutation$denyFriendshipRequest {
  Mutation$denyFriendshipRequest({
    required this.denyFriendshipRequest,
    required this.$__typename,
  });

  factory Mutation$denyFriendshipRequest.fromJson(Map<String, dynamic> json) {
    final l$denyFriendshipRequest = json['denyFriendshipRequest'];
    final l$$__typename = json['__typename'];
    return Mutation$denyFriendshipRequest(
      denyFriendshipRequest: (l$denyFriendshipRequest as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool denyFriendshipRequest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$denyFriendshipRequest = denyFriendshipRequest;
    _resultData['denyFriendshipRequest'] = l$denyFriendshipRequest;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$denyFriendshipRequest = denyFriendshipRequest;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$denyFriendshipRequest,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$denyFriendshipRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$denyFriendshipRequest = denyFriendshipRequest;
    final lOther$denyFriendshipRequest = other.denyFriendshipRequest;
    if (l$denyFriendshipRequest != lOther$denyFriendshipRequest) {
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

extension UtilityExtension$Mutation$denyFriendshipRequest
    on Mutation$denyFriendshipRequest {
  CopyWith$Mutation$denyFriendshipRequest<Mutation$denyFriendshipRequest>
      get copyWith => CopyWith$Mutation$denyFriendshipRequest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$denyFriendshipRequest<TRes> {
  factory CopyWith$Mutation$denyFriendshipRequest(
    Mutation$denyFriendshipRequest instance,
    TRes Function(Mutation$denyFriendshipRequest) then,
  ) = _CopyWithImpl$Mutation$denyFriendshipRequest;

  factory CopyWith$Mutation$denyFriendshipRequest.stub(TRes res) =
      _CopyWithStubImpl$Mutation$denyFriendshipRequest;

  TRes call({
    bool? denyFriendshipRequest,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$denyFriendshipRequest<TRes>
    implements CopyWith$Mutation$denyFriendshipRequest<TRes> {
  _CopyWithImpl$Mutation$denyFriendshipRequest(
    this._instance,
    this._then,
  );

  final Mutation$denyFriendshipRequest _instance;

  final TRes Function(Mutation$denyFriendshipRequest) _then;

  static const _undefined = {};

  TRes call({
    Object? denyFriendshipRequest = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$denyFriendshipRequest(
        denyFriendshipRequest:
            denyFriendshipRequest == _undefined || denyFriendshipRequest == null
                ? _instance.denyFriendshipRequest
                : (denyFriendshipRequest as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$denyFriendshipRequest<TRes>
    implements CopyWith$Mutation$denyFriendshipRequest<TRes> {
  _CopyWithStubImpl$Mutation$denyFriendshipRequest(this._res);

  TRes _res;

  call({
    bool? denyFriendshipRequest,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationdenyFriendshipRequest = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'denyFriendshipRequest'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'friendshipRequestId')),
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
        name: NameNode(value: 'denyFriendshipRequest'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'friendshipRequestId'),
            value: VariableNode(name: NameNode(value: 'friendshipRequestId')),
          )
        ],
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
]);
Mutation$denyFriendshipRequest _parserFn$Mutation$denyFriendshipRequest(
        Map<String, dynamic> data) =>
    Mutation$denyFriendshipRequest.fromJson(data);
typedef OnMutationCompleted$Mutation$denyFriendshipRequest = FutureOr<void>
    Function(
  dynamic,
  Mutation$denyFriendshipRequest?,
);

class Options$Mutation$denyFriendshipRequest
    extends graphql.MutationOptions<Mutation$denyFriendshipRequest> {
  Options$Mutation$denyFriendshipRequest({
    String? operationName,
    required Variables$Mutation$denyFriendshipRequest variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$denyFriendshipRequest? onCompleted,
    graphql.OnMutationUpdate<Mutation$denyFriendshipRequest>? update,
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
                        : _parserFn$Mutation$denyFriendshipRequest(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdenyFriendshipRequest,
          parserFn: _parserFn$Mutation$denyFriendshipRequest,
        );

  final OnMutationCompleted$Mutation$denyFriendshipRequest?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$denyFriendshipRequest
    extends graphql.WatchQueryOptions<Mutation$denyFriendshipRequest> {
  WatchOptions$Mutation$denyFriendshipRequest({
    String? operationName,
    required Variables$Mutation$denyFriendshipRequest variables,
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
          document: documentNodeMutationdenyFriendshipRequest,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$denyFriendshipRequest,
        );
}

extension ClientExtension$Mutation$denyFriendshipRequest
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$denyFriendshipRequest>>
      mutate$denyFriendshipRequest(
              Options$Mutation$denyFriendshipRequest options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$denyFriendshipRequest>
      watchMutation$denyFriendshipRequest(
              WatchOptions$Mutation$denyFriendshipRequest options) =>
          this.watchMutation(options);
}

class Mutation$denyFriendshipRequest$HookResult {
  Mutation$denyFriendshipRequest$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$denyFriendshipRequest runMutation;

  final graphql.QueryResult<Mutation$denyFriendshipRequest> result;
}

Mutation$denyFriendshipRequest$HookResult useMutation$denyFriendshipRequest(
    [WidgetOptions$Mutation$denyFriendshipRequest? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$denyFriendshipRequest());
  return Mutation$denyFriendshipRequest$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$denyFriendshipRequest>
    useWatchMutation$denyFriendshipRequest(
            WatchOptions$Mutation$denyFriendshipRequest options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$denyFriendshipRequest
    extends graphql.MutationOptions<Mutation$denyFriendshipRequest> {
  WidgetOptions$Mutation$denyFriendshipRequest({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$denyFriendshipRequest? onCompleted,
    graphql.OnMutationUpdate<Mutation$denyFriendshipRequest>? update,
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
                        : _parserFn$Mutation$denyFriendshipRequest(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdenyFriendshipRequest,
          parserFn: _parserFn$Mutation$denyFriendshipRequest,
        );

  final OnMutationCompleted$Mutation$denyFriendshipRequest?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$denyFriendshipRequest
    = graphql.MultiSourceResult<Mutation$denyFriendshipRequest> Function(
  Variables$Mutation$denyFriendshipRequest, {
  Object? optimisticResult,
});
typedef Builder$Mutation$denyFriendshipRequest = widgets.Widget Function(
  RunMutation$Mutation$denyFriendshipRequest,
  graphql.QueryResult<Mutation$denyFriendshipRequest>?,
);

class Mutation$denyFriendshipRequest$Widget
    extends graphql_flutter.Mutation<Mutation$denyFriendshipRequest> {
  Mutation$denyFriendshipRequest$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$denyFriendshipRequest? options,
    required Builder$Mutation$denyFriendshipRequest builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$denyFriendshipRequest(),
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
