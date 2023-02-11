import '../../widgets/friend_list_item_fragment.graphql.dart';
import '../../widgets/user_profile_modal_fragment.graphql.dart';
import 'friend_group_edit_screen.graphql.dart';
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
    if (!(other is Variables$Query$friendGroupDetailScreenViewer) ||
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

  TRes _res;

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
    final l$$__typename = json['__typename'];
    return Query$friendGroupDetailScreenViewer(
      viewer: Query$friendGroupDetailScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendGroupDetailScreenViewer$viewer viewer;

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
    if (!(other is Query$friendGroupDetailScreenViewer) ||
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
  CopyWith$Query$friendGroupDetailScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$friendGroupDetailScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$friendGroupDetailScreenViewer<TRes>
    implements CopyWith$Query$friendGroupDetailScreenViewer<TRes> {
  _CopyWithStubImpl$Query$friendGroupDetailScreenViewer(this._res);

  TRes _res;

  call({
    Query$friendGroupDetailScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
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
              FragmentSpreadNode(
                name: NameNode(value: 'friendGroupEditScreenFragment'),
                directives: [],
              ),
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
                  FragmentSpreadNode(
                    name: NameNode(value: 'userProfileModalFragment'),
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
  fragmentDefinitionfriendGroupEditScreenFragment,
  fragmentDefinitionfriendListItemFragment,
  fragmentDefinitionuserProfileModalFragment,
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
          await this.query(options);
  graphql.ObservableQuery<Query$friendGroupDetailScreenViewer>
      watchQuery$friendGroupDetailScreenViewer(
              WatchOptions$Query$friendGroupDetailScreenViewer options) =>
          this.watchQuery(options);
  void writeQuery$friendGroupDetailScreenViewer({
    required Query$friendGroupDetailScreenViewer data,
    required Variables$Query$friendGroupDetailScreenViewer variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
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
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
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
  Query$friendGroupDetailScreenViewer$Widget({
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
    final l$$__typename = json['__typename'];
    return Query$friendGroupDetailScreenViewer$viewer(
      friendGroup:
          Query$friendGroupDetailScreenViewer$viewer$friendGroup.fromJson(
              (l$friendGroup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$friendGroupDetailScreenViewer$viewer$friendGroup friendGroup;

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
    if (!(other is Query$friendGroupDetailScreenViewer$viewer) ||
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

  TRes _res;

  call({
    Query$friendGroupDetailScreenViewer$viewer$friendGroup? friendGroup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup<TRes>
      get friendGroup =>
          CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup.stub(
              _res);
}

class Query$friendGroupDetailScreenViewer$viewer$friendGroup
    implements Fragment$friendGroupEditScreenFragment {
  Query$friendGroupDetailScreenViewer$viewer$friendGroup({
    required this.id,
    required this.name,
    required this.friendUsers,
    required this.$__typename,
    required this.totalCount,
  });

  factory Query$friendGroupDetailScreenViewer$viewer$friendGroup.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$friendUsers = json['friendUsers'];
    final l$$__typename = json['__typename'];
    final l$totalCount = json['totalCount'];
    return Query$friendGroupDetailScreenViewer$viewer$friendGroup(
      id: (l$id as String),
      name: (l$name as String),
      friendUsers: (l$friendUsers as List<dynamic>)
          .map((e) =>
              Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
      totalCount: (l$totalCount as int),
    );
  }

  final String id;

  final String name;

  final List<Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers>
      friendUsers;

  final String $__typename;

  final int totalCount;

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
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$friendUsers = friendUsers;
    final l$$__typename = $__typename;
    final l$totalCount = totalCount;
    return Object.hashAll([
      l$id,
      l$name,
      Object.hashAll(l$friendUsers.map((v) => v)),
      l$$__typename,
      l$totalCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$friendGroupDetailScreenViewer$viewer$friendGroup) ||
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
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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
    List<Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers>?
        friendUsers,
    String? $__typename,
    int? totalCount,
  });
  TRes friendUsers(
      Iterable<Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers> Function(
              Iterable<
                  CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers<
                      Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers>>)
          _fn);
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

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? friendUsers = _undefined,
    Object? $__typename = _undefined,
    Object? totalCount = _undefined,
  }) =>
      _then(Query$friendGroupDetailScreenViewer$viewer$friendGroup(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        friendUsers: friendUsers == _undefined || friendUsers == null
            ? _instance.friendUsers
            : (friendUsers as List<
                Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        totalCount: totalCount == _undefined || totalCount == null
            ? _instance.totalCount
            : (totalCount as int),
      ));
  TRes friendUsers(
          Iterable<Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers> Function(
                  Iterable<
                      CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers<
                          Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers>>)
              _fn) =>
      call(
          friendUsers: _fn(_instance.friendUsers.map((e) =>
              CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers(
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

  TRes _res;

  call({
    String? id,
    String? name,
    List<Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers>?
        friendUsers,
    String? $__typename,
    int? totalCount,
  }) =>
      _res;
  friendUsers(_fn) => _res;
}

class Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers
    implements
        Fragment$friendListItemFragment,
        Fragment$userProfileModalFragment {
  Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.isMuted,
    this.distanceKm,
    required this.$__typename,
    required this.screenId,
  });

  factory Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isMuted = json['isMuted'];
    final l$distanceKm = json['distanceKm'];
    final l$$__typename = json['__typename'];
    final l$screenId = json['screenId'];
    return Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isMuted: (l$isMuted as bool),
      distanceKm: (l$distanceKm as int?),
      $__typename: (l$$__typename as String),
      screenId: (l$screenId as String),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final bool isMuted;

  final int? distanceKm;

  final String $__typename;

  final String screenId;

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
    return Object.hashAll([
      l$id,
      l$nickname,
      l$avatarUrl,
      l$isMuted,
      l$distanceKm,
      l$$__typename,
      l$screenId,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers) ||
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
    return true;
  }
}

extension UtilityExtension$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers
    on Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers {
  CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers<
          Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers>
      get copyWith =>
          CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers<
    TRes> {
  factory CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers(
    Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers instance,
    TRes Function(
            Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers)
        then,
  ) = _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers;

  factory CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers.stub(
          TRes res) =
      _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    int? distanceKm,
    String? $__typename,
    String? screenId,
  });
}

class _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers<
        TRes>
    implements
        CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers<
            TRes> {
  _CopyWithImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers(
    this._instance,
    this._then,
  );

  final Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers
      _instance;

  final TRes Function(
      Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isMuted = _undefined,
    Object? distanceKm = _undefined,
    Object? $__typename = _undefined,
    Object? screenId = _undefined,
  }) =>
      _then(Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers(
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
      ));
}

class _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers<
        TRes>
    implements
        CopyWith$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers<
            TRes> {
  _CopyWithStubImpl$Query$friendGroupDetailScreenViewer$viewer$friendGroup$friendUsers(
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
  }) =>
      _res;
}
