import '../../widgets/friend_list_item_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'user_profile_screen.graphql.dart';

class Variables$Query$userFriendsScreenUserFriends {
  factory Variables$Query$userFriendsScreenUserFriends({
    required String userId,
    String? after,
  }) =>
      Variables$Query$userFriendsScreenUserFriends._({
        r'userId': userId,
        if (after != null) r'after': after,
      });

  Variables$Query$userFriendsScreenUserFriends._(this._$data);

  factory Variables$Query$userFriendsScreenUserFriends.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$userFriendsScreenUserFriends._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  String? get after => (_$data['after'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    return result$data;
  }

  CopyWith$Variables$Query$userFriendsScreenUserFriends<
          Variables$Query$userFriendsScreenUserFriends>
      get copyWith => CopyWith$Variables$Query$userFriendsScreenUserFriends(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$userFriendsScreenUserFriends) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$after = after;
    return Object.hashAll([
      l$userId,
      _$data.containsKey('after') ? l$after : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$userFriendsScreenUserFriends<TRes> {
  factory CopyWith$Variables$Query$userFriendsScreenUserFriends(
    Variables$Query$userFriendsScreenUserFriends instance,
    TRes Function(Variables$Query$userFriendsScreenUserFriends) then,
  ) = _CopyWithImpl$Variables$Query$userFriendsScreenUserFriends;

  factory CopyWith$Variables$Query$userFriendsScreenUserFriends.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$userFriendsScreenUserFriends;

  TRes call({
    String? userId,
    String? after,
  });
}

class _CopyWithImpl$Variables$Query$userFriendsScreenUserFriends<TRes>
    implements CopyWith$Variables$Query$userFriendsScreenUserFriends<TRes> {
  _CopyWithImpl$Variables$Query$userFriendsScreenUserFriends(
    this._instance,
    this._then,
  );

  final Variables$Query$userFriendsScreenUserFriends _instance;

  final TRes Function(Variables$Query$userFriendsScreenUserFriends) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? after = _undefined,
  }) =>
      _then(Variables$Query$userFriendsScreenUserFriends._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
        if (after != _undefined) 'after': (after as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$userFriendsScreenUserFriends<TRes>
    implements CopyWith$Variables$Query$userFriendsScreenUserFriends<TRes> {
  _CopyWithStubImpl$Variables$Query$userFriendsScreenUserFriends(this._res);

  TRes _res;

  call({
    String? userId,
    String? after,
  }) =>
      _res;
}

class Query$userFriendsScreenUserFriends {
  Query$userFriendsScreenUserFriends({
    required this.userFriends,
    this.$__typename = 'Query',
  });

  factory Query$userFriendsScreenUserFriends.fromJson(
      Map<String, dynamic> json) {
    final l$userFriends = json['userFriends'];
    final l$$__typename = json['__typename'];
    return Query$userFriendsScreenUserFriends(
      userFriends: Query$userFriendsScreenUserFriends$userFriends.fromJson(
          (l$userFriends as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$userFriendsScreenUserFriends$userFriends userFriends;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userFriends = userFriends;
    _resultData['userFriends'] = l$userFriends.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userFriends = userFriends;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userFriends,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$userFriendsScreenUserFriends) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userFriends = userFriends;
    final lOther$userFriends = other.userFriends;
    if (l$userFriends != lOther$userFriends) {
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

extension UtilityExtension$Query$userFriendsScreenUserFriends
    on Query$userFriendsScreenUserFriends {
  CopyWith$Query$userFriendsScreenUserFriends<
          Query$userFriendsScreenUserFriends>
      get copyWith => CopyWith$Query$userFriendsScreenUserFriends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$userFriendsScreenUserFriends<TRes> {
  factory CopyWith$Query$userFriendsScreenUserFriends(
    Query$userFriendsScreenUserFriends instance,
    TRes Function(Query$userFriendsScreenUserFriends) then,
  ) = _CopyWithImpl$Query$userFriendsScreenUserFriends;

  factory CopyWith$Query$userFriendsScreenUserFriends.stub(TRes res) =
      _CopyWithStubImpl$Query$userFriendsScreenUserFriends;

  TRes call({
    Query$userFriendsScreenUserFriends$userFriends? userFriends,
    String? $__typename,
  });
  CopyWith$Query$userFriendsScreenUserFriends$userFriends<TRes> get userFriends;
}

class _CopyWithImpl$Query$userFriendsScreenUserFriends<TRes>
    implements CopyWith$Query$userFriendsScreenUserFriends<TRes> {
  _CopyWithImpl$Query$userFriendsScreenUserFriends(
    this._instance,
    this._then,
  );

  final Query$userFriendsScreenUserFriends _instance;

  final TRes Function(Query$userFriendsScreenUserFriends) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userFriends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$userFriendsScreenUserFriends(
        userFriends: userFriends == _undefined || userFriends == null
            ? _instance.userFriends
            : (userFriends as Query$userFriendsScreenUserFriends$userFriends),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$userFriendsScreenUserFriends$userFriends<TRes>
      get userFriends {
    final local$userFriends = _instance.userFriends;
    return CopyWith$Query$userFriendsScreenUserFriends$userFriends(
        local$userFriends, (e) => call(userFriends: e));
  }
}

class _CopyWithStubImpl$Query$userFriendsScreenUserFriends<TRes>
    implements CopyWith$Query$userFriendsScreenUserFriends<TRes> {
  _CopyWithStubImpl$Query$userFriendsScreenUserFriends(this._res);

  TRes _res;

  call({
    Query$userFriendsScreenUserFriends$userFriends? userFriends,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$userFriendsScreenUserFriends$userFriends<TRes>
      get userFriends =>
          CopyWith$Query$userFriendsScreenUserFriends$userFriends.stub(_res);
}

const documentNodeQueryuserFriendsScreenUserFriends =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'userFriendsScreenUserFriends'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'Cursor'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'userFriends'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
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
                    name: NameNode(value: 'userProfileScreenFragment'),
                    directives: [],
                  ),
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
  fragmentDefinitionuserProfileScreenFragment,
  fragmentDefinitionfriendListItemFragment,
]);
Query$userFriendsScreenUserFriends _parserFn$Query$userFriendsScreenUserFriends(
        Map<String, dynamic> data) =>
    Query$userFriendsScreenUserFriends.fromJson(data);
typedef OnQueryComplete$Query$userFriendsScreenUserFriends = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$userFriendsScreenUserFriends?,
);

class Options$Query$userFriendsScreenUserFriends
    extends graphql.QueryOptions<Query$userFriendsScreenUserFriends> {
  Options$Query$userFriendsScreenUserFriends({
    String? operationName,
    required Variables$Query$userFriendsScreenUserFriends variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$userFriendsScreenUserFriends? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$userFriendsScreenUserFriends? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
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
                        : _parserFn$Query$userFriendsScreenUserFriends(data),
                  ),
          onError: onError,
          document: documentNodeQueryuserFriendsScreenUserFriends,
          parserFn: _parserFn$Query$userFriendsScreenUserFriends,
        );

  final OnQueryComplete$Query$userFriendsScreenUserFriends?
      onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$userFriendsScreenUserFriends
    extends graphql.WatchQueryOptions<Query$userFriendsScreenUserFriends> {
  WatchOptions$Query$userFriendsScreenUserFriends({
    String? operationName,
    required Variables$Query$userFriendsScreenUserFriends variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$userFriendsScreenUserFriends? typedOptimisticResult,
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
          document: documentNodeQueryuserFriendsScreenUserFriends,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$userFriendsScreenUserFriends,
        );
}

class FetchMoreOptions$Query$userFriendsScreenUserFriends
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$userFriendsScreenUserFriends({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$userFriendsScreenUserFriends variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryuserFriendsScreenUserFriends,
        );
}

extension ClientExtension$Query$userFriendsScreenUserFriends
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$userFriendsScreenUserFriends>>
      query$userFriendsScreenUserFriends(
              Options$Query$userFriendsScreenUserFriends options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$userFriendsScreenUserFriends>
      watchQuery$userFriendsScreenUserFriends(
              WatchOptions$Query$userFriendsScreenUserFriends options) =>
          this.watchQuery(options);
  void writeQuery$userFriendsScreenUserFriends({
    required Query$userFriendsScreenUserFriends data,
    required Variables$Query$userFriendsScreenUserFriends variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryuserFriendsScreenUserFriends),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$userFriendsScreenUserFriends? readQuery$userFriendsScreenUserFriends({
    required Variables$Query$userFriendsScreenUserFriends variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryuserFriendsScreenUserFriends),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$userFriendsScreenUserFriends.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$userFriendsScreenUserFriends>
    useQuery$userFriendsScreenUserFriends(
            Options$Query$userFriendsScreenUserFriends options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$userFriendsScreenUserFriends>
    useWatchQuery$userFriendsScreenUserFriends(
            WatchOptions$Query$userFriendsScreenUserFriends options) =>
        graphql_flutter.useWatchQuery(options);

class Query$userFriendsScreenUserFriends$Widget
    extends graphql_flutter.Query<Query$userFriendsScreenUserFriends> {
  Query$userFriendsScreenUserFriends$Widget({
    widgets.Key? key,
    required Options$Query$userFriendsScreenUserFriends options,
    required graphql_flutter.QueryBuilder<Query$userFriendsScreenUserFriends>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$userFriendsScreenUserFriends$userFriends {
  Query$userFriendsScreenUserFriends$userFriends({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'UserConnection',
  });

  factory Query$userFriendsScreenUserFriends$userFriends.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$userFriendsScreenUserFriends$userFriends(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$userFriendsScreenUserFriends$userFriends$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      pageInfo:
          Query$userFriendsScreenUserFriends$userFriends$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$userFriendsScreenUserFriends$userFriends$edges> edges;

  final Query$userFriendsScreenUserFriends$userFriends$pageInfo pageInfo;

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
    if (!(other is Query$userFriendsScreenUserFriends$userFriends) ||
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

extension UtilityExtension$Query$userFriendsScreenUserFriends$userFriends
    on Query$userFriendsScreenUserFriends$userFriends {
  CopyWith$Query$userFriendsScreenUserFriends$userFriends<
          Query$userFriendsScreenUserFriends$userFriends>
      get copyWith => CopyWith$Query$userFriendsScreenUserFriends$userFriends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$userFriendsScreenUserFriends$userFriends<TRes> {
  factory CopyWith$Query$userFriendsScreenUserFriends$userFriends(
    Query$userFriendsScreenUserFriends$userFriends instance,
    TRes Function(Query$userFriendsScreenUserFriends$userFriends) then,
  ) = _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends;

  factory CopyWith$Query$userFriendsScreenUserFriends$userFriends.stub(
          TRes res) =
      _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends;

  TRes call({
    List<Query$userFriendsScreenUserFriends$userFriends$edges>? edges,
    Query$userFriendsScreenUserFriends$userFriends$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$userFriendsScreenUserFriends$userFriends$edges> Function(
              Iterable<
                  CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges<
                      Query$userFriendsScreenUserFriends$userFriends$edges>>)
          _fn);
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo<TRes>
      get pageInfo;
}

class _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends<TRes>
    implements CopyWith$Query$userFriendsScreenUserFriends$userFriends<TRes> {
  _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends(
    this._instance,
    this._then,
  );

  final Query$userFriendsScreenUserFriends$userFriends _instance;

  final TRes Function(Query$userFriendsScreenUserFriends$userFriends) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$userFriendsScreenUserFriends$userFriends(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges
                as List<Query$userFriendsScreenUserFriends$userFriends$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo
                as Query$userFriendsScreenUserFriends$userFriends$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes edges(
          Iterable<Query$userFriendsScreenUserFriends$userFriends$edges> Function(
                  Iterable<
                      CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges<
                          Query$userFriendsScreenUserFriends$userFriends$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) =>
              CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo<TRes>
      get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends<TRes>
    implements CopyWith$Query$userFriendsScreenUserFriends$userFriends<TRes> {
  _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends(this._res);

  TRes _res;

  call({
    List<Query$userFriendsScreenUserFriends$userFriends$edges>? edges,
    Query$userFriendsScreenUserFriends$userFriends$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;
  edges(_fn) => _res;
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo<TRes>
      get pageInfo =>
          CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo.stub(
              _res);
}

class Query$userFriendsScreenUserFriends$userFriends$edges {
  Query$userFriendsScreenUserFriends$userFriends$edges({
    required this.node,
    this.$__typename = 'UserEdge',
  });

  factory Query$userFriendsScreenUserFriends$userFriends$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$userFriendsScreenUserFriends$userFriends$edges(
      node: Query$userFriendsScreenUserFriends$userFriends$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$userFriendsScreenUserFriends$userFriends$edges$node node;

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
    if (!(other is Query$userFriendsScreenUserFriends$userFriends$edges) ||
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

extension UtilityExtension$Query$userFriendsScreenUserFriends$userFriends$edges
    on Query$userFriendsScreenUserFriends$userFriends$edges {
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges<
          Query$userFriendsScreenUserFriends$userFriends$edges>
      get copyWith =>
          CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges<
    TRes> {
  factory CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges(
    Query$userFriendsScreenUserFriends$userFriends$edges instance,
    TRes Function(Query$userFriendsScreenUserFriends$userFriends$edges) then,
  ) = _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$edges;

  factory CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$edges;

  TRes call({
    Query$userFriendsScreenUserFriends$userFriends$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$edges<TRes>
    implements
        CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges<TRes> {
  _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$edges(
    this._instance,
    this._then,
  );

  final Query$userFriendsScreenUserFriends$userFriends$edges _instance;

  final TRes Function(Query$userFriendsScreenUserFriends$userFriends$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$userFriendsScreenUserFriends$userFriends$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node
                as Query$userFriendsScreenUserFriends$userFriends$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$edges<
        TRes>
    implements
        CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges<TRes> {
  _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$edges(
      this._res);

  TRes _res;

  call({
    Query$userFriendsScreenUserFriends$userFriends$edges$node? node,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node<TRes>
      get node =>
          CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node
              .stub(_res);
}

class Query$userFriendsScreenUserFriends$userFriends$edges$node
    implements
        Fragment$userProfileScreenFragment,
        Fragment$friendListItemFragment {
  Query$userFriendsScreenUserFriends$userFriends$edges$node({
    required this.id,
    required this.screenId,
    required this.nickname,
    required this.avatarUrl,
    required this.isRequestingFriendship,
    required this.isFriend,
    required this.isMuted,
    required this.isBlocked,
    this.$__typename = 'User',
    this.distanceKm,
  });

  factory Query$userFriendsScreenUserFriends$userFriends$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$screenId = json['screenId'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isRequestingFriendship = json['isRequestingFriendship'];
    final l$isFriend = json['isFriend'];
    final l$isMuted = json['isMuted'];
    final l$isBlocked = json['isBlocked'];
    final l$$__typename = json['__typename'];
    final l$distanceKm = json['distanceKm'];
    return Query$userFriendsScreenUserFriends$userFriends$edges$node(
      id: (l$id as String),
      screenId: (l$screenId as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isRequestingFriendship: (l$isRequestingFriendship as bool),
      isFriend: (l$isFriend as bool),
      isMuted: (l$isMuted as bool),
      isBlocked: (l$isBlocked as bool),
      $__typename: (l$$__typename as String),
      distanceKm: (l$distanceKm as int?),
    );
  }

  final String id;

  final String screenId;

  final String nickname;

  final String avatarUrl;

  final bool isRequestingFriendship;

  final bool isFriend;

  final bool isMuted;

  final bool isBlocked;

  final String $__typename;

  final int? distanceKm;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$screenId = screenId;
    _resultData['screenId'] = l$screenId;
    final l$nickname = nickname;
    _resultData['nickname'] = l$nickname;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$isRequestingFriendship = isRequestingFriendship;
    _resultData['isRequestingFriendship'] = l$isRequestingFriendship;
    final l$isFriend = isFriend;
    _resultData['isFriend'] = l$isFriend;
    final l$isMuted = isMuted;
    _resultData['isMuted'] = l$isMuted;
    final l$isBlocked = isBlocked;
    _resultData['isBlocked'] = l$isBlocked;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$distanceKm = distanceKm;
    _resultData['distanceKm'] = l$distanceKm;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$screenId = screenId;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$isRequestingFriendship = isRequestingFriendship;
    final l$isFriend = isFriend;
    final l$isMuted = isMuted;
    final l$isBlocked = isBlocked;
    final l$$__typename = $__typename;
    final l$distanceKm = distanceKm;
    return Object.hashAll([
      l$id,
      l$screenId,
      l$nickname,
      l$avatarUrl,
      l$isRequestingFriendship,
      l$isFriend,
      l$isMuted,
      l$isBlocked,
      l$$__typename,
      l$distanceKm,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$userFriendsScreenUserFriends$userFriends$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$screenId = screenId;
    final lOther$screenId = other.screenId;
    if (l$screenId != lOther$screenId) {
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
    final l$isMuted = isMuted;
    final lOther$isMuted = other.isMuted;
    if (l$isMuted != lOther$isMuted) {
      return false;
    }
    final l$isBlocked = isBlocked;
    final lOther$isBlocked = other.isBlocked;
    if (l$isBlocked != lOther$isBlocked) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$distanceKm = distanceKm;
    final lOther$distanceKm = other.distanceKm;
    if (l$distanceKm != lOther$distanceKm) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$userFriendsScreenUserFriends$userFriends$edges$node
    on Query$userFriendsScreenUserFriends$userFriends$edges$node {
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node<
          Query$userFriendsScreenUserFriends$userFriends$edges$node>
      get copyWith =>
          CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node<
    TRes> {
  factory CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node(
    Query$userFriendsScreenUserFriends$userFriends$edges$node instance,
    TRes Function(Query$userFriendsScreenUserFriends$userFriends$edges$node)
        then,
  ) = _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$edges$node;

  factory CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$edges$node;

  TRes call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    bool? isRequestingFriendship,
    bool? isFriend,
    bool? isMuted,
    bool? isBlocked,
    String? $__typename,
    int? distanceKm,
  });
}

class _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$edges$node<
        TRes>
    implements
        CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node<
            TRes> {
  _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$edges$node(
    this._instance,
    this._then,
  );

  final Query$userFriendsScreenUserFriends$userFriends$edges$node _instance;

  final TRes Function(Query$userFriendsScreenUserFriends$userFriends$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? screenId = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isRequestingFriendship = _undefined,
    Object? isFriend = _undefined,
    Object? isMuted = _undefined,
    Object? isBlocked = _undefined,
    Object? $__typename = _undefined,
    Object? distanceKm = _undefined,
  }) =>
      _then(Query$userFriendsScreenUserFriends$userFriends$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        screenId: screenId == _undefined || screenId == null
            ? _instance.screenId
            : (screenId as String),
        nickname: nickname == _undefined || nickname == null
            ? _instance.nickname
            : (nickname as String),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        isRequestingFriendship: isRequestingFriendship == _undefined ||
                isRequestingFriendship == null
            ? _instance.isRequestingFriendship
            : (isRequestingFriendship as bool),
        isFriend: isFriend == _undefined || isFriend == null
            ? _instance.isFriend
            : (isFriend as bool),
        isMuted: isMuted == _undefined || isMuted == null
            ? _instance.isMuted
            : (isMuted as bool),
        isBlocked: isBlocked == _undefined || isBlocked == null
            ? _instance.isBlocked
            : (isBlocked as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        distanceKm: distanceKm == _undefined
            ? _instance.distanceKm
            : (distanceKm as int?),
      ));
}

class _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$edges$node<
        TRes>
    implements
        CopyWith$Query$userFriendsScreenUserFriends$userFriends$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    bool? isRequestingFriendship,
    bool? isFriend,
    bool? isMuted,
    bool? isBlocked,
    String? $__typename,
    int? distanceKm,
  }) =>
      _res;
}

class Query$userFriendsScreenUserFriends$userFriends$pageInfo {
  Query$userFriendsScreenUserFriends$userFriends$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$userFriendsScreenUserFriends$userFriends$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$userFriendsScreenUserFriends$userFriends$pageInfo(
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
    if (!(other is Query$userFriendsScreenUserFriends$userFriends$pageInfo) ||
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

extension UtilityExtension$Query$userFriendsScreenUserFriends$userFriends$pageInfo
    on Query$userFriendsScreenUserFriends$userFriends$pageInfo {
  CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo<
          Query$userFriendsScreenUserFriends$userFriends$pageInfo>
      get copyWith =>
          CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo<
    TRes> {
  factory CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo(
    Query$userFriendsScreenUserFriends$userFriends$pageInfo instance,
    TRes Function(Query$userFriendsScreenUserFriends$userFriends$pageInfo) then,
  ) = _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$pageInfo;

  factory CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$pageInfo;

  TRes call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$pageInfo<
        TRes>
    implements
        CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo<TRes> {
  _CopyWithImpl$Query$userFriendsScreenUserFriends$userFriends$pageInfo(
    this._instance,
    this._then,
  );

  final Query$userFriendsScreenUserFriends$userFriends$pageInfo _instance;

  final TRes Function(Query$userFriendsScreenUserFriends$userFriends$pageInfo)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$userFriendsScreenUserFriends$userFriends$pageInfo(
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

class _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$pageInfo<
        TRes>
    implements
        CopyWith$Query$userFriendsScreenUserFriends$userFriends$pageInfo<TRes> {
  _CopyWithStubImpl$Query$userFriendsScreenUserFriends$userFriends$pageInfo(
      this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    String? endCursor,
    String? $__typename,
  }) =>
      _res;
}
