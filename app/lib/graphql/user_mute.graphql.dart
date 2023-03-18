import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$muteUser {
  factory Variables$Mutation$muteUser({required String userId}) =>
      Variables$Mutation$muteUser._({
        r'userId': userId,
      });

  Variables$Mutation$muteUser._(this._$data);

  factory Variables$Mutation$muteUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Mutation$muteUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Mutation$muteUser<Variables$Mutation$muteUser>
      get copyWith => CopyWith$Variables$Mutation$muteUser(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$muteUser) ||
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

abstract class CopyWith$Variables$Mutation$muteUser<TRes> {
  factory CopyWith$Variables$Mutation$muteUser(
    Variables$Mutation$muteUser instance,
    TRes Function(Variables$Mutation$muteUser) then,
  ) = _CopyWithImpl$Variables$Mutation$muteUser;

  factory CopyWith$Variables$Mutation$muteUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$muteUser;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Mutation$muteUser<TRes>
    implements CopyWith$Variables$Mutation$muteUser<TRes> {
  _CopyWithImpl$Variables$Mutation$muteUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$muteUser _instance;

  final TRes Function(Variables$Mutation$muteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Mutation$muteUser._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$muteUser<TRes>
    implements CopyWith$Variables$Mutation$muteUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$muteUser(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Mutation$muteUser {
  Mutation$muteUser({
    required this.muteUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$muteUser.fromJson(Map<String, dynamic> json) {
    final l$muteUser = json['muteUser'];
    final l$$__typename = json['__typename'];
    return Mutation$muteUser(
      muteUser: Mutation$muteUser$muteUser.fromJson(
          (l$muteUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$muteUser$muteUser muteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$muteUser = muteUser;
    _resultData['muteUser'] = l$muteUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$muteUser = muteUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$muteUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$muteUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$muteUser = muteUser;
    final lOther$muteUser = other.muteUser;
    if (l$muteUser != lOther$muteUser) {
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

extension UtilityExtension$Mutation$muteUser on Mutation$muteUser {
  CopyWith$Mutation$muteUser<Mutation$muteUser> get copyWith =>
      CopyWith$Mutation$muteUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$muteUser<TRes> {
  factory CopyWith$Mutation$muteUser(
    Mutation$muteUser instance,
    TRes Function(Mutation$muteUser) then,
  ) = _CopyWithImpl$Mutation$muteUser;

  factory CopyWith$Mutation$muteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$muteUser;

  TRes call({
    Mutation$muteUser$muteUser? muteUser,
    String? $__typename,
  });
  CopyWith$Mutation$muteUser$muteUser<TRes> get muteUser;
}

class _CopyWithImpl$Mutation$muteUser<TRes>
    implements CopyWith$Mutation$muteUser<TRes> {
  _CopyWithImpl$Mutation$muteUser(
    this._instance,
    this._then,
  );

  final Mutation$muteUser _instance;

  final TRes Function(Mutation$muteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? muteUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$muteUser(
        muteUser: muteUser == _undefined || muteUser == null
            ? _instance.muteUser
            : (muteUser as Mutation$muteUser$muteUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$muteUser$muteUser<TRes> get muteUser {
    final local$muteUser = _instance.muteUser;
    return CopyWith$Mutation$muteUser$muteUser(
        local$muteUser, (e) => call(muteUser: e));
  }
}

class _CopyWithStubImpl$Mutation$muteUser<TRes>
    implements CopyWith$Mutation$muteUser<TRes> {
  _CopyWithStubImpl$Mutation$muteUser(this._res);

  TRes _res;

  call({
    Mutation$muteUser$muteUser? muteUser,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$muteUser$muteUser<TRes> get muteUser =>
      CopyWith$Mutation$muteUser$muteUser.stub(_res);
}

const documentNodeMutationmuteUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'muteUser'),
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
        name: NameNode(value: 'muteUser'),
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
            name: NameNode(value: 'mutedUserId'),
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
Mutation$muteUser _parserFn$Mutation$muteUser(Map<String, dynamic> data) =>
    Mutation$muteUser.fromJson(data);
typedef OnMutationCompleted$Mutation$muteUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$muteUser?,
);

class Options$Mutation$muteUser
    extends graphql.MutationOptions<Mutation$muteUser> {
  Options$Mutation$muteUser({
    String? operationName,
    required Variables$Mutation$muteUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$muteUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$muteUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$muteUser>? update,
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
                    data == null ? null : _parserFn$Mutation$muteUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationmuteUser,
          parserFn: _parserFn$Mutation$muteUser,
        );

  final OnMutationCompleted$Mutation$muteUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$muteUser
    extends graphql.WatchQueryOptions<Mutation$muteUser> {
  WatchOptions$Mutation$muteUser({
    String? operationName,
    required Variables$Mutation$muteUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$muteUser? typedOptimisticResult,
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
          document: documentNodeMutationmuteUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$muteUser,
        );
}

extension ClientExtension$Mutation$muteUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$muteUser>> mutate$muteUser(
          Options$Mutation$muteUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$muteUser> watchMutation$muteUser(
          WatchOptions$Mutation$muteUser options) =>
      this.watchMutation(options);
}

class Mutation$muteUser$HookResult {
  Mutation$muteUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$muteUser runMutation;

  final graphql.QueryResult<Mutation$muteUser> result;
}

Mutation$muteUser$HookResult useMutation$muteUser(
    [WidgetOptions$Mutation$muteUser? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$muteUser());
  return Mutation$muteUser$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$muteUser> useWatchMutation$muteUser(
        WatchOptions$Mutation$muteUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$muteUser
    extends graphql.MutationOptions<Mutation$muteUser> {
  WidgetOptions$Mutation$muteUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$muteUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$muteUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$muteUser>? update,
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
                    data == null ? null : _parserFn$Mutation$muteUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationmuteUser,
          parserFn: _parserFn$Mutation$muteUser,
        );

  final OnMutationCompleted$Mutation$muteUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$muteUser
    = graphql.MultiSourceResult<Mutation$muteUser> Function(
  Variables$Mutation$muteUser, {
  Object? optimisticResult,
  Mutation$muteUser? typedOptimisticResult,
});
typedef Builder$Mutation$muteUser = widgets.Widget Function(
  RunMutation$Mutation$muteUser,
  graphql.QueryResult<Mutation$muteUser>?,
);

class Mutation$muteUser$Widget
    extends graphql_flutter.Mutation<Mutation$muteUser> {
  Mutation$muteUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$muteUser? options,
    required Builder$Mutation$muteUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$muteUser(),
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

class Mutation$muteUser$muteUser {
  Mutation$muteUser$muteUser({
    required this.mutedUserId,
    this.$__typename = 'MuteUserPayload',
  });

  factory Mutation$muteUser$muteUser.fromJson(Map<String, dynamic> json) {
    final l$mutedUserId = json['mutedUserId'];
    final l$$__typename = json['__typename'];
    return Mutation$muteUser$muteUser(
      mutedUserId: (l$mutedUserId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String mutedUserId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mutedUserId = mutedUserId;
    _resultData['mutedUserId'] = l$mutedUserId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mutedUserId = mutedUserId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$mutedUserId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$muteUser$muteUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mutedUserId = mutedUserId;
    final lOther$mutedUserId = other.mutedUserId;
    if (l$mutedUserId != lOther$mutedUserId) {
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

extension UtilityExtension$Mutation$muteUser$muteUser
    on Mutation$muteUser$muteUser {
  CopyWith$Mutation$muteUser$muteUser<Mutation$muteUser$muteUser>
      get copyWith => CopyWith$Mutation$muteUser$muteUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$muteUser$muteUser<TRes> {
  factory CopyWith$Mutation$muteUser$muteUser(
    Mutation$muteUser$muteUser instance,
    TRes Function(Mutation$muteUser$muteUser) then,
  ) = _CopyWithImpl$Mutation$muteUser$muteUser;

  factory CopyWith$Mutation$muteUser$muteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$muteUser$muteUser;

  TRes call({
    String? mutedUserId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$muteUser$muteUser<TRes>
    implements CopyWith$Mutation$muteUser$muteUser<TRes> {
  _CopyWithImpl$Mutation$muteUser$muteUser(
    this._instance,
    this._then,
  );

  final Mutation$muteUser$muteUser _instance;

  final TRes Function(Mutation$muteUser$muteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mutedUserId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$muteUser$muteUser(
        mutedUserId: mutedUserId == _undefined || mutedUserId == null
            ? _instance.mutedUserId
            : (mutedUserId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$muteUser$muteUser<TRes>
    implements CopyWith$Mutation$muteUser$muteUser<TRes> {
  _CopyWithStubImpl$Mutation$muteUser$muteUser(this._res);

  TRes _res;

  call({
    String? mutedUserId,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$unmuteUser {
  factory Variables$Mutation$unmuteUser({required String userId}) =>
      Variables$Mutation$unmuteUser._({
        r'userId': userId,
      });

  Variables$Mutation$unmuteUser._(this._$data);

  factory Variables$Mutation$unmuteUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Mutation$unmuteUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Mutation$unmuteUser<Variables$Mutation$unmuteUser>
      get copyWith => CopyWith$Variables$Mutation$unmuteUser(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$unmuteUser) ||
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

abstract class CopyWith$Variables$Mutation$unmuteUser<TRes> {
  factory CopyWith$Variables$Mutation$unmuteUser(
    Variables$Mutation$unmuteUser instance,
    TRes Function(Variables$Mutation$unmuteUser) then,
  ) = _CopyWithImpl$Variables$Mutation$unmuteUser;

  factory CopyWith$Variables$Mutation$unmuteUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$unmuteUser;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Mutation$unmuteUser<TRes>
    implements CopyWith$Variables$Mutation$unmuteUser<TRes> {
  _CopyWithImpl$Variables$Mutation$unmuteUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$unmuteUser _instance;

  final TRes Function(Variables$Mutation$unmuteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Mutation$unmuteUser._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$unmuteUser<TRes>
    implements CopyWith$Variables$Mutation$unmuteUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$unmuteUser(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Mutation$unmuteUser {
  Mutation$unmuteUser({
    required this.unmuteUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$unmuteUser.fromJson(Map<String, dynamic> json) {
    final l$unmuteUser = json['unmuteUser'];
    final l$$__typename = json['__typename'];
    return Mutation$unmuteUser(
      unmuteUser: Mutation$unmuteUser$unmuteUser.fromJson(
          (l$unmuteUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$unmuteUser$unmuteUser unmuteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unmuteUser = unmuteUser;
    _resultData['unmuteUser'] = l$unmuteUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unmuteUser = unmuteUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$unmuteUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$unmuteUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$unmuteUser = unmuteUser;
    final lOther$unmuteUser = other.unmuteUser;
    if (l$unmuteUser != lOther$unmuteUser) {
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

extension UtilityExtension$Mutation$unmuteUser on Mutation$unmuteUser {
  CopyWith$Mutation$unmuteUser<Mutation$unmuteUser> get copyWith =>
      CopyWith$Mutation$unmuteUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$unmuteUser<TRes> {
  factory CopyWith$Mutation$unmuteUser(
    Mutation$unmuteUser instance,
    TRes Function(Mutation$unmuteUser) then,
  ) = _CopyWithImpl$Mutation$unmuteUser;

  factory CopyWith$Mutation$unmuteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$unmuteUser;

  TRes call({
    Mutation$unmuteUser$unmuteUser? unmuteUser,
    String? $__typename,
  });
  CopyWith$Mutation$unmuteUser$unmuteUser<TRes> get unmuteUser;
}

class _CopyWithImpl$Mutation$unmuteUser<TRes>
    implements CopyWith$Mutation$unmuteUser<TRes> {
  _CopyWithImpl$Mutation$unmuteUser(
    this._instance,
    this._then,
  );

  final Mutation$unmuteUser _instance;

  final TRes Function(Mutation$unmuteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? unmuteUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$unmuteUser(
        unmuteUser: unmuteUser == _undefined || unmuteUser == null
            ? _instance.unmuteUser
            : (unmuteUser as Mutation$unmuteUser$unmuteUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$unmuteUser$unmuteUser<TRes> get unmuteUser {
    final local$unmuteUser = _instance.unmuteUser;
    return CopyWith$Mutation$unmuteUser$unmuteUser(
        local$unmuteUser, (e) => call(unmuteUser: e));
  }
}

class _CopyWithStubImpl$Mutation$unmuteUser<TRes>
    implements CopyWith$Mutation$unmuteUser<TRes> {
  _CopyWithStubImpl$Mutation$unmuteUser(this._res);

  TRes _res;

  call({
    Mutation$unmuteUser$unmuteUser? unmuteUser,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$unmuteUser$unmuteUser<TRes> get unmuteUser =>
      CopyWith$Mutation$unmuteUser$unmuteUser.stub(_res);
}

const documentNodeMutationunmuteUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unmuteUser'),
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
        name: NameNode(value: 'unmuteUser'),
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
            name: NameNode(value: 'unmutedUserId'),
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
Mutation$unmuteUser _parserFn$Mutation$unmuteUser(Map<String, dynamic> data) =>
    Mutation$unmuteUser.fromJson(data);
typedef OnMutationCompleted$Mutation$unmuteUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$unmuteUser?,
);

class Options$Mutation$unmuteUser
    extends graphql.MutationOptions<Mutation$unmuteUser> {
  Options$Mutation$unmuteUser({
    String? operationName,
    required Variables$Mutation$unmuteUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$unmuteUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$unmuteUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$unmuteUser>? update,
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
                    data == null ? null : _parserFn$Mutation$unmuteUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationunmuteUser,
          parserFn: _parserFn$Mutation$unmuteUser,
        );

  final OnMutationCompleted$Mutation$unmuteUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$unmuteUser
    extends graphql.WatchQueryOptions<Mutation$unmuteUser> {
  WatchOptions$Mutation$unmuteUser({
    String? operationName,
    required Variables$Mutation$unmuteUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$unmuteUser? typedOptimisticResult,
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
          document: documentNodeMutationunmuteUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$unmuteUser,
        );
}

extension ClientExtension$Mutation$unmuteUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$unmuteUser>> mutate$unmuteUser(
          Options$Mutation$unmuteUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$unmuteUser> watchMutation$unmuteUser(
          WatchOptions$Mutation$unmuteUser options) =>
      this.watchMutation(options);
}

class Mutation$unmuteUser$HookResult {
  Mutation$unmuteUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$unmuteUser runMutation;

  final graphql.QueryResult<Mutation$unmuteUser> result;
}

Mutation$unmuteUser$HookResult useMutation$unmuteUser(
    [WidgetOptions$Mutation$unmuteUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$unmuteUser());
  return Mutation$unmuteUser$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$unmuteUser> useWatchMutation$unmuteUser(
        WatchOptions$Mutation$unmuteUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$unmuteUser
    extends graphql.MutationOptions<Mutation$unmuteUser> {
  WidgetOptions$Mutation$unmuteUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$unmuteUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$unmuteUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$unmuteUser>? update,
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
                    data == null ? null : _parserFn$Mutation$unmuteUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationunmuteUser,
          parserFn: _parserFn$Mutation$unmuteUser,
        );

  final OnMutationCompleted$Mutation$unmuteUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$unmuteUser
    = graphql.MultiSourceResult<Mutation$unmuteUser> Function(
  Variables$Mutation$unmuteUser, {
  Object? optimisticResult,
  Mutation$unmuteUser? typedOptimisticResult,
});
typedef Builder$Mutation$unmuteUser = widgets.Widget Function(
  RunMutation$Mutation$unmuteUser,
  graphql.QueryResult<Mutation$unmuteUser>?,
);

class Mutation$unmuteUser$Widget
    extends graphql_flutter.Mutation<Mutation$unmuteUser> {
  Mutation$unmuteUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$unmuteUser? options,
    required Builder$Mutation$unmuteUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$unmuteUser(),
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

class Mutation$unmuteUser$unmuteUser {
  Mutation$unmuteUser$unmuteUser({
    required this.unmutedUserId,
    this.$__typename = 'UnmuteUserPayload',
  });

  factory Mutation$unmuteUser$unmuteUser.fromJson(Map<String, dynamic> json) {
    final l$unmutedUserId = json['unmutedUserId'];
    final l$$__typename = json['__typename'];
    return Mutation$unmuteUser$unmuteUser(
      unmutedUserId: (l$unmutedUserId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String unmutedUserId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unmutedUserId = unmutedUserId;
    _resultData['unmutedUserId'] = l$unmutedUserId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unmutedUserId = unmutedUserId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$unmutedUserId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$unmuteUser$unmuteUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$unmutedUserId = unmutedUserId;
    final lOther$unmutedUserId = other.unmutedUserId;
    if (l$unmutedUserId != lOther$unmutedUserId) {
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

extension UtilityExtension$Mutation$unmuteUser$unmuteUser
    on Mutation$unmuteUser$unmuteUser {
  CopyWith$Mutation$unmuteUser$unmuteUser<Mutation$unmuteUser$unmuteUser>
      get copyWith => CopyWith$Mutation$unmuteUser$unmuteUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$unmuteUser$unmuteUser<TRes> {
  factory CopyWith$Mutation$unmuteUser$unmuteUser(
    Mutation$unmuteUser$unmuteUser instance,
    TRes Function(Mutation$unmuteUser$unmuteUser) then,
  ) = _CopyWithImpl$Mutation$unmuteUser$unmuteUser;

  factory CopyWith$Mutation$unmuteUser$unmuteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$unmuteUser$unmuteUser;

  TRes call({
    String? unmutedUserId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$unmuteUser$unmuteUser<TRes>
    implements CopyWith$Mutation$unmuteUser$unmuteUser<TRes> {
  _CopyWithImpl$Mutation$unmuteUser$unmuteUser(
    this._instance,
    this._then,
  );

  final Mutation$unmuteUser$unmuteUser _instance;

  final TRes Function(Mutation$unmuteUser$unmuteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? unmutedUserId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$unmuteUser$unmuteUser(
        unmutedUserId: unmutedUserId == _undefined || unmutedUserId == null
            ? _instance.unmutedUserId
            : (unmutedUserId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$unmuteUser$unmuteUser<TRes>
    implements CopyWith$Mutation$unmuteUser$unmuteUser<TRes> {
  _CopyWithStubImpl$Mutation$unmuteUser$unmuteUser(this._res);

  TRes _res;

  call({
    String? unmutedUserId,
    String? $__typename,
  }) =>
      _res;
}
