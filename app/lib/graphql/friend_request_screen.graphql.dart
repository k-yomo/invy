import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$searchUser {
  factory Variables$Query$searchUser({required String userScreenId}) =>
      Variables$Query$searchUser._({
        r'userScreenId': userScreenId,
      });

  Variables$Query$searchUser._(this._$data);

  factory Variables$Query$searchUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userScreenId = data['userScreenId'];
    result$data['userScreenId'] = (l$userScreenId as String);
    return Variables$Query$searchUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userScreenId => (_$data['userScreenId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userScreenId = userScreenId;
    result$data['userScreenId'] = l$userScreenId;
    return result$data;
  }

  CopyWith$Variables$Query$searchUser<Variables$Query$searchUser>
      get copyWith => CopyWith$Variables$Query$searchUser(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$searchUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userScreenId = userScreenId;
    final lOther$userScreenId = other.userScreenId;
    if (l$userScreenId != lOther$userScreenId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userScreenId = userScreenId;
    return Object.hashAll([l$userScreenId]);
  }
}

abstract class CopyWith$Variables$Query$searchUser<TRes> {
  factory CopyWith$Variables$Query$searchUser(
    Variables$Query$searchUser instance,
    TRes Function(Variables$Query$searchUser) then,
  ) = _CopyWithImpl$Variables$Query$searchUser;

  factory CopyWith$Variables$Query$searchUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$searchUser;

  TRes call({String? userScreenId});
}

class _CopyWithImpl$Variables$Query$searchUser<TRes>
    implements CopyWith$Variables$Query$searchUser<TRes> {
  _CopyWithImpl$Variables$Query$searchUser(
    this._instance,
    this._then,
  );

  final Variables$Query$searchUser _instance;

  final TRes Function(Variables$Query$searchUser) _then;

  static const _undefined = {};

  TRes call({Object? userScreenId = _undefined}) =>
      _then(Variables$Query$searchUser._({
        ..._instance._$data,
        if (userScreenId != _undefined && userScreenId != null)
          'userScreenId': (userScreenId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$searchUser<TRes>
    implements CopyWith$Variables$Query$searchUser<TRes> {
  _CopyWithStubImpl$Variables$Query$searchUser(this._res);

  TRes _res;

  call({String? userScreenId}) => _res;
}

class Query$searchUser {
  Query$searchUser({
    required this.userByScreenId,
    required this.$__typename,
  });

  factory Query$searchUser.fromJson(Map<String, dynamic> json) {
    final l$userByScreenId = json['userByScreenId'];
    final l$$__typename = json['__typename'];
    return Query$searchUser(
      userByScreenId: Query$searchUser$userByScreenId.fromJson(
          (l$userByScreenId as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$searchUser$userByScreenId userByScreenId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userByScreenId = userByScreenId;
    _resultData['userByScreenId'] = l$userByScreenId.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userByScreenId = userByScreenId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userByScreenId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$searchUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userByScreenId = userByScreenId;
    final lOther$userByScreenId = other.userByScreenId;
    if (l$userByScreenId != lOther$userByScreenId) {
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

extension UtilityExtension$Query$searchUser on Query$searchUser {
  CopyWith$Query$searchUser<Query$searchUser> get copyWith =>
      CopyWith$Query$searchUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$searchUser<TRes> {
  factory CopyWith$Query$searchUser(
    Query$searchUser instance,
    TRes Function(Query$searchUser) then,
  ) = _CopyWithImpl$Query$searchUser;

  factory CopyWith$Query$searchUser.stub(TRes res) =
      _CopyWithStubImpl$Query$searchUser;

  TRes call({
    Query$searchUser$userByScreenId? userByScreenId,
    String? $__typename,
  });
  CopyWith$Query$searchUser$userByScreenId<TRes> get userByScreenId;
}

class _CopyWithImpl$Query$searchUser<TRes>
    implements CopyWith$Query$searchUser<TRes> {
  _CopyWithImpl$Query$searchUser(
    this._instance,
    this._then,
  );

  final Query$searchUser _instance;

  final TRes Function(Query$searchUser) _then;

  static const _undefined = {};

  TRes call({
    Object? userByScreenId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$searchUser(
        userByScreenId: userByScreenId == _undefined || userByScreenId == null
            ? _instance.userByScreenId
            : (userByScreenId as Query$searchUser$userByScreenId),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$searchUser$userByScreenId<TRes> get userByScreenId {
    final local$userByScreenId = _instance.userByScreenId;
    return CopyWith$Query$searchUser$userByScreenId(
        local$userByScreenId, (e) => call(userByScreenId: e));
  }
}

class _CopyWithStubImpl$Query$searchUser<TRes>
    implements CopyWith$Query$searchUser<TRes> {
  _CopyWithStubImpl$Query$searchUser(this._res);

  TRes _res;

  call({
    Query$searchUser$userByScreenId? userByScreenId,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$searchUser$userByScreenId<TRes> get userByScreenId =>
      CopyWith$Query$searchUser$userByScreenId.stub(_res);
}

const documentNodeQuerysearchUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'searchUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userScreenId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'userByScreenId'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'screenId'),
            value: VariableNode(name: NameNode(value: 'userScreenId')),
          )
        ],
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
            name: NameNode(value: 'isFriend'),
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
Query$searchUser _parserFn$Query$searchUser(Map<String, dynamic> data) =>
    Query$searchUser.fromJson(data);

class Options$Query$searchUser extends graphql.QueryOptions<Query$searchUser> {
  Options$Query$searchUser({
    String? operationName,
    required Variables$Query$searchUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerysearchUser,
          parserFn: _parserFn$Query$searchUser,
        );
}

class WatchOptions$Query$searchUser
    extends graphql.WatchQueryOptions<Query$searchUser> {
  WatchOptions$Query$searchUser({
    String? operationName,
    required Variables$Query$searchUser variables,
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
          document: documentNodeQuerysearchUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$searchUser,
        );
}

class FetchMoreOptions$Query$searchUser extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$searchUser({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$searchUser variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerysearchUser,
        );
}

extension ClientExtension$Query$searchUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$searchUser>> query$searchUser(
          Options$Query$searchUser options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$searchUser> watchQuery$searchUser(
          WatchOptions$Query$searchUser options) =>
      this.watchQuery(options);
  void writeQuery$searchUser({
    required Query$searchUser data,
    required Variables$Query$searchUser variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerysearchUser),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$searchUser? readQuery$searchUser({
    required Variables$Query$searchUser variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerysearchUser),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$searchUser.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$searchUser> useQuery$searchUser(
        Options$Query$searchUser options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$searchUser> useWatchQuery$searchUser(
        WatchOptions$Query$searchUser options) =>
    graphql_flutter.useWatchQuery(options);

class Query$searchUser$Widget extends graphql_flutter.Query<Query$searchUser> {
  Query$searchUser$Widget({
    widgets.Key? key,
    required Options$Query$searchUser options,
    required graphql_flutter.QueryBuilder<Query$searchUser> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$searchUser$userByScreenId {
  Query$searchUser$userByScreenId({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.isFriend,
    required this.$__typename,
  });

  factory Query$searchUser$userByScreenId.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isFriend = json['isFriend'];
    final l$$__typename = json['__typename'];
    return Query$searchUser$userByScreenId(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isFriend: (l$isFriend as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final bool isFriend;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$nickname = nickname;
    _resultData['nickname'] = l$nickname;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$isFriend = isFriend;
    _resultData['isFriend'] = l$isFriend;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$isFriend = isFriend;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$nickname,
      l$avatarUrl,
      l$isFriend,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$searchUser$userByScreenId) ||
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
    final l$isFriend = isFriend;
    final lOther$isFriend = other.isFriend;
    if (l$isFriend != lOther$isFriend) {
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

extension UtilityExtension$Query$searchUser$userByScreenId
    on Query$searchUser$userByScreenId {
  CopyWith$Query$searchUser$userByScreenId<Query$searchUser$userByScreenId>
      get copyWith => CopyWith$Query$searchUser$userByScreenId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$searchUser$userByScreenId<TRes> {
  factory CopyWith$Query$searchUser$userByScreenId(
    Query$searchUser$userByScreenId instance,
    TRes Function(Query$searchUser$userByScreenId) then,
  ) = _CopyWithImpl$Query$searchUser$userByScreenId;

  factory CopyWith$Query$searchUser$userByScreenId.stub(TRes res) =
      _CopyWithStubImpl$Query$searchUser$userByScreenId;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    bool? isFriend,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$searchUser$userByScreenId<TRes>
    implements CopyWith$Query$searchUser$userByScreenId<TRes> {
  _CopyWithImpl$Query$searchUser$userByScreenId(
    this._instance,
    this._then,
  );

  final Query$searchUser$userByScreenId _instance;

  final TRes Function(Query$searchUser$userByScreenId) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isFriend = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$searchUser$userByScreenId(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        nickname: nickname == _undefined || nickname == null
            ? _instance.nickname
            : (nickname as String),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        isFriend: isFriend == _undefined || isFriend == null
            ? _instance.isFriend
            : (isFriend as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$searchUser$userByScreenId<TRes>
    implements CopyWith$Query$searchUser$userByScreenId<TRes> {
  _CopyWithStubImpl$Query$searchUser$userByScreenId(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    bool? isFriend,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$requestFriendship {
  factory Variables$Mutation$requestFriendship({required String userId}) =>
      Variables$Mutation$requestFriendship._({
        r'userId': userId,
      });

  Variables$Mutation$requestFriendship._(this._$data);

  factory Variables$Mutation$requestFriendship.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Mutation$requestFriendship._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Mutation$requestFriendship<
          Variables$Mutation$requestFriendship>
      get copyWith => CopyWith$Variables$Mutation$requestFriendship(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$requestFriendship) ||
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

abstract class CopyWith$Variables$Mutation$requestFriendship<TRes> {
  factory CopyWith$Variables$Mutation$requestFriendship(
    Variables$Mutation$requestFriendship instance,
    TRes Function(Variables$Mutation$requestFriendship) then,
  ) = _CopyWithImpl$Variables$Mutation$requestFriendship;

  factory CopyWith$Variables$Mutation$requestFriendship.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$requestFriendship;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Mutation$requestFriendship<TRes>
    implements CopyWith$Variables$Mutation$requestFriendship<TRes> {
  _CopyWithImpl$Variables$Mutation$requestFriendship(
    this._instance,
    this._then,
  );

  final Variables$Mutation$requestFriendship _instance;

  final TRes Function(Variables$Mutation$requestFriendship) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Mutation$requestFriendship._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$requestFriendship<TRes>
    implements CopyWith$Variables$Mutation$requestFriendship<TRes> {
  _CopyWithStubImpl$Variables$Mutation$requestFriendship(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Mutation$requestFriendship {
  Mutation$requestFriendship({
    required this.requestFriendship,
    required this.$__typename,
  });

  factory Mutation$requestFriendship.fromJson(Map<String, dynamic> json) {
    final l$requestFriendship = json['requestFriendship'];
    final l$$__typename = json['__typename'];
    return Mutation$requestFriendship(
      requestFriendship: Mutation$requestFriendship$requestFriendship.fromJson(
          (l$requestFriendship as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$requestFriendship$requestFriendship requestFriendship;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$requestFriendship = requestFriendship;
    _resultData['requestFriendship'] = l$requestFriendship.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$requestFriendship = requestFriendship;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$requestFriendship,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$requestFriendship) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$requestFriendship = requestFriendship;
    final lOther$requestFriendship = other.requestFriendship;
    if (l$requestFriendship != lOther$requestFriendship) {
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

extension UtilityExtension$Mutation$requestFriendship
    on Mutation$requestFriendship {
  CopyWith$Mutation$requestFriendship<Mutation$requestFriendship>
      get copyWith => CopyWith$Mutation$requestFriendship(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$requestFriendship<TRes> {
  factory CopyWith$Mutation$requestFriendship(
    Mutation$requestFriendship instance,
    TRes Function(Mutation$requestFriendship) then,
  ) = _CopyWithImpl$Mutation$requestFriendship;

  factory CopyWith$Mutation$requestFriendship.stub(TRes res) =
      _CopyWithStubImpl$Mutation$requestFriendship;

  TRes call({
    Mutation$requestFriendship$requestFriendship? requestFriendship,
    String? $__typename,
  });
  CopyWith$Mutation$requestFriendship$requestFriendship<TRes>
      get requestFriendship;
}

class _CopyWithImpl$Mutation$requestFriendship<TRes>
    implements CopyWith$Mutation$requestFriendship<TRes> {
  _CopyWithImpl$Mutation$requestFriendship(
    this._instance,
    this._then,
  );

  final Mutation$requestFriendship _instance;

  final TRes Function(Mutation$requestFriendship) _then;

  static const _undefined = {};

  TRes call({
    Object? requestFriendship = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$requestFriendship(
        requestFriendship:
            requestFriendship == _undefined || requestFriendship == null
                ? _instance.requestFriendship
                : (requestFriendship
                    as Mutation$requestFriendship$requestFriendship),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$requestFriendship$requestFriendship<TRes>
      get requestFriendship {
    final local$requestFriendship = _instance.requestFriendship;
    return CopyWith$Mutation$requestFriendship$requestFriendship(
        local$requestFriendship, (e) => call(requestFriendship: e));
  }
}

class _CopyWithStubImpl$Mutation$requestFriendship<TRes>
    implements CopyWith$Mutation$requestFriendship<TRes> {
  _CopyWithStubImpl$Mutation$requestFriendship(this._res);

  TRes _res;

  call({
    Mutation$requestFriendship$requestFriendship? requestFriendship,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$requestFriendship$requestFriendship<TRes>
      get requestFriendship =>
          CopyWith$Mutation$requestFriendship$requestFriendship.stub(_res);
}

const documentNodeMutationrequestFriendship = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'requestFriendship'),
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
        name: NameNode(value: 'requestFriendship'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'friendUserId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
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
Mutation$requestFriendship _parserFn$Mutation$requestFriendship(
        Map<String, dynamic> data) =>
    Mutation$requestFriendship.fromJson(data);
typedef OnMutationCompleted$Mutation$requestFriendship = FutureOr<void>
    Function(
  dynamic,
  Mutation$requestFriendship?,
);

class Options$Mutation$requestFriendship
    extends graphql.MutationOptions<Mutation$requestFriendship> {
  Options$Mutation$requestFriendship({
    String? operationName,
    required Variables$Mutation$requestFriendship variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$requestFriendship? onCompleted,
    graphql.OnMutationUpdate<Mutation$requestFriendship>? update,
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
                        : _parserFn$Mutation$requestFriendship(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationrequestFriendship,
          parserFn: _parserFn$Mutation$requestFriendship,
        );

  final OnMutationCompleted$Mutation$requestFriendship? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$requestFriendship
    extends graphql.WatchQueryOptions<Mutation$requestFriendship> {
  WatchOptions$Mutation$requestFriendship({
    String? operationName,
    required Variables$Mutation$requestFriendship variables,
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
          document: documentNodeMutationrequestFriendship,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$requestFriendship,
        );
}

extension ClientExtension$Mutation$requestFriendship on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$requestFriendship>>
      mutate$requestFriendship(
              Options$Mutation$requestFriendship options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$requestFriendship>
      watchMutation$requestFriendship(
              WatchOptions$Mutation$requestFriendship options) =>
          this.watchMutation(options);
}

class Mutation$requestFriendship$HookResult {
  Mutation$requestFriendship$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$requestFriendship runMutation;

  final graphql.QueryResult<Mutation$requestFriendship> result;
}

Mutation$requestFriendship$HookResult useMutation$requestFriendship(
    [WidgetOptions$Mutation$requestFriendship? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$requestFriendship());
  return Mutation$requestFriendship$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$requestFriendship>
    useWatchMutation$requestFriendship(
            WatchOptions$Mutation$requestFriendship options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$requestFriendship
    extends graphql.MutationOptions<Mutation$requestFriendship> {
  WidgetOptions$Mutation$requestFriendship({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$requestFriendship? onCompleted,
    graphql.OnMutationUpdate<Mutation$requestFriendship>? update,
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
                        : _parserFn$Mutation$requestFriendship(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationrequestFriendship,
          parserFn: _parserFn$Mutation$requestFriendship,
        );

  final OnMutationCompleted$Mutation$requestFriendship? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$requestFriendship
    = graphql.MultiSourceResult<Mutation$requestFriendship> Function(
  Variables$Mutation$requestFriendship, {
  Object? optimisticResult,
});
typedef Builder$Mutation$requestFriendship = widgets.Widget Function(
  RunMutation$Mutation$requestFriendship,
  graphql.QueryResult<Mutation$requestFriendship>?,
);

class Mutation$requestFriendship$Widget
    extends graphql_flutter.Mutation<Mutation$requestFriendship> {
  Mutation$requestFriendship$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$requestFriendship? options,
    required Builder$Mutation$requestFriendship builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$requestFriendship(),
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

class Mutation$requestFriendship$requestFriendship {
  Mutation$requestFriendship$requestFriendship({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$requestFriendship$requestFriendship.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$requestFriendship$requestFriendship(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$requestFriendship$requestFriendship) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$requestFriendship$requestFriendship
    on Mutation$requestFriendship$requestFriendship {
  CopyWith$Mutation$requestFriendship$requestFriendship<
          Mutation$requestFriendship$requestFriendship>
      get copyWith => CopyWith$Mutation$requestFriendship$requestFriendship(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$requestFriendship$requestFriendship<TRes> {
  factory CopyWith$Mutation$requestFriendship$requestFriendship(
    Mutation$requestFriendship$requestFriendship instance,
    TRes Function(Mutation$requestFriendship$requestFriendship) then,
  ) = _CopyWithImpl$Mutation$requestFriendship$requestFriendship;

  factory CopyWith$Mutation$requestFriendship$requestFriendship.stub(TRes res) =
      _CopyWithStubImpl$Mutation$requestFriendship$requestFriendship;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$requestFriendship$requestFriendship<TRes>
    implements CopyWith$Mutation$requestFriendship$requestFriendship<TRes> {
  _CopyWithImpl$Mutation$requestFriendship$requestFriendship(
    this._instance,
    this._then,
  );

  final Mutation$requestFriendship$requestFriendship _instance;

  final TRes Function(Mutation$requestFriendship$requestFriendship) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$requestFriendship$requestFriendship(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$requestFriendship$requestFriendship<TRes>
    implements CopyWith$Mutation$requestFriendship$requestFriendship<TRes> {
  _CopyWithStubImpl$Mutation$requestFriendship$requestFriendship(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
