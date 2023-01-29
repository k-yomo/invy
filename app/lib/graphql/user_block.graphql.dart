import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$blockUser {
  factory Variables$Mutation$blockUser({required String userId}) =>
      Variables$Mutation$blockUser._({
        r'userId': userId,
      });

  Variables$Mutation$blockUser._(this._$data);

  factory Variables$Mutation$blockUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Mutation$blockUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Mutation$blockUser<Variables$Mutation$blockUser>
      get copyWith => CopyWith$Variables$Mutation$blockUser(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$blockUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

abstract class CopyWith$Variables$Mutation$blockUser<TRes> {
  factory CopyWith$Variables$Mutation$blockUser(
    Variables$Mutation$blockUser instance,
    TRes Function(Variables$Mutation$blockUser) then,
  ) = _CopyWithImpl$Variables$Mutation$blockUser;

  factory CopyWith$Variables$Mutation$blockUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$blockUser;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Mutation$blockUser<TRes>
    implements CopyWith$Variables$Mutation$blockUser<TRes> {
  _CopyWithImpl$Variables$Mutation$blockUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$blockUser _instance;

  final TRes Function(Variables$Mutation$blockUser) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Mutation$blockUser._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$blockUser<TRes>
    implements CopyWith$Variables$Mutation$blockUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$blockUser(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Mutation$blockUser {
  Mutation$blockUser({
    required this.blockUser,
    required this.$__typename,
  });

  factory Mutation$blockUser.fromJson(Map<String, dynamic> json) {
    final l$blockUser = json['blockUser'];
    final l$$__typename = json['__typename'];
    return Mutation$blockUser(
      blockUser: Mutation$blockUser$blockUser.fromJson(
          (l$blockUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$blockUser$blockUser blockUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$blockUser = blockUser;
    _resultData['blockUser'] = l$blockUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$blockUser = blockUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$blockUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$blockUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$blockUser = blockUser;
    final lOther$blockUser = other.blockUser;
    if (l$blockUser != lOther$blockUser) {
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

extension UtilityExtension$Mutation$blockUser on Mutation$blockUser {
  CopyWith$Mutation$blockUser<Mutation$blockUser> get copyWith =>
      CopyWith$Mutation$blockUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$blockUser<TRes> {
  factory CopyWith$Mutation$blockUser(
    Mutation$blockUser instance,
    TRes Function(Mutation$blockUser) then,
  ) = _CopyWithImpl$Mutation$blockUser;

  factory CopyWith$Mutation$blockUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$blockUser;

  TRes call({
    Mutation$blockUser$blockUser? blockUser,
    String? $__typename,
  });
  CopyWith$Mutation$blockUser$blockUser<TRes> get blockUser;
}

class _CopyWithImpl$Mutation$blockUser<TRes>
    implements CopyWith$Mutation$blockUser<TRes> {
  _CopyWithImpl$Mutation$blockUser(
    this._instance,
    this._then,
  );

  final Mutation$blockUser _instance;

  final TRes Function(Mutation$blockUser) _then;

  static const _undefined = {};

  TRes call({
    Object? blockUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$blockUser(
        blockUser: blockUser == _undefined || blockUser == null
            ? _instance.blockUser
            : (blockUser as Mutation$blockUser$blockUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$blockUser$blockUser<TRes> get blockUser {
    final local$blockUser = _instance.blockUser;
    return CopyWith$Mutation$blockUser$blockUser(
        local$blockUser, (e) => call(blockUser: e));
  }
}

class _CopyWithStubImpl$Mutation$blockUser<TRes>
    implements CopyWith$Mutation$blockUser<TRes> {
  _CopyWithStubImpl$Mutation$blockUser(this._res);

  TRes _res;

  call({
    Mutation$blockUser$blockUser? blockUser,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$blockUser$blockUser<TRes> get blockUser =>
      CopyWith$Mutation$blockUser$blockUser.stub(_res);
}

const documentNodeMutationblockUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'blockUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
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
        name: NameNode(value: 'blockUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'blockedUserId'),
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
Mutation$blockUser _parserFn$Mutation$blockUser(Map<String, dynamic> data) =>
    Mutation$blockUser.fromJson(data);
typedef OnMutationCompleted$Mutation$blockUser = FutureOr<void> Function(
  dynamic,
  Mutation$blockUser?,
);

class Options$Mutation$blockUser
    extends graphql.MutationOptions<Mutation$blockUser> {
  Options$Mutation$blockUser({
    String? operationName,
    required Variables$Mutation$blockUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$blockUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$blockUser>? update,
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
                    data == null ? null : _parserFn$Mutation$blockUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationblockUser,
          parserFn: _parserFn$Mutation$blockUser,
        );

  final OnMutationCompleted$Mutation$blockUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$blockUser
    extends graphql.WatchQueryOptions<Mutation$blockUser> {
  WatchOptions$Mutation$blockUser({
    String? operationName,
    required Variables$Mutation$blockUser variables,
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
          document: documentNodeMutationblockUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$blockUser,
        );
}

extension ClientExtension$Mutation$blockUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$blockUser>> mutate$blockUser(
          Options$Mutation$blockUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$blockUser> watchMutation$blockUser(
          WatchOptions$Mutation$blockUser options) =>
      this.watchMutation(options);
}

class Mutation$blockUser$HookResult {
  Mutation$blockUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$blockUser runMutation;

  final graphql.QueryResult<Mutation$blockUser> result;
}

Mutation$blockUser$HookResult useMutation$blockUser(
    [WidgetOptions$Mutation$blockUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$blockUser());
  return Mutation$blockUser$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$blockUser> useWatchMutation$blockUser(
        WatchOptions$Mutation$blockUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$blockUser
    extends graphql.MutationOptions<Mutation$blockUser> {
  WidgetOptions$Mutation$blockUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$blockUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$blockUser>? update,
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
                    data == null ? null : _parserFn$Mutation$blockUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationblockUser,
          parserFn: _parserFn$Mutation$blockUser,
        );

  final OnMutationCompleted$Mutation$blockUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$blockUser
    = graphql.MultiSourceResult<Mutation$blockUser> Function(
  Variables$Mutation$blockUser, {
  Object? optimisticResult,
});
typedef Builder$Mutation$blockUser = widgets.Widget Function(
  RunMutation$Mutation$blockUser,
  graphql.QueryResult<Mutation$blockUser>?,
);

class Mutation$blockUser$Widget
    extends graphql_flutter.Mutation<Mutation$blockUser> {
  Mutation$blockUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$blockUser? options,
    required Builder$Mutation$blockUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$blockUser(),
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

class Mutation$blockUser$blockUser {
  Mutation$blockUser$blockUser({
    required this.blockedUserId,
    required this.$__typename,
  });

  factory Mutation$blockUser$blockUser.fromJson(Map<String, dynamic> json) {
    final l$blockedUserId = json['blockedUserId'];
    final l$$__typename = json['__typename'];
    return Mutation$blockUser$blockUser(
      blockedUserId: (l$blockedUserId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String blockedUserId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$blockedUserId = blockedUserId;
    _resultData['blockedUserId'] = l$blockedUserId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$blockedUserId = blockedUserId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$blockedUserId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$blockUser$blockUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$blockedUserId = blockedUserId;
    final lOther$blockedUserId = other.blockedUserId;
    if (l$blockedUserId != lOther$blockedUserId) {
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

extension UtilityExtension$Mutation$blockUser$blockUser
    on Mutation$blockUser$blockUser {
  CopyWith$Mutation$blockUser$blockUser<Mutation$blockUser$blockUser>
      get copyWith => CopyWith$Mutation$blockUser$blockUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$blockUser$blockUser<TRes> {
  factory CopyWith$Mutation$blockUser$blockUser(
    Mutation$blockUser$blockUser instance,
    TRes Function(Mutation$blockUser$blockUser) then,
  ) = _CopyWithImpl$Mutation$blockUser$blockUser;

  factory CopyWith$Mutation$blockUser$blockUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$blockUser$blockUser;

  TRes call({
    String? blockedUserId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$blockUser$blockUser<TRes>
    implements CopyWith$Mutation$blockUser$blockUser<TRes> {
  _CopyWithImpl$Mutation$blockUser$blockUser(
    this._instance,
    this._then,
  );

  final Mutation$blockUser$blockUser _instance;

  final TRes Function(Mutation$blockUser$blockUser) _then;

  static const _undefined = {};

  TRes call({
    Object? blockedUserId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$blockUser$blockUser(
        blockedUserId: blockedUserId == _undefined || blockedUserId == null
            ? _instance.blockedUserId
            : (blockedUserId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$blockUser$blockUser<TRes>
    implements CopyWith$Mutation$blockUser$blockUser<TRes> {
  _CopyWithStubImpl$Mutation$blockUser$blockUser(this._res);

  TRes _res;

  call({
    String? blockedUserId,
    String? $__typename,
  }) =>
      _res;
}
