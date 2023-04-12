import '../../graphql/schema.graphql.dart';
import '../../widgets/friend_group_fragment.graphql.dart';
import '../../widgets/friend_list_item_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$invitationFormScreenViewer {
  Query$invitationFormScreenViewer({
    required this.viewer,
    this.$__typename = 'Query',
  });

  factory Query$invitationFormScreenViewer.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$invitationFormScreenViewer(
      viewer: Query$invitationFormScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$invitationFormScreenViewer$viewer viewer;

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
    if (!(other is Query$invitationFormScreenViewer) ||
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

extension UtilityExtension$Query$invitationFormScreenViewer
    on Query$invitationFormScreenViewer {
  CopyWith$Query$invitationFormScreenViewer<Query$invitationFormScreenViewer>
      get copyWith => CopyWith$Query$invitationFormScreenViewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationFormScreenViewer<TRes> {
  factory CopyWith$Query$invitationFormScreenViewer(
    Query$invitationFormScreenViewer instance,
    TRes Function(Query$invitationFormScreenViewer) then,
  ) = _CopyWithImpl$Query$invitationFormScreenViewer;

  factory CopyWith$Query$invitationFormScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$invitationFormScreenViewer;

  TRes call({
    Query$invitationFormScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$invitationFormScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$invitationFormScreenViewer<TRes>
    implements CopyWith$Query$invitationFormScreenViewer<TRes> {
  _CopyWithImpl$Query$invitationFormScreenViewer(
    this._instance,
    this._then,
  );

  final Query$invitationFormScreenViewer _instance;

  final TRes Function(Query$invitationFormScreenViewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationFormScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$invitationFormScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$invitationFormScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$invitationFormScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$invitationFormScreenViewer<TRes>
    implements CopyWith$Query$invitationFormScreenViewer<TRes> {
  _CopyWithStubImpl$Query$invitationFormScreenViewer(this._res);

  TRes _res;

  call({
    Query$invitationFormScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$invitationFormScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$invitationFormScreenViewer$viewer.stub(_res);
}

const documentNodeQueryinvitationFormScreenViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'invitationFormScreenViewer'),
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
Query$invitationFormScreenViewer _parserFn$Query$invitationFormScreenViewer(
        Map<String, dynamic> data) =>
    Query$invitationFormScreenViewer.fromJson(data);
typedef OnQueryComplete$Query$invitationFormScreenViewer = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$invitationFormScreenViewer?,
);

class Options$Query$invitationFormScreenViewer
    extends graphql.QueryOptions<Query$invitationFormScreenViewer> {
  Options$Query$invitationFormScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$invitationFormScreenViewer? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$invitationFormScreenViewer? onComplete,
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
                        : _parserFn$Query$invitationFormScreenViewer(data),
                  ),
          onError: onError,
          document: documentNodeQueryinvitationFormScreenViewer,
          parserFn: _parserFn$Query$invitationFormScreenViewer,
        );

  final OnQueryComplete$Query$invitationFormScreenViewer? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$invitationFormScreenViewer
    extends graphql.WatchQueryOptions<Query$invitationFormScreenViewer> {
  WatchOptions$Query$invitationFormScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$invitationFormScreenViewer? typedOptimisticResult,
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
          document: documentNodeQueryinvitationFormScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$invitationFormScreenViewer,
        );
}

class FetchMoreOptions$Query$invitationFormScreenViewer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$invitationFormScreenViewer(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryinvitationFormScreenViewer,
        );
}

extension ClientExtension$Query$invitationFormScreenViewer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$invitationFormScreenViewer>>
      query$invitationFormScreenViewer(
              [Options$Query$invitationFormScreenViewer? options]) async =>
          await this
              .query(options ?? Options$Query$invitationFormScreenViewer());
  graphql.ObservableQuery<Query$invitationFormScreenViewer>
      watchQuery$invitationFormScreenViewer(
              [WatchOptions$Query$invitationFormScreenViewer? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$invitationFormScreenViewer());
  void writeQuery$invitationFormScreenViewer({
    required Query$invitationFormScreenViewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryinvitationFormScreenViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$invitationFormScreenViewer? readQuery$invitationFormScreenViewer(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryinvitationFormScreenViewer)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$invitationFormScreenViewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$invitationFormScreenViewer>
    useQuery$invitationFormScreenViewer(
            [Options$Query$invitationFormScreenViewer? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$invitationFormScreenViewer());
graphql.ObservableQuery<Query$invitationFormScreenViewer>
    useWatchQuery$invitationFormScreenViewer(
            [WatchOptions$Query$invitationFormScreenViewer? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$invitationFormScreenViewer());

class Query$invitationFormScreenViewer$Widget
    extends graphql_flutter.Query<Query$invitationFormScreenViewer> {
  Query$invitationFormScreenViewer$Widget({
    widgets.Key? key,
    Options$Query$invitationFormScreenViewer? options,
    required graphql_flutter.QueryBuilder<Query$invitationFormScreenViewer>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$invitationFormScreenViewer(),
          builder: builder,
        );
}

class Query$invitationFormScreenViewer$viewer {
  Query$invitationFormScreenViewer$viewer({
    required this.friendGroups,
    required this.friends,
    this.$__typename = 'Viewer',
  });

  factory Query$invitationFormScreenViewer$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$friendGroups = json['friendGroups'];
    final l$friends = json['friends'];
    final l$$__typename = json['__typename'];
    return Query$invitationFormScreenViewer$viewer(
      friendGroups: (l$friendGroups as List<dynamic>)
          .map((e) => Fragment$friendGroupListItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      friends: Query$invitationFormScreenViewer$viewer$friends.fromJson(
          (l$friends as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$friendGroupListItemFragment> friendGroups;

  final Query$invitationFormScreenViewer$viewer$friends friends;

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
    if (!(other is Query$invitationFormScreenViewer$viewer) ||
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

extension UtilityExtension$Query$invitationFormScreenViewer$viewer
    on Query$invitationFormScreenViewer$viewer {
  CopyWith$Query$invitationFormScreenViewer$viewer<
          Query$invitationFormScreenViewer$viewer>
      get copyWith => CopyWith$Query$invitationFormScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationFormScreenViewer$viewer<TRes> {
  factory CopyWith$Query$invitationFormScreenViewer$viewer(
    Query$invitationFormScreenViewer$viewer instance,
    TRes Function(Query$invitationFormScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$invitationFormScreenViewer$viewer;

  factory CopyWith$Query$invitationFormScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer;

  TRes call({
    List<Fragment$friendGroupListItemFragment>? friendGroups,
    Query$invitationFormScreenViewer$viewer$friends? friends,
    String? $__typename,
  });
  TRes friendGroups(
      Iterable<Fragment$friendGroupListItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$friendGroupListItemFragment<
                      Fragment$friendGroupListItemFragment>>)
          _fn);
  CopyWith$Query$invitationFormScreenViewer$viewer$friends<TRes> get friends;
}

class _CopyWithImpl$Query$invitationFormScreenViewer$viewer<TRes>
    implements CopyWith$Query$invitationFormScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$invitationFormScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$invitationFormScreenViewer$viewer _instance;

  final TRes Function(Query$invitationFormScreenViewer$viewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? friendGroups = _undefined,
    Object? friends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationFormScreenViewer$viewer(
        friendGroups: friendGroups == _undefined || friendGroups == null
            ? _instance.friendGroups
            : (friendGroups as List<Fragment$friendGroupListItemFragment>),
        friends: friends == _undefined || friends == null
            ? _instance.friends
            : (friends as Query$invitationFormScreenViewer$viewer$friends),
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
  CopyWith$Query$invitationFormScreenViewer$viewer$friends<TRes> get friends {
    final local$friends = _instance.friends;
    return CopyWith$Query$invitationFormScreenViewer$viewer$friends(
        local$friends, (e) => call(friends: e));
  }
}

class _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer<TRes>
    implements CopyWith$Query$invitationFormScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer(this._res);

  TRes _res;

  call({
    List<Fragment$friendGroupListItemFragment>? friendGroups,
    Query$invitationFormScreenViewer$viewer$friends? friends,
    String? $__typename,
  }) =>
      _res;
  friendGroups(_fn) => _res;
  CopyWith$Query$invitationFormScreenViewer$viewer$friends<TRes> get friends =>
      CopyWith$Query$invitationFormScreenViewer$viewer$friends.stub(_res);
}

class Query$invitationFormScreenViewer$viewer$friends {
  Query$invitationFormScreenViewer$viewer$friends({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'UserConnection',
  });

  factory Query$invitationFormScreenViewer$viewer$friends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$invitationFormScreenViewer$viewer$friends(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$invitationFormScreenViewer$viewer$friends$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo:
          Query$invitationFormScreenViewer$viewer$friends$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$invitationFormScreenViewer$viewer$friends$edges> edges;

  final Query$invitationFormScreenViewer$viewer$friends$pageInfo pageInfo;

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
    if (!(other is Query$invitationFormScreenViewer$viewer$friends) ||
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

extension UtilityExtension$Query$invitationFormScreenViewer$viewer$friends
    on Query$invitationFormScreenViewer$viewer$friends {
  CopyWith$Query$invitationFormScreenViewer$viewer$friends<
          Query$invitationFormScreenViewer$viewer$friends>
      get copyWith => CopyWith$Query$invitationFormScreenViewer$viewer$friends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationFormScreenViewer$viewer$friends<TRes> {
  factory CopyWith$Query$invitationFormScreenViewer$viewer$friends(
    Query$invitationFormScreenViewer$viewer$friends instance,
    TRes Function(Query$invitationFormScreenViewer$viewer$friends) then,
  ) = _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends;

  factory CopyWith$Query$invitationFormScreenViewer$viewer$friends.stub(
          TRes res) =
      _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends;

  TRes call({
    List<Query$invitationFormScreenViewer$viewer$friends$edges>? edges,
    Query$invitationFormScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$invitationFormScreenViewer$viewer$friends$edges> Function(
              Iterable<
                  CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges<
                      Query$invitationFormScreenViewer$viewer$friends$edges>>)
          _fn);
  CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo;
}

class _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$invitationFormScreenViewer$viewer$friends<TRes> {
  _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends(
    this._instance,
    this._then,
  );

  final Query$invitationFormScreenViewer$viewer$friends _instance;

  final TRes Function(Query$invitationFormScreenViewer$viewer$friends) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationFormScreenViewer$viewer$friends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges
                as List<Query$invitationFormScreenViewer$viewer$friends$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo
                as Query$invitationFormScreenViewer$viewer$friends$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$invitationFormScreenViewer$viewer$friends$edges> Function(
                  Iterable<
                      CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges<
                          Query$invitationFormScreenViewer$viewer$friends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) =>
              CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$invitationFormScreenViewer$viewer$friends<TRes> {
  _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends(this._res);

  TRes _res;

  call({
    List<Query$invitationFormScreenViewer$viewer$friends$edges>? edges,
    Query$invitationFormScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
  CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo
              .stub(_res);
}

class Query$invitationFormScreenViewer$viewer$friends$edges {
  Query$invitationFormScreenViewer$viewer$friends$edges({
    required this.node,
    this.$__typename = 'UserEdge',
  });

  factory Query$invitationFormScreenViewer$viewer$friends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$invitationFormScreenViewer$viewer$friends$edges(
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
    if (!(other is Query$invitationFormScreenViewer$viewer$friends$edges) ||
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

extension UtilityExtension$Query$invitationFormScreenViewer$viewer$friends$edges
    on Query$invitationFormScreenViewer$viewer$friends$edges {
  CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges<
          Query$invitationFormScreenViewer$viewer$friends$edges>
      get copyWith =>
          CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges<
    TRes> {
  factory CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges(
    Query$invitationFormScreenViewer$viewer$friends$edges instance,
    TRes Function(Query$invitationFormScreenViewer$viewer$friends$edges) then,
  ) = _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends$edges;

  factory CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends$edges;

  TRes call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  });
  CopyWith$Fragment$friendListItemFragment<TRes> get node;
}

class _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends$edges<TRes>
    implements
        CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends$edges(
    this._instance,
    this._then,
  );

  final Query$invitationFormScreenViewer$viewer$friends$edges _instance;

  final TRes Function(Query$invitationFormScreenViewer$viewer$friends$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationFormScreenViewer$viewer$friends$edges(
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

class _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends$edges<
        TRes>
    implements
        CopyWith$Query$invitationFormScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends$edges(
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

class Query$invitationFormScreenViewer$viewer$friends$pageInfo {
  Query$invitationFormScreenViewer$viewer$friends$pageInfo({
    this.startCursor,
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$invitationFormScreenViewer$viewer$friends$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$$__typename = json['__typename'];
    return Query$invitationFormScreenViewer$viewer$friends$pageInfo(
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
    if (!(other is Query$invitationFormScreenViewer$viewer$friends$pageInfo) ||
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

extension UtilityExtension$Query$invitationFormScreenViewer$viewer$friends$pageInfo
    on Query$invitationFormScreenViewer$viewer$friends$pageInfo {
  CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo<
          Query$invitationFormScreenViewer$viewer$friends$pageInfo>
      get copyWith =>
          CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo<
    TRes> {
  factory CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo(
    Query$invitationFormScreenViewer$viewer$friends$pageInfo instance,
    TRes Function(Query$invitationFormScreenViewer$viewer$friends$pageInfo)
        then,
  ) = _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends$pageInfo;

  factory CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends$pageInfo;

  TRes call({
    String? startCursor,
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends$pageInfo<
        TRes>
    implements
        CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo<
            TRes> {
  _CopyWithImpl$Query$invitationFormScreenViewer$viewer$friends$pageInfo(
    this._instance,
    this._then,
  );

  final Query$invitationFormScreenViewer$viewer$friends$pageInfo _instance;

  final TRes Function(Query$invitationFormScreenViewer$viewer$friends$pageInfo)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationFormScreenViewer$viewer$friends$pageInfo(
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

class _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends$pageInfo<
        TRes>
    implements
        CopyWith$Query$invitationFormScreenViewer$viewer$friends$pageInfo<
            TRes> {
  _CopyWithStubImpl$Query$invitationFormScreenViewer$viewer$friends$pageInfo(
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

class Variables$Mutation$sendInvitation {
  factory Variables$Mutation$sendInvitation(
          {required Input$SendInvitationInput input}) =>
      Variables$Mutation$sendInvitation._({
        r'input': input,
      });

  Variables$Mutation$sendInvitation._(this._$data);

  factory Variables$Mutation$sendInvitation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$SendInvitationInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$sendInvitation._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SendInvitationInput get input =>
      (_$data['input'] as Input$SendInvitationInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$sendInvitation<Variables$Mutation$sendInvitation>
      get copyWith => CopyWith$Variables$Mutation$sendInvitation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$sendInvitation) ||
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

abstract class CopyWith$Variables$Mutation$sendInvitation<TRes> {
  factory CopyWith$Variables$Mutation$sendInvitation(
    Variables$Mutation$sendInvitation instance,
    TRes Function(Variables$Mutation$sendInvitation) then,
  ) = _CopyWithImpl$Variables$Mutation$sendInvitation;

  factory CopyWith$Variables$Mutation$sendInvitation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$sendInvitation;

  TRes call({Input$SendInvitationInput? input});
}

class _CopyWithImpl$Variables$Mutation$sendInvitation<TRes>
    implements CopyWith$Variables$Mutation$sendInvitation<TRes> {
  _CopyWithImpl$Variables$Mutation$sendInvitation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$sendInvitation _instance;

  final TRes Function(Variables$Mutation$sendInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$sendInvitation._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$SendInvitationInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$sendInvitation<TRes>
    implements CopyWith$Variables$Mutation$sendInvitation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$sendInvitation(this._res);

  TRes _res;

  call({Input$SendInvitationInput? input}) => _res;
}

class Mutation$sendInvitation {
  Mutation$sendInvitation({
    required this.sendInvitation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$sendInvitation.fromJson(Map<String, dynamic> json) {
    final l$sendInvitation = json['sendInvitation'];
    final l$$__typename = json['__typename'];
    return Mutation$sendInvitation(
      sendInvitation: Mutation$sendInvitation$sendInvitation.fromJson(
          (l$sendInvitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$sendInvitation$sendInvitation sendInvitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendInvitation = sendInvitation;
    _resultData['sendInvitation'] = l$sendInvitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendInvitation = sendInvitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sendInvitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendInvitation = sendInvitation;
    final lOther$sendInvitation = other.sendInvitation;
    if (l$sendInvitation != lOther$sendInvitation) {
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

extension UtilityExtension$Mutation$sendInvitation on Mutation$sendInvitation {
  CopyWith$Mutation$sendInvitation<Mutation$sendInvitation> get copyWith =>
      CopyWith$Mutation$sendInvitation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$sendInvitation<TRes> {
  factory CopyWith$Mutation$sendInvitation(
    Mutation$sendInvitation instance,
    TRes Function(Mutation$sendInvitation) then,
  ) = _CopyWithImpl$Mutation$sendInvitation;

  factory CopyWith$Mutation$sendInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$sendInvitation;

  TRes call({
    Mutation$sendInvitation$sendInvitation? sendInvitation,
    String? $__typename,
  });
  CopyWith$Mutation$sendInvitation$sendInvitation<TRes> get sendInvitation;
}

class _CopyWithImpl$Mutation$sendInvitation<TRes>
    implements CopyWith$Mutation$sendInvitation<TRes> {
  _CopyWithImpl$Mutation$sendInvitation(
    this._instance,
    this._then,
  );

  final Mutation$sendInvitation _instance;

  final TRes Function(Mutation$sendInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendInvitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendInvitation(
        sendInvitation: sendInvitation == _undefined || sendInvitation == null
            ? _instance.sendInvitation
            : (sendInvitation as Mutation$sendInvitation$sendInvitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$sendInvitation$sendInvitation<TRes> get sendInvitation {
    final local$sendInvitation = _instance.sendInvitation;
    return CopyWith$Mutation$sendInvitation$sendInvitation(
        local$sendInvitation, (e) => call(sendInvitation: e));
  }
}

class _CopyWithStubImpl$Mutation$sendInvitation<TRes>
    implements CopyWith$Mutation$sendInvitation<TRes> {
  _CopyWithStubImpl$Mutation$sendInvitation(this._res);

  TRes _res;

  call({
    Mutation$sendInvitation$sendInvitation? sendInvitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$sendInvitation$sendInvitation<TRes> get sendInvitation =>
      CopyWith$Mutation$sendInvitation$sendInvitation.stub(_res);
}

const documentNodeMutationsendInvitation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'sendInvitation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SendInvitationInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'sendInvitation'),
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
            name: NameNode(value: 'invitation'),
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
                name: NameNode(value: 'location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'coordinate'),
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
                name: NameNode(value: 'startsAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'expiresAt'),
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
Mutation$sendInvitation _parserFn$Mutation$sendInvitation(
        Map<String, dynamic> data) =>
    Mutation$sendInvitation.fromJson(data);
typedef OnMutationCompleted$Mutation$sendInvitation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$sendInvitation?,
);

class Options$Mutation$sendInvitation
    extends graphql.MutationOptions<Mutation$sendInvitation> {
  Options$Mutation$sendInvitation({
    String? operationName,
    required Variables$Mutation$sendInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendInvitation>? update,
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
                        : _parserFn$Mutation$sendInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendInvitation,
          parserFn: _parserFn$Mutation$sendInvitation,
        );

  final OnMutationCompleted$Mutation$sendInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$sendInvitation
    extends graphql.WatchQueryOptions<Mutation$sendInvitation> {
  WatchOptions$Mutation$sendInvitation({
    String? operationName,
    required Variables$Mutation$sendInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendInvitation? typedOptimisticResult,
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
          document: documentNodeMutationsendInvitation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$sendInvitation,
        );
}

extension ClientExtension$Mutation$sendInvitation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$sendInvitation>> mutate$sendInvitation(
          Options$Mutation$sendInvitation options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$sendInvitation> watchMutation$sendInvitation(
          WatchOptions$Mutation$sendInvitation options) =>
      this.watchMutation(options);
}

class Mutation$sendInvitation$HookResult {
  Mutation$sendInvitation$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$sendInvitation runMutation;

  final graphql.QueryResult<Mutation$sendInvitation> result;
}

Mutation$sendInvitation$HookResult useMutation$sendInvitation(
    [WidgetOptions$Mutation$sendInvitation? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$sendInvitation());
  return Mutation$sendInvitation$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$sendInvitation>
    useWatchMutation$sendInvitation(
            WatchOptions$Mutation$sendInvitation options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$sendInvitation
    extends graphql.MutationOptions<Mutation$sendInvitation> {
  WidgetOptions$Mutation$sendInvitation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendInvitation>? update,
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
                        : _parserFn$Mutation$sendInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendInvitation,
          parserFn: _parserFn$Mutation$sendInvitation,
        );

  final OnMutationCompleted$Mutation$sendInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$sendInvitation
    = graphql.MultiSourceResult<Mutation$sendInvitation> Function(
  Variables$Mutation$sendInvitation, {
  Object? optimisticResult,
  Mutation$sendInvitation? typedOptimisticResult,
});
typedef Builder$Mutation$sendInvitation = widgets.Widget Function(
  RunMutation$Mutation$sendInvitation,
  graphql.QueryResult<Mutation$sendInvitation>?,
);

class Mutation$sendInvitation$Widget
    extends graphql_flutter.Mutation<Mutation$sendInvitation> {
  Mutation$sendInvitation$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$sendInvitation? options,
    required Builder$Mutation$sendInvitation builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$sendInvitation(),
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

class Mutation$sendInvitation$sendInvitation {
  Mutation$sendInvitation$sendInvitation({
    required this.invitation,
    this.$__typename = 'SendInvitationPayload',
  });

  factory Mutation$sendInvitation$sendInvitation.fromJson(
      Map<String, dynamic> json) {
    final l$invitation = json['invitation'];
    final l$$__typename = json['__typename'];
    return Mutation$sendInvitation$sendInvitation(
      invitation: Mutation$sendInvitation$sendInvitation$invitation.fromJson(
          (l$invitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$sendInvitation$sendInvitation$invitation invitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$invitation = invitation;
    _resultData['invitation'] = l$invitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$invitation = invitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$invitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendInvitation$sendInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitation = invitation;
    final lOther$invitation = other.invitation;
    if (l$invitation != lOther$invitation) {
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

extension UtilityExtension$Mutation$sendInvitation$sendInvitation
    on Mutation$sendInvitation$sendInvitation {
  CopyWith$Mutation$sendInvitation$sendInvitation<
          Mutation$sendInvitation$sendInvitation>
      get copyWith => CopyWith$Mutation$sendInvitation$sendInvitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendInvitation$sendInvitation<TRes> {
  factory CopyWith$Mutation$sendInvitation$sendInvitation(
    Mutation$sendInvitation$sendInvitation instance,
    TRes Function(Mutation$sendInvitation$sendInvitation) then,
  ) = _CopyWithImpl$Mutation$sendInvitation$sendInvitation;

  factory CopyWith$Mutation$sendInvitation$sendInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation;

  TRes call({
    Mutation$sendInvitation$sendInvitation$invitation? invitation,
    String? $__typename,
  });
  CopyWith$Mutation$sendInvitation$sendInvitation$invitation<TRes>
      get invitation;
}

class _CopyWithImpl$Mutation$sendInvitation$sendInvitation<TRes>
    implements CopyWith$Mutation$sendInvitation$sendInvitation<TRes> {
  _CopyWithImpl$Mutation$sendInvitation$sendInvitation(
    this._instance,
    this._then,
  );

  final Mutation$sendInvitation$sendInvitation _instance;

  final TRes Function(Mutation$sendInvitation$sendInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? invitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendInvitation$sendInvitation(
        invitation: invitation == _undefined || invitation == null
            ? _instance.invitation
            : (invitation as Mutation$sendInvitation$sendInvitation$invitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$sendInvitation$sendInvitation$invitation<TRes>
      get invitation {
    final local$invitation = _instance.invitation;
    return CopyWith$Mutation$sendInvitation$sendInvitation$invitation(
        local$invitation, (e) => call(invitation: e));
  }
}

class _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation<TRes>
    implements CopyWith$Mutation$sendInvitation$sendInvitation<TRes> {
  _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation(this._res);

  TRes _res;

  call({
    Mutation$sendInvitation$sendInvitation$invitation? invitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$sendInvitation$sendInvitation$invitation<TRes>
      get invitation =>
          CopyWith$Mutation$sendInvitation$sendInvitation$invitation.stub(_res);
}

class Mutation$sendInvitation$sendInvitation$invitation {
  Mutation$sendInvitation$sendInvitation$invitation({
    required this.id,
    required this.location,
    this.coordinate,
    required this.startsAt,
    required this.expiresAt,
    this.$__typename = 'Invitation',
  });

  factory Mutation$sendInvitation$sendInvitation$invitation.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$location = json['location'];
    final l$coordinate = json['coordinate'];
    final l$startsAt = json['startsAt'];
    final l$expiresAt = json['expiresAt'];
    final l$$__typename = json['__typename'];
    return Mutation$sendInvitation$sendInvitation$invitation(
      id: (l$id as String),
      location: (l$location as String),
      coordinate: l$coordinate == null
          ? null
          : Mutation$sendInvitation$sendInvitation$invitation$coordinate
              .fromJson((l$coordinate as Map<String, dynamic>)),
      startsAt: DateTime.parse((l$startsAt as String)),
      expiresAt: DateTime.parse((l$expiresAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String location;

  final Mutation$sendInvitation$sendInvitation$invitation$coordinate?
      coordinate;

  final DateTime startsAt;

  final DateTime expiresAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$location = location;
    _resultData['location'] = l$location;
    final l$coordinate = coordinate;
    _resultData['coordinate'] = l$coordinate?.toJson();
    final l$startsAt = startsAt;
    _resultData['startsAt'] = l$startsAt.toIso8601String();
    final l$expiresAt = expiresAt;
    _resultData['expiresAt'] = l$expiresAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$location = location;
    final l$coordinate = coordinate;
    final l$startsAt = startsAt;
    final l$expiresAt = expiresAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$location,
      l$coordinate,
      l$startsAt,
      l$expiresAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendInvitation$sendInvitation$invitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$coordinate = coordinate;
    final lOther$coordinate = other.coordinate;
    if (l$coordinate != lOther$coordinate) {
      return false;
    }
    final l$startsAt = startsAt;
    final lOther$startsAt = other.startsAt;
    if (l$startsAt != lOther$startsAt) {
      return false;
    }
    final l$expiresAt = expiresAt;
    final lOther$expiresAt = other.expiresAt;
    if (l$expiresAt != lOther$expiresAt) {
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

extension UtilityExtension$Mutation$sendInvitation$sendInvitation$invitation
    on Mutation$sendInvitation$sendInvitation$invitation {
  CopyWith$Mutation$sendInvitation$sendInvitation$invitation<
          Mutation$sendInvitation$sendInvitation$invitation>
      get copyWith =>
          CopyWith$Mutation$sendInvitation$sendInvitation$invitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendInvitation$sendInvitation$invitation<
    TRes> {
  factory CopyWith$Mutation$sendInvitation$sendInvitation$invitation(
    Mutation$sendInvitation$sendInvitation$invitation instance,
    TRes Function(Mutation$sendInvitation$sendInvitation$invitation) then,
  ) = _CopyWithImpl$Mutation$sendInvitation$sendInvitation$invitation;

  factory CopyWith$Mutation$sendInvitation$sendInvitation$invitation.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation$invitation;

  TRes call({
    String? id,
    String? location,
    Mutation$sendInvitation$sendInvitation$invitation$coordinate? coordinate,
    DateTime? startsAt,
    DateTime? expiresAt,
    String? $__typename,
  });
  CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate<TRes>
      get coordinate;
}

class _CopyWithImpl$Mutation$sendInvitation$sendInvitation$invitation<TRes>
    implements
        CopyWith$Mutation$sendInvitation$sendInvitation$invitation<TRes> {
  _CopyWithImpl$Mutation$sendInvitation$sendInvitation$invitation(
    this._instance,
    this._then,
  );

  final Mutation$sendInvitation$sendInvitation$invitation _instance;

  final TRes Function(Mutation$sendInvitation$sendInvitation$invitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? location = _undefined,
    Object? coordinate = _undefined,
    Object? startsAt = _undefined,
    Object? expiresAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendInvitation$sendInvitation$invitation(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as String),
        coordinate: coordinate == _undefined
            ? _instance.coordinate
            : (coordinate
                as Mutation$sendInvitation$sendInvitation$invitation$coordinate?),
        startsAt: startsAt == _undefined || startsAt == null
            ? _instance.startsAt
            : (startsAt as DateTime),
        expiresAt: expiresAt == _undefined || expiresAt == null
            ? _instance.expiresAt
            : (expiresAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate<TRes>
      get coordinate {
    final local$coordinate = _instance.coordinate;
    return local$coordinate == null
        ? CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate
            .stub(_then(_instance))
        : CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate(
            local$coordinate, (e) => call(coordinate: e));
  }
}

class _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation$invitation<TRes>
    implements
        CopyWith$Mutation$sendInvitation$sendInvitation$invitation<TRes> {
  _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation$invitation(
      this._res);

  TRes _res;

  call({
    String? id,
    String? location,
    Mutation$sendInvitation$sendInvitation$invitation$coordinate? coordinate,
    DateTime? startsAt,
    DateTime? expiresAt,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate<TRes>
      get coordinate =>
          CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate
              .stub(_res);
}

class Mutation$sendInvitation$sendInvitation$invitation$coordinate {
  Mutation$sendInvitation$sendInvitation$invitation$coordinate({
    required this.latitude,
    required this.longitude,
    this.$__typename = 'Coordinate',
  });

  factory Mutation$sendInvitation$sendInvitation$invitation$coordinate.fromJson(
      Map<String, dynamic> json) {
    final l$latitude = json['latitude'];
    final l$longitude = json['longitude'];
    final l$$__typename = json['__typename'];
    return Mutation$sendInvitation$sendInvitation$invitation$coordinate(
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
            is Mutation$sendInvitation$sendInvitation$invitation$coordinate) ||
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

extension UtilityExtension$Mutation$sendInvitation$sendInvitation$invitation$coordinate
    on Mutation$sendInvitation$sendInvitation$invitation$coordinate {
  CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate<
          Mutation$sendInvitation$sendInvitation$invitation$coordinate>
      get copyWith =>
          CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate<
    TRes> {
  factory CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate(
    Mutation$sendInvitation$sendInvitation$invitation$coordinate instance,
    TRes Function(Mutation$sendInvitation$sendInvitation$invitation$coordinate)
        then,
  ) = _CopyWithImpl$Mutation$sendInvitation$sendInvitation$invitation$coordinate;

  factory CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation$invitation$coordinate;

  TRes call({
    double? latitude,
    double? longitude,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$sendInvitation$sendInvitation$invitation$coordinate<
        TRes>
    implements
        CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate<
            TRes> {
  _CopyWithImpl$Mutation$sendInvitation$sendInvitation$invitation$coordinate(
    this._instance,
    this._then,
  );

  final Mutation$sendInvitation$sendInvitation$invitation$coordinate _instance;

  final TRes Function(
      Mutation$sendInvitation$sendInvitation$invitation$coordinate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? latitude = _undefined,
    Object? longitude = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendInvitation$sendInvitation$invitation$coordinate(
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

class _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation$invitation$coordinate<
        TRes>
    implements
        CopyWith$Mutation$sendInvitation$sendInvitation$invitation$coordinate<
            TRes> {
  _CopyWithStubImpl$Mutation$sendInvitation$sendInvitation$invitation$coordinate(
      this._res);

  TRes _res;

  call({
    double? latitude,
    double? longitude,
    String? $__typename,
  }) =>
      _res;
}
