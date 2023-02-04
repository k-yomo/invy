import '../../components/friend_list_item_fragment.graphql.dart';
import '../../graphql/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$friendGroupEditScreenFragment {
  Fragment$friendGroupEditScreenFragment({
    required this.id,
    required this.name,
    required this.friendUsers,
    required this.$__typename,
  });

  factory Fragment$friendGroupEditScreenFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$friendUsers = json['friendUsers'];
    final l$$__typename = json['__typename'];
    return Fragment$friendGroupEditScreenFragment(
      id: (l$id as String),
      name: (l$name as String),
      friendUsers: (l$friendUsers as List<dynamic>)
          .map((e) => Fragment$friendListItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final List<Fragment$friendListItemFragment> friendUsers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$friendUsers = friendUsers;
    _resultData['friendUsers'] = l$friendUsers.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$friendUsers = friendUsers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      Object.hashAll(l$friendUsers.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$friendGroupEditScreenFragment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$friendUsers = friendUsers;
    final lOther$friendUsers = other.friendUsers;
    if (l$friendUsers.length != lOther$friendUsers.length) {
      return false;
    }
    for (int i = 0; i < l$friendUsers.length; i++) {
      final l$friendUsers$entry = l$friendUsers[i];
      final lOther$friendUsers$entry = lOther$friendUsers[i];
      if (l$friendUsers$entry != lOther$friendUsers$entry) {
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

extension UtilityExtension$Fragment$friendGroupEditScreenFragment
    on Fragment$friendGroupEditScreenFragment {
  CopyWith$Fragment$friendGroupEditScreenFragment<
          Fragment$friendGroupEditScreenFragment>
      get copyWith => CopyWith$Fragment$friendGroupEditScreenFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$friendGroupEditScreenFragment<TRes> {
  factory CopyWith$Fragment$friendGroupEditScreenFragment(
    Fragment$friendGroupEditScreenFragment instance,
    TRes Function(Fragment$friendGroupEditScreenFragment) then,
  ) = _CopyWithImpl$Fragment$friendGroupEditScreenFragment;

  factory CopyWith$Fragment$friendGroupEditScreenFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$friendGroupEditScreenFragment;

  TRes call({
    String? id,
    String? name,
    List<Fragment$friendListItemFragment>? friendUsers,
    String? $__typename,
  });
  TRes friendUsers(
      Iterable<Fragment$friendListItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$friendListItemFragment<
                      Fragment$friendListItemFragment>>)
          _fn);
}

class _CopyWithImpl$Fragment$friendGroupEditScreenFragment<TRes>
    implements CopyWith$Fragment$friendGroupEditScreenFragment<TRes> {
  _CopyWithImpl$Fragment$friendGroupEditScreenFragment(
    this._instance,
    this._then,
  );

  final Fragment$friendGroupEditScreenFragment _instance;

  final TRes Function(Fragment$friendGroupEditScreenFragment) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? friendUsers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$friendGroupEditScreenFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        friendUsers: friendUsers == _undefined || friendUsers == null
            ? _instance.friendUsers
            : (friendUsers as List<Fragment$friendListItemFragment>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes friendUsers(
          Iterable<Fragment$friendListItemFragment> Function(
                  Iterable<
                      CopyWith$Fragment$friendListItemFragment<
                          Fragment$friendListItemFragment>>)
              _fn) =>
      call(
          friendUsers: _fn(_instance.friendUsers
              .map((e) => CopyWith$Fragment$friendListItemFragment(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$friendGroupEditScreenFragment<TRes>
    implements CopyWith$Fragment$friendGroupEditScreenFragment<TRes> {
  _CopyWithStubImpl$Fragment$friendGroupEditScreenFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    List<Fragment$friendListItemFragment>? friendUsers,
    String? $__typename,
  }) =>
      _res;
  friendUsers(_fn) => _res;
}

const fragmentDefinitionfriendGroupEditScreenFragment = FragmentDefinitionNode(
  name: NameNode(value: 'friendGroupEditScreenFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'FriendGroup'),
    isNonNull: false,
  )),
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
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'friendUsers'),
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
);
const documentNodeFragmentfriendGroupEditScreenFragment =
    DocumentNode(definitions: [
  fragmentDefinitionfriendGroupEditScreenFragment,
  fragmentDefinitionfriendListItemFragment,
]);

extension ClientExtension$Fragment$friendGroupEditScreenFragment
    on graphql.GraphQLClient {
  void writeFragment$friendGroupEditScreenFragment({
    required Fragment$friendGroupEditScreenFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'friendGroupEditScreenFragment',
            document: documentNodeFragmentfriendGroupEditScreenFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$friendGroupEditScreenFragment?
      readFragment$friendGroupEditScreenFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'friendGroupEditScreenFragment',
          document: documentNodeFragmentfriendGroupEditScreenFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$friendGroupEditScreenFragment.fromJson(result);
  }
}

class Query$friendGroupEditScreenViewer {
  Query$friendGroupEditScreenViewer({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$friendGroupEditScreenViewer.fromJson(
      Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupEditScreenViewer(
      viewer: Query$friendGroupEditScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendGroupEditScreenViewer$viewer viewer;

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
    if (!(other is Query$friendGroupEditScreenViewer) ||
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

extension UtilityExtension$Query$friendGroupEditScreenViewer
    on Query$friendGroupEditScreenViewer {
  CopyWith$Query$friendGroupEditScreenViewer<Query$friendGroupEditScreenViewer>
      get copyWith => CopyWith$Query$friendGroupEditScreenViewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupEditScreenViewer<TRes> {
  factory CopyWith$Query$friendGroupEditScreenViewer(
    Query$friendGroupEditScreenViewer instance,
    TRes Function(Query$friendGroupEditScreenViewer) then,
  ) = _CopyWithImpl$Query$friendGroupEditScreenViewer;

  factory CopyWith$Query$friendGroupEditScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendGroupEditScreenViewer;

  TRes call({
    Query$friendGroupEditScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$friendGroupEditScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$friendGroupEditScreenViewer<TRes>
    implements CopyWith$Query$friendGroupEditScreenViewer<TRes> {
  _CopyWithImpl$Query$friendGroupEditScreenViewer(
    this._instance,
    this._then,
  );

  final Query$friendGroupEditScreenViewer _instance;

  final TRes Function(Query$friendGroupEditScreenViewer) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupEditScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$friendGroupEditScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$friendGroupEditScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$friendGroupEditScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupEditScreenViewer<TRes>
    implements CopyWith$Query$friendGroupEditScreenViewer<TRes> {
  _CopyWithStubImpl$Query$friendGroupEditScreenViewer(this._res);

  TRes _res;

  call({
    Query$friendGroupEditScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendGroupEditScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$friendGroupEditScreenViewer$viewer.stub(_res);
}

const documentNodeQueryfriendGroupEditScreenViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'friendGroupEditScreenViewer'),
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
Query$friendGroupEditScreenViewer _parserFn$Query$friendGroupEditScreenViewer(
        Map<String, dynamic> data) =>
    Query$friendGroupEditScreenViewer.fromJson(data);

class Options$Query$friendGroupEditScreenViewer
    extends graphql.QueryOptions<Query$friendGroupEditScreenViewer> {
  Options$Query$friendGroupEditScreenViewer({
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
          document: documentNodeQueryfriendGroupEditScreenViewer,
          parserFn: _parserFn$Query$friendGroupEditScreenViewer,
        );
}

class WatchOptions$Query$friendGroupEditScreenViewer
    extends graphql.WatchQueryOptions<Query$friendGroupEditScreenViewer> {
  WatchOptions$Query$friendGroupEditScreenViewer({
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
          document: documentNodeQueryfriendGroupEditScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$friendGroupEditScreenViewer,
        );
}

class FetchMoreOptions$Query$friendGroupEditScreenViewer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$friendGroupEditScreenViewer(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryfriendGroupEditScreenViewer,
        );
}

extension ClientExtension$Query$friendGroupEditScreenViewer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$friendGroupEditScreenViewer>>
      query$friendGroupEditScreenViewer(
              [Options$Query$friendGroupEditScreenViewer? options]) async =>
          await this
              .query(options ?? Options$Query$friendGroupEditScreenViewer());
  graphql.ObservableQuery<Query$friendGroupEditScreenViewer>
      watchQuery$friendGroupEditScreenViewer(
              [WatchOptions$Query$friendGroupEditScreenViewer? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$friendGroupEditScreenViewer());
  void writeQuery$friendGroupEditScreenViewer({
    required Query$friendGroupEditScreenViewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryfriendGroupEditScreenViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$friendGroupEditScreenViewer? readQuery$friendGroupEditScreenViewer(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfriendGroupEditScreenViewer)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$friendGroupEditScreenViewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$friendGroupEditScreenViewer>
    useQuery$friendGroupEditScreenViewer(
            [Options$Query$friendGroupEditScreenViewer? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$friendGroupEditScreenViewer());
graphql.ObservableQuery<Query$friendGroupEditScreenViewer>
    useWatchQuery$friendGroupEditScreenViewer(
            [WatchOptions$Query$friendGroupEditScreenViewer? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$friendGroupEditScreenViewer());

class Query$friendGroupEditScreenViewer$Widget
    extends graphql_flutter.Query<Query$friendGroupEditScreenViewer> {
  Query$friendGroupEditScreenViewer$Widget({
    widgets.Key? key,
    Options$Query$friendGroupEditScreenViewer? options,
    required graphql_flutter.QueryBuilder<Query$friendGroupEditScreenViewer>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$friendGroupEditScreenViewer(),
          builder: builder,
        );
}

class Query$friendGroupEditScreenViewer$viewer {
  Query$friendGroupEditScreenViewer$viewer({
    required this.friends,
    required this.$__typename,
  });

  factory Query$friendGroupEditScreenViewer$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$friends = json['friends'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupEditScreenViewer$viewer(
      friends: Query$friendGroupEditScreenViewer$viewer$friends.fromJson(
          (l$friends as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendGroupEditScreenViewer$viewer$friends friends;

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
    if (!(other is Query$friendGroupEditScreenViewer$viewer) ||
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

extension UtilityExtension$Query$friendGroupEditScreenViewer$viewer
    on Query$friendGroupEditScreenViewer$viewer {
  CopyWith$Query$friendGroupEditScreenViewer$viewer<
          Query$friendGroupEditScreenViewer$viewer>
      get copyWith => CopyWith$Query$friendGroupEditScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupEditScreenViewer$viewer<TRes> {
  factory CopyWith$Query$friendGroupEditScreenViewer$viewer(
    Query$friendGroupEditScreenViewer$viewer instance,
    TRes Function(Query$friendGroupEditScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer;

  factory CopyWith$Query$friendGroupEditScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer;

  TRes call({
    Query$friendGroupEditScreenViewer$viewer$friends? friends,
    String? $__typename,
  });
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends<TRes> get friends;
}

class _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendGroupEditScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$friendGroupEditScreenViewer$viewer _instance;

  final TRes Function(Query$friendGroupEditScreenViewer$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? friends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupEditScreenViewer$viewer(
        friends: friends == _undefined || friends == null
            ? _instance.friends
            : (friends as Query$friendGroupEditScreenViewer$viewer$friends),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends<TRes> get friends {
    final local$friends = _instance.friends;
    return CopyWith$Query$friendGroupEditScreenViewer$viewer$friends(
        local$friends, (e) => call(friends: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendGroupEditScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer(this._res);

  TRes _res;

  call({
    Query$friendGroupEditScreenViewer$viewer$friends? friends,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends<TRes> get friends =>
      CopyWith$Query$friendGroupEditScreenViewer$viewer$friends.stub(_res);
}

class Query$friendGroupEditScreenViewer$viewer$friends {
  Query$friendGroupEditScreenViewer$viewer$friends({
    required this.edges,
    required this.pageInfo,
    required this.$__typename,
  });

  factory Query$friendGroupEditScreenViewer$viewer$friends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupEditScreenViewer$viewer$friends(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$friendGroupEditScreenViewer$viewer$friends$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo:
          Query$friendGroupEditScreenViewer$viewer$friends$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$friendGroupEditScreenViewer$viewer$friends$edges> edges;

  final Query$friendGroupEditScreenViewer$viewer$friends$pageInfo pageInfo;

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
    if (!(other is Query$friendGroupEditScreenViewer$viewer$friends) ||
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

extension UtilityExtension$Query$friendGroupEditScreenViewer$viewer$friends
    on Query$friendGroupEditScreenViewer$viewer$friends {
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends<
          Query$friendGroupEditScreenViewer$viewer$friends>
      get copyWith => CopyWith$Query$friendGroupEditScreenViewer$viewer$friends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupEditScreenViewer$viewer$friends<TRes> {
  factory CopyWith$Query$friendGroupEditScreenViewer$viewer$friends(
    Query$friendGroupEditScreenViewer$viewer$friends instance,
    TRes Function(Query$friendGroupEditScreenViewer$viewer$friends) then,
  ) = _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends;

  factory CopyWith$Query$friendGroupEditScreenViewer$viewer$friends.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends;

  TRes call({
    List<Query$friendGroupEditScreenViewer$viewer$friends$edges>? edges,
    Query$friendGroupEditScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$friendGroupEditScreenViewer$viewer$friends$edges> Function(
              Iterable<
                  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges<
                      Query$friendGroupEditScreenViewer$viewer$friends$edges>>)
          _fn);
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo;
}

class _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$friendGroupEditScreenViewer$viewer$friends<TRes> {
  _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends(
    this._instance,
    this._then,
  );

  final Query$friendGroupEditScreenViewer$viewer$friends _instance;

  final TRes Function(Query$friendGroupEditScreenViewer$viewer$friends) _then;

  static const _undefined = {};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupEditScreenViewer$viewer$friends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$friendGroupEditScreenViewer$viewer$friends$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo
                as Query$friendGroupEditScreenViewer$viewer$friends$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$friendGroupEditScreenViewer$viewer$friends$edges> Function(
                  Iterable<
                      CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges<
                          Query$friendGroupEditScreenViewer$viewer$friends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) =>
              CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends<TRes>
    implements CopyWith$Query$friendGroupEditScreenViewer$viewer$friends<TRes> {
  _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends(this._res);

  TRes _res;

  call({
    List<Query$friendGroupEditScreenViewer$viewer$friends$edges>? edges,
    Query$friendGroupEditScreenViewer$viewer$friends$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo
              .stub(_res);
}

class Query$friendGroupEditScreenViewer$viewer$friends$edges {
  Query$friendGroupEditScreenViewer$viewer$friends$edges({
    required this.node,
    required this.$__typename,
  });

  factory Query$friendGroupEditScreenViewer$viewer$friends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupEditScreenViewer$viewer$friends$edges(
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
    if (!(other is Query$friendGroupEditScreenViewer$viewer$friends$edges) ||
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

extension UtilityExtension$Query$friendGroupEditScreenViewer$viewer$friends$edges
    on Query$friendGroupEditScreenViewer$viewer$friends$edges {
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges<
          Query$friendGroupEditScreenViewer$viewer$friends$edges>
      get copyWith =>
          CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges<
    TRes> {
  factory CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges(
    Query$friendGroupEditScreenViewer$viewer$friends$edges instance,
    TRes Function(Query$friendGroupEditScreenViewer$viewer$friends$edges) then,
  ) = _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends$edges;

  factory CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends$edges;

  TRes call({
    Fragment$friendListItemFragment? node,
    String? $__typename,
  });
  CopyWith$Fragment$friendListItemFragment<TRes> get node;
}

class _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends$edges<TRes>
    implements
        CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends$edges(
    this._instance,
    this._then,
  );

  final Query$friendGroupEditScreenViewer$viewer$friends$edges _instance;

  final TRes Function(Query$friendGroupEditScreenViewer$viewer$friends$edges)
      _then;

  static const _undefined = {};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupEditScreenViewer$viewer$friends$edges(
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

class _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends$edges<
        TRes>
    implements
        CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$edges<TRes> {
  _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends$edges(
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

class Query$friendGroupEditScreenViewer$viewer$friends$pageInfo {
  Query$friendGroupEditScreenViewer$viewer$friends$pageInfo({
    this.startCursor,
    this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.$__typename,
  });

  factory Query$friendGroupEditScreenViewer$viewer$friends$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$$__typename = json['__typename'];
    return Query$friendGroupEditScreenViewer$viewer$friends$pageInfo(
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
    if (!(other is Query$friendGroupEditScreenViewer$viewer$friends$pageInfo) ||
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

extension UtilityExtension$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo
    on Query$friendGroupEditScreenViewer$viewer$friends$pageInfo {
  CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<
          Query$friendGroupEditScreenViewer$viewer$friends$pageInfo>
      get copyWith =>
          CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<
    TRes> {
  factory CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo(
    Query$friendGroupEditScreenViewer$viewer$friends$pageInfo instance,
    TRes Function(Query$friendGroupEditScreenViewer$viewer$friends$pageInfo)
        then,
  ) = _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo;

  factory CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo;

  TRes call({
    String? startCursor,
    String? endCursor,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<
        TRes>
    implements
        CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<
            TRes> {
  _CopyWithImpl$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo(
    this._instance,
    this._then,
  );

  final Query$friendGroupEditScreenViewer$viewer$friends$pageInfo _instance;

  final TRes Function(Query$friendGroupEditScreenViewer$viewer$friends$pageInfo)
      _then;

  static const _undefined = {};

  TRes call({
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupEditScreenViewer$viewer$friends$pageInfo(
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

class _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<
        TRes>
    implements
        CopyWith$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo<
            TRes> {
  _CopyWithStubImpl$Query$friendGroupEditScreenViewer$viewer$friends$pageInfo(
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

class Variables$Mutation$updateFriendGroup {
  factory Variables$Mutation$updateFriendGroup(
          {required Input$UpdateFriendGroupInput input}) =>
      Variables$Mutation$updateFriendGroup._({
        r'input': input,
      });

  Variables$Mutation$updateFriendGroup._(this._$data);

  factory Variables$Mutation$updateFriendGroup.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$UpdateFriendGroupInput.fromJson(
        (l$input as Map<String, dynamic>));
    return Variables$Mutation$updateFriendGroup._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UpdateFriendGroupInput get input =>
      (_$data['input'] as Input$UpdateFriendGroupInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateFriendGroup<
          Variables$Mutation$updateFriendGroup>
      get copyWith => CopyWith$Variables$Mutation$updateFriendGroup(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateFriendGroup) ||
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

abstract class CopyWith$Variables$Mutation$updateFriendGroup<TRes> {
  factory CopyWith$Variables$Mutation$updateFriendGroup(
    Variables$Mutation$updateFriendGroup instance,
    TRes Function(Variables$Mutation$updateFriendGroup) then,
  ) = _CopyWithImpl$Variables$Mutation$updateFriendGroup;

  factory CopyWith$Variables$Mutation$updateFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateFriendGroup;

  TRes call({Input$UpdateFriendGroupInput? input});
}

class _CopyWithImpl$Variables$Mutation$updateFriendGroup<TRes>
    implements CopyWith$Variables$Mutation$updateFriendGroup<TRes> {
  _CopyWithImpl$Variables$Mutation$updateFriendGroup(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateFriendGroup _instance;

  final TRes Function(Variables$Mutation$updateFriendGroup) _then;

  static const _undefined = {};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$updateFriendGroup._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateFriendGroupInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateFriendGroup<TRes>
    implements CopyWith$Variables$Mutation$updateFriendGroup<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateFriendGroup(this._res);

  TRes _res;

  call({Input$UpdateFriendGroupInput? input}) => _res;
}

class Mutation$updateFriendGroup {
  Mutation$updateFriendGroup({
    required this.updateFriendGroup,
    required this.$__typename,
  });

  factory Mutation$updateFriendGroup.fromJson(Map<String, dynamic> json) {
    final l$updateFriendGroup = json['updateFriendGroup'];
    final l$$__typename = json['__typename'];
    return Mutation$updateFriendGroup(
      updateFriendGroup: Mutation$updateFriendGroup$updateFriendGroup.fromJson(
          (l$updateFriendGroup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$updateFriendGroup$updateFriendGroup updateFriendGroup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateFriendGroup = updateFriendGroup;
    _resultData['updateFriendGroup'] = l$updateFriendGroup.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateFriendGroup = updateFriendGroup;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateFriendGroup,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateFriendGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateFriendGroup = updateFriendGroup;
    final lOther$updateFriendGroup = other.updateFriendGroup;
    if (l$updateFriendGroup != lOther$updateFriendGroup) {
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

extension UtilityExtension$Mutation$updateFriendGroup
    on Mutation$updateFriendGroup {
  CopyWith$Mutation$updateFriendGroup<Mutation$updateFriendGroup>
      get copyWith => CopyWith$Mutation$updateFriendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateFriendGroup<TRes> {
  factory CopyWith$Mutation$updateFriendGroup(
    Mutation$updateFriendGroup instance,
    TRes Function(Mutation$updateFriendGroup) then,
  ) = _CopyWithImpl$Mutation$updateFriendGroup;

  factory CopyWith$Mutation$updateFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateFriendGroup;

  TRes call({
    Mutation$updateFriendGroup$updateFriendGroup? updateFriendGroup,
    String? $__typename,
  });
  CopyWith$Mutation$updateFriendGroup$updateFriendGroup<TRes>
      get updateFriendGroup;
}

class _CopyWithImpl$Mutation$updateFriendGroup<TRes>
    implements CopyWith$Mutation$updateFriendGroup<TRes> {
  _CopyWithImpl$Mutation$updateFriendGroup(
    this._instance,
    this._then,
  );

  final Mutation$updateFriendGroup _instance;

  final TRes Function(Mutation$updateFriendGroup) _then;

  static const _undefined = {};

  TRes call({
    Object? updateFriendGroup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateFriendGroup(
        updateFriendGroup:
            updateFriendGroup == _undefined || updateFriendGroup == null
                ? _instance.updateFriendGroup
                : (updateFriendGroup
                    as Mutation$updateFriendGroup$updateFriendGroup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateFriendGroup$updateFriendGroup<TRes>
      get updateFriendGroup {
    final local$updateFriendGroup = _instance.updateFriendGroup;
    return CopyWith$Mutation$updateFriendGroup$updateFriendGroup(
        local$updateFriendGroup, (e) => call(updateFriendGroup: e));
  }
}

class _CopyWithStubImpl$Mutation$updateFriendGroup<TRes>
    implements CopyWith$Mutation$updateFriendGroup<TRes> {
  _CopyWithStubImpl$Mutation$updateFriendGroup(this._res);

  TRes _res;

  call({
    Mutation$updateFriendGroup$updateFriendGroup? updateFriendGroup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateFriendGroup$updateFriendGroup<TRes>
      get updateFriendGroup =>
          CopyWith$Mutation$updateFriendGroup$updateFriendGroup.stub(_res);
}

const documentNodeMutationupdateFriendGroup = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateFriendGroup'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateFriendGroupInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateFriendGroup'),
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
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'friendUsers'),
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
  fragmentDefinitionfriendListItemFragment,
]);
Mutation$updateFriendGroup _parserFn$Mutation$updateFriendGroup(
        Map<String, dynamic> data) =>
    Mutation$updateFriendGroup.fromJson(data);
typedef OnMutationCompleted$Mutation$updateFriendGroup = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateFriendGroup?,
);

class Options$Mutation$updateFriendGroup
    extends graphql.MutationOptions<Mutation$updateFriendGroup> {
  Options$Mutation$updateFriendGroup({
    String? operationName,
    required Variables$Mutation$updateFriendGroup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateFriendGroup? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateFriendGroup>? update,
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
                        : _parserFn$Mutation$updateFriendGroup(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateFriendGroup,
          parserFn: _parserFn$Mutation$updateFriendGroup,
        );

  final OnMutationCompleted$Mutation$updateFriendGroup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateFriendGroup
    extends graphql.WatchQueryOptions<Mutation$updateFriendGroup> {
  WatchOptions$Mutation$updateFriendGroup({
    String? operationName,
    required Variables$Mutation$updateFriendGroup variables,
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
          document: documentNodeMutationupdateFriendGroup,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateFriendGroup,
        );
}

extension ClientExtension$Mutation$updateFriendGroup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateFriendGroup>>
      mutate$updateFriendGroup(
              Options$Mutation$updateFriendGroup options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateFriendGroup>
      watchMutation$updateFriendGroup(
              WatchOptions$Mutation$updateFriendGroup options) =>
          this.watchMutation(options);
}

class Mutation$updateFriendGroup$HookResult {
  Mutation$updateFriendGroup$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$updateFriendGroup runMutation;

  final graphql.QueryResult<Mutation$updateFriendGroup> result;
}

Mutation$updateFriendGroup$HookResult useMutation$updateFriendGroup(
    [WidgetOptions$Mutation$updateFriendGroup? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$updateFriendGroup());
  return Mutation$updateFriendGroup$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$updateFriendGroup>
    useWatchMutation$updateFriendGroup(
            WatchOptions$Mutation$updateFriendGroup options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$updateFriendGroup
    extends graphql.MutationOptions<Mutation$updateFriendGroup> {
  WidgetOptions$Mutation$updateFriendGroup({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateFriendGroup? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateFriendGroup>? update,
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
                        : _parserFn$Mutation$updateFriendGroup(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateFriendGroup,
          parserFn: _parserFn$Mutation$updateFriendGroup,
        );

  final OnMutationCompleted$Mutation$updateFriendGroup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$updateFriendGroup
    = graphql.MultiSourceResult<Mutation$updateFriendGroup> Function(
  Variables$Mutation$updateFriendGroup, {
  Object? optimisticResult,
});
typedef Builder$Mutation$updateFriendGroup = widgets.Widget Function(
  RunMutation$Mutation$updateFriendGroup,
  graphql.QueryResult<Mutation$updateFriendGroup>?,
);

class Mutation$updateFriendGroup$Widget
    extends graphql_flutter.Mutation<Mutation$updateFriendGroup> {
  Mutation$updateFriendGroup$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$updateFriendGroup? options,
    required Builder$Mutation$updateFriendGroup builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$updateFriendGroup(),
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

class Mutation$updateFriendGroup$updateFriendGroup {
  Mutation$updateFriendGroup$updateFriendGroup({
    required this.friendGroup,
    required this.$__typename,
  });

  factory Mutation$updateFriendGroup$updateFriendGroup.fromJson(
      Map<String, dynamic> json) {
    final l$friendGroup = json['friendGroup'];
    final l$$__typename = json['__typename'];
    return Mutation$updateFriendGroup$updateFriendGroup(
      friendGroup:
          Mutation$updateFriendGroup$updateFriendGroup$friendGroup.fromJson(
              (l$friendGroup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$updateFriendGroup$updateFriendGroup$friendGroup friendGroup;

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
    if (!(other is Mutation$updateFriendGroup$updateFriendGroup) ||
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

extension UtilityExtension$Mutation$updateFriendGroup$updateFriendGroup
    on Mutation$updateFriendGroup$updateFriendGroup {
  CopyWith$Mutation$updateFriendGroup$updateFriendGroup<
          Mutation$updateFriendGroup$updateFriendGroup>
      get copyWith => CopyWith$Mutation$updateFriendGroup$updateFriendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateFriendGroup$updateFriendGroup<TRes> {
  factory CopyWith$Mutation$updateFriendGroup$updateFriendGroup(
    Mutation$updateFriendGroup$updateFriendGroup instance,
    TRes Function(Mutation$updateFriendGroup$updateFriendGroup) then,
  ) = _CopyWithImpl$Mutation$updateFriendGroup$updateFriendGroup;

  factory CopyWith$Mutation$updateFriendGroup$updateFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateFriendGroup$updateFriendGroup;

  TRes call({
    Mutation$updateFriendGroup$updateFriendGroup$friendGroup? friendGroup,
    String? $__typename,
  });
  CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<TRes>
      get friendGroup;
}

class _CopyWithImpl$Mutation$updateFriendGroup$updateFriendGroup<TRes>
    implements CopyWith$Mutation$updateFriendGroup$updateFriendGroup<TRes> {
  _CopyWithImpl$Mutation$updateFriendGroup$updateFriendGroup(
    this._instance,
    this._then,
  );

  final Mutation$updateFriendGroup$updateFriendGroup _instance;

  final TRes Function(Mutation$updateFriendGroup$updateFriendGroup) _then;

  static const _undefined = {};

  TRes call({
    Object? friendGroup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateFriendGroup$updateFriendGroup(
        friendGroup: friendGroup == _undefined || friendGroup == null
            ? _instance.friendGroup
            : (friendGroup
                as Mutation$updateFriendGroup$updateFriendGroup$friendGroup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<TRes>
      get friendGroup {
    final local$friendGroup = _instance.friendGroup;
    return CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup(
        local$friendGroup, (e) => call(friendGroup: e));
  }
}

class _CopyWithStubImpl$Mutation$updateFriendGroup$updateFriendGroup<TRes>
    implements CopyWith$Mutation$updateFriendGroup$updateFriendGroup<TRes> {
  _CopyWithStubImpl$Mutation$updateFriendGroup$updateFriendGroup(this._res);

  TRes _res;

  call({
    Mutation$updateFriendGroup$updateFriendGroup$friendGroup? friendGroup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<TRes>
      get friendGroup =>
          CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup
              .stub(_res);
}

class Mutation$updateFriendGroup$updateFriendGroup$friendGroup {
  Mutation$updateFriendGroup$updateFriendGroup$friendGroup({
    required this.id,
    required this.name,
    required this.totalCount,
    required this.friendUsers,
    required this.$__typename,
  });

  factory Mutation$updateFriendGroup$updateFriendGroup$friendGroup.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$totalCount = json['totalCount'];
    final l$friendUsers = json['friendUsers'];
    final l$$__typename = json['__typename'];
    return Mutation$updateFriendGroup$updateFriendGroup$friendGroup(
      id: (l$id as String),
      name: (l$name as String),
      totalCount: (l$totalCount as int),
      friendUsers: (l$friendUsers as List<dynamic>)
          .map((e) => Fragment$friendListItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int totalCount;

  final List<Fragment$friendListItemFragment> friendUsers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$friendUsers = friendUsers;
    _resultData['friendUsers'] = l$friendUsers.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$totalCount = totalCount;
    final l$friendUsers = friendUsers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$totalCount,
      Object.hashAll(l$friendUsers.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateFriendGroup$updateFriendGroup$friendGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
      return false;
    }
    final l$friendUsers = friendUsers;
    final lOther$friendUsers = other.friendUsers;
    if (l$friendUsers.length != lOther$friendUsers.length) {
      return false;
    }
    for (int i = 0; i < l$friendUsers.length; i++) {
      final l$friendUsers$entry = l$friendUsers[i];
      final lOther$friendUsers$entry = lOther$friendUsers[i];
      if (l$friendUsers$entry != lOther$friendUsers$entry) {
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

extension UtilityExtension$Mutation$updateFriendGroup$updateFriendGroup$friendGroup
    on Mutation$updateFriendGroup$updateFriendGroup$friendGroup {
  CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<
          Mutation$updateFriendGroup$updateFriendGroup$friendGroup>
      get copyWith =>
          CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<
    TRes> {
  factory CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup(
    Mutation$updateFriendGroup$updateFriendGroup$friendGroup instance,
    TRes Function(Mutation$updateFriendGroup$updateFriendGroup$friendGroup)
        then,
  ) = _CopyWithImpl$Mutation$updateFriendGroup$updateFriendGroup$friendGroup;

  factory CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateFriendGroup$updateFriendGroup$friendGroup;

  TRes call({
    String? id,
    String? name,
    int? totalCount,
    List<Fragment$friendListItemFragment>? friendUsers,
    String? $__typename,
  });
  TRes friendUsers(
      Iterable<Fragment$friendListItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$friendListItemFragment<
                      Fragment$friendListItemFragment>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<
        TRes>
    implements
        CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<
            TRes> {
  _CopyWithImpl$Mutation$updateFriendGroup$updateFriendGroup$friendGroup(
    this._instance,
    this._then,
  );

  final Mutation$updateFriendGroup$updateFriendGroup$friendGroup _instance;

  final TRes Function(Mutation$updateFriendGroup$updateFriendGroup$friendGroup)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? totalCount = _undefined,
    Object? friendUsers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateFriendGroup$updateFriendGroup$friendGroup(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        totalCount: totalCount == _undefined || totalCount == null
            ? _instance.totalCount
            : (totalCount as int),
        friendUsers: friendUsers == _undefined || friendUsers == null
            ? _instance.friendUsers
            : (friendUsers as List<Fragment$friendListItemFragment>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes friendUsers(
          Iterable<Fragment$friendListItemFragment> Function(
                  Iterable<
                      CopyWith$Fragment$friendListItemFragment<
                          Fragment$friendListItemFragment>>)
              _fn) =>
      call(
          friendUsers: _fn(_instance.friendUsers
              .map((e) => CopyWith$Fragment$friendListItemFragment(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<
        TRes>
    implements
        CopyWith$Mutation$updateFriendGroup$updateFriendGroup$friendGroup<
            TRes> {
  _CopyWithStubImpl$Mutation$updateFriendGroup$updateFriendGroup$friendGroup(
      this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    int? totalCount,
    List<Fragment$friendListItemFragment>? friendUsers,
    String? $__typename,
  }) =>
      _res;
  friendUsers(_fn) => _res;
}
