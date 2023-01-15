import '../components/friend_list_item_fragment.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$friendGroupDetailScreenViewer {
  factory Variables$Query$friendGroupDetailScreenViewer(
          {required String friendGroupId}) =>
      Variables$Query$friendGroupDetailScreenViewer._({
        r'friendGroupId': friendGroupId,
      });

  Variables$Query$friendGroupDetailScreenViewer._(this._$data);

  factory Variables$Query$friendGroupDetailScreenViewer.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$friendGroupId = data['friendGroupId'];
    result$data['friendGroupId'] = (l$friendGroupId as String);
    return Variables$Query$friendGroupDetailScreenViewer._(result$data);
  }

  Map<String, dynamic> _$data;

  String get friendGroupId => (_$data['friendGroupId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$friendGroupId = friendGroupId;
    result$data['friendGroupId'] = l$friendGroupId;
    return result$data;
  }

  CopyWith$Variables$Query$friendGroupDetailScreenViewer<
          Variables$Query$friendGroupDetailScreenViewer>
      get copyWith => CopyWith$Variables$Query$friendGroupDetailScreenViewer(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$friendGroupDetailScreenViewer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$friendGroupId = friendGroupId;
    final lOther$friendGroupId = other.friendGroupId;
    if (l$friendGroupId != lOther$friendGroupId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$friendGroupId = friendGroupId;
    return Object.hashAll([l$friendGroupId]);
  }
}

abstract class CopyWith$Variables$Query$friendGroupDetailScreenViewer<TRes> {
  factory CopyWith$Variables$Query$friendGroupDetailScreenViewer(
    Variables$Query$friendGroupDetailScreenViewer instance,
    TRes Function(Variables$Query$friendGroupDetailScreenViewer) then,
  ) = _CopyWithImpl$Variables$Query$friendGroupDetailScreenViewer;

  factory CopyWith$Variables$Query$friendGroupDetailScreenViewer.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$friendGroupDetailScreenViewer;

  TRes call({String? friendGroupId});
}

class _CopyWithImpl$Variables$Query$friendGroupDetailScreenViewer<TRes>
    implements CopyWith$Variables$Query$friendGroupDetailScreenViewer<TRes> {
  _CopyWithImpl$Variables$Query$friendGroupDetailScreenViewer(
    this._instance,
    this._then,
  );

  final Variables$Query$friendGroupDetailScreenViewer _instance;

  final TRes Function(Variables$Query$friendGroupDetailScreenViewer) _then;

  static const _undefined = {};

  @override
  TRes call({Object? friendGroupId = _undefined}) =>
      _then(Variables$Query$friendGroupDetailScreenViewer._({
        ..._instance._$data,
        if (friendGroupId != _undefined && friendGroupId != null)
          'friendGroupId': (friendGroupId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$friendGroupDetailScreenViewer<TRes>
    implements CopyWith$Variables$Query$friendGroupDetailScreenViewer<TRes> {
  _CopyWithStubImpl$Variables$Query$friendGroupDetailScreenViewer(this._res);

  final TRes _res;

  @override
  call({String? friendGroupId}) => _res;
}

class Query$friendGroupDetailScreenViewer {
  Query$friendGroupDetailScreenViewer({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$friendGroupDetailScreenViewer.fromJson(
      Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$Typename = json['__typename'];
    return Query$friendGroupDetailScreenViewer(
      viewer: Query$friendGroupDetailScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Query$friendGroupDetailScreenViewer$viewer viewer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$viewer = viewer;
    resultData['viewer'] = l$viewer.toJson();
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$viewer = viewer;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$viewer,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$friendGroupDetailScreenViewer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$viewer = viewer;
    final lOther$viewer = other.viewer;
    if (l$viewer != lOther$viewer) {
      return false;
    }
    final l$$Typename = $__typename;
    final lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$friendGroupDetailScreenViewer
    on Query$friendGroupDetailScreenViewer {
  CopyWith$Query$friendGroupDetailScreenViewer<
          Query$friendGroupDetailScreenViewer>
      get copyWith => CopyWith$Query$friendGroupDetailScreenViewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupDetailScreenViewer<TRes> {
  factory CopyWith$Query$friendGroupDetailScreenViewer(
    Query$friendGroupDetailScreenViewer instance,
    TRes Function(Query$friendGroupDetailScreenViewer) then,
  ) = _CopyWithImpl$Query$friendGroupDetailScreenViewer;

  factory CopyWith$Query$friendGroupDetailScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendGroupDetailScreenViewer;

  TRes call({
    Query$friendGroupDetailScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$friendGroupDetailScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$friendGroupDetailScreenViewer<TRes>
    implements CopyWith$Query$friendGroupDetailScreenViewer<TRes> {
  _CopyWithImpl$Query$friendGroupDetailScreenViewer(
    this._instance,
    this._then,
  );

  final Query$friendGroupDetailScreenViewer _instance;

  final TRes Function(Query$friendGroupDetailScreenViewer) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupDetailScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$friendGroupDetailScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Query$friendGroupDetailScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$friendGroupDetailScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupDetailScreenViewer<TRes>
    implements CopyWith$Query$friendGroupDetailScreenViewer<TRes> {
  _CopyWithStubImpl$Query$friendGroupDetailScreenViewer(this._res);

  final TRes _res;

  @override
  call({
    Query$friendGroupDetailScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Query$friendGroupDetailScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$friendGroupDetailScreenViewer$viewer.stub(_res);
}

const documentNodeQueryfriendGroupDetailScreenViewer =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'friendGroupDetailScreenViewer'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'friendGroupId')),
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
        name: NameNode(value: 'viewer'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'friendGroup'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'friendGroupId'),
                value: VariableNode(name: NameNode(value: 'friendGroupId')),
              )
            ],
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
Query$friendGroupDetailScreenViewer
    _parserFn$Query$friendGroupDetailScreenViewer(Map<String, dynamic> data) =>
        Query$friendGroupDetailScreenViewer.fromJson(data);

class Options$Query$friendGroupDetailScreenViewer
    extends graphql.QueryOptions<Query$friendGroupDetailScreenViewer> {
  Options$Query$friendGroupDetailScreenViewer({
    String? operationName,
    required Variables$Query$friendGroupDetailScreenViewer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryfriendGroupDetailScreenViewer,
          parserFn: _parserFn$Query$friendGroupDetailScreenViewer,
        );
}

class WatchOptions$Query$friendGroupDetailScreenViewer
    extends graphql.WatchQueryOptions<Query$friendGroupDetailScreenViewer> {
  WatchOptions$Query$friendGroupDetailScreenViewer({
    String? operationName,
    required Variables$Query$friendGroupDetailScreenViewer variables,
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
          document: documentNodeQueryfriendGroupDetailScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$friendGroupDetailScreenViewer,
        );
}

class FetchMoreOptions$Query$friendGroupDetailScreenViewer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$friendGroupDetailScreenViewer({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$friendGroupDetailScreenViewer variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryfriendGroupDetailScreenViewer,
        );
}

extension ClientExtension$Query$friendGroupDetailScreenViewer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$friendGroupDetailScreenViewer>>
      query$friendGroupDetailScreenViewer(
              Options$Query$friendGroupDetailScreenViewer options) async =>
          await query(options);
  graphql.ObservableQuery<Query$friendGroupDetailScreenViewer>
      watchQuery$friendGroupDetailScreenViewer(
              WatchOptions$Query$friendGroupDetailScreenViewer options) =>
          watchQuery(options);
  void writeQuery$friendGroupDetailScreenViewer({
    required Query$friendGroupDetailScreenViewer data,
    required Variables$Query$friendGroupDetailScreenViewer variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation: const graphql.Operation(
              document: documentNodeQueryfriendGroupDetailScreenViewer),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$friendGroupDetailScreenViewer? readQuery$friendGroupDetailScreenViewer({
    required Variables$Query$friendGroupDetailScreenViewer variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation: const graphql.Operation(
            document: documentNodeQueryfriendGroupDetailScreenViewer),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$friendGroupDetailScreenViewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$friendGroupDetailScreenViewer>
    useQuery$friendGroupDetailScreenViewer(
            Options$Query$friendGroupDetailScreenViewer options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$friendGroupDetailScreenViewer>
    useWatchQuery$friendGroupDetailScreenViewer(
            WatchOptions$Query$friendGroupDetailScreenViewer options) =>
        graphql_flutter.useWatchQuery(options);

class Query$friendGroupDetailScreenViewer$Widget
    extends graphql_flutter.Query<Query$friendGroupDetailScreenViewer> {
  const Query$friendGroupDetailScreenViewer$Widget({
    widgets.Key? key,
    required Options$Query$friendGroupDetailScreenViewer options,
    required graphql_flutter.QueryBuilder<Query$friendGroupDetailScreenViewer>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$friendGroupDetailScreenViewer$viewer {
  Query$friendGroupDetailScreenViewer$viewer({
    required this.friendGroup,
    required this.$__typename,
  });

  factory Query$friendGroupDetailScreenViewer$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$friendGroup = json['friendGroup'];
    final l$$Typename = json['__typename'];
    return Query$friendGroupDetailScreenViewer$viewer(
      friendGroup:
          Query$friendGroupDetailScreenViewer$viewer$friendGroup.fromJson(
              (l$friendGroup as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Query$friendGroupDetailScreenViewer$viewer$friendGroup friendGroup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$friendGroup = friendGroup;
    resultData['friendGroup'] = l$friendGroup.toJson();
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$friendGroup = friendGroup;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$friendGroup,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$friendGroupDetailScreenViewer$viewer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$friendGroup = friendGroup;
    final lOther$friendGroup = other.friendGroup;
    if (l$friendGroup != lOther$friendGroup) {
      return false;
    }
    final l$$Typename = $__typename;
    final lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$friendGroupDetailScreenViewer$viewer
    on Query$friendGroupDetailScreenViewer$viewer {
  CopyWith$Query$friendGroupDetailScreenViewer$viewer<
          Query$friendGroupDetailScreenViewer$viewer>
      get copyWith => CopyWith$Query$friendGroupDetailScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupDetailScreenViewer$viewer<TRes> {
  factory CopyWith$Query$friendGroupDetailScreenViewer$viewer(
    Query$friendGroupDetailScreenViewer$viewer instance,
    TRes Function(Query$friendGroupDetailScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer;

  factory CopyWith$Query$friendGroupDetailScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer;

  TRes call({
    Query$friendGroupDetailScreenViewer$viewer$friendGroup? friendGroup,
    String? $__typename,
  });
  CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup<TRes>
      get friendGroup;
}

class _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendGroupDetailScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$friendGroupDetailScreenViewer$viewer _instance;

  final TRes Function(Query$friendGroupDetailScreenViewer$viewer) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? friendGroup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupDetailScreenViewer$viewer(
        friendGroup: friendGroup == _undefined || friendGroup == null
            ? _instance.friendGroup
            : (friendGroup
                as Query$friendGroupDetailScreenViewer$viewer$friendGroup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup<TRes>
      get friendGroup {
    final local$friendGroup = _instance.friendGroup;
    return CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup(
        local$friendGroup, (e) => call(friendGroup: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer<TRes>
    implements CopyWith$Query$friendGroupDetailScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer(this._res);

  final TRes _res;

  @override
  call({
    Query$friendGroupDetailScreenViewer$viewer$friendGroup? friendGroup,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup<TRes>
      get friendGroup =>
          CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup.stub(
              _res);
}

class Query$friendGroupDetailScreenViewer$viewer$friendGroup {
  Query$friendGroupDetailScreenViewer$viewer$friendGroup({
    required this.id,
    required this.name,
    required this.totalCount,
    required this.friendUsers,
    required this.$__typename,
  });

  factory Query$friendGroupDetailScreenViewer$viewer$friendGroup.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$totalCount = json['totalCount'];
    final l$friendUsers = json['friendUsers'];
    final l$$Typename = json['__typename'];
    return Query$friendGroupDetailScreenViewer$viewer$friendGroup(
      id: (l$id as String),
      name: (l$name as String),
      totalCount: (l$totalCount as int),
      friendUsers: (l$friendUsers as List<dynamic>)
          .map((e) => Fragment$friendListItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$Typename as String),
    );
  }

  final String id;

  final String name;

  final int totalCount;

  final List<Fragment$friendListItemFragment> friendUsers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$name = name;
    resultData['name'] = l$name;
    final l$totalCount = totalCount;
    resultData['totalCount'] = l$totalCount;
    final l$friendUsers = friendUsers;
    resultData['friendUsers'] = l$friendUsers.map((e) => e.toJson()).toList();
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$totalCount = totalCount;
    final l$friendUsers = friendUsers;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$totalCount,
      Object.hashAll(l$friendUsers.map((v) => v)),
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$friendGroupDetailScreenViewer$viewer$friendGroup ||
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
    final l$$Typename = $__typename;
    final lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$friendGroupDetailScreenViewer$viewer$friendGroup
    on Query$friendGroupDetailScreenViewer$viewer$friendGroup {
  CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup<
          Query$friendGroupDetailScreenViewer$viewer$friendGroup>
      get copyWith =>
          CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup<
    TRes> {
  factory CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup(
    Query$friendGroupDetailScreenViewer$viewer$friendGroup instance,
    TRes Function(Query$friendGroupDetailScreenViewer$viewer$friendGroup) then,
  ) = _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup;

  factory CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup;

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
          fn);
}

class _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup<TRes>
    implements
        CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup<TRes> {
  _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup(
    this._instance,
    this._then,
  );

  final Query$friendGroupDetailScreenViewer$viewer$friendGroup _instance;

  final TRes Function(Query$friendGroupDetailScreenViewer$viewer$friendGroup)
      _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? totalCount = _undefined,
    Object? friendUsers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$friendGroupDetailScreenViewer$viewer$friendGroup(
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
  @override
  TRes friendUsers(
          Iterable<Fragment$friendListItemFragment> Function(
                  Iterable<
                      CopyWith$Fragment$friendListItemFragment<
                          Fragment$friendListItemFragment>>)
              fn) =>
      call(
          friendUsers: fn(_instance.friendUsers
              .map((e) => CopyWith$Fragment$friendListItemFragment(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup<
        TRes>
    implements
        CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup<TRes> {
  _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup(
      this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    int? totalCount,
    List<Fragment$friendListItemFragment>? friendUsers,
    String? $__typename,
  }) =>
      _res;
  @override
  friendUsers(fn) => _res;
}
