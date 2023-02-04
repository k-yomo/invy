import '../graphql/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$viewer {
  Query$viewer({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$viewer.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$viewer(
      viewer: Query$viewer$viewer.fromJson((l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$viewer$viewer viewer;

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
    if (!(other is Query$viewer) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$viewer on Query$viewer {
  CopyWith$Query$viewer<Query$viewer> get copyWith => CopyWith$Query$viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$viewer<TRes> {
  factory CopyWith$Query$viewer(
    Query$viewer instance,
    TRes Function(Query$viewer) then,
  ) = _CopyWithImpl$Query$viewer;

  factory CopyWith$Query$viewer.stub(TRes res) = _CopyWithStubImpl$Query$viewer;

  TRes call({
    Query$viewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$viewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$viewer<TRes> implements CopyWith$Query$viewer<TRes> {
  _CopyWithImpl$Query$viewer(
    this._instance,
    this._then,
  );

  final Query$viewer _instance;

  final TRes Function(Query$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$viewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$viewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$viewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$viewer$viewer(local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$viewer<TRes>
    implements CopyWith$Query$viewer<TRes> {
  _CopyWithStubImpl$Query$viewer(this._res);

  TRes _res;

  call({
    Query$viewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$viewer$viewer<TRes> get viewer =>
      CopyWith$Query$viewer$viewer.stub(_res);
}

const documentNodeQueryviewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'viewer'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'viewer'),
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
            name: NameNode(value: 'screenId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'nickname'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatarUrl'),
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
Query$viewer _parserFn$Query$viewer(Map<String, dynamic> data) =>
    Query$viewer.fromJson(data);

class Options$Query$viewer extends graphql.QueryOptions<Query$viewer> {
  Options$Query$viewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryviewer,
          parserFn: _parserFn$Query$viewer,
        );
}

class WatchOptions$Query$viewer
    extends graphql.WatchQueryOptions<Query$viewer> {
  WatchOptions$Query$viewer({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryviewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$viewer,
        );
}

class FetchMoreOptions$Query$viewer extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$viewer({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryviewer,
        );
}

extension ClientExtension$Query$viewer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$viewer>> query$viewer(
          [Options$Query$viewer? options]) async =>
      await this.query(options ?? Options$Query$viewer());
  graphql.ObservableQuery<Query$viewer> watchQuery$viewer(
          [WatchOptions$Query$viewer? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$viewer());
  void writeQuery$viewer({
    required Query$viewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryviewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$viewer? readQuery$viewer({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryviewer)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$viewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$viewer> useQuery$viewer(
        [Options$Query$viewer? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$viewer());
graphql.ObservableQuery<Query$viewer> useWatchQuery$viewer(
        [WatchOptions$Query$viewer? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$viewer());

class Query$viewer$Widget extends graphql_flutter.Query<Query$viewer> {
  Query$viewer$Widget({
    widgets.Key? key,
    Options$Query$viewer? options,
    required graphql_flutter.QueryBuilder<Query$viewer> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$viewer(),
          builder: builder,
        );
}

class Query$viewer$viewer {
  Query$viewer$viewer({
    required this.id,
    required this.screenId,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Query$viewer$viewer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$screenId = json['screenId'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$viewer$viewer(
      id: (l$id as String),
      screenId: (l$screenId as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String screenId;

  final String nickname;

  final String avatarUrl;

  final String $__typename;

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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$screenId = screenId;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$screenId,
      l$nickname,
      l$avatarUrl,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$viewer$viewer) || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$viewer$viewer on Query$viewer$viewer {
  CopyWith$Query$viewer$viewer<Query$viewer$viewer> get copyWith =>
      CopyWith$Query$viewer$viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$viewer$viewer<TRes> {
  factory CopyWith$Query$viewer$viewer(
    Query$viewer$viewer instance,
    TRes Function(Query$viewer$viewer) then,
  ) = _CopyWithImpl$Query$viewer$viewer;

  factory CopyWith$Query$viewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$viewer$viewer;

  TRes call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$viewer$viewer<TRes>
    implements CopyWith$Query$viewer$viewer<TRes> {
  _CopyWithImpl$Query$viewer$viewer(
    this._instance,
    this._then,
  );

  final Query$viewer$viewer _instance;

  final TRes Function(Query$viewer$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? screenId = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$viewer$viewer(
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$viewer$viewer<TRes>
    implements CopyWith$Query$viewer$viewer<TRes> {
  _CopyWithStubImpl$Query$viewer$viewer(this._res);

  TRes _res;

  call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$signUp {
  factory Variables$Mutation$signUp({required Input$SignUpInput input}) =>
      Variables$Mutation$signUp._({
        r'input': input,
      });

  Variables$Mutation$signUp._(this._$data);

  factory Variables$Mutation$signUp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$SignUpInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$signUp._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SignUpInput get input => (_$data['input'] as Input$SignUpInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$signUp<Variables$Mutation$signUp> get copyWith =>
      CopyWith$Variables$Mutation$signUp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$signUp) ||
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

abstract class CopyWith$Variables$Mutation$signUp<TRes> {
  factory CopyWith$Variables$Mutation$signUp(
    Variables$Mutation$signUp instance,
    TRes Function(Variables$Mutation$signUp) then,
  ) = _CopyWithImpl$Variables$Mutation$signUp;

  factory CopyWith$Variables$Mutation$signUp.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$signUp;

  TRes call({Input$SignUpInput? input});
}

class _CopyWithImpl$Variables$Mutation$signUp<TRes>
    implements CopyWith$Variables$Mutation$signUp<TRes> {
  _CopyWithImpl$Variables$Mutation$signUp(
    this._instance,
    this._then,
  );

  final Variables$Mutation$signUp _instance;

  final TRes Function(Variables$Mutation$signUp) _then;

  static const _undefined = {};

  TRes call({Object? input = _undefined}) => _then(Variables$Mutation$signUp._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$SignUpInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$signUp<TRes>
    implements CopyWith$Variables$Mutation$signUp<TRes> {
  _CopyWithStubImpl$Variables$Mutation$signUp(this._res);

  TRes _res;

  call({Input$SignUpInput? input}) => _res;
}

class Mutation$signUp {
  Mutation$signUp({
    required this.signUp,
    required this.$__typename,
  });

  factory Mutation$signUp.fromJson(Map<String, dynamic> json) {
    final l$signUp = json['signUp'];
    final l$$__typename = json['__typename'];
    return Mutation$signUp(
      signUp:
          Mutation$signUp$signUp.fromJson((l$signUp as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$signUp$signUp signUp;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signUp = signUp;
    _resultData['signUp'] = l$signUp.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signUp = signUp;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$signUp,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$signUp) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signUp = signUp;
    final lOther$signUp = other.signUp;
    if (l$signUp != lOther$signUp) {
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

extension UtilityExtension$Mutation$signUp on Mutation$signUp {
  CopyWith$Mutation$signUp<Mutation$signUp> get copyWith =>
      CopyWith$Mutation$signUp(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$signUp<TRes> {
  factory CopyWith$Mutation$signUp(
    Mutation$signUp instance,
    TRes Function(Mutation$signUp) then,
  ) = _CopyWithImpl$Mutation$signUp;

  factory CopyWith$Mutation$signUp.stub(TRes res) =
      _CopyWithStubImpl$Mutation$signUp;

  TRes call({
    Mutation$signUp$signUp? signUp,
    String? $__typename,
  });
  CopyWith$Mutation$signUp$signUp<TRes> get signUp;
}

class _CopyWithImpl$Mutation$signUp<TRes>
    implements CopyWith$Mutation$signUp<TRes> {
  _CopyWithImpl$Mutation$signUp(
    this._instance,
    this._then,
  );

  final Mutation$signUp _instance;

  final TRes Function(Mutation$signUp) _then;

  static const _undefined = {};

  TRes call({
    Object? signUp = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$signUp(
        signUp: signUp == _undefined || signUp == null
            ? _instance.signUp
            : (signUp as Mutation$signUp$signUp),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$signUp$signUp<TRes> get signUp {
    final local$signUp = _instance.signUp;
    return CopyWith$Mutation$signUp$signUp(
        local$signUp, (e) => call(signUp: e));
  }
}

class _CopyWithStubImpl$Mutation$signUp<TRes>
    implements CopyWith$Mutation$signUp<TRes> {
  _CopyWithStubImpl$Mutation$signUp(this._res);

  TRes _res;

  call({
    Mutation$signUp$signUp? signUp,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$signUp$signUp<TRes> get signUp =>
      CopyWith$Mutation$signUp$signUp.stub(_res);
}

const documentNodeMutationsignUp = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'signUp'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SignUpInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'signUp'),
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
            name: NameNode(value: 'viewer'),
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
                name: NameNode(value: 'screenId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'nickname'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'avatarUrl'),
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
Mutation$signUp _parserFn$Mutation$signUp(Map<String, dynamic> data) =>
    Mutation$signUp.fromJson(data);
typedef OnMutationCompleted$Mutation$signUp = FutureOr<void> Function(
  dynamic,
  Mutation$signUp?,
);

class Options$Mutation$signUp extends graphql.MutationOptions<Mutation$signUp> {
  Options$Mutation$signUp({
    String? operationName,
    required Variables$Mutation$signUp variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$signUp? onCompleted,
    graphql.OnMutationUpdate<Mutation$signUp>? update,
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
                    data == null ? null : _parserFn$Mutation$signUp(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsignUp,
          parserFn: _parserFn$Mutation$signUp,
        );

  final OnMutationCompleted$Mutation$signUp? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$signUp
    extends graphql.WatchQueryOptions<Mutation$signUp> {
  WatchOptions$Mutation$signUp({
    String? operationName,
    required Variables$Mutation$signUp variables,
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
          document: documentNodeMutationsignUp,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$signUp,
        );
}

extension ClientExtension$Mutation$signUp on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$signUp>> mutate$signUp(
          Options$Mutation$signUp options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$signUp> watchMutation$signUp(
          WatchOptions$Mutation$signUp options) =>
      this.watchMutation(options);
}

class Mutation$signUp$HookResult {
  Mutation$signUp$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$signUp runMutation;

  final graphql.QueryResult<Mutation$signUp> result;
}

Mutation$signUp$HookResult useMutation$signUp(
    [WidgetOptions$Mutation$signUp? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$signUp());
  return Mutation$signUp$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$signUp> useWatchMutation$signUp(
        WatchOptions$Mutation$signUp options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$signUp
    extends graphql.MutationOptions<Mutation$signUp> {
  WidgetOptions$Mutation$signUp({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$signUp? onCompleted,
    graphql.OnMutationUpdate<Mutation$signUp>? update,
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
                    data == null ? null : _parserFn$Mutation$signUp(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsignUp,
          parserFn: _parserFn$Mutation$signUp,
        );

  final OnMutationCompleted$Mutation$signUp? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$signUp = graphql.MultiSourceResult<Mutation$signUp>
    Function(
  Variables$Mutation$signUp, {
  Object? optimisticResult,
});
typedef Builder$Mutation$signUp = widgets.Widget Function(
  RunMutation$Mutation$signUp,
  graphql.QueryResult<Mutation$signUp>?,
);

class Mutation$signUp$Widget extends graphql_flutter.Mutation<Mutation$signUp> {
  Mutation$signUp$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$signUp? options,
    required Builder$Mutation$signUp builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$signUp(),
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

class Mutation$signUp$signUp {
  Mutation$signUp$signUp({
    required this.viewer,
    required this.$__typename,
  });

  factory Mutation$signUp$signUp.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Mutation$signUp$signUp(
      viewer: Mutation$signUp$signUp$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$signUp$signUp$viewer viewer;

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
    if (!(other is Mutation$signUp$signUp) ||
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

extension UtilityExtension$Mutation$signUp$signUp on Mutation$signUp$signUp {
  CopyWith$Mutation$signUp$signUp<Mutation$signUp$signUp> get copyWith =>
      CopyWith$Mutation$signUp$signUp(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$signUp$signUp<TRes> {
  factory CopyWith$Mutation$signUp$signUp(
    Mutation$signUp$signUp instance,
    TRes Function(Mutation$signUp$signUp) then,
  ) = _CopyWithImpl$Mutation$signUp$signUp;

  factory CopyWith$Mutation$signUp$signUp.stub(TRes res) =
      _CopyWithStubImpl$Mutation$signUp$signUp;

  TRes call({
    Mutation$signUp$signUp$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Mutation$signUp$signUp$viewer<TRes> get viewer;
}

class _CopyWithImpl$Mutation$signUp$signUp<TRes>
    implements CopyWith$Mutation$signUp$signUp<TRes> {
  _CopyWithImpl$Mutation$signUp$signUp(
    this._instance,
    this._then,
  );

  final Mutation$signUp$signUp _instance;

  final TRes Function(Mutation$signUp$signUp) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$signUp$signUp(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Mutation$signUp$signUp$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$signUp$signUp$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Mutation$signUp$signUp$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Mutation$signUp$signUp<TRes>
    implements CopyWith$Mutation$signUp$signUp<TRes> {
  _CopyWithStubImpl$Mutation$signUp$signUp(this._res);

  TRes _res;

  call({
    Mutation$signUp$signUp$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$signUp$signUp$viewer<TRes> get viewer =>
      CopyWith$Mutation$signUp$signUp$viewer.stub(_res);
}

class Mutation$signUp$signUp$viewer {
  Mutation$signUp$signUp$viewer({
    required this.id,
    required this.screenId,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Mutation$signUp$signUp$viewer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$screenId = json['screenId'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Mutation$signUp$signUp$viewer(
      id: (l$id as String),
      screenId: (l$screenId as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String screenId;

  final String nickname;

  final String avatarUrl;

  final String $__typename;

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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$screenId = screenId;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$screenId,
      l$nickname,
      l$avatarUrl,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$signUp$signUp$viewer) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$signUp$signUp$viewer
    on Mutation$signUp$signUp$viewer {
  CopyWith$Mutation$signUp$signUp$viewer<Mutation$signUp$signUp$viewer>
      get copyWith => CopyWith$Mutation$signUp$signUp$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$signUp$signUp$viewer<TRes> {
  factory CopyWith$Mutation$signUp$signUp$viewer(
    Mutation$signUp$signUp$viewer instance,
    TRes Function(Mutation$signUp$signUp$viewer) then,
  ) = _CopyWithImpl$Mutation$signUp$signUp$viewer;

  factory CopyWith$Mutation$signUp$signUp$viewer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$signUp$signUp$viewer;

  TRes call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$signUp$signUp$viewer<TRes>
    implements CopyWith$Mutation$signUp$signUp$viewer<TRes> {
  _CopyWithImpl$Mutation$signUp$signUp$viewer(
    this._instance,
    this._then,
  );

  final Mutation$signUp$signUp$viewer _instance;

  final TRes Function(Mutation$signUp$signUp$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? screenId = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$signUp$signUp$viewer(
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$signUp$signUp$viewer<TRes>
    implements CopyWith$Mutation$signUp$signUp$viewer<TRes> {
  _CopyWithStubImpl$Mutation$signUp$signUp$viewer(this._res);

  TRes _res;

  call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}
