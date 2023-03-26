import '../../graphql/schema.graphql.dart';
import '../../widgets/invitation_detail_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$invitationDetail {
  factory Variables$Query$invitationDetail({required String id}) =>
      Variables$Query$invitationDetail._({
        r'id': id,
      });

  Variables$Query$invitationDetail._(this._$data);

  factory Variables$Query$invitationDetail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$invitationDetail._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$invitationDetail<Variables$Query$invitationDetail>
      get copyWith => CopyWith$Variables$Query$invitationDetail(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$invitationDetail) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$invitationDetail<TRes> {
  factory CopyWith$Variables$Query$invitationDetail(
    Variables$Query$invitationDetail instance,
    TRes Function(Variables$Query$invitationDetail) then,
  ) = _CopyWithImpl$Variables$Query$invitationDetail;

  factory CopyWith$Variables$Query$invitationDetail.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$invitationDetail;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$invitationDetail<TRes>
    implements CopyWith$Variables$Query$invitationDetail<TRes> {
  _CopyWithImpl$Variables$Query$invitationDetail(
    this._instance,
    this._then,
  );

  final Variables$Query$invitationDetail _instance;

  final TRes Function(Variables$Query$invitationDetail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$invitationDetail._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$invitationDetail<TRes>
    implements CopyWith$Variables$Query$invitationDetail<TRes> {
  _CopyWithStubImpl$Variables$Query$invitationDetail(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$invitationDetail {
  Query$invitationDetail({
    required this.invitation,
    this.$__typename = 'Query',
  });

  factory Query$invitationDetail.fromJson(Map<String, dynamic> json) {
    final l$invitation = json['invitation'];
    final l$$__typename = json['__typename'];
    return Query$invitationDetail(
      invitation: Query$invitationDetail$invitation.fromJson(
          (l$invitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$invitationDetail$invitation invitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$invitation = invitation;
    _resultData['invitation'] = l$invitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$invitation = invitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$invitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$invitationDetail) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitation = invitation;
    final lOther$invitation = other.invitation;
    if (l$invitation != lOther$invitation) {
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

extension UtilityExtension$Query$invitationDetail on Query$invitationDetail {
  CopyWith$Query$invitationDetail<Query$invitationDetail> get copyWith =>
      CopyWith$Query$invitationDetail(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$invitationDetail<TRes> {
  factory CopyWith$Query$invitationDetail(
    Query$invitationDetail instance,
    TRes Function(Query$invitationDetail) then,
  ) = _CopyWithImpl$Query$invitationDetail;

  factory CopyWith$Query$invitationDetail.stub(TRes res) =
      _CopyWithStubImpl$Query$invitationDetail;

  TRes call({
    Query$invitationDetail$invitation? invitation,
    String? $__typename,
  });
  CopyWith$Query$invitationDetail$invitation<TRes> get invitation;
}

class _CopyWithImpl$Query$invitationDetail<TRes>
    implements CopyWith$Query$invitationDetail<TRes> {
  _CopyWithImpl$Query$invitationDetail(
    this._instance,
    this._then,
  );

  final Query$invitationDetail _instance;

  final TRes Function(Query$invitationDetail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? invitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationDetail(
        invitation: invitation == _undefined || invitation == null
            ? _instance.invitation
            : (invitation as Query$invitationDetail$invitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$invitationDetail$invitation<TRes> get invitation {
    final local$invitation = _instance.invitation;
    return CopyWith$Query$invitationDetail$invitation(
        local$invitation, (e) => call(invitation: e));
  }
}

class _CopyWithStubImpl$Query$invitationDetail<TRes>
    implements CopyWith$Query$invitationDetail<TRes> {
  _CopyWithStubImpl$Query$invitationDetail(this._res);

  TRes _res;

  call({
    Query$invitationDetail$invitation? invitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$invitationDetail$invitation<TRes> get invitation =>
      CopyWith$Query$invitationDetail$invitation.stub(_res);
}

const documentNodeQueryinvitationDetail = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'invitationDetail'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'invitation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'invitationDetailFragment'),
            directives: [],
          ),
          FieldNode(
            name: NameNode(value: 'isAccepted'),
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
  fragmentDefinitioninvitationDetailFragment,
  fragmentDefinitioninvitationDetailAcceptedUserFragment,
]);
Query$invitationDetail _parserFn$Query$invitationDetail(
        Map<String, dynamic> data) =>
    Query$invitationDetail.fromJson(data);
typedef OnQueryComplete$Query$invitationDetail = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$invitationDetail?,
);

class Options$Query$invitationDetail
    extends graphql.QueryOptions<Query$invitationDetail> {
  Options$Query$invitationDetail({
    String? operationName,
    required Variables$Query$invitationDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$invitationDetail? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$invitationDetail? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$invitationDetail(data),
                  ),
          onError: onError,
          document: documentNodeQueryinvitationDetail,
          parserFn: _parserFn$Query$invitationDetail,
        );

  final OnQueryComplete$Query$invitationDetail? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$invitationDetail
    extends graphql.WatchQueryOptions<Query$invitationDetail> {
  WatchOptions$Query$invitationDetail({
    String? operationName,
    required Variables$Query$invitationDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$invitationDetail? typedOptimisticResult,
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
          document: documentNodeQueryinvitationDetail,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$invitationDetail,
        );
}

class FetchMoreOptions$Query$invitationDetail extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$invitationDetail({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$invitationDetail variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryinvitationDetail,
        );
}

extension ClientExtension$Query$invitationDetail on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$invitationDetail>> query$invitationDetail(
          Options$Query$invitationDetail options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$invitationDetail> watchQuery$invitationDetail(
          WatchOptions$Query$invitationDetail options) =>
      this.watchQuery(options);
  void writeQuery$invitationDetail({
    required Query$invitationDetail data,
    required Variables$Query$invitationDetail variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryinvitationDetail),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$invitationDetail? readQuery$invitationDetail({
    required Variables$Query$invitationDetail variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryinvitationDetail),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$invitationDetail.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$invitationDetail>
    useQuery$invitationDetail(Options$Query$invitationDetail options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$invitationDetail> useWatchQuery$invitationDetail(
        WatchOptions$Query$invitationDetail options) =>
    graphql_flutter.useWatchQuery(options);

class Query$invitationDetail$Widget
    extends graphql_flutter.Query<Query$invitationDetail> {
  Query$invitationDetail$Widget({
    widgets.Key? key,
    required Options$Query$invitationDetail options,
    required graphql_flutter.QueryBuilder<Query$invitationDetail> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$invitationDetail$invitation
    implements Fragment$invitationDetailFragment {
  Query$invitationDetail$invitation({
    required this.id,
    required this.status,
    required this.location,
    this.coordinate,
    required this.comment,
    required this.startsAt,
    required this.expiresAt,
    this.chatRoomId,
    required this.user,
    required this.acceptedUsers,
    this.$__typename = 'Invitation',
    required this.isAccepted,
  });

  factory Query$invitationDetail$invitation.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$location = json['location'];
    final l$coordinate = json['coordinate'];
    final l$comment = json['comment'];
    final l$startsAt = json['startsAt'];
    final l$expiresAt = json['expiresAt'];
    final l$chatRoomId = json['chatRoomId'];
    final l$user = json['user'];
    final l$acceptedUsers = json['acceptedUsers'];
    final l$$__typename = json['__typename'];
    final l$isAccepted = json['isAccepted'];
    return Query$invitationDetail$invitation(
      id: (l$id as String),
      status: fromJson$Enum$InvitationStatus((l$status as String)),
      location: (l$location as String),
      coordinate: l$coordinate == null
          ? null
          : Query$invitationDetail$invitation$coordinate.fromJson(
              (l$coordinate as Map<String, dynamic>)),
      comment: (l$comment as String),
      startsAt: DateTime.parse((l$startsAt as String)),
      expiresAt: DateTime.parse((l$expiresAt as String)),
      chatRoomId: (l$chatRoomId as String?),
      user: Fragment$invitationDetailAcceptedUserFragment.fromJson(
          (l$user as Map<String, dynamic>)),
      acceptedUsers: (l$acceptedUsers as List<dynamic>)
          .map((e) => Fragment$invitationDetailAcceptedUserFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
      isAccepted: (l$isAccepted as bool),
    );
  }

  final String id;

  final Enum$InvitationStatus status;

  final String location;

  final Query$invitationDetail$invitation$coordinate? coordinate;

  final String comment;

  final DateTime startsAt;

  final DateTime expiresAt;

  final String? chatRoomId;

  final Fragment$invitationDetailAcceptedUserFragment user;

  final List<Fragment$invitationDetailAcceptedUserFragment> acceptedUsers;

  final String $__typename;

  final bool isAccepted;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$InvitationStatus(l$status);
    final l$location = location;
    _resultData['location'] = l$location;
    final l$coordinate = coordinate;
    _resultData['coordinate'] = l$coordinate?.toJson();
    final l$comment = comment;
    _resultData['comment'] = l$comment;
    final l$startsAt = startsAt;
    _resultData['startsAt'] = l$startsAt.toIso8601String();
    final l$expiresAt = expiresAt;
    _resultData['expiresAt'] = l$expiresAt.toIso8601String();
    final l$chatRoomId = chatRoomId;
    _resultData['chatRoomId'] = l$chatRoomId;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$acceptedUsers = acceptedUsers;
    _resultData['acceptedUsers'] =
        l$acceptedUsers.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$isAccepted = isAccepted;
    _resultData['isAccepted'] = l$isAccepted;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$location = location;
    final l$coordinate = coordinate;
    final l$comment = comment;
    final l$startsAt = startsAt;
    final l$expiresAt = expiresAt;
    final l$chatRoomId = chatRoomId;
    final l$user = user;
    final l$acceptedUsers = acceptedUsers;
    final l$$__typename = $__typename;
    final l$isAccepted = isAccepted;
    return Object.hashAll([
      l$id,
      l$status,
      l$location,
      l$coordinate,
      l$comment,
      l$startsAt,
      l$expiresAt,
      l$chatRoomId,
      l$user,
      Object.hashAll(l$acceptedUsers.map((v) => v)),
      l$$__typename,
      l$isAccepted,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$invitationDetail$invitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$coordinate = coordinate;
    final lOther$coordinate = other.coordinate;
    if (l$coordinate != lOther$coordinate) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$startsAt = startsAt;
    final lOther$startsAt = other.startsAt;
    if (l$startsAt != lOther$startsAt) {
      return false;
    }
    final l$expiresAt = expiresAt;
    final lOther$expiresAt = other.expiresAt;
    if (l$expiresAt != lOther$expiresAt) {
      return false;
    }
    final l$chatRoomId = chatRoomId;
    final lOther$chatRoomId = other.chatRoomId;
    if (l$chatRoomId != lOther$chatRoomId) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$acceptedUsers = acceptedUsers;
    final lOther$acceptedUsers = other.acceptedUsers;
    if (l$acceptedUsers.length != lOther$acceptedUsers.length) {
      return false;
    }
    for (int i = 0; i < l$acceptedUsers.length; i++) {
      final l$acceptedUsers$entry = l$acceptedUsers[i];
      final lOther$acceptedUsers$entry = lOther$acceptedUsers[i];
      if (l$acceptedUsers$entry != lOther$acceptedUsers$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$isAccepted = isAccepted;
    final lOther$isAccepted = other.isAccepted;
    if (l$isAccepted != lOther$isAccepted) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$invitationDetail$invitation
    on Query$invitationDetail$invitation {
  CopyWith$Query$invitationDetail$invitation<Query$invitationDetail$invitation>
      get copyWith => CopyWith$Query$invitationDetail$invitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationDetail$invitation<TRes> {
  factory CopyWith$Query$invitationDetail$invitation(
    Query$invitationDetail$invitation instance,
    TRes Function(Query$invitationDetail$invitation) then,
  ) = _CopyWithImpl$Query$invitationDetail$invitation;

  factory CopyWith$Query$invitationDetail$invitation.stub(TRes res) =
      _CopyWithStubImpl$Query$invitationDetail$invitation;

  TRes call({
    String? id,
    Enum$InvitationStatus? status,
    String? location,
    Query$invitationDetail$invitation$coordinate? coordinate,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    String? chatRoomId,
    Fragment$invitationDetailAcceptedUserFragment? user,
    List<Fragment$invitationDetailAcceptedUserFragment>? acceptedUsers,
    String? $__typename,
    bool? isAccepted,
  });
  CopyWith$Query$invitationDetail$invitation$coordinate<TRes> get coordinate;
  CopyWith$Fragment$invitationDetailAcceptedUserFragment<TRes> get user;
  TRes acceptedUsers(
      Iterable<Fragment$invitationDetailAcceptedUserFragment> Function(
              Iterable<
                  CopyWith$Fragment$invitationDetailAcceptedUserFragment<
                      Fragment$invitationDetailAcceptedUserFragment>>)
          _fn);
}

class _CopyWithImpl$Query$invitationDetail$invitation<TRes>
    implements CopyWith$Query$invitationDetail$invitation<TRes> {
  _CopyWithImpl$Query$invitationDetail$invitation(
    this._instance,
    this._then,
  );

  final Query$invitationDetail$invitation _instance;

  final TRes Function(Query$invitationDetail$invitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? location = _undefined,
    Object? coordinate = _undefined,
    Object? comment = _undefined,
    Object? startsAt = _undefined,
    Object? expiresAt = _undefined,
    Object? chatRoomId = _undefined,
    Object? user = _undefined,
    Object? acceptedUsers = _undefined,
    Object? $__typename = _undefined,
    Object? isAccepted = _undefined,
  }) =>
      _then(Query$invitationDetail$invitation(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$InvitationStatus),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as String),
        coordinate: coordinate == _undefined
            ? _instance.coordinate
            : (coordinate as Query$invitationDetail$invitation$coordinate?),
        comment: comment == _undefined || comment == null
            ? _instance.comment
            : (comment as String),
        startsAt: startsAt == _undefined || startsAt == null
            ? _instance.startsAt
            : (startsAt as DateTime),
        expiresAt: expiresAt == _undefined || expiresAt == null
            ? _instance.expiresAt
            : (expiresAt as DateTime),
        chatRoomId: chatRoomId == _undefined
            ? _instance.chatRoomId
            : (chatRoomId as String?),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Fragment$invitationDetailAcceptedUserFragment),
        acceptedUsers: acceptedUsers == _undefined || acceptedUsers == null
            ? _instance.acceptedUsers
            : (acceptedUsers
                as List<Fragment$invitationDetailAcceptedUserFragment>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        isAccepted: isAccepted == _undefined || isAccepted == null
            ? _instance.isAccepted
            : (isAccepted as bool),
      ));
  CopyWith$Query$invitationDetail$invitation$coordinate<TRes> get coordinate {
    final local$coordinate = _instance.coordinate;
    return local$coordinate == null
        ? CopyWith$Query$invitationDetail$invitation$coordinate.stub(
            _then(_instance))
        : CopyWith$Query$invitationDetail$invitation$coordinate(
            local$coordinate, (e) => call(coordinate: e));
  }

  CopyWith$Fragment$invitationDetailAcceptedUserFragment<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Fragment$invitationDetailAcceptedUserFragment(
        local$user, (e) => call(user: e));
  }

  TRes acceptedUsers(
          Iterable<Fragment$invitationDetailAcceptedUserFragment> Function(
                  Iterable<
                      CopyWith$Fragment$invitationDetailAcceptedUserFragment<
                          Fragment$invitationDetailAcceptedUserFragment>>)
              _fn) =>
      call(
          acceptedUsers: _fn(_instance.acceptedUsers.map(
              (e) => CopyWith$Fragment$invitationDetailAcceptedUserFragment(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$invitationDetail$invitation<TRes>
    implements CopyWith$Query$invitationDetail$invitation<TRes> {
  _CopyWithStubImpl$Query$invitationDetail$invitation(this._res);

  TRes _res;

  call({
    String? id,
    Enum$InvitationStatus? status,
    String? location,
    Query$invitationDetail$invitation$coordinate? coordinate,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    String? chatRoomId,
    Fragment$invitationDetailAcceptedUserFragment? user,
    List<Fragment$invitationDetailAcceptedUserFragment>? acceptedUsers,
    String? $__typename,
    bool? isAccepted,
  }) =>
      _res;
  CopyWith$Query$invitationDetail$invitation$coordinate<TRes> get coordinate =>
      CopyWith$Query$invitationDetail$invitation$coordinate.stub(_res);
  CopyWith$Fragment$invitationDetailAcceptedUserFragment<TRes> get user =>
      CopyWith$Fragment$invitationDetailAcceptedUserFragment.stub(_res);
  acceptedUsers(_fn) => _res;
}

class Query$invitationDetail$invitation$coordinate
    implements Fragment$invitationDetailFragment$coordinate {
  Query$invitationDetail$invitation$coordinate({
    required this.latitude,
    required this.longitude,
    this.$__typename = 'Coordinate',
  });

  factory Query$invitationDetail$invitation$coordinate.fromJson(
      Map<String, dynamic> json) {
    final l$latitude = json['latitude'];
    final l$longitude = json['longitude'];
    final l$$__typename = json['__typename'];
    return Query$invitationDetail$invitation$coordinate(
      latitude: (l$latitude as num).toDouble(),
      longitude: (l$longitude as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final double latitude;

  final double longitude;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$latitude = latitude;
    _resultData['latitude'] = l$latitude;
    final l$longitude = longitude;
    _resultData['longitude'] = l$longitude;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$latitude = latitude;
    final l$longitude = longitude;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$latitude,
      l$longitude,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$invitationDetail$invitation$coordinate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$latitude = latitude;
    final lOther$latitude = other.latitude;
    if (l$latitude != lOther$latitude) {
      return false;
    }
    final l$longitude = longitude;
    final lOther$longitude = other.longitude;
    if (l$longitude != lOther$longitude) {
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

extension UtilityExtension$Query$invitationDetail$invitation$coordinate
    on Query$invitationDetail$invitation$coordinate {
  CopyWith$Query$invitationDetail$invitation$coordinate<
          Query$invitationDetail$invitation$coordinate>
      get copyWith => CopyWith$Query$invitationDetail$invitation$coordinate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationDetail$invitation$coordinate<TRes> {
  factory CopyWith$Query$invitationDetail$invitation$coordinate(
    Query$invitationDetail$invitation$coordinate instance,
    TRes Function(Query$invitationDetail$invitation$coordinate) then,
  ) = _CopyWithImpl$Query$invitationDetail$invitation$coordinate;

  factory CopyWith$Query$invitationDetail$invitation$coordinate.stub(TRes res) =
      _CopyWithStubImpl$Query$invitationDetail$invitation$coordinate;

  TRes call({
    double? latitude,
    double? longitude,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$invitationDetail$invitation$coordinate<TRes>
    implements CopyWith$Query$invitationDetail$invitation$coordinate<TRes> {
  _CopyWithImpl$Query$invitationDetail$invitation$coordinate(
    this._instance,
    this._then,
  );

  final Query$invitationDetail$invitation$coordinate _instance;

  final TRes Function(Query$invitationDetail$invitation$coordinate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? latitude = _undefined,
    Object? longitude = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationDetail$invitation$coordinate(
        latitude: latitude == _undefined || latitude == null
            ? _instance.latitude
            : (latitude as double),
        longitude: longitude == _undefined || longitude == null
            ? _instance.longitude
            : (longitude as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$invitationDetail$invitation$coordinate<TRes>
    implements CopyWith$Query$invitationDetail$invitation$coordinate<TRes> {
  _CopyWithStubImpl$Query$invitationDetail$invitation$coordinate(this._res);

  TRes _res;

  call({
    double? latitude,
    double? longitude,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$closeInvitation {
  factory Variables$Mutation$closeInvitation({required String id}) =>
      Variables$Mutation$closeInvitation._({
        r'id': id,
      });

  Variables$Mutation$closeInvitation._(this._$data);

  factory Variables$Mutation$closeInvitation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$closeInvitation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$closeInvitation<
          Variables$Mutation$closeInvitation>
      get copyWith => CopyWith$Variables$Mutation$closeInvitation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$closeInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$closeInvitation<TRes> {
  factory CopyWith$Variables$Mutation$closeInvitation(
    Variables$Mutation$closeInvitation instance,
    TRes Function(Variables$Mutation$closeInvitation) then,
  ) = _CopyWithImpl$Variables$Mutation$closeInvitation;

  factory CopyWith$Variables$Mutation$closeInvitation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$closeInvitation;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$closeInvitation<TRes>
    implements CopyWith$Variables$Mutation$closeInvitation<TRes> {
  _CopyWithImpl$Variables$Mutation$closeInvitation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$closeInvitation _instance;

  final TRes Function(Variables$Mutation$closeInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$closeInvitation._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$closeInvitation<TRes>
    implements CopyWith$Variables$Mutation$closeInvitation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$closeInvitation(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$closeInvitation {
  Mutation$closeInvitation({
    required this.closeInvitation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$closeInvitation.fromJson(Map<String, dynamic> json) {
    final l$closeInvitation = json['closeInvitation'];
    final l$$__typename = json['__typename'];
    return Mutation$closeInvitation(
      closeInvitation: Mutation$closeInvitation$closeInvitation.fromJson(
          (l$closeInvitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$closeInvitation$closeInvitation closeInvitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$closeInvitation = closeInvitation;
    _resultData['closeInvitation'] = l$closeInvitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$closeInvitation = closeInvitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$closeInvitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$closeInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$closeInvitation = closeInvitation;
    final lOther$closeInvitation = other.closeInvitation;
    if (l$closeInvitation != lOther$closeInvitation) {
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

extension UtilityExtension$Mutation$closeInvitation
    on Mutation$closeInvitation {
  CopyWith$Mutation$closeInvitation<Mutation$closeInvitation> get copyWith =>
      CopyWith$Mutation$closeInvitation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$closeInvitation<TRes> {
  factory CopyWith$Mutation$closeInvitation(
    Mutation$closeInvitation instance,
    TRes Function(Mutation$closeInvitation) then,
  ) = _CopyWithImpl$Mutation$closeInvitation;

  factory CopyWith$Mutation$closeInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$closeInvitation;

  TRes call({
    Mutation$closeInvitation$closeInvitation? closeInvitation,
    String? $__typename,
  });
  CopyWith$Mutation$closeInvitation$closeInvitation<TRes> get closeInvitation;
}

class _CopyWithImpl$Mutation$closeInvitation<TRes>
    implements CopyWith$Mutation$closeInvitation<TRes> {
  _CopyWithImpl$Mutation$closeInvitation(
    this._instance,
    this._then,
  );

  final Mutation$closeInvitation _instance;

  final TRes Function(Mutation$closeInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? closeInvitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$closeInvitation(
        closeInvitation:
            closeInvitation == _undefined || closeInvitation == null
                ? _instance.closeInvitation
                : (closeInvitation as Mutation$closeInvitation$closeInvitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$closeInvitation$closeInvitation<TRes> get closeInvitation {
    final local$closeInvitation = _instance.closeInvitation;
    return CopyWith$Mutation$closeInvitation$closeInvitation(
        local$closeInvitation, (e) => call(closeInvitation: e));
  }
}

class _CopyWithStubImpl$Mutation$closeInvitation<TRes>
    implements CopyWith$Mutation$closeInvitation<TRes> {
  _CopyWithStubImpl$Mutation$closeInvitation(this._res);

  TRes _res;

  call({
    Mutation$closeInvitation$closeInvitation? closeInvitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$closeInvitation$closeInvitation<TRes> get closeInvitation =>
      CopyWith$Mutation$closeInvitation$closeInvitation.stub(_res);
}

const documentNodeMutationcloseInvitation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'closeInvitation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'closeInvitation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'invitationId'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'invitation'),
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
                name: NameNode(value: 'status'),
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
Mutation$closeInvitation _parserFn$Mutation$closeInvitation(
        Map<String, dynamic> data) =>
    Mutation$closeInvitation.fromJson(data);
typedef OnMutationCompleted$Mutation$closeInvitation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$closeInvitation?,
);

class Options$Mutation$closeInvitation
    extends graphql.MutationOptions<Mutation$closeInvitation> {
  Options$Mutation$closeInvitation({
    String? operationName,
    required Variables$Mutation$closeInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$closeInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$closeInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$closeInvitation>? update,
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
                        : _parserFn$Mutation$closeInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcloseInvitation,
          parserFn: _parserFn$Mutation$closeInvitation,
        );

  final OnMutationCompleted$Mutation$closeInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$closeInvitation
    extends graphql.WatchQueryOptions<Mutation$closeInvitation> {
  WatchOptions$Mutation$closeInvitation({
    String? operationName,
    required Variables$Mutation$closeInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$closeInvitation? typedOptimisticResult,
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
          document: documentNodeMutationcloseInvitation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$closeInvitation,
        );
}

extension ClientExtension$Mutation$closeInvitation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$closeInvitation>> mutate$closeInvitation(
          Options$Mutation$closeInvitation options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$closeInvitation>
      watchMutation$closeInvitation(
              WatchOptions$Mutation$closeInvitation options) =>
          this.watchMutation(options);
}

class Mutation$closeInvitation$HookResult {
  Mutation$closeInvitation$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$closeInvitation runMutation;

  final graphql.QueryResult<Mutation$closeInvitation> result;
}

Mutation$closeInvitation$HookResult useMutation$closeInvitation(
    [WidgetOptions$Mutation$closeInvitation? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$closeInvitation());
  return Mutation$closeInvitation$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$closeInvitation>
    useWatchMutation$closeInvitation(
            WatchOptions$Mutation$closeInvitation options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$closeInvitation
    extends graphql.MutationOptions<Mutation$closeInvitation> {
  WidgetOptions$Mutation$closeInvitation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$closeInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$closeInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$closeInvitation>? update,
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
                        : _parserFn$Mutation$closeInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcloseInvitation,
          parserFn: _parserFn$Mutation$closeInvitation,
        );

  final OnMutationCompleted$Mutation$closeInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$closeInvitation
    = graphql.MultiSourceResult<Mutation$closeInvitation> Function(
  Variables$Mutation$closeInvitation, {
  Object? optimisticResult,
  Mutation$closeInvitation? typedOptimisticResult,
});
typedef Builder$Mutation$closeInvitation = widgets.Widget Function(
  RunMutation$Mutation$closeInvitation,
  graphql.QueryResult<Mutation$closeInvitation>?,
);

class Mutation$closeInvitation$Widget
    extends graphql_flutter.Mutation<Mutation$closeInvitation> {
  Mutation$closeInvitation$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$closeInvitation? options,
    required Builder$Mutation$closeInvitation builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$closeInvitation(),
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

class Mutation$closeInvitation$closeInvitation {
  Mutation$closeInvitation$closeInvitation({
    required this.invitation,
    this.$__typename = 'CloseInvitationPayload',
  });

  factory Mutation$closeInvitation$closeInvitation.fromJson(
      Map<String, dynamic> json) {
    final l$invitation = json['invitation'];
    final l$$__typename = json['__typename'];
    return Mutation$closeInvitation$closeInvitation(
      invitation: Mutation$closeInvitation$closeInvitation$invitation.fromJson(
          (l$invitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$closeInvitation$closeInvitation$invitation invitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$invitation = invitation;
    _resultData['invitation'] = l$invitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$invitation = invitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$invitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$closeInvitation$closeInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitation = invitation;
    final lOther$invitation = other.invitation;
    if (l$invitation != lOther$invitation) {
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

extension UtilityExtension$Mutation$closeInvitation$closeInvitation
    on Mutation$closeInvitation$closeInvitation {
  CopyWith$Mutation$closeInvitation$closeInvitation<
          Mutation$closeInvitation$closeInvitation>
      get copyWith => CopyWith$Mutation$closeInvitation$closeInvitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$closeInvitation$closeInvitation<TRes> {
  factory CopyWith$Mutation$closeInvitation$closeInvitation(
    Mutation$closeInvitation$closeInvitation instance,
    TRes Function(Mutation$closeInvitation$closeInvitation) then,
  ) = _CopyWithImpl$Mutation$closeInvitation$closeInvitation;

  factory CopyWith$Mutation$closeInvitation$closeInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$closeInvitation$closeInvitation;

  TRes call({
    Mutation$closeInvitation$closeInvitation$invitation? invitation,
    String? $__typename,
  });
  CopyWith$Mutation$closeInvitation$closeInvitation$invitation<TRes>
      get invitation;
}

class _CopyWithImpl$Mutation$closeInvitation$closeInvitation<TRes>
    implements CopyWith$Mutation$closeInvitation$closeInvitation<TRes> {
  _CopyWithImpl$Mutation$closeInvitation$closeInvitation(
    this._instance,
    this._then,
  );

  final Mutation$closeInvitation$closeInvitation _instance;

  final TRes Function(Mutation$closeInvitation$closeInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? invitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$closeInvitation$closeInvitation(
        invitation: invitation == _undefined || invitation == null
            ? _instance.invitation
            : (invitation
                as Mutation$closeInvitation$closeInvitation$invitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$closeInvitation$closeInvitation$invitation<TRes>
      get invitation {
    final local$invitation = _instance.invitation;
    return CopyWith$Mutation$closeInvitation$closeInvitation$invitation(
        local$invitation, (e) => call(invitation: e));
  }
}

class _CopyWithStubImpl$Mutation$closeInvitation$closeInvitation<TRes>
    implements CopyWith$Mutation$closeInvitation$closeInvitation<TRes> {
  _CopyWithStubImpl$Mutation$closeInvitation$closeInvitation(this._res);

  TRes _res;

  call({
    Mutation$closeInvitation$closeInvitation$invitation? invitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$closeInvitation$closeInvitation$invitation<TRes>
      get invitation =>
          CopyWith$Mutation$closeInvitation$closeInvitation$invitation.stub(
              _res);
}

class Mutation$closeInvitation$closeInvitation$invitation {
  Mutation$closeInvitation$closeInvitation$invitation({
    required this.id,
    required this.status,
    this.$__typename = 'Invitation',
  });

  factory Mutation$closeInvitation$closeInvitation$invitation.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$closeInvitation$closeInvitation$invitation(
      id: (l$id as String),
      status: fromJson$Enum$InvitationStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$InvitationStatus status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$InvitationStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$closeInvitation$closeInvitation$invitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Mutation$closeInvitation$closeInvitation$invitation
    on Mutation$closeInvitation$closeInvitation$invitation {
  CopyWith$Mutation$closeInvitation$closeInvitation$invitation<
          Mutation$closeInvitation$closeInvitation$invitation>
      get copyWith =>
          CopyWith$Mutation$closeInvitation$closeInvitation$invitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$closeInvitation$closeInvitation$invitation<
    TRes> {
  factory CopyWith$Mutation$closeInvitation$closeInvitation$invitation(
    Mutation$closeInvitation$closeInvitation$invitation instance,
    TRes Function(Mutation$closeInvitation$closeInvitation$invitation) then,
  ) = _CopyWithImpl$Mutation$closeInvitation$closeInvitation$invitation;

  factory CopyWith$Mutation$closeInvitation$closeInvitation$invitation.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$closeInvitation$closeInvitation$invitation;

  TRes call({
    String? id,
    Enum$InvitationStatus? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$closeInvitation$closeInvitation$invitation<TRes>
    implements
        CopyWith$Mutation$closeInvitation$closeInvitation$invitation<TRes> {
  _CopyWithImpl$Mutation$closeInvitation$closeInvitation$invitation(
    this._instance,
    this._then,
  );

  final Mutation$closeInvitation$closeInvitation$invitation _instance;

  final TRes Function(Mutation$closeInvitation$closeInvitation$invitation)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$closeInvitation$closeInvitation$invitation(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$InvitationStatus),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$closeInvitation$closeInvitation$invitation<
        TRes>
    implements
        CopyWith$Mutation$closeInvitation$closeInvitation$invitation<TRes> {
  _CopyWithStubImpl$Mutation$closeInvitation$closeInvitation$invitation(
      this._res);

  TRes _res;

  call({
    String? id,
    Enum$InvitationStatus? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$activateInvitation {
  factory Variables$Mutation$activateInvitation({required String id}) =>
      Variables$Mutation$activateInvitation._({
        r'id': id,
      });

  Variables$Mutation$activateInvitation._(this._$data);

  factory Variables$Mutation$activateInvitation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$activateInvitation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$activateInvitation<
          Variables$Mutation$activateInvitation>
      get copyWith => CopyWith$Variables$Mutation$activateInvitation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$activateInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$activateInvitation<TRes> {
  factory CopyWith$Variables$Mutation$activateInvitation(
    Variables$Mutation$activateInvitation instance,
    TRes Function(Variables$Mutation$activateInvitation) then,
  ) = _CopyWithImpl$Variables$Mutation$activateInvitation;

  factory CopyWith$Variables$Mutation$activateInvitation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$activateInvitation;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$activateInvitation<TRes>
    implements CopyWith$Variables$Mutation$activateInvitation<TRes> {
  _CopyWithImpl$Variables$Mutation$activateInvitation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$activateInvitation _instance;

  final TRes Function(Variables$Mutation$activateInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$activateInvitation._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$activateInvitation<TRes>
    implements CopyWith$Variables$Mutation$activateInvitation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$activateInvitation(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$activateInvitation {
  Mutation$activateInvitation({
    required this.activateInvitation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$activateInvitation.fromJson(Map<String, dynamic> json) {
    final l$activateInvitation = json['activateInvitation'];
    final l$$__typename = json['__typename'];
    return Mutation$activateInvitation(
      activateInvitation:
          Mutation$activateInvitation$activateInvitation.fromJson(
              (l$activateInvitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$activateInvitation$activateInvitation activateInvitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$activateInvitation = activateInvitation;
    _resultData['activateInvitation'] = l$activateInvitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$activateInvitation = activateInvitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$activateInvitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$activateInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$activateInvitation = activateInvitation;
    final lOther$activateInvitation = other.activateInvitation;
    if (l$activateInvitation != lOther$activateInvitation) {
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

extension UtilityExtension$Mutation$activateInvitation
    on Mutation$activateInvitation {
  CopyWith$Mutation$activateInvitation<Mutation$activateInvitation>
      get copyWith => CopyWith$Mutation$activateInvitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$activateInvitation<TRes> {
  factory CopyWith$Mutation$activateInvitation(
    Mutation$activateInvitation instance,
    TRes Function(Mutation$activateInvitation) then,
  ) = _CopyWithImpl$Mutation$activateInvitation;

  factory CopyWith$Mutation$activateInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$activateInvitation;

  TRes call({
    Mutation$activateInvitation$activateInvitation? activateInvitation,
    String? $__typename,
  });
  CopyWith$Mutation$activateInvitation$activateInvitation<TRes>
      get activateInvitation;
}

class _CopyWithImpl$Mutation$activateInvitation<TRes>
    implements CopyWith$Mutation$activateInvitation<TRes> {
  _CopyWithImpl$Mutation$activateInvitation(
    this._instance,
    this._then,
  );

  final Mutation$activateInvitation _instance;

  final TRes Function(Mutation$activateInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? activateInvitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$activateInvitation(
        activateInvitation:
            activateInvitation == _undefined || activateInvitation == null
                ? _instance.activateInvitation
                : (activateInvitation
                    as Mutation$activateInvitation$activateInvitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$activateInvitation$activateInvitation<TRes>
      get activateInvitation {
    final local$activateInvitation = _instance.activateInvitation;
    return CopyWith$Mutation$activateInvitation$activateInvitation(
        local$activateInvitation, (e) => call(activateInvitation: e));
  }
}

class _CopyWithStubImpl$Mutation$activateInvitation<TRes>
    implements CopyWith$Mutation$activateInvitation<TRes> {
  _CopyWithStubImpl$Mutation$activateInvitation(this._res);

  TRes _res;

  call({
    Mutation$activateInvitation$activateInvitation? activateInvitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$activateInvitation$activateInvitation<TRes>
      get activateInvitation =>
          CopyWith$Mutation$activateInvitation$activateInvitation.stub(_res);
}

const documentNodeMutationactivateInvitation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'activateInvitation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'activateInvitation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'invitationId'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'invitation'),
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
                name: NameNode(value: 'status'),
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
Mutation$activateInvitation _parserFn$Mutation$activateInvitation(
        Map<String, dynamic> data) =>
    Mutation$activateInvitation.fromJson(data);
typedef OnMutationCompleted$Mutation$activateInvitation = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$activateInvitation?,
);

class Options$Mutation$activateInvitation
    extends graphql.MutationOptions<Mutation$activateInvitation> {
  Options$Mutation$activateInvitation({
    String? operationName,
    required Variables$Mutation$activateInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$activateInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$activateInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$activateInvitation>? update,
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
                        : _parserFn$Mutation$activateInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationactivateInvitation,
          parserFn: _parserFn$Mutation$activateInvitation,
        );

  final OnMutationCompleted$Mutation$activateInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$activateInvitation
    extends graphql.WatchQueryOptions<Mutation$activateInvitation> {
  WatchOptions$Mutation$activateInvitation({
    String? operationName,
    required Variables$Mutation$activateInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$activateInvitation? typedOptimisticResult,
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
          document: documentNodeMutationactivateInvitation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$activateInvitation,
        );
}

extension ClientExtension$Mutation$activateInvitation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$activateInvitation>>
      mutate$activateInvitation(
              Options$Mutation$activateInvitation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$activateInvitation>
      watchMutation$activateInvitation(
              WatchOptions$Mutation$activateInvitation options) =>
          this.watchMutation(options);
}

class Mutation$activateInvitation$HookResult {
  Mutation$activateInvitation$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$activateInvitation runMutation;

  final graphql.QueryResult<Mutation$activateInvitation> result;
}

Mutation$activateInvitation$HookResult useMutation$activateInvitation(
    [WidgetOptions$Mutation$activateInvitation? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$activateInvitation());
  return Mutation$activateInvitation$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$activateInvitation>
    useWatchMutation$activateInvitation(
            WatchOptions$Mutation$activateInvitation options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$activateInvitation
    extends graphql.MutationOptions<Mutation$activateInvitation> {
  WidgetOptions$Mutation$activateInvitation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$activateInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$activateInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$activateInvitation>? update,
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
                        : _parserFn$Mutation$activateInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationactivateInvitation,
          parserFn: _parserFn$Mutation$activateInvitation,
        );

  final OnMutationCompleted$Mutation$activateInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$activateInvitation
    = graphql.MultiSourceResult<Mutation$activateInvitation> Function(
  Variables$Mutation$activateInvitation, {
  Object? optimisticResult,
  Mutation$activateInvitation? typedOptimisticResult,
});
typedef Builder$Mutation$activateInvitation = widgets.Widget Function(
  RunMutation$Mutation$activateInvitation,
  graphql.QueryResult<Mutation$activateInvitation>?,
);

class Mutation$activateInvitation$Widget
    extends graphql_flutter.Mutation<Mutation$activateInvitation> {
  Mutation$activateInvitation$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$activateInvitation? options,
    required Builder$Mutation$activateInvitation builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$activateInvitation(),
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

class Mutation$activateInvitation$activateInvitation {
  Mutation$activateInvitation$activateInvitation({
    required this.invitation,
    this.$__typename = 'ActivateInvitationPayload',
  });

  factory Mutation$activateInvitation$activateInvitation.fromJson(
      Map<String, dynamic> json) {
    final l$invitation = json['invitation'];
    final l$$__typename = json['__typename'];
    return Mutation$activateInvitation$activateInvitation(
      invitation:
          Mutation$activateInvitation$activateInvitation$invitation.fromJson(
              (l$invitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$activateInvitation$activateInvitation$invitation invitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$invitation = invitation;
    _resultData['invitation'] = l$invitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$invitation = invitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$invitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$activateInvitation$activateInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitation = invitation;
    final lOther$invitation = other.invitation;
    if (l$invitation != lOther$invitation) {
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

extension UtilityExtension$Mutation$activateInvitation$activateInvitation
    on Mutation$activateInvitation$activateInvitation {
  CopyWith$Mutation$activateInvitation$activateInvitation<
          Mutation$activateInvitation$activateInvitation>
      get copyWith => CopyWith$Mutation$activateInvitation$activateInvitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$activateInvitation$activateInvitation<TRes> {
  factory CopyWith$Mutation$activateInvitation$activateInvitation(
    Mutation$activateInvitation$activateInvitation instance,
    TRes Function(Mutation$activateInvitation$activateInvitation) then,
  ) = _CopyWithImpl$Mutation$activateInvitation$activateInvitation;

  factory CopyWith$Mutation$activateInvitation$activateInvitation.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$activateInvitation$activateInvitation;

  TRes call({
    Mutation$activateInvitation$activateInvitation$invitation? invitation,
    String? $__typename,
  });
  CopyWith$Mutation$activateInvitation$activateInvitation$invitation<TRes>
      get invitation;
}

class _CopyWithImpl$Mutation$activateInvitation$activateInvitation<TRes>
    implements CopyWith$Mutation$activateInvitation$activateInvitation<TRes> {
  _CopyWithImpl$Mutation$activateInvitation$activateInvitation(
    this._instance,
    this._then,
  );

  final Mutation$activateInvitation$activateInvitation _instance;

  final TRes Function(Mutation$activateInvitation$activateInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? invitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$activateInvitation$activateInvitation(
        invitation: invitation == _undefined || invitation == null
            ? _instance.invitation
            : (invitation
                as Mutation$activateInvitation$activateInvitation$invitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$activateInvitation$activateInvitation$invitation<TRes>
      get invitation {
    final local$invitation = _instance.invitation;
    return CopyWith$Mutation$activateInvitation$activateInvitation$invitation(
        local$invitation, (e) => call(invitation: e));
  }
}

class _CopyWithStubImpl$Mutation$activateInvitation$activateInvitation<TRes>
    implements CopyWith$Mutation$activateInvitation$activateInvitation<TRes> {
  _CopyWithStubImpl$Mutation$activateInvitation$activateInvitation(this._res);

  TRes _res;

  call({
    Mutation$activateInvitation$activateInvitation$invitation? invitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$activateInvitation$activateInvitation$invitation<TRes>
      get invitation =>
          CopyWith$Mutation$activateInvitation$activateInvitation$invitation
              .stub(_res);
}

class Mutation$activateInvitation$activateInvitation$invitation {
  Mutation$activateInvitation$activateInvitation$invitation({
    required this.id,
    required this.status,
    this.$__typename = 'Invitation',
  });

  factory Mutation$activateInvitation$activateInvitation$invitation.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$activateInvitation$activateInvitation$invitation(
      id: (l$id as String),
      status: fromJson$Enum$InvitationStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$InvitationStatus status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$InvitationStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$activateInvitation$activateInvitation$invitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Mutation$activateInvitation$activateInvitation$invitation
    on Mutation$activateInvitation$activateInvitation$invitation {
  CopyWith$Mutation$activateInvitation$activateInvitation$invitation<
          Mutation$activateInvitation$activateInvitation$invitation>
      get copyWith =>
          CopyWith$Mutation$activateInvitation$activateInvitation$invitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$activateInvitation$activateInvitation$invitation<
    TRes> {
  factory CopyWith$Mutation$activateInvitation$activateInvitation$invitation(
    Mutation$activateInvitation$activateInvitation$invitation instance,
    TRes Function(Mutation$activateInvitation$activateInvitation$invitation)
        then,
  ) = _CopyWithImpl$Mutation$activateInvitation$activateInvitation$invitation;

  factory CopyWith$Mutation$activateInvitation$activateInvitation$invitation.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$activateInvitation$activateInvitation$invitation;

  TRes call({
    String? id,
    Enum$InvitationStatus? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$activateInvitation$activateInvitation$invitation<
        TRes>
    implements
        CopyWith$Mutation$activateInvitation$activateInvitation$invitation<
            TRes> {
  _CopyWithImpl$Mutation$activateInvitation$activateInvitation$invitation(
    this._instance,
    this._then,
  );

  final Mutation$activateInvitation$activateInvitation$invitation _instance;

  final TRes Function(Mutation$activateInvitation$activateInvitation$invitation)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$activateInvitation$activateInvitation$invitation(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$InvitationStatus),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$activateInvitation$activateInvitation$invitation<
        TRes>
    implements
        CopyWith$Mutation$activateInvitation$activateInvitation$invitation<
            TRes> {
  _CopyWithStubImpl$Mutation$activateInvitation$activateInvitation$invitation(
      this._res);

  TRes _res;

  call({
    String? id,
    Enum$InvitationStatus? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteInvitation {
  factory Variables$Mutation$deleteInvitation({required String id}) =>
      Variables$Mutation$deleteInvitation._({
        r'id': id,
      });

  Variables$Mutation$deleteInvitation._(this._$data);

  factory Variables$Mutation$deleteInvitation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$deleteInvitation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteInvitation<
          Variables$Mutation$deleteInvitation>
      get copyWith => CopyWith$Variables$Mutation$deleteInvitation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteInvitation<TRes> {
  factory CopyWith$Variables$Mutation$deleteInvitation(
    Variables$Mutation$deleteInvitation instance,
    TRes Function(Variables$Mutation$deleteInvitation) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteInvitation;

  factory CopyWith$Variables$Mutation$deleteInvitation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteInvitation;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$deleteInvitation<TRes>
    implements CopyWith$Variables$Mutation$deleteInvitation<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteInvitation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteInvitation _instance;

  final TRes Function(Variables$Mutation$deleteInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$deleteInvitation._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteInvitation<TRes>
    implements CopyWith$Variables$Mutation$deleteInvitation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteInvitation(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$deleteInvitation {
  Mutation$deleteInvitation({
    required this.deleteInvitation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$deleteInvitation.fromJson(Map<String, dynamic> json) {
    final l$deleteInvitation = json['deleteInvitation'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteInvitation(
      deleteInvitation: Mutation$deleteInvitation$deleteInvitation.fromJson(
          (l$deleteInvitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$deleteInvitation$deleteInvitation deleteInvitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteInvitation = deleteInvitation;
    _resultData['deleteInvitation'] = l$deleteInvitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteInvitation = deleteInvitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteInvitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteInvitation = deleteInvitation;
    final lOther$deleteInvitation = other.deleteInvitation;
    if (l$deleteInvitation != lOther$deleteInvitation) {
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

extension UtilityExtension$Mutation$deleteInvitation
    on Mutation$deleteInvitation {
  CopyWith$Mutation$deleteInvitation<Mutation$deleteInvitation> get copyWith =>
      CopyWith$Mutation$deleteInvitation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteInvitation<TRes> {
  factory CopyWith$Mutation$deleteInvitation(
    Mutation$deleteInvitation instance,
    TRes Function(Mutation$deleteInvitation) then,
  ) = _CopyWithImpl$Mutation$deleteInvitation;

  factory CopyWith$Mutation$deleteInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteInvitation;

  TRes call({
    Mutation$deleteInvitation$deleteInvitation? deleteInvitation,
    String? $__typename,
  });
  CopyWith$Mutation$deleteInvitation$deleteInvitation<TRes>
      get deleteInvitation;
}

class _CopyWithImpl$Mutation$deleteInvitation<TRes>
    implements CopyWith$Mutation$deleteInvitation<TRes> {
  _CopyWithImpl$Mutation$deleteInvitation(
    this._instance,
    this._then,
  );

  final Mutation$deleteInvitation _instance;

  final TRes Function(Mutation$deleteInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteInvitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteInvitation(
        deleteInvitation: deleteInvitation == _undefined ||
                deleteInvitation == null
            ? _instance.deleteInvitation
            : (deleteInvitation as Mutation$deleteInvitation$deleteInvitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteInvitation$deleteInvitation<TRes>
      get deleteInvitation {
    final local$deleteInvitation = _instance.deleteInvitation;
    return CopyWith$Mutation$deleteInvitation$deleteInvitation(
        local$deleteInvitation, (e) => call(deleteInvitation: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteInvitation<TRes>
    implements CopyWith$Mutation$deleteInvitation<TRes> {
  _CopyWithStubImpl$Mutation$deleteInvitation(this._res);

  TRes _res;

  call({
    Mutation$deleteInvitation$deleteInvitation? deleteInvitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteInvitation$deleteInvitation<TRes>
      get deleteInvitation =>
          CopyWith$Mutation$deleteInvitation$deleteInvitation.stub(_res);
}

const documentNodeMutationdeleteInvitation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteInvitation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'deleteInvitation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'invitationId'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deletedInvitationId'),
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
Mutation$deleteInvitation _parserFn$Mutation$deleteInvitation(
        Map<String, dynamic> data) =>
    Mutation$deleteInvitation.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteInvitation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$deleteInvitation?,
);

class Options$Mutation$deleteInvitation
    extends graphql.MutationOptions<Mutation$deleteInvitation> {
  Options$Mutation$deleteInvitation({
    String? operationName,
    required Variables$Mutation$deleteInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteInvitation>? update,
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
                        : _parserFn$Mutation$deleteInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteInvitation,
          parserFn: _parserFn$Mutation$deleteInvitation,
        );

  final OnMutationCompleted$Mutation$deleteInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteInvitation
    extends graphql.WatchQueryOptions<Mutation$deleteInvitation> {
  WatchOptions$Mutation$deleteInvitation({
    String? operationName,
    required Variables$Mutation$deleteInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteInvitation? typedOptimisticResult,
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
          document: documentNodeMutationdeleteInvitation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteInvitation,
        );
}

extension ClientExtension$Mutation$deleteInvitation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteInvitation>>
      mutate$deleteInvitation(
              Options$Mutation$deleteInvitation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteInvitation>
      watchMutation$deleteInvitation(
              WatchOptions$Mutation$deleteInvitation options) =>
          this.watchMutation(options);
}

class Mutation$deleteInvitation$HookResult {
  Mutation$deleteInvitation$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$deleteInvitation runMutation;

  final graphql.QueryResult<Mutation$deleteInvitation> result;
}

Mutation$deleteInvitation$HookResult useMutation$deleteInvitation(
    [WidgetOptions$Mutation$deleteInvitation? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$deleteInvitation());
  return Mutation$deleteInvitation$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$deleteInvitation>
    useWatchMutation$deleteInvitation(
            WatchOptions$Mutation$deleteInvitation options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$deleteInvitation
    extends graphql.MutationOptions<Mutation$deleteInvitation> {
  WidgetOptions$Mutation$deleteInvitation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteInvitation>? update,
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
                        : _parserFn$Mutation$deleteInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteInvitation,
          parserFn: _parserFn$Mutation$deleteInvitation,
        );

  final OnMutationCompleted$Mutation$deleteInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$deleteInvitation
    = graphql.MultiSourceResult<Mutation$deleteInvitation> Function(
  Variables$Mutation$deleteInvitation, {
  Object? optimisticResult,
  Mutation$deleteInvitation? typedOptimisticResult,
});
typedef Builder$Mutation$deleteInvitation = widgets.Widget Function(
  RunMutation$Mutation$deleteInvitation,
  graphql.QueryResult<Mutation$deleteInvitation>?,
);

class Mutation$deleteInvitation$Widget
    extends graphql_flutter.Mutation<Mutation$deleteInvitation> {
  Mutation$deleteInvitation$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$deleteInvitation? options,
    required Builder$Mutation$deleteInvitation builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$deleteInvitation(),
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

class Mutation$deleteInvitation$deleteInvitation {
  Mutation$deleteInvitation$deleteInvitation({
    required this.deletedInvitationId,
    this.$__typename = 'DeleteInvitationPayload',
  });

  factory Mutation$deleteInvitation$deleteInvitation.fromJson(
      Map<String, dynamic> json) {
    final l$deletedInvitationId = json['deletedInvitationId'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteInvitation$deleteInvitation(
      deletedInvitationId: (l$deletedInvitationId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String deletedInvitationId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deletedInvitationId = deletedInvitationId;
    _resultData['deletedInvitationId'] = l$deletedInvitationId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deletedInvitationId = deletedInvitationId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deletedInvitationId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteInvitation$deleteInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deletedInvitationId = deletedInvitationId;
    final lOther$deletedInvitationId = other.deletedInvitationId;
    if (l$deletedInvitationId != lOther$deletedInvitationId) {
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

extension UtilityExtension$Mutation$deleteInvitation$deleteInvitation
    on Mutation$deleteInvitation$deleteInvitation {
  CopyWith$Mutation$deleteInvitation$deleteInvitation<
          Mutation$deleteInvitation$deleteInvitation>
      get copyWith => CopyWith$Mutation$deleteInvitation$deleteInvitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteInvitation$deleteInvitation<TRes> {
  factory CopyWith$Mutation$deleteInvitation$deleteInvitation(
    Mutation$deleteInvitation$deleteInvitation instance,
    TRes Function(Mutation$deleteInvitation$deleteInvitation) then,
  ) = _CopyWithImpl$Mutation$deleteInvitation$deleteInvitation;

  factory CopyWith$Mutation$deleteInvitation$deleteInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteInvitation$deleteInvitation;

  TRes call({
    String? deletedInvitationId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteInvitation$deleteInvitation<TRes>
    implements CopyWith$Mutation$deleteInvitation$deleteInvitation<TRes> {
  _CopyWithImpl$Mutation$deleteInvitation$deleteInvitation(
    this._instance,
    this._then,
  );

  final Mutation$deleteInvitation$deleteInvitation _instance;

  final TRes Function(Mutation$deleteInvitation$deleteInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deletedInvitationId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteInvitation$deleteInvitation(
        deletedInvitationId:
            deletedInvitationId == _undefined || deletedInvitationId == null
                ? _instance.deletedInvitationId
                : (deletedInvitationId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteInvitation$deleteInvitation<TRes>
    implements CopyWith$Mutation$deleteInvitation$deleteInvitation<TRes> {
  _CopyWithStubImpl$Mutation$deleteInvitation$deleteInvitation(this._res);

  TRes _res;

  call({
    String? deletedInvitationId,
    String? $__typename,
  }) =>
      _res;
}
