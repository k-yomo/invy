import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Mutation$signOut {
  Mutation$signOut({
    required this.signOut,
    this.$__typename = 'Mutation',
  });

  factory Mutation$signOut.fromJson(Map<String, dynamic> json) {
    final l$signOut = json['signOut'];
    final l$$__typename = json['__typename'];
    return Mutation$signOut(
      signOut: Mutation$signOut$signOut.fromJson(
          (l$signOut as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$signOut$signOut signOut;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signOut = signOut;
    _resultData['signOut'] = l$signOut.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signOut = signOut;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$signOut,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$signOut) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signOut = signOut;
    final lOther$signOut = other.signOut;
    if (l$signOut != lOther$signOut) {
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

extension UtilityExtension$Mutation$signOut on Mutation$signOut {
  CopyWith$Mutation$signOut<Mutation$signOut> get copyWith =>
      CopyWith$Mutation$signOut(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$signOut<TRes> {
  factory CopyWith$Mutation$signOut(
    Mutation$signOut instance,
    TRes Function(Mutation$signOut) then,
  ) = _CopyWithImpl$Mutation$signOut;

  factory CopyWith$Mutation$signOut.stub(TRes res) =
      _CopyWithStubImpl$Mutation$signOut;

  TRes call({
    Mutation$signOut$signOut? signOut,
    String? $__typename,
  });
  CopyWith$Mutation$signOut$signOut<TRes> get signOut;
}

class _CopyWithImpl$Mutation$signOut<TRes>
    implements CopyWith$Mutation$signOut<TRes> {
  _CopyWithImpl$Mutation$signOut(
    this._instance,
    this._then,
  );

  final Mutation$signOut _instance;

  final TRes Function(Mutation$signOut) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? signOut = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$signOut(
        signOut: signOut == _undefined || signOut == null
            ? _instance.signOut
            : (signOut as Mutation$signOut$signOut),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$signOut$signOut<TRes> get signOut {
    final local$signOut = _instance.signOut;
    return CopyWith$Mutation$signOut$signOut(
        local$signOut, (e) => call(signOut: e));
  }
}

class _CopyWithStubImpl$Mutation$signOut<TRes>
    implements CopyWith$Mutation$signOut<TRes> {
  _CopyWithStubImpl$Mutation$signOut(this._res);

  TRes _res;

  call({
    Mutation$signOut$signOut? signOut,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$signOut$signOut<TRes> get signOut =>
      CopyWith$Mutation$signOut$signOut.stub(_res);
}

const documentNodeMutationsignOut = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'signOut'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'signOut'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'signedOutUserId'),
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
Mutation$signOut _parserFn$Mutation$signOut(Map<String, dynamic> data) =>
    Mutation$signOut.fromJson(data);
typedef OnMutationCompleted$Mutation$signOut = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$signOut?,
);

class Options$Mutation$signOut
    extends graphql.MutationOptions<Mutation$signOut> {
  Options$Mutation$signOut({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$signOut? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$signOut? onCompleted,
    graphql.OnMutationUpdate<Mutation$signOut>? update,
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
                    data == null ? null : _parserFn$Mutation$signOut(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsignOut,
          parserFn: _parserFn$Mutation$signOut,
        );

  final OnMutationCompleted$Mutation$signOut? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$signOut
    extends graphql.WatchQueryOptions<Mutation$signOut> {
  WatchOptions$Mutation$signOut({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$signOut? typedOptimisticResult,
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
          document: documentNodeMutationsignOut,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$signOut,
        );
}

extension ClientExtension$Mutation$signOut on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$signOut>> mutate$signOut(
          [Options$Mutation$signOut? options]) async =>
      await this.mutate(options ?? Options$Mutation$signOut());
  graphql.ObservableQuery<Mutation$signOut> watchMutation$signOut(
          [WatchOptions$Mutation$signOut? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$signOut());
}

class Mutation$signOut$HookResult {
  Mutation$signOut$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$signOut runMutation;

  final graphql.QueryResult<Mutation$signOut> result;
}

Mutation$signOut$HookResult useMutation$signOut(
    [WidgetOptions$Mutation$signOut? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$signOut());
  return Mutation$signOut$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$signOut> useWatchMutation$signOut(
        [WatchOptions$Mutation$signOut? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$signOut());

class WidgetOptions$Mutation$signOut
    extends graphql.MutationOptions<Mutation$signOut> {
  WidgetOptions$Mutation$signOut({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$signOut? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$signOut? onCompleted,
    graphql.OnMutationUpdate<Mutation$signOut>? update,
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
                    data == null ? null : _parserFn$Mutation$signOut(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsignOut,
          parserFn: _parserFn$Mutation$signOut,
        );

  final OnMutationCompleted$Mutation$signOut? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$signOut
    = graphql.MultiSourceResult<Mutation$signOut> Function({
  Object? optimisticResult,
  Mutation$signOut? typedOptimisticResult,
});
typedef Builder$Mutation$signOut = widgets.Widget Function(
  RunMutation$Mutation$signOut,
  graphql.QueryResult<Mutation$signOut>?,
);

class Mutation$signOut$Widget
    extends graphql_flutter.Mutation<Mutation$signOut> {
  Mutation$signOut$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$signOut? options,
    required Builder$Mutation$signOut builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$signOut(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$signOut$signOut {
  Mutation$signOut$signOut({
    required this.signedOutUserId,
    this.$__typename = 'SignOutPayload',
  });

  factory Mutation$signOut$signOut.fromJson(Map<String, dynamic> json) {
    final l$signedOutUserId = json['signedOutUserId'];
    final l$$__typename = json['__typename'];
    return Mutation$signOut$signOut(
      signedOutUserId: (l$signedOutUserId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String signedOutUserId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signedOutUserId = signedOutUserId;
    _resultData['signedOutUserId'] = l$signedOutUserId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signedOutUserId = signedOutUserId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$signedOutUserId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$signOut$signOut) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$signedOutUserId = signedOutUserId;
    final lOther$signedOutUserId = other.signedOutUserId;
    if (l$signedOutUserId != lOther$signedOutUserId) {
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

extension UtilityExtension$Mutation$signOut$signOut
    on Mutation$signOut$signOut {
  CopyWith$Mutation$signOut$signOut<Mutation$signOut$signOut> get copyWith =>
      CopyWith$Mutation$signOut$signOut(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$signOut$signOut<TRes> {
  factory CopyWith$Mutation$signOut$signOut(
    Mutation$signOut$signOut instance,
    TRes Function(Mutation$signOut$signOut) then,
  ) = _CopyWithImpl$Mutation$signOut$signOut;

  factory CopyWith$Mutation$signOut$signOut.stub(TRes res) =
      _CopyWithStubImpl$Mutation$signOut$signOut;

  TRes call({
    String? signedOutUserId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$signOut$signOut<TRes>
    implements CopyWith$Mutation$signOut$signOut<TRes> {
  _CopyWithImpl$Mutation$signOut$signOut(
    this._instance,
    this._then,
  );

  final Mutation$signOut$signOut _instance;

  final TRes Function(Mutation$signOut$signOut) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? signedOutUserId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$signOut$signOut(
        signedOutUserId:
            signedOutUserId == _undefined || signedOutUserId == null
                ? _instance.signedOutUserId
                : (signedOutUserId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$signOut$signOut<TRes>
    implements CopyWith$Mutation$signOut$signOut<TRes> {
  _CopyWithStubImpl$Mutation$signOut$signOut(this._res);

  TRes _res;

  call({
    String? signedOutUserId,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$deleteAccount {
  Mutation$deleteAccount({
    required this.deleteAccount,
    this.$__typename = 'Mutation',
  });

  factory Mutation$deleteAccount.fromJson(Map<String, dynamic> json) {
    final l$deleteAccount = json['deleteAccount'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteAccount(
      deleteAccount: Mutation$deleteAccount$deleteAccount.fromJson(
          (l$deleteAccount as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$deleteAccount$deleteAccount deleteAccount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteAccount = deleteAccount;
    _resultData['deleteAccount'] = l$deleteAccount.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteAccount = deleteAccount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteAccount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteAccount) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteAccount = deleteAccount;
    final lOther$deleteAccount = other.deleteAccount;
    if (l$deleteAccount != lOther$deleteAccount) {
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

extension UtilityExtension$Mutation$deleteAccount on Mutation$deleteAccount {
  CopyWith$Mutation$deleteAccount<Mutation$deleteAccount> get copyWith =>
      CopyWith$Mutation$deleteAccount(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteAccount<TRes> {
  factory CopyWith$Mutation$deleteAccount(
    Mutation$deleteAccount instance,
    TRes Function(Mutation$deleteAccount) then,
  ) = _CopyWithImpl$Mutation$deleteAccount;

  factory CopyWith$Mutation$deleteAccount.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteAccount;

  TRes call({
    Mutation$deleteAccount$deleteAccount? deleteAccount,
    String? $__typename,
  });
  CopyWith$Mutation$deleteAccount$deleteAccount<TRes> get deleteAccount;
}

class _CopyWithImpl$Mutation$deleteAccount<TRes>
    implements CopyWith$Mutation$deleteAccount<TRes> {
  _CopyWithImpl$Mutation$deleteAccount(
    this._instance,
    this._then,
  );

  final Mutation$deleteAccount _instance;

  final TRes Function(Mutation$deleteAccount) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteAccount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteAccount(
        deleteAccount: deleteAccount == _undefined || deleteAccount == null
            ? _instance.deleteAccount
            : (deleteAccount as Mutation$deleteAccount$deleteAccount),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteAccount$deleteAccount<TRes> get deleteAccount {
    final local$deleteAccount = _instance.deleteAccount;
    return CopyWith$Mutation$deleteAccount$deleteAccount(
        local$deleteAccount, (e) => call(deleteAccount: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteAccount<TRes>
    implements CopyWith$Mutation$deleteAccount<TRes> {
  _CopyWithStubImpl$Mutation$deleteAccount(this._res);

  TRes _res;

  call({
    Mutation$deleteAccount$deleteAccount? deleteAccount,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteAccount$deleteAccount<TRes> get deleteAccount =>
      CopyWith$Mutation$deleteAccount$deleteAccount.stub(_res);
}

const documentNodeMutationdeleteAccount = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteAccount'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteAccount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deletedAccountId'),
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
Mutation$deleteAccount _parserFn$Mutation$deleteAccount(
        Map<String, dynamic> data) =>
    Mutation$deleteAccount.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteAccount = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$deleteAccount?,
);

class Options$Mutation$deleteAccount
    extends graphql.MutationOptions<Mutation$deleteAccount> {
  Options$Mutation$deleteAccount({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteAccount? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteAccount? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteAccount>? update,
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
                        : _parserFn$Mutation$deleteAccount(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteAccount,
          parserFn: _parserFn$Mutation$deleteAccount,
        );

  final OnMutationCompleted$Mutation$deleteAccount? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteAccount
    extends graphql.WatchQueryOptions<Mutation$deleteAccount> {
  WatchOptions$Mutation$deleteAccount({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteAccount? typedOptimisticResult,
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
          document: documentNodeMutationdeleteAccount,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteAccount,
        );
}

extension ClientExtension$Mutation$deleteAccount on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteAccount>> mutate$deleteAccount(
          [Options$Mutation$deleteAccount? options]) async =>
      await this.mutate(options ?? Options$Mutation$deleteAccount());
  graphql.ObservableQuery<Mutation$deleteAccount> watchMutation$deleteAccount(
          [WatchOptions$Mutation$deleteAccount? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$deleteAccount());
}

class Mutation$deleteAccount$HookResult {
  Mutation$deleteAccount$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$deleteAccount runMutation;

  final graphql.QueryResult<Mutation$deleteAccount> result;
}

Mutation$deleteAccount$HookResult useMutation$deleteAccount(
    [WidgetOptions$Mutation$deleteAccount? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$deleteAccount());
  return Mutation$deleteAccount$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$deleteAccount> useWatchMutation$deleteAccount(
        [WatchOptions$Mutation$deleteAccount? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$deleteAccount());

class WidgetOptions$Mutation$deleteAccount
    extends graphql.MutationOptions<Mutation$deleteAccount> {
  WidgetOptions$Mutation$deleteAccount({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteAccount? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteAccount? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteAccount>? update,
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
                        : _parserFn$Mutation$deleteAccount(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteAccount,
          parserFn: _parserFn$Mutation$deleteAccount,
        );

  final OnMutationCompleted$Mutation$deleteAccount? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$deleteAccount
    = graphql.MultiSourceResult<Mutation$deleteAccount> Function({
  Object? optimisticResult,
  Mutation$deleteAccount? typedOptimisticResult,
});
typedef Builder$Mutation$deleteAccount = widgets.Widget Function(
  RunMutation$Mutation$deleteAccount,
  graphql.QueryResult<Mutation$deleteAccount>?,
);

class Mutation$deleteAccount$Widget
    extends graphql_flutter.Mutation<Mutation$deleteAccount> {
  Mutation$deleteAccount$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$deleteAccount? options,
    required Builder$Mutation$deleteAccount builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$deleteAccount(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$deleteAccount$deleteAccount {
  Mutation$deleteAccount$deleteAccount({
    required this.deletedAccountId,
    this.$__typename = 'DeleteAccountPayload',
  });

  factory Mutation$deleteAccount$deleteAccount.fromJson(
      Map<String, dynamic> json) {
    final l$deletedAccountId = json['deletedAccountId'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteAccount$deleteAccount(
      deletedAccountId: (l$deletedAccountId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String deletedAccountId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deletedAccountId = deletedAccountId;
    _resultData['deletedAccountId'] = l$deletedAccountId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deletedAccountId = deletedAccountId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deletedAccountId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteAccount$deleteAccount) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deletedAccountId = deletedAccountId;
    final lOther$deletedAccountId = other.deletedAccountId;
    if (l$deletedAccountId != lOther$deletedAccountId) {
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

extension UtilityExtension$Mutation$deleteAccount$deleteAccount
    on Mutation$deleteAccount$deleteAccount {
  CopyWith$Mutation$deleteAccount$deleteAccount<
          Mutation$deleteAccount$deleteAccount>
      get copyWith => CopyWith$Mutation$deleteAccount$deleteAccount(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteAccount$deleteAccount<TRes> {
  factory CopyWith$Mutation$deleteAccount$deleteAccount(
    Mutation$deleteAccount$deleteAccount instance,
    TRes Function(Mutation$deleteAccount$deleteAccount) then,
  ) = _CopyWithImpl$Mutation$deleteAccount$deleteAccount;

  factory CopyWith$Mutation$deleteAccount$deleteAccount.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteAccount$deleteAccount;

  TRes call({
    String? deletedAccountId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteAccount$deleteAccount<TRes>
    implements CopyWith$Mutation$deleteAccount$deleteAccount<TRes> {
  _CopyWithImpl$Mutation$deleteAccount$deleteAccount(
    this._instance,
    this._then,
  );

  final Mutation$deleteAccount$deleteAccount _instance;

  final TRes Function(Mutation$deleteAccount$deleteAccount) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deletedAccountId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteAccount$deleteAccount(
        deletedAccountId:
            deletedAccountId == _undefined || deletedAccountId == null
                ? _instance.deletedAccountId
                : (deletedAccountId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteAccount$deleteAccount<TRes>
    implements CopyWith$Mutation$deleteAccount$deleteAccount<TRes> {
  _CopyWithStubImpl$Mutation$deleteAccount$deleteAccount(this._res);

  TRes _res;

  call({
    String? deletedAccountId,
    String? $__typename,
  }) =>
      _res;
}
