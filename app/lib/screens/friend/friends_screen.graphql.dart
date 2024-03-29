import '../../widgets/friend_group_fragment.graphql.dart';
import '../../widgets/friend_list_item_fragment.graphql.dart';
import '../../widgets/pending_friendship_request_list_fragment.graphql.dart';
import '../user/user_profile_screen.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$friendsScreenViewer {
  Query$friendsScreenViewer({
    required this.viewer,
    this.$__typename = 'Query',
  });

  factory Query$friendsScreenViewer.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$friendsScreenViewer(
      viewer: Query$friendsScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendsScreenViewer$viewer viewer;

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
    if (!(other is Query$friendsScreenViewer) ||
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

extension UtilityExtension$Query$friendsScreenViewer
    on Query$friendsScreenViewer {
  CopyWith$Query$friendsScreenViewer<Query$friendsScreenViewer> get copyWith =>
      CopyWith$Query$friendsScreenViewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$friendsScreenViewer<TRes> {
  factory CopyWith$Query$friendsScreenViewer(
    Query$friendsScreenViewer instance,
    TRes Function(Query$friendsScreenViewer) then,
  ) = _CopyWithImpl$Query$friendsScreenViewer;

  factory CopyWith$Query$friendsScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendsScreenViewer;

  TRes call({
    Query$friendsScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$friendsScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$friendsScreenViewer<TRes>
    implements CopyWith$Query$friendsScreenViewer<TRes> {
  _CopyWithImpl$Query$friendsScreenViewer(
    this._instance,
    this._then,
  );

  final Query$friendsScreenViewer _instance;

  final TRes Function(Query$friendsScreenViewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendsScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$friendsScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$friendsScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$friendsScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$friendsScreenViewer<TRes>
    implements CopyWith$Query$friendsScreenViewer<TRes> {
  _CopyWithStubImpl$Query$friendsScreenViewer(this._res);

  TRes _res;

  call({
    Query$friendsScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendsScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$friendsScreenViewer$viewer.stub(_res);
}

const documentNodeQueryfriendsScreenViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'friendsScreenViewer'),
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
                      FragmentSpreadNode(
                        name: NameNode(value: 'userProfileScreenFragment'),
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
  fragmentDefinitionuserProfileScreenFragment,
  fragmentDefinitionpendingFriendRequestItemFragment,
]);
Query$friendsScreenViewer _parserFn$Query$friendsScreenViewer(
        Map<String, dynamic> data) =>
    Query$friendsScreenViewer.fromJson(data);
typedef OnQueryComplete$Query$friendsScreenViewer = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$friendsScreenViewer?,
);

class Options$Query$friendsScreenViewer
    extends graphql.QueryOptions<Query$friendsScreenViewer> {
  Options$Query$friendsScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$friendsScreenViewer? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$friendsScreenViewer? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$friendsScreenViewer(data),
                  ),
          onError: onError,
          document: documentNodeQueryfriendsScreenViewer,
          parserFn: _parserFn$Query$friendsScreenViewer,
        );

  final OnQueryComplete$Query$friendsScreenViewer? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$friendsScreenViewer
    extends graphql.WatchQueryOptions<Query$friendsScreenViewer> {
  WatchOptions$Query$friendsScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$friendsScreenViewer? typedOptimisticResult,
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
          document: documentNodeQueryfriendsScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$friendsScreenViewer,
        );
}

class FetchMoreOptions$Query$friendsScreenViewer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$friendsScreenViewer(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryfriendsScreenViewer,
        );
}

extension ClientExtension$Query$friendsScreenViewer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$friendsScreenViewer>>
      query$friendsScreenViewer(
              [Options$Query$friendsScreenViewer? options]) async =>
          await this.query(options ?? Options$Query$friendsScreenViewer());
  graphql.ObservableQuery<Query$friendsScreenViewer>
      watchQuery$friendsScreenViewer(
              [WatchOptions$Query$friendsScreenViewer? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$friendsScreenViewer());
  void writeQuery$friendsScreenViewer({
    required Query$friendsScreenViewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryfriendsScreenViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$friendsScreenViewer? readQuery$friendsScreenViewer(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfriendsScreenViewer)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$friendsScreenViewer.fromJson(result);
  }
}

graphql_flutter
    .QueryHookResult<Query$friendsScreenViewer> useQuery$friendsScreenViewer(
        [Options$Query$friendsScreenViewer? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$friendsScreenViewer());
graphql.ObservableQuery<Query$friendsScreenViewer>
    useWatchQuery$friendsScreenViewer(
            [WatchOptions$Query$friendsScreenViewer? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$friendsScreenViewer());

class Query$friendsScreenViewer$Widget
    extends graphql_flutter.Query<Query$friendsScreenViewer> {
  Query$friendsScreenViewer$Widget({
    widgets.Key? key,
    Options$Query$friendsScreenViewer? options,
    required graphql_flutter.QueryBuilder<Query$friendsScreenViewer> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$friendsScreenViewer(),
          builder: builder,
        );
}

class Query$friendsScreenViewer$viewer {
  Query$friendsScreenViewer$viewer({
    required this.id,
    required this.friendGroups,
    required this.friends,
    required this.pendingFriendshipRequests,
    this.$__typename = 'Viewer',
  });

  factory Query$friendsScreenViewer$viewer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$friendGroups = json['friendGroups'];
    final l$friends = json['friends'];
    final l$pendingFriendshipRequests = json['pendingFriendshipRequests'];
    final l$$__typename = json['__typename'];
    return Query$friendsScreenViewer$viewer(
      id: (l$id as String),
      friendGroups: (l$friendGroups as List<dynamic>)
          .map((e) => Fragment$friendGroupListItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      friends: Query$friendsScreenViewer$viewer$friends.fromJson(
          (l$friends as Map<String, dynamic>)),
      pendingFriendshipRequests: (l$pendingFriendshipRequests as List<dynamic>)
          .map((e) => Fragment$pendingFriendRequestItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<Fragment$friendGroupListItemFragment> friendGroups;

  final Query$friendsScreenViewer$viewer$friends friends;

  final List<Fragment$pendingFriendRequestItemFragment>
      pendingFriendshipRequests;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$friendGroups = friendGroups;
    final l$friends = friends;
    final l$pendingFriendshipRequests = pendingFriendshipRequests;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Query$friendsScreenViewer$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$friendsScreenViewer$viewer
    on Query$friendsScreenViewer$viewer {
  CopyWith$Query$friendsScreenViewer$viewer<Query$friendsScreenViewer$viewer>
      get copyWith => CopyWith$Query$friendsScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendsScreenViewer$viewer<TRes> {
  factory CopyWith$Query$friendsScreenViewer$viewer(
    Query$friendsScreenViewer$viewer instance,
    TRes Function(Query$friendsScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$friendsScreenViewer$viewer;

  factory CopyWith$Query$friendsScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendsScreenViewer$viewer;

  TRes call({
    String? id,
    List<Fragment$friendGroupListItemFragment>? friendGroups,
    Query$friendsScreenViewer$viewer$friends? friends,
    List<Fragment$pendingFriendRequestItemFragment>? pendingFriendshipRequests,
    String? $__typename,
  });
  TRes friendGroups(
      Iterable<Fragment$friendGroupListItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$friendGroupListItemFragment<
                      Fragment$friendGroupListItemFragment>>)
          _fn);
  CopyWith$Query$friendsScreenViewer$viewer$friends<TRes> get friends;
  TRes pendingFriendshipRequests(
      Iterable<Fragment$pendingFriendRequestItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$pendingFriendRequestItemFragment<
                      Fragment$pendingFriendRequestItemFragment>>)
          _fn);
}

class _CopyWithImpl$Query$friendsScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendsScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$friendsScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$friendsScreenViewer$viewer _instance;

  final TRes Function(Query$friendsScreenViewer$viewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? friendGroups = _undefined,
    Object? friends = _undefined,
    Object? pendingFriendshipRequests = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendsScreenViewer$viewer(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        friendGroups: friendGroups == _undefined || friendGroups == null
            ? _instance.friendGroups
            : (friendGroups as List<Fragment$friendGroupListItemFragment>),
        friends: friends == _undefined || friends == null
            ? _instance.friends
            : (friends as Query$friendsScreenViewer$viewer$friends),
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
  CopyWith$Query$friendsScreenViewer$viewer$friends<TRes> get friends {
    final local$friends = _instance.friends;
    return CopyWith$Query$friendsScreenViewer$viewer$friends(
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

class _CopyWithStubImpl$Query$friendsScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendsScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$friendsScreenViewer$viewer(this._res);

  TRes _res;

  call({
    String? id,
    List<Fragment$friendGroupListItemFragment>? friendGroups,
    Query$friendsScreenViewer$viewer$friends? friends,
    List<Fragment$pendingFriendRequestItemFragment>? pendingFriendshipRequests,
    String? $__typename,
  }) =>
      _res;
  friendGroups(_fn) => _res;
  CopyWith$Query$friendsScreenViewer$viewer$friends<TRes> get friends =>
      CopyWith$Query$friendsScreenViewer$viewer$friends.stub(_res);
  pendingFriendshipRequests(_fn) => _res;
}

class Query$friendsScreenViewer$viewer$friends {
  Query$friendsScreenViewer$viewer$friends({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'UserConnection',
  });

  factory Query$friendsScreenViewer$viewer$friends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$friendsScreenViewer$viewer$friends(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$friendsScreenViewer$viewer$friends$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$friendsScreenViewer$viewer$friends$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$friendsScreenViewer$viewer$friends$edges> edges;

  final Query$friendsScreenViewer$viewer$friends$pageInfo pageInfo;

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
    if (!(other is Query$friendsScreenViewer$viewer$friends) ||
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

extension UtilityExtension$Query$friendsScreenViewer$viewer$friends
    on Query$friendsScreenViewer$viewer$friends {
  CopyWith$Query$friendsScreenViewer$viewer$friends<
          Query$friendsScreenViewer$viewer$friends>
      get copyWith => CopyWith$Query$friendsScreenViewer$viewer$friends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendsScreenViewer$viewer$friends<TRes> {
  factory CopyWith$Query$friendsScreenViewer$viewer$friends(
    Query$friendsScreenViewer$viewer$friends instance,
    TRes Function(Query$friendsScreenViewer$viewer$friends) then,
  ) = _CopyWithImpl$Query$friendsScreenViewer$viewer$friends;

  factory CopyWith$Query$friendsScreenViewer$viewer$friends.stub(TRes res) =
      _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends;

  TRes call({
    List<Query$friendsScreenViewer$viewer$friends$edges>? edges,
    Query$friendsScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$friendsScreenViewer$viewer$friends$edges> Function(
              Iterable<
                  CopyWith$Query$friendsScreenViewer$viewer$friends$edges<
                      Query$friendsScreenViewer$viewer$friends$edges>>)
          _fn);
  CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$friendsScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$friendsScreenViewer$viewer$friends<TRes> {
  _CopyWithImpl$Query$friendsScreenViewer$viewer$friends(
    this._instance,
    this._then,
  );

  final Query$friendsScreenViewer$viewer$friends _instance;

  final TRes Function(Query$friendsScreenViewer$viewer$friends) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendsScreenViewer$viewer$friends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$friendsScreenViewer$viewer$friends$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$friendsScreenViewer$viewer$friends$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$friendsScreenViewer$viewer$friends$edges> Function(
                  Iterable<
                      CopyWith$Query$friendsScreenViewer$viewer$friends$edges<
                          Query$friendsScreenViewer$viewer$friends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map(
              (e) => CopyWith$Query$friendsScreenViewer$viewer$friends$edges(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$friendsScreenViewer$viewer$friends<TRes> {
  _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends(this._res);

  TRes _res;

  call({
    List<Query$friendsScreenViewer$viewer$friends$edges>? edges,
    Query$friendsScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
  CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo.stub(_res);
}

class Query$friendsScreenViewer$viewer$friends$edges {
  Query$friendsScreenViewer$viewer$friends$edges({
    required this.node,
    this.$__typename = 'UserEdge',
  });

  factory Query$friendsScreenViewer$viewer$friends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$friendsScreenViewer$viewer$friends$edges(
      node: Query$friendsScreenViewer$viewer$friends$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendsScreenViewer$viewer$friends$edges$node node;

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
    if (!(other is Query$friendsScreenViewer$viewer$friends$edges) ||
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

extension UtilityExtension$Query$friendsScreenViewer$viewer$friends$edges
    on Query$friendsScreenViewer$viewer$friends$edges {
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges<
          Query$friendsScreenViewer$viewer$friends$edges>
      get copyWith => CopyWith$Query$friendsScreenViewer$viewer$friends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendsScreenViewer$viewer$friends$edges<TRes> {
  factory CopyWith$Query$friendsScreenViewer$viewer$friends$edges(
    Query$friendsScreenViewer$viewer$friends$edges instance,
    TRes Function(Query$friendsScreenViewer$viewer$friends$edges) then,
  ) = _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges;

  factory CopyWith$Query$friendsScreenViewer$viewer$friends$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges;

  TRes call({
    Query$friendsScreenViewer$viewer$friends$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges<TRes>
    implements CopyWith$Query$friendsScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges(
    this._instance,
    this._then,
  );

  final Query$friendsScreenViewer$viewer$friends$edges _instance;

  final TRes Function(Query$friendsScreenViewer$viewer$friends$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendsScreenViewer$viewer$friends$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$friendsScreenViewer$viewer$friends$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges<TRes>
    implements CopyWith$Query$friendsScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges(this._res);

  TRes _res;

  call({
    Query$friendsScreenViewer$viewer$friends$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node<TRes> get node =>
      CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node.stub(_res);
}

class Query$friendsScreenViewer$viewer$friends$edges$node
    implements
        Fragment$friendListItemFragment,
        Fragment$userProfileScreenFragment {
  Query$friendsScreenViewer$viewer$friends$edges$node({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.isMuted,
    this.distanceKm,
    this.$__typename = 'User',
    required this.screenId,
    required this.isRequestingFriendship,
    required this.isFriend,
    required this.isBlocked,
    this.fuzzyCoordinate,
  });

  factory Query$friendsScreenViewer$viewer$friends$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isMuted = json['isMuted'];
    final l$distanceKm = json['distanceKm'];
    final l$$__typename = json['__typename'];
    final l$screenId = json['screenId'];
    final l$isRequestingFriendship = json['isRequestingFriendship'];
    final l$isFriend = json['isFriend'];
    final l$isBlocked = json['isBlocked'];
    final l$fuzzyCoordinate = json['fuzzyCoordinate'];
    return Query$friendsScreenViewer$viewer$friends$edges$node(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isMuted: (l$isMuted as bool),
      distanceKm: (l$distanceKm as int?),
      $__typename: (l$$__typename as String),
      screenId: (l$screenId as String),
      isRequestingFriendship: (l$isRequestingFriendship as bool),
      isFriend: (l$isFriend as bool),
      isBlocked: (l$isBlocked as bool),
      fuzzyCoordinate: l$fuzzyCoordinate == null
          ? null
          : Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
              .fromJson((l$fuzzyCoordinate as Map<String, dynamic>)),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final bool isMuted;

  final int? distanceKm;

  final String $__typename;

  final String screenId;

  final bool isRequestingFriendship;

  final bool isFriend;

  final bool isBlocked;

  final Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate?
      fuzzyCoordinate;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$nickname = nickname;
    _resultData['nickname'] = l$nickname;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$isMuted = isMuted;
    _resultData['isMuted'] = l$isMuted;
    final l$distanceKm = distanceKm;
    _resultData['distanceKm'] = l$distanceKm;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$screenId = screenId;
    _resultData['screenId'] = l$screenId;
    final l$isRequestingFriendship = isRequestingFriendship;
    _resultData['isRequestingFriendship'] = l$isRequestingFriendship;
    final l$isFriend = isFriend;
    _resultData['isFriend'] = l$isFriend;
    final l$isBlocked = isBlocked;
    _resultData['isBlocked'] = l$isBlocked;
    final l$fuzzyCoordinate = fuzzyCoordinate;
    _resultData['fuzzyCoordinate'] = l$fuzzyCoordinate?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$isMuted = isMuted;
    final l$distanceKm = distanceKm;
    final l$$__typename = $__typename;
    final l$screenId = screenId;
    final l$isRequestingFriendship = isRequestingFriendship;
    final l$isFriend = isFriend;
    final l$isBlocked = isBlocked;
    final l$fuzzyCoordinate = fuzzyCoordinate;
    return Object.hashAll([
      l$id,
      l$nickname,
      l$avatarUrl,
      l$isMuted,
      l$distanceKm,
      l$$__typename,
      l$screenId,
      l$isRequestingFriendship,
      l$isFriend,
      l$isBlocked,
      l$fuzzyCoordinate,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$friendsScreenViewer$viewer$friends$edges$node) ||
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
    final l$isMuted = isMuted;
    final lOther$isMuted = other.isMuted;
    if (l$isMuted != lOther$isMuted) {
      return false;
    }
    final l$distanceKm = distanceKm;
    final lOther$distanceKm = other.distanceKm;
    if (l$distanceKm != lOther$distanceKm) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$screenId = screenId;
    final lOther$screenId = other.screenId;
    if (l$screenId != lOther$screenId) {
      return false;
    }
    final l$isRequestingFriendship = isRequestingFriendship;
    final lOther$isRequestingFriendship = other.isRequestingFriendship;
    if (l$isRequestingFriendship != lOther$isRequestingFriendship) {
      return false;
    }
    final l$isFriend = isFriend;
    final lOther$isFriend = other.isFriend;
    if (l$isFriend != lOther$isFriend) {
      return false;
    }
    final l$isBlocked = isBlocked;
    final lOther$isBlocked = other.isBlocked;
    if (l$isBlocked != lOther$isBlocked) {
      return false;
    }
    final l$fuzzyCoordinate = fuzzyCoordinate;
    final lOther$fuzzyCoordinate = other.fuzzyCoordinate;
    if (l$fuzzyCoordinate != lOther$fuzzyCoordinate) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$friendsScreenViewer$viewer$friends$edges$node
    on Query$friendsScreenViewer$viewer$friends$edges$node {
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node<
          Query$friendsScreenViewer$viewer$friends$edges$node>
      get copyWith =>
          CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node<
    TRes> {
  factory CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node(
    Query$friendsScreenViewer$viewer$friends$edges$node instance,
    TRes Function(Query$friendsScreenViewer$viewer$friends$edges$node) then,
  ) = _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges$node;

  factory CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges$node;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    int? distanceKm,
    String? $__typename,
    String? screenId,
    bool? isRequestingFriendship,
    bool? isFriend,
    bool? isBlocked,
    Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate?
        fuzzyCoordinate,
  });
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
      TRes> get fuzzyCoordinate;
}

class _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges$node<TRes>
    implements
        CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node<TRes> {
  _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges$node(
    this._instance,
    this._then,
  );

  final Query$friendsScreenViewer$viewer$friends$edges$node _instance;

  final TRes Function(Query$friendsScreenViewer$viewer$friends$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isMuted = _undefined,
    Object? distanceKm = _undefined,
    Object? $__typename = _undefined,
    Object? screenId = _undefined,
    Object? isRequestingFriendship = _undefined,
    Object? isFriend = _undefined,
    Object? isBlocked = _undefined,
    Object? fuzzyCoordinate = _undefined,
  }) =>
      _then(Query$friendsScreenViewer$viewer$friends$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        nickname: nickname == _undefined || nickname == null
            ? _instance.nickname
            : (nickname as String),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        isMuted: isMuted == _undefined || isMuted == null
            ? _instance.isMuted
            : (isMuted as bool),
        distanceKm: distanceKm == _undefined
            ? _instance.distanceKm
            : (distanceKm as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        screenId: screenId == _undefined || screenId == null
            ? _instance.screenId
            : (screenId as String),
        isRequestingFriendship: isRequestingFriendship == _undefined ||
                isRequestingFriendship == null
            ? _instance.isRequestingFriendship
            : (isRequestingFriendship as bool),
        isFriend: isFriend == _undefined || isFriend == null
            ? _instance.isFriend
            : (isFriend as bool),
        isBlocked: isBlocked == _undefined || isBlocked == null
            ? _instance.isBlocked
            : (isBlocked as bool),
        fuzzyCoordinate: fuzzyCoordinate == _undefined
            ? _instance.fuzzyCoordinate
            : (fuzzyCoordinate
                as Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate?),
      ));
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
      TRes> get fuzzyCoordinate {
    final local$fuzzyCoordinate = _instance.fuzzyCoordinate;
    return local$fuzzyCoordinate == null
        ? CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
            .stub(_then(_instance))
        : CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
            local$fuzzyCoordinate, (e) => call(fuzzyCoordinate: e));
  }
}

class _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges$node<
        TRes>
    implements
        CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node<TRes> {
  _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    int? distanceKm,
    String? $__typename,
    String? screenId,
    bool? isRequestingFriendship,
    bool? isFriend,
    bool? isBlocked,
    Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate?
        fuzzyCoordinate,
  }) =>
      _res;
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
          TRes>
      get fuzzyCoordinate =>
          CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
              .stub(_res);
}

class Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
    implements Fragment$userProfileScreenFragment$fuzzyCoordinate {
  Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate({
    required this.latitude,
    required this.longitude,
    this.$__typename = 'Coordinate',
  });

  factory Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate.fromJson(
      Map<String, dynamic> json) {
    final l$latitude = json['latitude'];
    final l$longitude = json['longitude'];
    final l$$__typename = json['__typename'];
    return Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
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
            is Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate) ||
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

extension UtilityExtension$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
    on Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate {
  CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
          Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate>
      get copyWith =>
          CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
    TRes> {
  factory CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
    Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
        instance,
    TRes Function(
            Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate)
        then,
  ) = _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate;

  factory CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate;

  TRes call({
    double? latitude,
    double? longitude,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
        TRes>
    implements
        CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
            TRes> {
  _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
    this._instance,
    this._then,
  );

  final Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate
      _instance;

  final TRes Function(
          Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? latitude = _undefined,
    Object? longitude = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
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

class _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
        TRes>
    implements
        CopyWith$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate<
            TRes> {
  _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$edges$node$fuzzyCoordinate(
      this._res);

  TRes _res;

  call({
    double? latitude,
    double? longitude,
    String? $__typename,
  }) =>
      _res;
}

class Query$friendsScreenViewer$viewer$friends$pageInfo {
  Query$friendsScreenViewer$viewer$friends$pageInfo({
    this.startCursor,
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$friendsScreenViewer$viewer$friends$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$$__typename = json['__typename'];
    return Query$friendsScreenViewer$viewer$friends$pageInfo(
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
    if (!(other is Query$friendsScreenViewer$viewer$friends$pageInfo) ||
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

extension UtilityExtension$Query$friendsScreenViewer$viewer$friends$pageInfo
    on Query$friendsScreenViewer$viewer$friends$pageInfo {
  CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo<
          Query$friendsScreenViewer$viewer$friends$pageInfo>
      get copyWith =>
          CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo<
    TRes> {
  factory CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo(
    Query$friendsScreenViewer$viewer$friends$pageInfo instance,
    TRes Function(Query$friendsScreenViewer$viewer$friends$pageInfo) then,
  ) = _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$pageInfo;

  factory CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$pageInfo;

  TRes call({
    String? startCursor,
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$pageInfo<TRes>
    implements
        CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo<TRes> {
  _CopyWithImpl$Query$friendsScreenViewer$viewer$friends$pageInfo(
    this._instance,
    this._then,
  );

  final Query$friendsScreenViewer$viewer$friends$pageInfo _instance;

  final TRes Function(Query$friendsScreenViewer$viewer$friends$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendsScreenViewer$viewer$friends$pageInfo(
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

class _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$pageInfo<TRes>
    implements
        CopyWith$Query$friendsScreenViewer$viewer$friends$pageInfo<TRes> {
  _CopyWithStubImpl$Query$friendsScreenViewer$viewer$friends$pageInfo(
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

  static const _undefined = <dynamic, dynamic>{};

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
    this.$__typename = 'Mutation',
  });

  factory Mutation$acceptFriendshipRequest.fromJson(Map<String, dynamic> json) {
    final l$acceptFriendshipRequest = json['acceptFriendshipRequest'];
    final l$$__typename = json['__typename'];
    return Mutation$acceptFriendshipRequest(
      acceptFriendshipRequest:
          Mutation$acceptFriendshipRequest$acceptFriendshipRequest.fromJson(
              (l$acceptFriendshipRequest as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$acceptFriendshipRequest$acceptFriendshipRequest
      acceptFriendshipRequest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$acceptFriendshipRequest = acceptFriendshipRequest;
    _resultData['acceptFriendshipRequest'] = l$acceptFriendshipRequest.toJson();
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
    Mutation$acceptFriendshipRequest$acceptFriendshipRequest?
        acceptFriendshipRequest,
    String? $__typename,
  });
  CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<TRes>
      get acceptFriendshipRequest;
}

class _CopyWithImpl$Mutation$acceptFriendshipRequest<TRes>
    implements CopyWith$Mutation$acceptFriendshipRequest<TRes> {
  _CopyWithImpl$Mutation$acceptFriendshipRequest(
    this._instance,
    this._then,
  );

  final Mutation$acceptFriendshipRequest _instance;

  final TRes Function(Mutation$acceptFriendshipRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? acceptFriendshipRequest = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$acceptFriendshipRequest(
        acceptFriendshipRequest: acceptFriendshipRequest == _undefined ||
                acceptFriendshipRequest == null
            ? _instance.acceptFriendshipRequest
            : (acceptFriendshipRequest
                as Mutation$acceptFriendshipRequest$acceptFriendshipRequest),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<TRes>
      get acceptFriendshipRequest {
    final local$acceptFriendshipRequest = _instance.acceptFriendshipRequest;
    return CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest(
        local$acceptFriendshipRequest, (e) => call(acceptFriendshipRequest: e));
  }
}

class _CopyWithStubImpl$Mutation$acceptFriendshipRequest<TRes>
    implements CopyWith$Mutation$acceptFriendshipRequest<TRes> {
  _CopyWithStubImpl$Mutation$acceptFriendshipRequest(this._res);

  TRes _res;

  call({
    Mutation$acceptFriendshipRequest$acceptFriendshipRequest?
        acceptFriendshipRequest,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<TRes>
      get acceptFriendshipRequest =>
          CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest
              .stub(_res);
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
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'acceptedFriendshipRequestId'),
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
Mutation$acceptFriendshipRequest _parserFn$Mutation$acceptFriendshipRequest(
        Map<String, dynamic> data) =>
    Mutation$acceptFriendshipRequest.fromJson(data);
typedef OnMutationCompleted$Mutation$acceptFriendshipRequest = FutureOr<void>
    Function(
  Map<String, dynamic>?,
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
    Mutation$acceptFriendshipRequest? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
    Mutation$acceptFriendshipRequest? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
    Mutation$acceptFriendshipRequest? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
  Mutation$acceptFriendshipRequest? typedOptimisticResult,
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
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$acceptFriendshipRequest$acceptFriendshipRequest {
  Mutation$acceptFriendshipRequest$acceptFriendshipRequest({
    required this.acceptedFriendshipRequestId,
    this.$__typename = 'AcceptFriendshipRequestPayload',
  });

  factory Mutation$acceptFriendshipRequest$acceptFriendshipRequest.fromJson(
      Map<String, dynamic> json) {
    final l$acceptedFriendshipRequestId = json['acceptedFriendshipRequestId'];
    final l$$__typename = json['__typename'];
    return Mutation$acceptFriendshipRequest$acceptFriendshipRequest(
      acceptedFriendshipRequestId: (l$acceptedFriendshipRequestId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String acceptedFriendshipRequestId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$acceptedFriendshipRequestId = acceptedFriendshipRequestId;
    _resultData['acceptedFriendshipRequestId'] = l$acceptedFriendshipRequestId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$acceptedFriendshipRequestId = acceptedFriendshipRequestId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$acceptedFriendshipRequestId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$acceptFriendshipRequest$acceptFriendshipRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$acceptedFriendshipRequestId = acceptedFriendshipRequestId;
    final lOther$acceptedFriendshipRequestId =
        other.acceptedFriendshipRequestId;
    if (l$acceptedFriendshipRequestId != lOther$acceptedFriendshipRequestId) {
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

extension UtilityExtension$Mutation$acceptFriendshipRequest$acceptFriendshipRequest
    on Mutation$acceptFriendshipRequest$acceptFriendshipRequest {
  CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<
          Mutation$acceptFriendshipRequest$acceptFriendshipRequest>
      get copyWith =>
          CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<
    TRes> {
  factory CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest(
    Mutation$acceptFriendshipRequest$acceptFriendshipRequest instance,
    TRes Function(Mutation$acceptFriendshipRequest$acceptFriendshipRequest)
        then,
  ) = _CopyWithImpl$Mutation$acceptFriendshipRequest$acceptFriendshipRequest;

  factory CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$acceptFriendshipRequest$acceptFriendshipRequest;

  TRes call({
    String? acceptedFriendshipRequestId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<
        TRes>
    implements
        CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<
            TRes> {
  _CopyWithImpl$Mutation$acceptFriendshipRequest$acceptFriendshipRequest(
    this._instance,
    this._then,
  );

  final Mutation$acceptFriendshipRequest$acceptFriendshipRequest _instance;

  final TRes Function(Mutation$acceptFriendshipRequest$acceptFriendshipRequest)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? acceptedFriendshipRequestId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$acceptFriendshipRequest$acceptFriendshipRequest(
        acceptedFriendshipRequestId:
            acceptedFriendshipRequestId == _undefined ||
                    acceptedFriendshipRequestId == null
                ? _instance.acceptedFriendshipRequestId
                : (acceptedFriendshipRequestId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<
        TRes>
    implements
        CopyWith$Mutation$acceptFriendshipRequest$acceptFriendshipRequest<
            TRes> {
  _CopyWithStubImpl$Mutation$acceptFriendshipRequest$acceptFriendshipRequest(
      this._res);

  TRes _res;

  call({
    String? acceptedFriendshipRequestId,
    String? $__typename,
  }) =>
      _res;
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

  static const _undefined = <dynamic, dynamic>{};

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
    this.$__typename = 'Mutation',
  });

  factory Mutation$denyFriendshipRequest.fromJson(Map<String, dynamic> json) {
    final l$denyFriendshipRequest = json['denyFriendshipRequest'];
    final l$$__typename = json['__typename'];
    return Mutation$denyFriendshipRequest(
      denyFriendshipRequest:
          Mutation$denyFriendshipRequest$denyFriendshipRequest.fromJson(
              (l$denyFriendshipRequest as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$denyFriendshipRequest$denyFriendshipRequest
      denyFriendshipRequest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$denyFriendshipRequest = denyFriendshipRequest;
    _resultData['denyFriendshipRequest'] = l$denyFriendshipRequest.toJson();
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
    Mutation$denyFriendshipRequest$denyFriendshipRequest? denyFriendshipRequest,
    String? $__typename,
  });
  CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest<TRes>
      get denyFriendshipRequest;
}

class _CopyWithImpl$Mutation$denyFriendshipRequest<TRes>
    implements CopyWith$Mutation$denyFriendshipRequest<TRes> {
  _CopyWithImpl$Mutation$denyFriendshipRequest(
    this._instance,
    this._then,
  );

  final Mutation$denyFriendshipRequest _instance;

  final TRes Function(Mutation$denyFriendshipRequest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? denyFriendshipRequest = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$denyFriendshipRequest(
        denyFriendshipRequest:
            denyFriendshipRequest == _undefined || denyFriendshipRequest == null
                ? _instance.denyFriendshipRequest
                : (denyFriendshipRequest
                    as Mutation$denyFriendshipRequest$denyFriendshipRequest),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest<TRes>
      get denyFriendshipRequest {
    final local$denyFriendshipRequest = _instance.denyFriendshipRequest;
    return CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest(
        local$denyFriendshipRequest, (e) => call(denyFriendshipRequest: e));
  }
}

class _CopyWithStubImpl$Mutation$denyFriendshipRequest<TRes>
    implements CopyWith$Mutation$denyFriendshipRequest<TRes> {
  _CopyWithStubImpl$Mutation$denyFriendshipRequest(this._res);

  TRes _res;

  call({
    Mutation$denyFriendshipRequest$denyFriendshipRequest? denyFriendshipRequest,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest<TRes>
      get denyFriendshipRequest =>
          CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest.stub(
              _res);
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
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deniedFriendshipRequestId'),
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
Mutation$denyFriendshipRequest _parserFn$Mutation$denyFriendshipRequest(
        Map<String, dynamic> data) =>
    Mutation$denyFriendshipRequest.fromJson(data);
typedef OnMutationCompleted$Mutation$denyFriendshipRequest = FutureOr<void>
    Function(
  Map<String, dynamic>?,
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
    Mutation$denyFriendshipRequest? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
    Mutation$denyFriendshipRequest? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
    Mutation$denyFriendshipRequest? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
  Mutation$denyFriendshipRequest? typedOptimisticResult,
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
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$denyFriendshipRequest$denyFriendshipRequest {
  Mutation$denyFriendshipRequest$denyFriendshipRequest({
    required this.deniedFriendshipRequestId,
    this.$__typename = 'DenyFriendshipRequestPayload',
  });

  factory Mutation$denyFriendshipRequest$denyFriendshipRequest.fromJson(
      Map<String, dynamic> json) {
    final l$deniedFriendshipRequestId = json['deniedFriendshipRequestId'];
    final l$$__typename = json['__typename'];
    return Mutation$denyFriendshipRequest$denyFriendshipRequest(
      deniedFriendshipRequestId: (l$deniedFriendshipRequestId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String deniedFriendshipRequestId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deniedFriendshipRequestId = deniedFriendshipRequestId;
    _resultData['deniedFriendshipRequestId'] = l$deniedFriendshipRequestId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deniedFriendshipRequestId = deniedFriendshipRequestId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deniedFriendshipRequestId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$denyFriendshipRequest$denyFriendshipRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deniedFriendshipRequestId = deniedFriendshipRequestId;
    final lOther$deniedFriendshipRequestId = other.deniedFriendshipRequestId;
    if (l$deniedFriendshipRequestId != lOther$deniedFriendshipRequestId) {
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

extension UtilityExtension$Mutation$denyFriendshipRequest$denyFriendshipRequest
    on Mutation$denyFriendshipRequest$denyFriendshipRequest {
  CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest<
          Mutation$denyFriendshipRequest$denyFriendshipRequest>
      get copyWith =>
          CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest<
    TRes> {
  factory CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest(
    Mutation$denyFriendshipRequest$denyFriendshipRequest instance,
    TRes Function(Mutation$denyFriendshipRequest$denyFriendshipRequest) then,
  ) = _CopyWithImpl$Mutation$denyFriendshipRequest$denyFriendshipRequest;

  factory CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$denyFriendshipRequest$denyFriendshipRequest;

  TRes call({
    String? deniedFriendshipRequestId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$denyFriendshipRequest$denyFriendshipRequest<TRes>
    implements
        CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest<TRes> {
  _CopyWithImpl$Mutation$denyFriendshipRequest$denyFriendshipRequest(
    this._instance,
    this._then,
  );

  final Mutation$denyFriendshipRequest$denyFriendshipRequest _instance;

  final TRes Function(Mutation$denyFriendshipRequest$denyFriendshipRequest)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deniedFriendshipRequestId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$denyFriendshipRequest$denyFriendshipRequest(
        deniedFriendshipRequestId: deniedFriendshipRequestId == _undefined ||
                deniedFriendshipRequestId == null
            ? _instance.deniedFriendshipRequestId
            : (deniedFriendshipRequestId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$denyFriendshipRequest$denyFriendshipRequest<
        TRes>
    implements
        CopyWith$Mutation$denyFriendshipRequest$denyFriendshipRequest<TRes> {
  _CopyWithStubImpl$Mutation$denyFriendshipRequest$denyFriendshipRequest(
      this._res);

  TRes _res;

  call({
    String? deniedFriendshipRequestId,
    String? $__typename,
  }) =>
      _res;
}
