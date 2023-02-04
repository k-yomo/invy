import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$deleteFriendGroup {
  factory Variables$Mutation$deleteFriendGroup(
          {required String friendGroupId}) =>
      Variables$Mutation$deleteFriendGroup._({
        r'friendGroupId': friendGroupId,
      });

  Variables$Mutation$deleteFriendGroup._(this._$data);

  factory Variables$Mutation$deleteFriendGroup.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$friendGroupId = data['friendGroupId'];
    result$data['friendGroupId'] = (l$friendGroupId as String);
    return Variables$Mutation$deleteFriendGroup._(result$data);
  }

  Map<String, dynamic> _$data;

  String get friendGroupId => (_$data['friendGroupId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$friendGroupId = friendGroupId;
    result$data['friendGroupId'] = l$friendGroupId;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteFriendGroup<
          Variables$Mutation$deleteFriendGroup>
      get copyWith => CopyWith$Variables$Mutation$deleteFriendGroup(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteFriendGroup) ||
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

abstract class CopyWith$Variables$Mutation$deleteFriendGroup<TRes> {
  factory CopyWith$Variables$Mutation$deleteFriendGroup(
    Variables$Mutation$deleteFriendGroup instance,
    TRes Function(Variables$Mutation$deleteFriendGroup) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteFriendGroup;

  factory CopyWith$Variables$Mutation$deleteFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteFriendGroup;

  TRes call({String? friendGroupId});
}

class _CopyWithImpl$Variables$Mutation$deleteFriendGroup<TRes>
    implements CopyWith$Variables$Mutation$deleteFriendGroup<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteFriendGroup(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteFriendGroup _instance;

  final TRes Function(Variables$Mutation$deleteFriendGroup) _then;

  static const _undefined = {};

  TRes call({Object? friendGroupId = _undefined}) =>
      _then(Variables$Mutation$deleteFriendGroup._({
        ..._instance._$data,
        if (friendGroupId != _undefined && friendGroupId != null)
          'friendGroupId': (friendGroupId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteFriendGroup<TRes>
    implements CopyWith$Variables$Mutation$deleteFriendGroup<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteFriendGroup(this._res);

  TRes _res;

  call({String? friendGroupId}) => _res;
}

class Mutation$deleteFriendGroup {
  Mutation$deleteFriendGroup({
    required this.deleteFriendGroup,
    required this.$__typename,
  });

  factory Mutation$deleteFriendGroup.fromJson(Map<String, dynamic> json) {
    final l$deleteFriendGroup = json['deleteFriendGroup'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteFriendGroup(
      deleteFriendGroup: Mutation$deleteFriendGroup$deleteFriendGroup.fromJson(
          (l$deleteFriendGroup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$deleteFriendGroup$deleteFriendGroup deleteFriendGroup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFriendGroup = deleteFriendGroup;
    _resultData['deleteFriendGroup'] = l$deleteFriendGroup.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFriendGroup = deleteFriendGroup;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteFriendGroup,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteFriendGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFriendGroup = deleteFriendGroup;
    final lOther$deleteFriendGroup = other.deleteFriendGroup;
    if (l$deleteFriendGroup != lOther$deleteFriendGroup) {
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

extension UtilityExtension$Mutation$deleteFriendGroup
    on Mutation$deleteFriendGroup {
  CopyWith$Mutation$deleteFriendGroup<Mutation$deleteFriendGroup>
      get copyWith => CopyWith$Mutation$deleteFriendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteFriendGroup<TRes> {
  factory CopyWith$Mutation$deleteFriendGroup(
    Mutation$deleteFriendGroup instance,
    TRes Function(Mutation$deleteFriendGroup) then,
  ) = _CopyWithImpl$Mutation$deleteFriendGroup;

  factory CopyWith$Mutation$deleteFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteFriendGroup;

  TRes call({
    Mutation$deleteFriendGroup$deleteFriendGroup? deleteFriendGroup,
    String? $__typename,
  });
  CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup<TRes>
      get deleteFriendGroup;
}

class _CopyWithImpl$Mutation$deleteFriendGroup<TRes>
    implements CopyWith$Mutation$deleteFriendGroup<TRes> {
  _CopyWithImpl$Mutation$deleteFriendGroup(
    this._instance,
    this._then,
  );

  final Mutation$deleteFriendGroup _instance;

  final TRes Function(Mutation$deleteFriendGroup) _then;

  static const _undefined = {};

  TRes call({
    Object? deleteFriendGroup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteFriendGroup(
        deleteFriendGroup:
            deleteFriendGroup == _undefined || deleteFriendGroup == null
                ? _instance.deleteFriendGroup
                : (deleteFriendGroup
                    as Mutation$deleteFriendGroup$deleteFriendGroup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup<TRes>
      get deleteFriendGroup {
    final local$deleteFriendGroup = _instance.deleteFriendGroup;
    return CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup(
        local$deleteFriendGroup, (e) => call(deleteFriendGroup: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteFriendGroup<TRes>
    implements CopyWith$Mutation$deleteFriendGroup<TRes> {
  _CopyWithStubImpl$Mutation$deleteFriendGroup(this._res);

  TRes _res;

  call({
    Mutation$deleteFriendGroup$deleteFriendGroup? deleteFriendGroup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup<TRes>
      get deleteFriendGroup =>
          CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup.stub(_res);
}

const documentNodeMutationdeleteFriendGroup = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteFriendGroup'),
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
        name: NameNode(value: 'deleteFriendGroup'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'friendGroupId'),
            value: VariableNode(name: NameNode(value: 'friendGroupId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deletedFriendGroupId'),
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
Mutation$deleteFriendGroup _parserFn$Mutation$deleteFriendGroup(
        Map<String, dynamic> data) =>
    Mutation$deleteFriendGroup.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteFriendGroup = FutureOr<void>
    Function(
  dynamic,
  Mutation$deleteFriendGroup?,
);

class Options$Mutation$deleteFriendGroup
    extends graphql.MutationOptions<Mutation$deleteFriendGroup> {
  Options$Mutation$deleteFriendGroup({
    String? operationName,
    required Variables$Mutation$deleteFriendGroup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteFriendGroup? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteFriendGroup>? update,
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
                        : _parserFn$Mutation$deleteFriendGroup(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteFriendGroup,
          parserFn: _parserFn$Mutation$deleteFriendGroup,
        );

  final OnMutationCompleted$Mutation$deleteFriendGroup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteFriendGroup
    extends graphql.WatchQueryOptions<Mutation$deleteFriendGroup> {
  WatchOptions$Mutation$deleteFriendGroup({
    String? operationName,
    required Variables$Mutation$deleteFriendGroup variables,
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
          document: documentNodeMutationdeleteFriendGroup,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteFriendGroup,
        );
}

extension ClientExtension$Mutation$deleteFriendGroup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteFriendGroup>>
      mutate$deleteFriendGroup(
              Options$Mutation$deleteFriendGroup options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteFriendGroup>
      watchMutation$deleteFriendGroup(
              WatchOptions$Mutation$deleteFriendGroup options) =>
          this.watchMutation(options);
}

class Mutation$deleteFriendGroup$HookResult {
  Mutation$deleteFriendGroup$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$deleteFriendGroup runMutation;

  final graphql.QueryResult<Mutation$deleteFriendGroup> result;
}

Mutation$deleteFriendGroup$HookResult useMutation$deleteFriendGroup(
    [WidgetOptions$Mutation$deleteFriendGroup? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$deleteFriendGroup());
  return Mutation$deleteFriendGroup$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$deleteFriendGroup>
    useWatchMutation$deleteFriendGroup(
            WatchOptions$Mutation$deleteFriendGroup options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$deleteFriendGroup
    extends graphql.MutationOptions<Mutation$deleteFriendGroup> {
  WidgetOptions$Mutation$deleteFriendGroup({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteFriendGroup? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteFriendGroup>? update,
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
                        : _parserFn$Mutation$deleteFriendGroup(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteFriendGroup,
          parserFn: _parserFn$Mutation$deleteFriendGroup,
        );

  final OnMutationCompleted$Mutation$deleteFriendGroup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$deleteFriendGroup
    = graphql.MultiSourceResult<Mutation$deleteFriendGroup> Function(
  Variables$Mutation$deleteFriendGroup, {
  Object? optimisticResult,
});
typedef Builder$Mutation$deleteFriendGroup = widgets.Widget Function(
  RunMutation$Mutation$deleteFriendGroup,
  graphql.QueryResult<Mutation$deleteFriendGroup>?,
);

class Mutation$deleteFriendGroup$Widget
    extends graphql_flutter.Mutation<Mutation$deleteFriendGroup> {
  Mutation$deleteFriendGroup$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$deleteFriendGroup? options,
    required Builder$Mutation$deleteFriendGroup builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$deleteFriendGroup(),
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

class Mutation$deleteFriendGroup$deleteFriendGroup {
  Mutation$deleteFriendGroup$deleteFriendGroup({
    required this.deletedFriendGroupId,
    required this.$__typename,
  });

  factory Mutation$deleteFriendGroup$deleteFriendGroup.fromJson(
      Map<String, dynamic> json) {
    final l$deletedFriendGroupId = json['deletedFriendGroupId'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteFriendGroup$deleteFriendGroup(
      deletedFriendGroupId: (l$deletedFriendGroupId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String deletedFriendGroupId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deletedFriendGroupId = deletedFriendGroupId;
    _resultData['deletedFriendGroupId'] = l$deletedFriendGroupId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deletedFriendGroupId = deletedFriendGroupId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deletedFriendGroupId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteFriendGroup$deleteFriendGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deletedFriendGroupId = deletedFriendGroupId;
    final lOther$deletedFriendGroupId = other.deletedFriendGroupId;
    if (l$deletedFriendGroupId != lOther$deletedFriendGroupId) {
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

extension UtilityExtension$Mutation$deleteFriendGroup$deleteFriendGroup
    on Mutation$deleteFriendGroup$deleteFriendGroup {
  CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup<
          Mutation$deleteFriendGroup$deleteFriendGroup>
      get copyWith => CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup<TRes> {
  factory CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup(
    Mutation$deleteFriendGroup$deleteFriendGroup instance,
    TRes Function(Mutation$deleteFriendGroup$deleteFriendGroup) then,
  ) = _CopyWithImpl$Mutation$deleteFriendGroup$deleteFriendGroup;

  factory CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteFriendGroup$deleteFriendGroup;

  TRes call({
    String? deletedFriendGroupId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteFriendGroup$deleteFriendGroup<TRes>
    implements CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup<TRes> {
  _CopyWithImpl$Mutation$deleteFriendGroup$deleteFriendGroup(
    this._instance,
    this._then,
  );

  final Mutation$deleteFriendGroup$deleteFriendGroup _instance;

  final TRes Function(Mutation$deleteFriendGroup$deleteFriendGroup) _then;

  static const _undefined = {};

  TRes call({
    Object? deletedFriendGroupId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteFriendGroup$deleteFriendGroup(
        deletedFriendGroupId:
            deletedFriendGroupId == _undefined || deletedFriendGroupId == null
                ? _instance.deletedFriendGroupId
                : (deletedFriendGroupId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteFriendGroup$deleteFriendGroup<TRes>
    implements CopyWith$Mutation$deleteFriendGroup$deleteFriendGroup<TRes> {
  _CopyWithStubImpl$Mutation$deleteFriendGroup$deleteFriendGroup(this._res);

  TRes _res;

  call({
    String? deletedFriendGroupId,
    String? $__typename,
  }) =>
      _res;
}
