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
    required this.location,
    this.coordinate,
    required this.comment,
    required this.startsAt,
    required this.expiresAt,
    required this.user,
    required this.acceptedUsers,
    this.$__typename = 'Invitation',
    required this.isAccepted,
  });

  factory Query$invitationDetail$invitation.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$location = json['location'];
    final l$coordinate = json['coordinate'];
    final l$comment = json['comment'];
    final l$startsAt = json['startsAt'];
    final l$expiresAt = json['expiresAt'];
    final l$user = json['user'];
    final l$acceptedUsers = json['acceptedUsers'];
    final l$$__typename = json['__typename'];
    final l$isAccepted = json['isAccepted'];
    return Query$invitationDetail$invitation(
      id: (l$id as String),
      location: (l$location as String),
      coordinate: l$coordinate == null
          ? null
          : Query$invitationDetail$invitation$coordinate.fromJson(
              (l$coordinate as Map<String, dynamic>)),
      comment: (l$comment as String),
      startsAt: DateTime.parse((l$startsAt as String)),
      expiresAt: DateTime.parse((l$expiresAt as String)),
      user: Query$invitationDetail$invitation$user.fromJson(
          (l$user as Map<String, dynamic>)),
      acceptedUsers: (l$acceptedUsers as List<dynamic>)
          .map((e) => Query$invitationDetail$invitation$acceptedUsers.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
      isAccepted: (l$isAccepted as bool),
    );
  }

  final String id;

  final String location;

  final Query$invitationDetail$invitation$coordinate? coordinate;

  final String comment;

  final DateTime startsAt;

  final DateTime expiresAt;

  final Query$invitationDetail$invitation$user user;

  final List<Query$invitationDetail$invitation$acceptedUsers> acceptedUsers;

  final String $__typename;

  final bool isAccepted;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$location = location;
    final l$coordinate = coordinate;
    final l$comment = comment;
    final l$startsAt = startsAt;
    final l$expiresAt = expiresAt;
    final l$user = user;
    final l$acceptedUsers = acceptedUsers;
    final l$$__typename = $__typename;
    final l$isAccepted = isAccepted;
    return Object.hashAll([
      l$id,
      l$location,
      l$coordinate,
      l$comment,
      l$startsAt,
      l$expiresAt,
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
    String? location,
    Query$invitationDetail$invitation$coordinate? coordinate,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    Query$invitationDetail$invitation$user? user,
    List<Query$invitationDetail$invitation$acceptedUsers>? acceptedUsers,
    String? $__typename,
    bool? isAccepted,
  });
  CopyWith$Query$invitationDetail$invitation$coordinate<TRes> get coordinate;
  CopyWith$Query$invitationDetail$invitation$user<TRes> get user;
  TRes acceptedUsers(
      Iterable<Query$invitationDetail$invitation$acceptedUsers> Function(
              Iterable<
                  CopyWith$Query$invitationDetail$invitation$acceptedUsers<
                      Query$invitationDetail$invitation$acceptedUsers>>)
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
    Object? location = _undefined,
    Object? coordinate = _undefined,
    Object? comment = _undefined,
    Object? startsAt = _undefined,
    Object? expiresAt = _undefined,
    Object? user = _undefined,
    Object? acceptedUsers = _undefined,
    Object? $__typename = _undefined,
    Object? isAccepted = _undefined,
  }) =>
      _then(Query$invitationDetail$invitation(
        id: id == _undefined || id == null ? _instance.id : (id as String),
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
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$invitationDetail$invitation$user),
        acceptedUsers: acceptedUsers == _undefined || acceptedUsers == null
            ? _instance.acceptedUsers
            : (acceptedUsers
                as List<Query$invitationDetail$invitation$acceptedUsers>),
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

  CopyWith$Query$invitationDetail$invitation$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$invitationDetail$invitation$user(
        local$user, (e) => call(user: e));
  }

  TRes acceptedUsers(
          Iterable<Query$invitationDetail$invitation$acceptedUsers> Function(
                  Iterable<
                      CopyWith$Query$invitationDetail$invitation$acceptedUsers<
                          Query$invitationDetail$invitation$acceptedUsers>>)
              _fn) =>
      call(
          acceptedUsers: _fn(_instance.acceptedUsers.map(
              (e) => CopyWith$Query$invitationDetail$invitation$acceptedUsers(
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
    String? location,
    Query$invitationDetail$invitation$coordinate? coordinate,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    Query$invitationDetail$invitation$user? user,
    List<Query$invitationDetail$invitation$acceptedUsers>? acceptedUsers,
    String? $__typename,
    bool? isAccepted,
  }) =>
      _res;
  CopyWith$Query$invitationDetail$invitation$coordinate<TRes> get coordinate =>
      CopyWith$Query$invitationDetail$invitation$coordinate.stub(_res);
  CopyWith$Query$invitationDetail$invitation$user<TRes> get user =>
      CopyWith$Query$invitationDetail$invitation$user.stub(_res);
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

class Query$invitationDetail$invitation$user
    implements Fragment$invitationDetailFragment$user {
  Query$invitationDetail$invitation$user({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    this.$__typename = 'User',
  });

  factory Query$invitationDetail$invitation$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$invitationDetail$invitation$user(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Query$invitationDetail$invitation$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$invitationDetail$invitation$user
    on Query$invitationDetail$invitation$user {
  CopyWith$Query$invitationDetail$invitation$user<
          Query$invitationDetail$invitation$user>
      get copyWith => CopyWith$Query$invitationDetail$invitation$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationDetail$invitation$user<TRes> {
  factory CopyWith$Query$invitationDetail$invitation$user(
    Query$invitationDetail$invitation$user instance,
    TRes Function(Query$invitationDetail$invitation$user) then,
  ) = _CopyWithImpl$Query$invitationDetail$invitation$user;

  factory CopyWith$Query$invitationDetail$invitation$user.stub(TRes res) =
      _CopyWithStubImpl$Query$invitationDetail$invitation$user;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$invitationDetail$invitation$user<TRes>
    implements CopyWith$Query$invitationDetail$invitation$user<TRes> {
  _CopyWithImpl$Query$invitationDetail$invitation$user(
    this._instance,
    this._then,
  );

  final Query$invitationDetail$invitation$user _instance;

  final TRes Function(Query$invitationDetail$invitation$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationDetail$invitation$user(
        id: id == _undefined || id == null ? _instance.id : (id as String),
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

class _CopyWithStubImpl$Query$invitationDetail$invitation$user<TRes>
    implements CopyWith$Query$invitationDetail$invitation$user<TRes> {
  _CopyWithStubImpl$Query$invitationDetail$invitation$user(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

class Query$invitationDetail$invitation$acceptedUsers
    implements Fragment$invitationDetailFragment$acceptedUsers {
  Query$invitationDetail$invitation$acceptedUsers({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    this.$__typename = 'User',
  });

  factory Query$invitationDetail$invitation$acceptedUsers.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$invitationDetail$invitation$acceptedUsers(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Query$invitationDetail$invitation$acceptedUsers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$invitationDetail$invitation$acceptedUsers
    on Query$invitationDetail$invitation$acceptedUsers {
  CopyWith$Query$invitationDetail$invitation$acceptedUsers<
          Query$invitationDetail$invitation$acceptedUsers>
      get copyWith => CopyWith$Query$invitationDetail$invitation$acceptedUsers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationDetail$invitation$acceptedUsers<TRes> {
  factory CopyWith$Query$invitationDetail$invitation$acceptedUsers(
    Query$invitationDetail$invitation$acceptedUsers instance,
    TRes Function(Query$invitationDetail$invitation$acceptedUsers) then,
  ) = _CopyWithImpl$Query$invitationDetail$invitation$acceptedUsers;

  factory CopyWith$Query$invitationDetail$invitation$acceptedUsers.stub(
          TRes res) =
      _CopyWithStubImpl$Query$invitationDetail$invitation$acceptedUsers;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$invitationDetail$invitation$acceptedUsers<TRes>
    implements CopyWith$Query$invitationDetail$invitation$acceptedUsers<TRes> {
  _CopyWithImpl$Query$invitationDetail$invitation$acceptedUsers(
    this._instance,
    this._then,
  );

  final Query$invitationDetail$invitation$acceptedUsers _instance;

  final TRes Function(Query$invitationDetail$invitation$acceptedUsers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationDetail$invitation$acceptedUsers(
        id: id == _undefined || id == null ? _instance.id : (id as String),
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

class _CopyWithStubImpl$Query$invitationDetail$invitation$acceptedUsers<TRes>
    implements CopyWith$Query$invitationDetail$invitation$acceptedUsers<TRes> {
  _CopyWithStubImpl$Query$invitationDetail$invitation$acceptedUsers(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}
