import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$muteFriend {
  factory Variables$Mutation$muteFriend({required String muteUserId}) =>
      Variables$Mutation$muteFriend._({
        r'muteUserId': muteUserId,
      });

  Variables$Mutation$muteFriend._(this._$data);

  factory Variables$Mutation$muteFriend.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$muteUserId = data['muteUserId'];
    result$data['muteUserId'] = (l$muteUserId as String);
    return Variables$Mutation$muteFriend._(result$data);
  }

  Map<String, dynamic> _$data;

  String get muteUserId => (_$data['muteUserId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$muteUserId = muteUserId;
    result$data['muteUserId'] = l$muteUserId;
    return result$data;
  }

  CopyWith$Variables$Mutation$muteFriend<Variables$Mutation$muteFriend>
      get copyWith => CopyWith$Variables$Mutation$muteFriend(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$muteFriend) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$muteUserId = muteUserId;
    final lOther$muteUserId = other.muteUserId;
    if (l$muteUserId != lOther$muteUserId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$muteUserId = muteUserId;
    return Object.hashAll([l$muteUserId]);
  }
}

abstract class CopyWith$Variables$Mutation$muteFriend<TRes> {
  factory CopyWith$Variables$Mutation$muteFriend(
    Variables$Mutation$muteFriend instance,
    TRes Function(Variables$Mutation$muteFriend) then,
  ) = _CopyWithImpl$Variables$Mutation$muteFriend;

  factory CopyWith$Variables$Mutation$muteFriend.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$muteFriend;

  TRes call({String? muteUserId});
}

class _CopyWithImpl$Variables$Mutation$muteFriend<TRes>
    implements CopyWith$Variables$Mutation$muteFriend<TRes> {
  _CopyWithImpl$Variables$Mutation$muteFriend(
    this._instance,
    this._then,
  );

  final Variables$Mutation$muteFriend _instance;

  final TRes Function(Variables$Mutation$muteFriend) _then;

  static const _undefined = {};

  TRes call({Object? muteUserId = _undefined}) =>
      _then(Variables$Mutation$muteFriend._({
        ..._instance._$data,
        if (muteUserId != _undefined && muteUserId != null)
          'muteUserId': (muteUserId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$muteFriend<TRes>
    implements CopyWith$Variables$Mutation$muteFriend<TRes> {
  _CopyWithStubImpl$Variables$Mutation$muteFriend(this._res);

  TRes _res;

  call({String? muteUserId}) => _res;
}

class Mutation$muteFriend {
  Mutation$muteFriend({
    required this.muteUser,
    required this.$__typename,
  });

  factory Mutation$muteFriend.fromJson(Map<String, dynamic> json) {
    final l$muteUser = json['muteUser'];
    final l$$__typename = json['__typename'];
    return Mutation$muteFriend(
      muteUser: (l$muteUser as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool muteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$muteUser = muteUser;
    _resultData['muteUser'] = l$muteUser;
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
    if (!(other is Mutation$muteFriend) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$muteFriend on Mutation$muteFriend {
  CopyWith$Mutation$muteFriend<Mutation$muteFriend> get copyWith =>
      CopyWith$Mutation$muteFriend(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$muteFriend<TRes> {
  factory CopyWith$Mutation$muteFriend(
    Mutation$muteFriend instance,
    TRes Function(Mutation$muteFriend) then,
  ) = _CopyWithImpl$Mutation$muteFriend;

  factory CopyWith$Mutation$muteFriend.stub(TRes res) =
      _CopyWithStubImpl$Mutation$muteFriend;

  TRes call({
    bool? muteUser,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$muteFriend<TRes>
    implements CopyWith$Mutation$muteFriend<TRes> {
  _CopyWithImpl$Mutation$muteFriend(
    this._instance,
    this._then,
  );

  final Mutation$muteFriend _instance;

  final TRes Function(Mutation$muteFriend) _then;

  static const _undefined = {};

  TRes call({
    Object? muteUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$muteFriend(
        muteUser: muteUser == _undefined || muteUser == null
            ? _instance.muteUser
            : (muteUser as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$muteFriend<TRes>
    implements CopyWith$Mutation$muteFriend<TRes> {
  _CopyWithStubImpl$Mutation$muteFriend(this._res);

  TRes _res;

  call({
    bool? muteUser,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationmuteFriend = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'muteFriend'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'muteUserId')),
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
            name: NameNode(value: 'muteUserId'),
            value: VariableNode(name: NameNode(value: 'muteUserId')),
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
Mutation$muteFriend _parserFn$Mutation$muteFriend(Map<String, dynamic> data) =>
    Mutation$muteFriend.fromJson(data);
typedef OnMutationCompleted$Mutation$muteFriend = FutureOr<void> Function(
  dynamic,
  Mutation$muteFriend?,
);

class Options$Mutation$muteFriend
    extends graphql.MutationOptions<Mutation$muteFriend> {
  Options$Mutation$muteFriend({
    String? operationName,
    required Variables$Mutation$muteFriend variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$muteFriend? onCompleted,
    graphql.OnMutationUpdate<Mutation$muteFriend>? update,
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
                    data == null ? null : _parserFn$Mutation$muteFriend(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationmuteFriend,
          parserFn: _parserFn$Mutation$muteFriend,
        );

  final OnMutationCompleted$Mutation$muteFriend? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$muteFriend
    extends graphql.WatchQueryOptions<Mutation$muteFriend> {
  WatchOptions$Mutation$muteFriend({
    String? operationName,
    required Variables$Mutation$muteFriend variables,
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
          document: documentNodeMutationmuteFriend,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$muteFriend,
        );
}

extension ClientExtension$Mutation$muteFriend on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$muteFriend>> mutate$muteFriend(
          Options$Mutation$muteFriend options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$muteFriend> watchMutation$muteFriend(
          WatchOptions$Mutation$muteFriend options) =>
      this.watchMutation(options);
}

class Mutation$muteFriend$HookResult {
  Mutation$muteFriend$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$muteFriend runMutation;

  final graphql.QueryResult<Mutation$muteFriend> result;
}

Mutation$muteFriend$HookResult useMutation$muteFriend(
    [WidgetOptions$Mutation$muteFriend? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$muteFriend());
  return Mutation$muteFriend$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$muteFriend> useWatchMutation$muteFriend(
        WatchOptions$Mutation$muteFriend options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$muteFriend
    extends graphql.MutationOptions<Mutation$muteFriend> {
  WidgetOptions$Mutation$muteFriend({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$muteFriend? onCompleted,
    graphql.OnMutationUpdate<Mutation$muteFriend>? update,
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
                    data == null ? null : _parserFn$Mutation$muteFriend(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationmuteFriend,
          parserFn: _parserFn$Mutation$muteFriend,
        );

  final OnMutationCompleted$Mutation$muteFriend? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$muteFriend
    = graphql.MultiSourceResult<Mutation$muteFriend> Function(
  Variables$Mutation$muteFriend, {
  Object? optimisticResult,
});
typedef Builder$Mutation$muteFriend = widgets.Widget Function(
  RunMutation$Mutation$muteFriend,
  graphql.QueryResult<Mutation$muteFriend>?,
);

class Mutation$muteFriend$Widget
    extends graphql_flutter.Mutation<Mutation$muteFriend> {
  Mutation$muteFriend$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$muteFriend? options,
    required Builder$Mutation$muteFriend builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$muteFriend(),
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

class Variables$Mutation$unmuteFriend {
  factory Variables$Mutation$unmuteFriend({required String muteUserId}) =>
      Variables$Mutation$unmuteFriend._({
        r'muteUserId': muteUserId,
      });

  Variables$Mutation$unmuteFriend._(this._$data);

  factory Variables$Mutation$unmuteFriend.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$muteUserId = data['muteUserId'];
    result$data['muteUserId'] = (l$muteUserId as String);
    return Variables$Mutation$unmuteFriend._(result$data);
  }

  Map<String, dynamic> _$data;

  String get muteUserId => (_$data['muteUserId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$muteUserId = muteUserId;
    result$data['muteUserId'] = l$muteUserId;
    return result$data;
  }

  CopyWith$Variables$Mutation$unmuteFriend<Variables$Mutation$unmuteFriend>
      get copyWith => CopyWith$Variables$Mutation$unmuteFriend(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$unmuteFriend) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$muteUserId = muteUserId;
    final lOther$muteUserId = other.muteUserId;
    if (l$muteUserId != lOther$muteUserId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$muteUserId = muteUserId;
    return Object.hashAll([l$muteUserId]);
  }
}

abstract class CopyWith$Variables$Mutation$unmuteFriend<TRes> {
  factory CopyWith$Variables$Mutation$unmuteFriend(
    Variables$Mutation$unmuteFriend instance,
    TRes Function(Variables$Mutation$unmuteFriend) then,
  ) = _CopyWithImpl$Variables$Mutation$unmuteFriend;

  factory CopyWith$Variables$Mutation$unmuteFriend.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$unmuteFriend;

  TRes call({String? muteUserId});
}

class _CopyWithImpl$Variables$Mutation$unmuteFriend<TRes>
    implements CopyWith$Variables$Mutation$unmuteFriend<TRes> {
  _CopyWithImpl$Variables$Mutation$unmuteFriend(
    this._instance,
    this._then,
  );

  final Variables$Mutation$unmuteFriend _instance;

  final TRes Function(Variables$Mutation$unmuteFriend) _then;

  static const _undefined = {};

  TRes call({Object? muteUserId = _undefined}) =>
      _then(Variables$Mutation$unmuteFriend._({
        ..._instance._$data,
        if (muteUserId != _undefined && muteUserId != null)
          'muteUserId': (muteUserId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$unmuteFriend<TRes>
    implements CopyWith$Variables$Mutation$unmuteFriend<TRes> {
  _CopyWithStubImpl$Variables$Mutation$unmuteFriend(this._res);

  TRes _res;

  call({String? muteUserId}) => _res;
}

class Mutation$unmuteFriend {
  Mutation$unmuteFriend({
    required this.unmuteUser,
    required this.$__typename,
  });

  factory Mutation$unmuteFriend.fromJson(Map<String, dynamic> json) {
    final l$unmuteUser = json['unmuteUser'];
    final l$$__typename = json['__typename'];
    return Mutation$unmuteFriend(
      unmuteUser: (l$unmuteUser as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool unmuteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unmuteUser = unmuteUser;
    _resultData['unmuteUser'] = l$unmuteUser;
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
    if (!(other is Mutation$unmuteFriend) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$unmuteFriend on Mutation$unmuteFriend {
  CopyWith$Mutation$unmuteFriend<Mutation$unmuteFriend> get copyWith =>
      CopyWith$Mutation$unmuteFriend(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$unmuteFriend<TRes> {
  factory CopyWith$Mutation$unmuteFriend(
    Mutation$unmuteFriend instance,
    TRes Function(Mutation$unmuteFriend) then,
  ) = _CopyWithImpl$Mutation$unmuteFriend;

  factory CopyWith$Mutation$unmuteFriend.stub(TRes res) =
      _CopyWithStubImpl$Mutation$unmuteFriend;

  TRes call({
    bool? unmuteUser,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$unmuteFriend<TRes>
    implements CopyWith$Mutation$unmuteFriend<TRes> {
  _CopyWithImpl$Mutation$unmuteFriend(
    this._instance,
    this._then,
  );

  final Mutation$unmuteFriend _instance;

  final TRes Function(Mutation$unmuteFriend) _then;

  static const _undefined = {};

  TRes call({
    Object? unmuteUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$unmuteFriend(
        unmuteUser: unmuteUser == _undefined || unmuteUser == null
            ? _instance.unmuteUser
            : (unmuteUser as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$unmuteFriend<TRes>
    implements CopyWith$Mutation$unmuteFriend<TRes> {
  _CopyWithStubImpl$Mutation$unmuteFriend(this._res);

  TRes _res;

  call({
    bool? unmuteUser,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationunmuteFriend = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unmuteFriend'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'muteUserId')),
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
            name: NameNode(value: 'muteUserId'),
            value: VariableNode(name: NameNode(value: 'muteUserId')),
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
Mutation$unmuteFriend _parserFn$Mutation$unmuteFriend(
        Map<String, dynamic> data) =>
    Mutation$unmuteFriend.fromJson(data);
typedef OnMutationCompleted$Mutation$unmuteFriend = FutureOr<void> Function(
  dynamic,
  Mutation$unmuteFriend?,
);

class Options$Mutation$unmuteFriend
    extends graphql.MutationOptions<Mutation$unmuteFriend> {
  Options$Mutation$unmuteFriend({
    String? operationName,
    required Variables$Mutation$unmuteFriend variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$unmuteFriend? onCompleted,
    graphql.OnMutationUpdate<Mutation$unmuteFriend>? update,
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
                    data == null ? null : _parserFn$Mutation$unmuteFriend(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationunmuteFriend,
          parserFn: _parserFn$Mutation$unmuteFriend,
        );

  final OnMutationCompleted$Mutation$unmuteFriend? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$unmuteFriend
    extends graphql.WatchQueryOptions<Mutation$unmuteFriend> {
  WatchOptions$Mutation$unmuteFriend({
    String? operationName,
    required Variables$Mutation$unmuteFriend variables,
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
          document: documentNodeMutationunmuteFriend,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$unmuteFriend,
        );
}

extension ClientExtension$Mutation$unmuteFriend on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$unmuteFriend>> mutate$unmuteFriend(
          Options$Mutation$unmuteFriend options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$unmuteFriend> watchMutation$unmuteFriend(
          WatchOptions$Mutation$unmuteFriend options) =>
      this.watchMutation(options);
}

class Mutation$unmuteFriend$HookResult {
  Mutation$unmuteFriend$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$unmuteFriend runMutation;

  final graphql.QueryResult<Mutation$unmuteFriend> result;
}

Mutation$unmuteFriend$HookResult useMutation$unmuteFriend(
    [WidgetOptions$Mutation$unmuteFriend? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$unmuteFriend());
  return Mutation$unmuteFriend$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$unmuteFriend> useWatchMutation$unmuteFriend(
        WatchOptions$Mutation$unmuteFriend options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$unmuteFriend
    extends graphql.MutationOptions<Mutation$unmuteFriend> {
  WidgetOptions$Mutation$unmuteFriend({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$unmuteFriend? onCompleted,
    graphql.OnMutationUpdate<Mutation$unmuteFriend>? update,
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
                    data == null ? null : _parserFn$Mutation$unmuteFriend(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationunmuteFriend,
          parserFn: _parserFn$Mutation$unmuteFriend,
        );

  final OnMutationCompleted$Mutation$unmuteFriend? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$unmuteFriend
    = graphql.MultiSourceResult<Mutation$unmuteFriend> Function(
  Variables$Mutation$unmuteFriend, {
  Object? optimisticResult,
});
typedef Builder$Mutation$unmuteFriend = widgets.Widget Function(
  RunMutation$Mutation$unmuteFriend,
  graphql.QueryResult<Mutation$unmuteFriend>?,
);

class Mutation$unmuteFriend$Widget
    extends graphql_flutter.Mutation<Mutation$unmuteFriend> {
  Mutation$unmuteFriend$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$unmuteFriend? options,
    required Builder$Mutation$unmuteFriend builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$unmuteFriend(),
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
