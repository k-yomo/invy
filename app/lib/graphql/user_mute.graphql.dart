import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$muteFriend {
  factory Variables$Mutation$muteFriend({required String userId}) =>
      Variables$Mutation$muteFriend._({
        r'userId': userId,
      });

  Variables$Mutation$muteFriend._(this._$data);

  factory Variables$Mutation$muteFriend.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Mutation$muteFriend._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
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
    if (other is! Variables$Mutation$muteFriend ||
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

abstract class CopyWith$Variables$Mutation$muteFriend<TRes> {
  factory CopyWith$Variables$Mutation$muteFriend(
    Variables$Mutation$muteFriend instance,
    TRes Function(Variables$Mutation$muteFriend) then,
  ) = _CopyWithImpl$Variables$Mutation$muteFriend;

  factory CopyWith$Variables$Mutation$muteFriend.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$muteFriend;

  TRes call({String? userId});
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

  @override
  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Mutation$muteFriend._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$muteFriend<TRes>
    implements CopyWith$Variables$Mutation$muteFriend<TRes> {
  _CopyWithStubImpl$Variables$Mutation$muteFriend(this._res);

  final TRes _res;

  @override
  call({String? userId}) => _res;
}

class Mutation$muteFriend {
  Mutation$muteFriend({
    required this.muteUser,
    required this.$__typename,
  });

  factory Mutation$muteFriend.fromJson(Map<String, dynamic> json) {
    final l$muteUser = json['muteUser'];
    final l$$Typename = json['__typename'];
    return Mutation$muteFriend(
      muteUser: Mutation$muteFriend$muteUser.fromJson(
          (l$muteUser as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Mutation$muteFriend$muteUser muteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$muteUser = muteUser;
    resultData['muteUser'] = l$muteUser.toJson();
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$muteUser = muteUser;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$muteUser,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$muteFriend || runtimeType != other.runtimeType) {
      return false;
    }
    final l$muteUser = muteUser;
    final lOther$muteUser = other.muteUser;
    if (l$muteUser != lOther$muteUser) {
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
    Mutation$muteFriend$muteUser? muteUser,
    String? $__typename,
  });
  CopyWith$Mutation$muteFriend$muteUser<TRes> get muteUser;
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

  @override
  TRes call({
    Object? muteUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$muteFriend(
        muteUser: muteUser == _undefined || muteUser == null
            ? _instance.muteUser
            : (muteUser as Mutation$muteFriend$muteUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Mutation$muteFriend$muteUser<TRes> get muteUser {
    final local$muteUser = _instance.muteUser;
    return CopyWith$Mutation$muteFriend$muteUser(
        local$muteUser, (e) => call(muteUser: e));
  }
}

class _CopyWithStubImpl$Mutation$muteFriend<TRes>
    implements CopyWith$Mutation$muteFriend<TRes> {
  _CopyWithStubImpl$Mutation$muteFriend(this._res);

  final TRes _res;

  @override
  call({
    Mutation$muteFriend$muteUser? muteUser,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Mutation$muteFriend$muteUser<TRes> get muteUser =>
      CopyWith$Mutation$muteFriend$muteUser.stub(_res);
}

const documentNodeMutationmuteFriend = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'muteFriend'),
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
      await mutate(options);
  graphql.ObservableQuery<Mutation$muteFriend> watchMutation$muteFriend(
          WatchOptions$Mutation$muteFriend options) =>
      watchMutation(options);
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

class Mutation$muteFriend$muteUser {
  Mutation$muteFriend$muteUser({
    required this.mutedUserId,
    required this.$__typename,
  });

  factory Mutation$muteFriend$muteUser.fromJson(Map<String, dynamic> json) {
    final l$mutedUserId = json['mutedUserId'];
    final l$$Typename = json['__typename'];
    return Mutation$muteFriend$muteUser(
      mutedUserId: (l$mutedUserId as String),
      $__typename: (l$$Typename as String),
    );
  }

  final String mutedUserId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$mutedUserId = mutedUserId;
    resultData['mutedUserId'] = l$mutedUserId;
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$mutedUserId = mutedUserId;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$mutedUserId,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$muteFriend$muteUser ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mutedUserId = mutedUserId;
    final lOther$mutedUserId = other.mutedUserId;
    if (l$mutedUserId != lOther$mutedUserId) {
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

extension UtilityExtension$Mutation$muteFriend$muteUser
    on Mutation$muteFriend$muteUser {
  CopyWith$Mutation$muteFriend$muteUser<Mutation$muteFriend$muteUser>
      get copyWith => CopyWith$Mutation$muteFriend$muteUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$muteFriend$muteUser<TRes> {
  factory CopyWith$Mutation$muteFriend$muteUser(
    Mutation$muteFriend$muteUser instance,
    TRes Function(Mutation$muteFriend$muteUser) then,
  ) = _CopyWithImpl$Mutation$muteFriend$muteUser;

  factory CopyWith$Mutation$muteFriend$muteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$muteFriend$muteUser;

  TRes call({
    String? mutedUserId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$muteFriend$muteUser<TRes>
    implements CopyWith$Mutation$muteFriend$muteUser<TRes> {
  _CopyWithImpl$Mutation$muteFriend$muteUser(
    this._instance,
    this._then,
  );

  final Mutation$muteFriend$muteUser _instance;

  final TRes Function(Mutation$muteFriend$muteUser) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? mutedUserId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$muteFriend$muteUser(
        mutedUserId: mutedUserId == _undefined || mutedUserId == null
            ? _instance.mutedUserId
            : (mutedUserId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$muteFriend$muteUser<TRes>
    implements CopyWith$Mutation$muteFriend$muteUser<TRes> {
  _CopyWithStubImpl$Mutation$muteFriend$muteUser(this._res);

  final TRes _res;

  @override
  call({
    String? mutedUserId,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$unmuteFriend {
  factory Variables$Mutation$unmuteFriend({required String userId}) =>
      Variables$Mutation$unmuteFriend._({
        r'userId': userId,
      });

  Variables$Mutation$unmuteFriend._(this._$data);

  factory Variables$Mutation$unmuteFriend.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Mutation$unmuteFriend._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
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
    if (other is! Variables$Mutation$unmuteFriend ||
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

abstract class CopyWith$Variables$Mutation$unmuteFriend<TRes> {
  factory CopyWith$Variables$Mutation$unmuteFriend(
    Variables$Mutation$unmuteFriend instance,
    TRes Function(Variables$Mutation$unmuteFriend) then,
  ) = _CopyWithImpl$Variables$Mutation$unmuteFriend;

  factory CopyWith$Variables$Mutation$unmuteFriend.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$unmuteFriend;

  TRes call({String? userId});
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

  @override
  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Mutation$unmuteFriend._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$unmuteFriend<TRes>
    implements CopyWith$Variables$Mutation$unmuteFriend<TRes> {
  _CopyWithStubImpl$Variables$Mutation$unmuteFriend(this._res);

  final TRes _res;

  @override
  call({String? userId}) => _res;
}

class Mutation$unmuteFriend {
  Mutation$unmuteFriend({
    required this.unmuteUser,
    required this.$__typename,
  });

  factory Mutation$unmuteFriend.fromJson(Map<String, dynamic> json) {
    final l$unmuteUser = json['unmuteUser'];
    final l$$Typename = json['__typename'];
    return Mutation$unmuteFriend(
      unmuteUser: Mutation$unmuteFriend$unmuteUser.fromJson(
          (l$unmuteUser as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Mutation$unmuteFriend$unmuteUser unmuteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$unmuteUser = unmuteUser;
    resultData['unmuteUser'] = l$unmuteUser.toJson();
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$unmuteUser = unmuteUser;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$unmuteUser,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$unmuteFriend || runtimeType != other.runtimeType) {
      return false;
    }
    final l$unmuteUser = unmuteUser;
    final lOther$unmuteUser = other.unmuteUser;
    if (l$unmuteUser != lOther$unmuteUser) {
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
    Mutation$unmuteFriend$unmuteUser? unmuteUser,
    String? $__typename,
  });
  CopyWith$Mutation$unmuteFriend$unmuteUser<TRes> get unmuteUser;
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

  @override
  TRes call({
    Object? unmuteUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$unmuteFriend(
        unmuteUser: unmuteUser == _undefined || unmuteUser == null
            ? _instance.unmuteUser
            : (unmuteUser as Mutation$unmuteFriend$unmuteUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Mutation$unmuteFriend$unmuteUser<TRes> get unmuteUser {
    final local$unmuteUser = _instance.unmuteUser;
    return CopyWith$Mutation$unmuteFriend$unmuteUser(
        local$unmuteUser, (e) => call(unmuteUser: e));
  }
}

class _CopyWithStubImpl$Mutation$unmuteFriend<TRes>
    implements CopyWith$Mutation$unmuteFriend<TRes> {
  _CopyWithStubImpl$Mutation$unmuteFriend(this._res);

  final TRes _res;

  @override
  call({
    Mutation$unmuteFriend$unmuteUser? unmuteUser,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Mutation$unmuteFriend$unmuteUser<TRes> get unmuteUser =>
      CopyWith$Mutation$unmuteFriend$unmuteUser.stub(_res);
}

const documentNodeMutationunmuteFriend = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unmuteFriend'),
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
      await mutate(options);
  graphql.ObservableQuery<Mutation$unmuteFriend> watchMutation$unmuteFriend(
          WatchOptions$Mutation$unmuteFriend options) =>
      watchMutation(options);
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

class Mutation$unmuteFriend$unmuteUser {
  Mutation$unmuteFriend$unmuteUser({
    required this.unmutedUserId,
    required this.$__typename,
  });

  factory Mutation$unmuteFriend$unmuteUser.fromJson(Map<String, dynamic> json) {
    final l$unmutedUserId = json['unmutedUserId'];
    final l$$Typename = json['__typename'];
    return Mutation$unmuteFriend$unmuteUser(
      unmutedUserId: (l$unmutedUserId as String),
      $__typename: (l$$Typename as String),
    );
  }

  final String unmutedUserId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$unmutedUserId = unmutedUserId;
    resultData['unmutedUserId'] = l$unmutedUserId;
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$unmutedUserId = unmutedUserId;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$unmutedUserId,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$unmuteFriend$unmuteUser ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$unmutedUserId = unmutedUserId;
    final lOther$unmutedUserId = other.unmutedUserId;
    if (l$unmutedUserId != lOther$unmutedUserId) {
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

extension UtilityExtension$Mutation$unmuteFriend$unmuteUser
    on Mutation$unmuteFriend$unmuteUser {
  CopyWith$Mutation$unmuteFriend$unmuteUser<Mutation$unmuteFriend$unmuteUser>
      get copyWith => CopyWith$Mutation$unmuteFriend$unmuteUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$unmuteFriend$unmuteUser<TRes> {
  factory CopyWith$Mutation$unmuteFriend$unmuteUser(
    Mutation$unmuteFriend$unmuteUser instance,
    TRes Function(Mutation$unmuteFriend$unmuteUser) then,
  ) = _CopyWithImpl$Mutation$unmuteFriend$unmuteUser;

  factory CopyWith$Mutation$unmuteFriend$unmuteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$unmuteFriend$unmuteUser;

  TRes call({
    String? unmutedUserId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$unmuteFriend$unmuteUser<TRes>
    implements CopyWith$Mutation$unmuteFriend$unmuteUser<TRes> {
  _CopyWithImpl$Mutation$unmuteFriend$unmuteUser(
    this._instance,
    this._then,
  );

  final Mutation$unmuteFriend$unmuteUser _instance;

  final TRes Function(Mutation$unmuteFriend$unmuteUser) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? unmutedUserId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$unmuteFriend$unmuteUser(
        unmutedUserId: unmutedUserId == _undefined || unmutedUserId == null
            ? _instance.unmutedUserId
            : (unmutedUserId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$unmuteFriend$unmuteUser<TRes>
    implements CopyWith$Mutation$unmuteFriend$unmuteUser<TRes> {
  _CopyWithStubImpl$Mutation$unmuteFriend$unmuteUser(this._res);

  final TRes _res;

  @override
  call({
    String? unmutedUserId,
    String? $__typename,
  }) =>
      _res;
}
