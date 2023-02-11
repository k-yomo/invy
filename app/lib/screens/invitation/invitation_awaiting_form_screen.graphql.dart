import '../../graphql/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$registerInvitationAwaiting {
  factory Variables$Mutation$registerInvitationAwaiting(
          {required Input$RegisterInvitationAwaitingInput input}) =>
      Variables$Mutation$registerInvitationAwaiting._({
        r'input': input,
      });

  Variables$Mutation$registerInvitationAwaiting._(this._$data);

  factory Variables$Mutation$registerInvitationAwaiting.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$RegisterInvitationAwaitingInput.fromJson(
        (l$input as Map<String, dynamic>));
    return Variables$Mutation$registerInvitationAwaiting._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$RegisterInvitationAwaitingInput get input =>
      (_$data['input'] as Input$RegisterInvitationAwaitingInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$registerInvitationAwaiting<
          Variables$Mutation$registerInvitationAwaiting>
      get copyWith => CopyWith$Variables$Mutation$registerInvitationAwaiting(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$registerInvitationAwaiting) ||
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

abstract class CopyWith$Variables$Mutation$registerInvitationAwaiting<TRes> {
  factory CopyWith$Variables$Mutation$registerInvitationAwaiting(
    Variables$Mutation$registerInvitationAwaiting instance,
    TRes Function(Variables$Mutation$registerInvitationAwaiting) then,
  ) = _CopyWithImpl$Variables$Mutation$registerInvitationAwaiting;

  factory CopyWith$Variables$Mutation$registerInvitationAwaiting.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$registerInvitationAwaiting;

  TRes call({Input$RegisterInvitationAwaitingInput? input});
}

class _CopyWithImpl$Variables$Mutation$registerInvitationAwaiting<TRes>
    implements CopyWith$Variables$Mutation$registerInvitationAwaiting<TRes> {
  _CopyWithImpl$Variables$Mutation$registerInvitationAwaiting(
    this._instance,
    this._then,
  );

  final Variables$Mutation$registerInvitationAwaiting _instance;

  final TRes Function(Variables$Mutation$registerInvitationAwaiting) _then;

  static const _undefined = {};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$registerInvitationAwaiting._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$RegisterInvitationAwaitingInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$registerInvitationAwaiting<TRes>
    implements CopyWith$Variables$Mutation$registerInvitationAwaiting<TRes> {
  _CopyWithStubImpl$Variables$Mutation$registerInvitationAwaiting(this._res);

  TRes _res;

  call({Input$RegisterInvitationAwaitingInput? input}) => _res;
}

class Mutation$registerInvitationAwaiting {
  Mutation$registerInvitationAwaiting({
    required this.registerInvitationAwaiting,
    required this.$__typename,
  });

  factory Mutation$registerInvitationAwaiting.fromJson(
      Map<String, dynamic> json) {
    final l$registerInvitationAwaiting = json['registerInvitationAwaiting'];
    final l$$__typename = json['__typename'];
    return Mutation$registerInvitationAwaiting(
      registerInvitationAwaiting:
          Mutation$registerInvitationAwaiting$registerInvitationAwaiting
              .fromJson((l$registerInvitationAwaiting as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$registerInvitationAwaiting$registerInvitationAwaiting
      registerInvitationAwaiting;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$registerInvitationAwaiting = registerInvitationAwaiting;
    _resultData['registerInvitationAwaiting'] =
        l$registerInvitationAwaiting.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$registerInvitationAwaiting = registerInvitationAwaiting;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$registerInvitationAwaiting,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$registerInvitationAwaiting) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$registerInvitationAwaiting = registerInvitationAwaiting;
    final lOther$registerInvitationAwaiting = other.registerInvitationAwaiting;
    if (l$registerInvitationAwaiting != lOther$registerInvitationAwaiting) {
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

extension UtilityExtension$Mutation$registerInvitationAwaiting
    on Mutation$registerInvitationAwaiting {
  CopyWith$Mutation$registerInvitationAwaiting<
          Mutation$registerInvitationAwaiting>
      get copyWith => CopyWith$Mutation$registerInvitationAwaiting(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$registerInvitationAwaiting<TRes> {
  factory CopyWith$Mutation$registerInvitationAwaiting(
    Mutation$registerInvitationAwaiting instance,
    TRes Function(Mutation$registerInvitationAwaiting) then,
  ) = _CopyWithImpl$Mutation$registerInvitationAwaiting;

  factory CopyWith$Mutation$registerInvitationAwaiting.stub(TRes res) =
      _CopyWithStubImpl$Mutation$registerInvitationAwaiting;

  TRes call({
    Mutation$registerInvitationAwaiting$registerInvitationAwaiting?
        registerInvitationAwaiting,
    String? $__typename,
  });
  CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<TRes>
      get registerInvitationAwaiting;
}

class _CopyWithImpl$Mutation$registerInvitationAwaiting<TRes>
    implements CopyWith$Mutation$registerInvitationAwaiting<TRes> {
  _CopyWithImpl$Mutation$registerInvitationAwaiting(
    this._instance,
    this._then,
  );

  final Mutation$registerInvitationAwaiting _instance;

  final TRes Function(Mutation$registerInvitationAwaiting) _then;

  static const _undefined = {};

  TRes call({
    Object? registerInvitationAwaiting = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$registerInvitationAwaiting(
        registerInvitationAwaiting: registerInvitationAwaiting == _undefined ||
                registerInvitationAwaiting == null
            ? _instance.registerInvitationAwaiting
            : (registerInvitationAwaiting
                as Mutation$registerInvitationAwaiting$registerInvitationAwaiting),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<TRes>
      get registerInvitationAwaiting {
    final local$registerInvitationAwaiting =
        _instance.registerInvitationAwaiting;
    return CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting(
        local$registerInvitationAwaiting,
        (e) => call(registerInvitationAwaiting: e));
  }
}

class _CopyWithStubImpl$Mutation$registerInvitationAwaiting<TRes>
    implements CopyWith$Mutation$registerInvitationAwaiting<TRes> {
  _CopyWithStubImpl$Mutation$registerInvitationAwaiting(this._res);

  TRes _res;

  call({
    Mutation$registerInvitationAwaiting$registerInvitationAwaiting?
        registerInvitationAwaiting,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<TRes>
      get registerInvitationAwaiting =>
          CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting
              .stub(_res);
}

const documentNodeMutationregisterInvitationAwaiting =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'registerInvitationAwaiting'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'RegisterInvitationAwaitingInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'registerInvitationAwaiting'),
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
            name: NameNode(value: 'invitationAwaiting'),
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
                name: NameNode(value: 'userId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'startsAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'endsAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'comment'),
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
]);
Mutation$registerInvitationAwaiting
    _parserFn$Mutation$registerInvitationAwaiting(Map<String, dynamic> data) =>
        Mutation$registerInvitationAwaiting.fromJson(data);
typedef OnMutationCompleted$Mutation$registerInvitationAwaiting = FutureOr<void>
    Function(
  dynamic,
  Mutation$registerInvitationAwaiting?,
);

class Options$Mutation$registerInvitationAwaiting
    extends graphql.MutationOptions<Mutation$registerInvitationAwaiting> {
  Options$Mutation$registerInvitationAwaiting({
    String? operationName,
    required Variables$Mutation$registerInvitationAwaiting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$registerInvitationAwaiting? onCompleted,
    graphql.OnMutationUpdate<Mutation$registerInvitationAwaiting>? update,
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
                        : _parserFn$Mutation$registerInvitationAwaiting(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationregisterInvitationAwaiting,
          parserFn: _parserFn$Mutation$registerInvitationAwaiting,
        );

  final OnMutationCompleted$Mutation$registerInvitationAwaiting?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$registerInvitationAwaiting
    extends graphql.WatchQueryOptions<Mutation$registerInvitationAwaiting> {
  WatchOptions$Mutation$registerInvitationAwaiting({
    String? operationName,
    required Variables$Mutation$registerInvitationAwaiting variables,
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
          document: documentNodeMutationregisterInvitationAwaiting,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$registerInvitationAwaiting,
        );
}

extension ClientExtension$Mutation$registerInvitationAwaiting
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$registerInvitationAwaiting>>
      mutate$registerInvitationAwaiting(
              Options$Mutation$registerInvitationAwaiting options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$registerInvitationAwaiting>
      watchMutation$registerInvitationAwaiting(
              WatchOptions$Mutation$registerInvitationAwaiting options) =>
          this.watchMutation(options);
}

class Mutation$registerInvitationAwaiting$HookResult {
  Mutation$registerInvitationAwaiting$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$registerInvitationAwaiting runMutation;

  final graphql.QueryResult<Mutation$registerInvitationAwaiting> result;
}

Mutation$registerInvitationAwaiting$HookResult
    useMutation$registerInvitationAwaiting(
        [WidgetOptions$Mutation$registerInvitationAwaiting? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$registerInvitationAwaiting());
  return Mutation$registerInvitationAwaiting$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$registerInvitationAwaiting>
    useWatchMutation$registerInvitationAwaiting(
            WatchOptions$Mutation$registerInvitationAwaiting options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$registerInvitationAwaiting
    extends graphql.MutationOptions<Mutation$registerInvitationAwaiting> {
  WidgetOptions$Mutation$registerInvitationAwaiting({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$registerInvitationAwaiting? onCompleted,
    graphql.OnMutationUpdate<Mutation$registerInvitationAwaiting>? update,
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
                        : _parserFn$Mutation$registerInvitationAwaiting(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationregisterInvitationAwaiting,
          parserFn: _parserFn$Mutation$registerInvitationAwaiting,
        );

  final OnMutationCompleted$Mutation$registerInvitationAwaiting?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$registerInvitationAwaiting
    = graphql.MultiSourceResult<Mutation$registerInvitationAwaiting> Function(
  Variables$Mutation$registerInvitationAwaiting, {
  Object? optimisticResult,
});
typedef Builder$Mutation$registerInvitationAwaiting = widgets.Widget Function(
  RunMutation$Mutation$registerInvitationAwaiting,
  graphql.QueryResult<Mutation$registerInvitationAwaiting>?,
);

class Mutation$registerInvitationAwaiting$Widget
    extends graphql_flutter.Mutation<Mutation$registerInvitationAwaiting> {
  Mutation$registerInvitationAwaiting$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$registerInvitationAwaiting? options,
    required Builder$Mutation$registerInvitationAwaiting builder,
  }) : super(
          key: key,
          options:
              options ?? WidgetOptions$Mutation$registerInvitationAwaiting(),
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

class Mutation$registerInvitationAwaiting$registerInvitationAwaiting {
  Mutation$registerInvitationAwaiting$registerInvitationAwaiting({
    required this.invitationAwaiting,
    required this.$__typename,
  });

  factory Mutation$registerInvitationAwaiting$registerInvitationAwaiting.fromJson(
      Map<String, dynamic> json) {
    final l$invitationAwaiting = json['invitationAwaiting'];
    final l$$__typename = json['__typename'];
    return Mutation$registerInvitationAwaiting$registerInvitationAwaiting(
      invitationAwaiting:
          Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting
              .fromJson((l$invitationAwaiting as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting
      invitationAwaiting;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$invitationAwaiting = invitationAwaiting;
    _resultData['invitationAwaiting'] = l$invitationAwaiting.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$invitationAwaiting = invitationAwaiting;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$invitationAwaiting,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$registerInvitationAwaiting$registerInvitationAwaiting) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitationAwaiting = invitationAwaiting;
    final lOther$invitationAwaiting = other.invitationAwaiting;
    if (l$invitationAwaiting != lOther$invitationAwaiting) {
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

extension UtilityExtension$Mutation$registerInvitationAwaiting$registerInvitationAwaiting
    on Mutation$registerInvitationAwaiting$registerInvitationAwaiting {
  CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<
          Mutation$registerInvitationAwaiting$registerInvitationAwaiting>
      get copyWith =>
          CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<
    TRes> {
  factory CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting(
    Mutation$registerInvitationAwaiting$registerInvitationAwaiting instance,
    TRes Function(
            Mutation$registerInvitationAwaiting$registerInvitationAwaiting)
        then,
  ) = _CopyWithImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting;

  factory CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting;

  TRes call({
    Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting?
        invitationAwaiting,
    String? $__typename,
  });
  CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
      TRes> get invitationAwaiting;
}

class _CopyWithImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<
        TRes>
    implements
        CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<
            TRes> {
  _CopyWithImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting(
    this._instance,
    this._then,
  );

  final Mutation$registerInvitationAwaiting$registerInvitationAwaiting
      _instance;

  final TRes Function(
      Mutation$registerInvitationAwaiting$registerInvitationAwaiting) _then;

  static const _undefined = {};

  TRes call({
    Object? invitationAwaiting = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$registerInvitationAwaiting$registerInvitationAwaiting(
        invitationAwaiting: invitationAwaiting == _undefined ||
                invitationAwaiting == null
            ? _instance.invitationAwaiting
            : (invitationAwaiting
                as Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
      TRes> get invitationAwaiting {
    final local$invitationAwaiting = _instance.invitationAwaiting;
    return CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting(
        local$invitationAwaiting, (e) => call(invitationAwaiting: e));
  }
}

class _CopyWithStubImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<
        TRes>
    implements
        CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting<
            TRes> {
  _CopyWithStubImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting(
      this._res);

  TRes _res;

  call({
    Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting?
        invitationAwaiting,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
          TRes>
      get invitationAwaiting =>
          CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting
              .stub(_res);
}

class Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting {
  Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting({
    required this.id,
    required this.userId,
    required this.startsAt,
    required this.endsAt,
    required this.comment,
    required this.$__typename,
  });

  factory Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$startsAt = json['startsAt'];
    final l$endsAt = json['endsAt'];
    final l$comment = json['comment'];
    final l$$__typename = json['__typename'];
    return Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting(
      id: (l$id as String),
      userId: (l$userId as String),
      startsAt: DateTime.parse((l$startsAt as String)),
      endsAt: DateTime.parse((l$endsAt as String)),
      comment: (l$comment as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String userId;

  final DateTime startsAt;

  final DateTime endsAt;

  final String comment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$startsAt = startsAt;
    _resultData['startsAt'] = l$startsAt.toIso8601String();
    final l$endsAt = endsAt;
    _resultData['endsAt'] = l$endsAt.toIso8601String();
    final l$comment = comment;
    _resultData['comment'] = l$comment;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$userId = userId;
    final l$startsAt = startsAt;
    final l$endsAt = endsAt;
    final l$comment = comment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$userId,
      l$startsAt,
      l$endsAt,
      l$comment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$startsAt = startsAt;
    final lOther$startsAt = other.startsAt;
    if (l$startsAt != lOther$startsAt) {
      return false;
    }
    final l$endsAt = endsAt;
    final lOther$endsAt = other.endsAt;
    if (l$endsAt != lOther$endsAt) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
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

extension UtilityExtension$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting
    on Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting {
  CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
          Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting>
      get copyWith =>
          CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
    TRes> {
  factory CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting(
    Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting
        instance,
    TRes Function(
            Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting)
        then,
  ) = _CopyWithImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting;

  factory CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting;

  TRes call({
    String? id,
    String? userId,
    DateTime? startsAt,
    DateTime? endsAt,
    String? comment,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
        TRes>
    implements
        CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
            TRes> {
  _CopyWithImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting(
    this._instance,
    this._then,
  );

  final Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting
      _instance;

  final TRes Function(
          Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? startsAt = _undefined,
    Object? endsAt = _undefined,
    Object? comment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        startsAt: startsAt == _undefined || startsAt == null
            ? _instance.startsAt
            : (startsAt as DateTime),
        endsAt: endsAt == _undefined || endsAt == null
            ? _instance.endsAt
            : (endsAt as DateTime),
        comment: comment == _undefined || comment == null
            ? _instance.comment
            : (comment as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
        TRes>
    implements
        CopyWith$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting<
            TRes> {
  _CopyWithStubImpl$Mutation$registerInvitationAwaiting$registerInvitationAwaiting$invitationAwaiting(
      this._res);

  TRes _res;

  call({
    String? id,
    String? userId,
    DateTime? startsAt,
    DateTime? endsAt,
    String? comment,
    String? $__typename,
  }) =>
      _res;
}
