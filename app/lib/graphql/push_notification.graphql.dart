import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$registerPushNotificationToken {
  factory Variables$Mutation$registerPushNotificationToken(
          {required Input$RegisterPushNotificationTokenInput input}) =>
      Variables$Mutation$registerPushNotificationToken._({
        r'input': input,
      });

  Variables$Mutation$registerPushNotificationToken._(this._$data);

  factory Variables$Mutation$registerPushNotificationToken.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$RegisterPushNotificationTokenInput.fromJson(
        (l$input as Map<String, dynamic>));
    return Variables$Mutation$registerPushNotificationToken._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$RegisterPushNotificationTokenInput get input =>
      (_$data['input'] as Input$RegisterPushNotificationTokenInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$registerPushNotificationToken<
          Variables$Mutation$registerPushNotificationToken>
      get copyWith => CopyWith$Variables$Mutation$registerPushNotificationToken(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$registerPushNotificationToken) ||
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

abstract class CopyWith$Variables$Mutation$registerPushNotificationToken<TRes> {
  factory CopyWith$Variables$Mutation$registerPushNotificationToken(
    Variables$Mutation$registerPushNotificationToken instance,
    TRes Function(Variables$Mutation$registerPushNotificationToken) then,
  ) = _CopyWithImpl$Variables$Mutation$registerPushNotificationToken;

  factory CopyWith$Variables$Mutation$registerPushNotificationToken.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$registerPushNotificationToken;

  TRes call({Input$RegisterPushNotificationTokenInput? input});
}

class _CopyWithImpl$Variables$Mutation$registerPushNotificationToken<TRes>
    implements CopyWith$Variables$Mutation$registerPushNotificationToken<TRes> {
  _CopyWithImpl$Variables$Mutation$registerPushNotificationToken(
    this._instance,
    this._then,
  );

  final Variables$Mutation$registerPushNotificationToken _instance;

  final TRes Function(Variables$Mutation$registerPushNotificationToken) _then;

  static const _undefined = {};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$registerPushNotificationToken._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$RegisterPushNotificationTokenInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$registerPushNotificationToken<TRes>
    implements CopyWith$Variables$Mutation$registerPushNotificationToken<TRes> {
  _CopyWithStubImpl$Variables$Mutation$registerPushNotificationToken(this._res);

  TRes _res;

  call({Input$RegisterPushNotificationTokenInput? input}) => _res;
}

class Mutation$registerPushNotificationToken {
  Mutation$registerPushNotificationToken({
    required this.registerPushNotificationToken,
    required this.$__typename,
  });

  factory Mutation$registerPushNotificationToken.fromJson(
      Map<String, dynamic> json) {
    final l$registerPushNotificationToken =
        json['registerPushNotificationToken'];
    final l$$__typename = json['__typename'];
    return Mutation$registerPushNotificationToken(
      registerPushNotificationToken:
          Mutation$registerPushNotificationToken$registerPushNotificationToken
              .fromJson(
                  (l$registerPushNotificationToken as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$registerPushNotificationToken$registerPushNotificationToken
      registerPushNotificationToken;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$registerPushNotificationToken = registerPushNotificationToken;
    _resultData['registerPushNotificationToken'] =
        l$registerPushNotificationToken.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$registerPushNotificationToken = registerPushNotificationToken;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$registerPushNotificationToken,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$registerPushNotificationToken) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$registerPushNotificationToken = registerPushNotificationToken;
    final lOther$registerPushNotificationToken =
        other.registerPushNotificationToken;
    if (l$registerPushNotificationToken !=
        lOther$registerPushNotificationToken) {
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

extension UtilityExtension$Mutation$registerPushNotificationToken
    on Mutation$registerPushNotificationToken {
  CopyWith$Mutation$registerPushNotificationToken<
          Mutation$registerPushNotificationToken>
      get copyWith => CopyWith$Mutation$registerPushNotificationToken(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$registerPushNotificationToken<TRes> {
  factory CopyWith$Mutation$registerPushNotificationToken(
    Mutation$registerPushNotificationToken instance,
    TRes Function(Mutation$registerPushNotificationToken) then,
  ) = _CopyWithImpl$Mutation$registerPushNotificationToken;

  factory CopyWith$Mutation$registerPushNotificationToken.stub(TRes res) =
      _CopyWithStubImpl$Mutation$registerPushNotificationToken;

  TRes call({
    Mutation$registerPushNotificationToken$registerPushNotificationToken?
        registerPushNotificationToken,
    String? $__typename,
  });
  CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken<
      TRes> get registerPushNotificationToken;
}

class _CopyWithImpl$Mutation$registerPushNotificationToken<TRes>
    implements CopyWith$Mutation$registerPushNotificationToken<TRes> {
  _CopyWithImpl$Mutation$registerPushNotificationToken(
    this._instance,
    this._then,
  );

  final Mutation$registerPushNotificationToken _instance;

  final TRes Function(Mutation$registerPushNotificationToken) _then;

  static const _undefined = {};

  TRes call({
    Object? registerPushNotificationToken = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$registerPushNotificationToken(
        registerPushNotificationToken: registerPushNotificationToken ==
                    _undefined ||
                registerPushNotificationToken == null
            ? _instance.registerPushNotificationToken
            : (registerPushNotificationToken
                as Mutation$registerPushNotificationToken$registerPushNotificationToken),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken<
      TRes> get registerPushNotificationToken {
    final local$registerPushNotificationToken =
        _instance.registerPushNotificationToken;
    return CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken(
        local$registerPushNotificationToken,
        (e) => call(registerPushNotificationToken: e));
  }
}

class _CopyWithStubImpl$Mutation$registerPushNotificationToken<TRes>
    implements CopyWith$Mutation$registerPushNotificationToken<TRes> {
  _CopyWithStubImpl$Mutation$registerPushNotificationToken(this._res);

  TRes _res;

  call({
    Mutation$registerPushNotificationToken$registerPushNotificationToken?
        registerPushNotificationToken,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken<
          TRes>
      get registerPushNotificationToken =>
          CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken
              .stub(_res);
}

const documentNodeMutationregisterPushNotificationToken =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'registerPushNotificationToken'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'RegisterPushNotificationTokenInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'registerPushNotificationToken'),
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
            name: NameNode(value: 'registeredPushNotificationTokenId'),
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
Mutation$registerPushNotificationToken
    _parserFn$Mutation$registerPushNotificationToken(
            Map<String, dynamic> data) =>
        Mutation$registerPushNotificationToken.fromJson(data);
typedef OnMutationCompleted$Mutation$registerPushNotificationToken
    = FutureOr<void> Function(
  dynamic,
  Mutation$registerPushNotificationToken?,
);

class Options$Mutation$registerPushNotificationToken
    extends graphql.MutationOptions<Mutation$registerPushNotificationToken> {
  Options$Mutation$registerPushNotificationToken({
    String? operationName,
    required Variables$Mutation$registerPushNotificationToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$registerPushNotificationToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$registerPushNotificationToken>? update,
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
                        : _parserFn$Mutation$registerPushNotificationToken(
                            data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationregisterPushNotificationToken,
          parserFn: _parserFn$Mutation$registerPushNotificationToken,
        );

  final OnMutationCompleted$Mutation$registerPushNotificationToken?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$registerPushNotificationToken
    extends graphql.WatchQueryOptions<Mutation$registerPushNotificationToken> {
  WatchOptions$Mutation$registerPushNotificationToken({
    String? operationName,
    required Variables$Mutation$registerPushNotificationToken variables,
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
          document: documentNodeMutationregisterPushNotificationToken,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$registerPushNotificationToken,
        );
}

extension ClientExtension$Mutation$registerPushNotificationToken
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$registerPushNotificationToken>>
      mutate$registerPushNotificationToken(
              Options$Mutation$registerPushNotificationToken options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$registerPushNotificationToken>
      watchMutation$registerPushNotificationToken(
              WatchOptions$Mutation$registerPushNotificationToken options) =>
          this.watchMutation(options);
}

class Mutation$registerPushNotificationToken$HookResult {
  Mutation$registerPushNotificationToken$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$registerPushNotificationToken runMutation;

  final graphql.QueryResult<Mutation$registerPushNotificationToken> result;
}

Mutation$registerPushNotificationToken$HookResult
    useMutation$registerPushNotificationToken(
        [WidgetOptions$Mutation$registerPushNotificationToken? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$registerPushNotificationToken());
  return Mutation$registerPushNotificationToken$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$registerPushNotificationToken>
    useWatchMutation$registerPushNotificationToken(
            WatchOptions$Mutation$registerPushNotificationToken options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$registerPushNotificationToken
    extends graphql.MutationOptions<Mutation$registerPushNotificationToken> {
  WidgetOptions$Mutation$registerPushNotificationToken({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$registerPushNotificationToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$registerPushNotificationToken>? update,
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
                        : _parserFn$Mutation$registerPushNotificationToken(
                            data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationregisterPushNotificationToken,
          parserFn: _parserFn$Mutation$registerPushNotificationToken,
        );

  final OnMutationCompleted$Mutation$registerPushNotificationToken?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$registerPushNotificationToken
    = graphql.MultiSourceResult<Mutation$registerPushNotificationToken>
        Function(
  Variables$Mutation$registerPushNotificationToken, {
  Object? optimisticResult,
});
typedef Builder$Mutation$registerPushNotificationToken = widgets.Widget
    Function(
  RunMutation$Mutation$registerPushNotificationToken,
  graphql.QueryResult<Mutation$registerPushNotificationToken>?,
);

class Mutation$registerPushNotificationToken$Widget
    extends graphql_flutter.Mutation<Mutation$registerPushNotificationToken> {
  Mutation$registerPushNotificationToken$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$registerPushNotificationToken? options,
    required Builder$Mutation$registerPushNotificationToken builder,
  }) : super(
          key: key,
          options:
              options ?? WidgetOptions$Mutation$registerPushNotificationToken(),
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

class Mutation$registerPushNotificationToken$registerPushNotificationToken {
  Mutation$registerPushNotificationToken$registerPushNotificationToken({
    required this.registeredPushNotificationTokenId,
    required this.$__typename,
  });

  factory Mutation$registerPushNotificationToken$registerPushNotificationToken.fromJson(
      Map<String, dynamic> json) {
    final l$registeredPushNotificationTokenId =
        json['registeredPushNotificationTokenId'];
    final l$$__typename = json['__typename'];
    return Mutation$registerPushNotificationToken$registerPushNotificationToken(
      registeredPushNotificationTokenId:
          (l$registeredPushNotificationTokenId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String registeredPushNotificationTokenId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$registeredPushNotificationTokenId =
        registeredPushNotificationTokenId;
    _resultData['registeredPushNotificationTokenId'] =
        l$registeredPushNotificationTokenId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$registeredPushNotificationTokenId =
        registeredPushNotificationTokenId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$registeredPushNotificationTokenId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$registerPushNotificationToken$registerPushNotificationToken) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$registeredPushNotificationTokenId =
        registeredPushNotificationTokenId;
    final lOther$registeredPushNotificationTokenId =
        other.registeredPushNotificationTokenId;
    if (l$registeredPushNotificationTokenId !=
        lOther$registeredPushNotificationTokenId) {
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

extension UtilityExtension$Mutation$registerPushNotificationToken$registerPushNotificationToken
    on Mutation$registerPushNotificationToken$registerPushNotificationToken {
  CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken<
          Mutation$registerPushNotificationToken$registerPushNotificationToken>
      get copyWith =>
          CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken<
    TRes> {
  factory CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken(
    Mutation$registerPushNotificationToken$registerPushNotificationToken
        instance,
    TRes Function(
            Mutation$registerPushNotificationToken$registerPushNotificationToken)
        then,
  ) = _CopyWithImpl$Mutation$registerPushNotificationToken$registerPushNotificationToken;

  factory CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$registerPushNotificationToken$registerPushNotificationToken;

  TRes call({
    String? registeredPushNotificationTokenId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$registerPushNotificationToken$registerPushNotificationToken<
        TRes>
    implements
        CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken<
            TRes> {
  _CopyWithImpl$Mutation$registerPushNotificationToken$registerPushNotificationToken(
    this._instance,
    this._then,
  );

  final Mutation$registerPushNotificationToken$registerPushNotificationToken
      _instance;

  final TRes Function(
          Mutation$registerPushNotificationToken$registerPushNotificationToken)
      _then;

  static const _undefined = {};

  TRes call({
    Object? registeredPushNotificationTokenId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$registerPushNotificationToken$registerPushNotificationToken(
        registeredPushNotificationTokenId:
            registeredPushNotificationTokenId == _undefined ||
                    registeredPushNotificationTokenId == null
                ? _instance.registeredPushNotificationTokenId
                : (registeredPushNotificationTokenId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$registerPushNotificationToken$registerPushNotificationToken<
        TRes>
    implements
        CopyWith$Mutation$registerPushNotificationToken$registerPushNotificationToken<
            TRes> {
  _CopyWithStubImpl$Mutation$registerPushNotificationToken$registerPushNotificationToken(
      this._res);

  TRes _res;

  call({
    String? registeredPushNotificationTokenId,
    String? $__typename,
  }) =>
      _res;
}
