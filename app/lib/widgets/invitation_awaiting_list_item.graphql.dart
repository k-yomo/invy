import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$invitationAwaitingListItemFragment {
  Fragment$invitationAwaitingListItemFragment({
    required this.id,
    required this.userId,
    required this.startsAt,
    required this.endsAt,
    required this.comment,
    this.$__typename = 'InvitationAwaiting',
  });

  factory Fragment$invitationAwaitingListItemFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$startsAt = json['startsAt'];
    final l$endsAt = json['endsAt'];
    final l$comment = json['comment'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationAwaitingListItemFragment(
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
    if (!(other is Fragment$invitationAwaitingListItemFragment) ||
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

extension UtilityExtension$Fragment$invitationAwaitingListItemFragment
    on Fragment$invitationAwaitingListItemFragment {
  CopyWith$Fragment$invitationAwaitingListItemFragment<
          Fragment$invitationAwaitingListItemFragment>
      get copyWith => CopyWith$Fragment$invitationAwaitingListItemFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationAwaitingListItemFragment<TRes> {
  factory CopyWith$Fragment$invitationAwaitingListItemFragment(
    Fragment$invitationAwaitingListItemFragment instance,
    TRes Function(Fragment$invitationAwaitingListItemFragment) then,
  ) = _CopyWithImpl$Fragment$invitationAwaitingListItemFragment;

  factory CopyWith$Fragment$invitationAwaitingListItemFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$invitationAwaitingListItemFragment;

  TRes call({
    String? id,
    String? userId,
    DateTime? startsAt,
    DateTime? endsAt,
    String? comment,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$invitationAwaitingListItemFragment<TRes>
    implements CopyWith$Fragment$invitationAwaitingListItemFragment<TRes> {
  _CopyWithImpl$Fragment$invitationAwaitingListItemFragment(
    this._instance,
    this._then,
  );

  final Fragment$invitationAwaitingListItemFragment _instance;

  final TRes Function(Fragment$invitationAwaitingListItemFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? startsAt = _undefined,
    Object? endsAt = _undefined,
    Object? comment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationAwaitingListItemFragment(
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

class _CopyWithStubImpl$Fragment$invitationAwaitingListItemFragment<TRes>
    implements CopyWith$Fragment$invitationAwaitingListItemFragment<TRes> {
  _CopyWithStubImpl$Fragment$invitationAwaitingListItemFragment(this._res);

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

const fragmentDefinitioninvitationAwaitingListItemFragment =
    FragmentDefinitionNode(
  name: NameNode(value: 'invitationAwaitingListItemFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'InvitationAwaiting'),
    isNonNull: false,
  )),
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
);
const documentNodeFragmentinvitationAwaitingListItemFragment =
    DocumentNode(definitions: [
  fragmentDefinitioninvitationAwaitingListItemFragment,
]);

extension ClientExtension$Fragment$invitationAwaitingListItemFragment
    on graphql.GraphQLClient {
  void writeFragment$invitationAwaitingListItemFragment({
    required Fragment$invitationAwaitingListItemFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'invitationAwaitingListItemFragment',
            document: documentNodeFragmentinvitationAwaitingListItemFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$invitationAwaitingListItemFragment?
      readFragment$invitationAwaitingListItemFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'invitationAwaitingListItemFragment',
          document: documentNodeFragmentinvitationAwaitingListItemFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$invitationAwaitingListItemFragment.fromJson(result);
  }
}

class Variables$Mutation$deleteInvitationAwaiting {
  factory Variables$Mutation$deleteInvitationAwaiting(
          {required String invitationAwaitingId}) =>
      Variables$Mutation$deleteInvitationAwaiting._({
        r'invitationAwaitingId': invitationAwaitingId,
      });

  Variables$Mutation$deleteInvitationAwaiting._(this._$data);

  factory Variables$Mutation$deleteInvitationAwaiting.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$invitationAwaitingId = data['invitationAwaitingId'];
    result$data['invitationAwaitingId'] = (l$invitationAwaitingId as String);
    return Variables$Mutation$deleteInvitationAwaiting._(result$data);
  }

  Map<String, dynamic> _$data;

  String get invitationAwaitingId => (_$data['invitationAwaitingId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$invitationAwaitingId = invitationAwaitingId;
    result$data['invitationAwaitingId'] = l$invitationAwaitingId;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteInvitationAwaiting<
          Variables$Mutation$deleteInvitationAwaiting>
      get copyWith => CopyWith$Variables$Mutation$deleteInvitationAwaiting(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteInvitationAwaiting) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitationAwaitingId = invitationAwaitingId;
    final lOther$invitationAwaitingId = other.invitationAwaitingId;
    if (l$invitationAwaitingId != lOther$invitationAwaitingId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$invitationAwaitingId = invitationAwaitingId;
    return Object.hashAll([l$invitationAwaitingId]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteInvitationAwaiting<TRes> {
  factory CopyWith$Variables$Mutation$deleteInvitationAwaiting(
    Variables$Mutation$deleteInvitationAwaiting instance,
    TRes Function(Variables$Mutation$deleteInvitationAwaiting) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteInvitationAwaiting;

  factory CopyWith$Variables$Mutation$deleteInvitationAwaiting.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteInvitationAwaiting;

  TRes call({String? invitationAwaitingId});
}

class _CopyWithImpl$Variables$Mutation$deleteInvitationAwaiting<TRes>
    implements CopyWith$Variables$Mutation$deleteInvitationAwaiting<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteInvitationAwaiting(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteInvitationAwaiting _instance;

  final TRes Function(Variables$Mutation$deleteInvitationAwaiting) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? invitationAwaitingId = _undefined}) =>
      _then(Variables$Mutation$deleteInvitationAwaiting._({
        ..._instance._$data,
        if (invitationAwaitingId != _undefined && invitationAwaitingId != null)
          'invitationAwaitingId': (invitationAwaitingId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteInvitationAwaiting<TRes>
    implements CopyWith$Variables$Mutation$deleteInvitationAwaiting<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteInvitationAwaiting(this._res);

  TRes _res;

  call({String? invitationAwaitingId}) => _res;
}

class Mutation$deleteInvitationAwaiting {
  Mutation$deleteInvitationAwaiting({
    required this.deleteInvitationAwaiting,
    this.$__typename = 'Mutation',
  });

  factory Mutation$deleteInvitationAwaiting.fromJson(
      Map<String, dynamic> json) {
    final l$deleteInvitationAwaiting = json['deleteInvitationAwaiting'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteInvitationAwaiting(
      deleteInvitationAwaiting:
          Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting.fromJson(
              (l$deleteInvitationAwaiting as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting
      deleteInvitationAwaiting;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteInvitationAwaiting = deleteInvitationAwaiting;
    _resultData['deleteInvitationAwaiting'] =
        l$deleteInvitationAwaiting.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteInvitationAwaiting = deleteInvitationAwaiting;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteInvitationAwaiting,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteInvitationAwaiting) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteInvitationAwaiting = deleteInvitationAwaiting;
    final lOther$deleteInvitationAwaiting = other.deleteInvitationAwaiting;
    if (l$deleteInvitationAwaiting != lOther$deleteInvitationAwaiting) {
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

extension UtilityExtension$Mutation$deleteInvitationAwaiting
    on Mutation$deleteInvitationAwaiting {
  CopyWith$Mutation$deleteInvitationAwaiting<Mutation$deleteInvitationAwaiting>
      get copyWith => CopyWith$Mutation$deleteInvitationAwaiting(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteInvitationAwaiting<TRes> {
  factory CopyWith$Mutation$deleteInvitationAwaiting(
    Mutation$deleteInvitationAwaiting instance,
    TRes Function(Mutation$deleteInvitationAwaiting) then,
  ) = _CopyWithImpl$Mutation$deleteInvitationAwaiting;

  factory CopyWith$Mutation$deleteInvitationAwaiting.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteInvitationAwaiting;

  TRes call({
    Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting?
        deleteInvitationAwaiting,
    String? $__typename,
  });
  CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<TRes>
      get deleteInvitationAwaiting;
}

class _CopyWithImpl$Mutation$deleteInvitationAwaiting<TRes>
    implements CopyWith$Mutation$deleteInvitationAwaiting<TRes> {
  _CopyWithImpl$Mutation$deleteInvitationAwaiting(
    this._instance,
    this._then,
  );

  final Mutation$deleteInvitationAwaiting _instance;

  final TRes Function(Mutation$deleteInvitationAwaiting) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteInvitationAwaiting = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteInvitationAwaiting(
        deleteInvitationAwaiting: deleteInvitationAwaiting == _undefined ||
                deleteInvitationAwaiting == null
            ? _instance.deleteInvitationAwaiting
            : (deleteInvitationAwaiting
                as Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<TRes>
      get deleteInvitationAwaiting {
    final local$deleteInvitationAwaiting = _instance.deleteInvitationAwaiting;
    return CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting(
        local$deleteInvitationAwaiting,
        (e) => call(deleteInvitationAwaiting: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteInvitationAwaiting<TRes>
    implements CopyWith$Mutation$deleteInvitationAwaiting<TRes> {
  _CopyWithStubImpl$Mutation$deleteInvitationAwaiting(this._res);

  TRes _res;

  call({
    Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting?
        deleteInvitationAwaiting,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<TRes>
      get deleteInvitationAwaiting =>
          CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting
              .stub(_res);
}

const documentNodeMutationdeleteInvitationAwaiting = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteInvitationAwaiting'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'invitationAwaitingId')),
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
        name: NameNode(value: 'deleteInvitationAwaiting'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'invitationAwaitingId'),
            value: VariableNode(name: NameNode(value: 'invitationAwaitingId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deletedInvitationAwaitingId'),
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
Mutation$deleteInvitationAwaiting _parserFn$Mutation$deleteInvitationAwaiting(
        Map<String, dynamic> data) =>
    Mutation$deleteInvitationAwaiting.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteInvitationAwaiting = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$deleteInvitationAwaiting?,
);

class Options$Mutation$deleteInvitationAwaiting
    extends graphql.MutationOptions<Mutation$deleteInvitationAwaiting> {
  Options$Mutation$deleteInvitationAwaiting({
    String? operationName,
    required Variables$Mutation$deleteInvitationAwaiting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteInvitationAwaiting? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteInvitationAwaiting? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteInvitationAwaiting>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$deleteInvitationAwaiting(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteInvitationAwaiting,
          parserFn: _parserFn$Mutation$deleteInvitationAwaiting,
        );

  final OnMutationCompleted$Mutation$deleteInvitationAwaiting?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteInvitationAwaiting
    extends graphql.WatchQueryOptions<Mutation$deleteInvitationAwaiting> {
  WatchOptions$Mutation$deleteInvitationAwaiting({
    String? operationName,
    required Variables$Mutation$deleteInvitationAwaiting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteInvitationAwaiting? typedOptimisticResult,
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
          document: documentNodeMutationdeleteInvitationAwaiting,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteInvitationAwaiting,
        );
}

extension ClientExtension$Mutation$deleteInvitationAwaiting
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteInvitationAwaiting>>
      mutate$deleteInvitationAwaiting(
              Options$Mutation$deleteInvitationAwaiting options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteInvitationAwaiting>
      watchMutation$deleteInvitationAwaiting(
              WatchOptions$Mutation$deleteInvitationAwaiting options) =>
          this.watchMutation(options);
}

class Mutation$deleteInvitationAwaiting$HookResult {
  Mutation$deleteInvitationAwaiting$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$deleteInvitationAwaiting runMutation;

  final graphql.QueryResult<Mutation$deleteInvitationAwaiting> result;
}

Mutation$deleteInvitationAwaiting$HookResult
    useMutation$deleteInvitationAwaiting(
        [WidgetOptions$Mutation$deleteInvitationAwaiting? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$deleteInvitationAwaiting());
  return Mutation$deleteInvitationAwaiting$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$deleteInvitationAwaiting>
    useWatchMutation$deleteInvitationAwaiting(
            WatchOptions$Mutation$deleteInvitationAwaiting options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$deleteInvitationAwaiting
    extends graphql.MutationOptions<Mutation$deleteInvitationAwaiting> {
  WidgetOptions$Mutation$deleteInvitationAwaiting({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteInvitationAwaiting? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteInvitationAwaiting? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteInvitationAwaiting>? update,
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
                        : _parserFn$Mutation$deleteInvitationAwaiting(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteInvitationAwaiting,
          parserFn: _parserFn$Mutation$deleteInvitationAwaiting,
        );

  final OnMutationCompleted$Mutation$deleteInvitationAwaiting?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$deleteInvitationAwaiting
    = graphql.MultiSourceResult<Mutation$deleteInvitationAwaiting> Function(
  Variables$Mutation$deleteInvitationAwaiting, {
  Object? optimisticResult,
  Mutation$deleteInvitationAwaiting? typedOptimisticResult,
});
typedef Builder$Mutation$deleteInvitationAwaiting = widgets.Widget Function(
  RunMutation$Mutation$deleteInvitationAwaiting,
  graphql.QueryResult<Mutation$deleteInvitationAwaiting>?,
);

class Mutation$deleteInvitationAwaiting$Widget
    extends graphql_flutter.Mutation<Mutation$deleteInvitationAwaiting> {
  Mutation$deleteInvitationAwaiting$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$deleteInvitationAwaiting? options,
    required Builder$Mutation$deleteInvitationAwaiting builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$deleteInvitationAwaiting(),
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

class Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting {
  Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting({
    required this.deletedInvitationAwaitingId,
    this.$__typename = 'DeleteInvitationAwaitingPayload',
  });

  factory Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting.fromJson(
      Map<String, dynamic> json) {
    final l$deletedInvitationAwaitingId = json['deletedInvitationAwaitingId'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting(
      deletedInvitationAwaitingId: (l$deletedInvitationAwaitingId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String deletedInvitationAwaitingId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deletedInvitationAwaitingId = deletedInvitationAwaitingId;
    _resultData['deletedInvitationAwaitingId'] = l$deletedInvitationAwaitingId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deletedInvitationAwaitingId = deletedInvitationAwaitingId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deletedInvitationAwaitingId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deletedInvitationAwaitingId = deletedInvitationAwaitingId;
    final lOther$deletedInvitationAwaitingId =
        other.deletedInvitationAwaitingId;
    if (l$deletedInvitationAwaitingId != lOther$deletedInvitationAwaitingId) {
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

extension UtilityExtension$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting
    on Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting {
  CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<
          Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting>
      get copyWith =>
          CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<
    TRes> {
  factory CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting(
    Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting instance,
    TRes Function(Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting)
        then,
  ) = _CopyWithImpl$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting;

  factory CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting;

  TRes call({
    String? deletedInvitationAwaitingId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<
        TRes>
    implements
        CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<
            TRes> {
  _CopyWithImpl$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting(
    this._instance,
    this._then,
  );

  final Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting _instance;

  final TRes Function(
      Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deletedInvitationAwaitingId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting(
        deletedInvitationAwaitingId:
            deletedInvitationAwaitingId == _undefined ||
                    deletedInvitationAwaitingId == null
                ? _instance.deletedInvitationAwaitingId
                : (deletedInvitationAwaitingId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<
        TRes>
    implements
        CopyWith$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteInvitationAwaiting$deleteInvitationAwaiting(
      this._res);

  TRes _res;

  call({
    String? deletedInvitationAwaitingId,
    String? $__typename,
  }) =>
      _res;
}
