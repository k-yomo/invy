import '../widgets/invitation_awaiting_list_item.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$userProfileScreenFragment {
  Fragment$userProfileScreenFragment({
    required this.id,
    required this.screenId,
    required this.nickname,
    required this.avatarUrl,
    required this.isMuted,
    required this.isFriend,
    required this.isBlocked,
    required this.invitationAwaitings,
    required this.$__typename,
  });

  factory Fragment$userProfileScreenFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$screenId = json['screenId'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isMuted = json['isMuted'];
    final l$isFriend = json['isFriend'];
    final l$isBlocked = json['isBlocked'];
    final l$invitationAwaitings = json['invitationAwaitings'];
    final l$$__typename = json['__typename'];
    return Fragment$userProfileScreenFragment(
      id: (l$id as String),
      screenId: (l$screenId as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isMuted: (l$isMuted as bool),
      isFriend: (l$isFriend as bool),
      isBlocked: (l$isBlocked as bool),
      invitationAwaitings: (l$invitationAwaitings as List<dynamic>)
          .map((e) => Fragment$invitationAwaitingListItemFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String screenId;

  final String nickname;

  final String avatarUrl;

  final bool isMuted;

  final bool isFriend;

  final bool isBlocked;

  final List<Fragment$invitationAwaitingListItemFragment> invitationAwaitings;

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
    final l$isMuted = isMuted;
    _resultData['isMuted'] = l$isMuted;
    final l$isFriend = isFriend;
    _resultData['isFriend'] = l$isFriend;
    final l$isBlocked = isBlocked;
    _resultData['isBlocked'] = l$isBlocked;
    final l$invitationAwaitings = invitationAwaitings;
    _resultData['invitationAwaitings'] =
        l$invitationAwaitings.map((e) => e.toJson()).toList();
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
    final l$isMuted = isMuted;
    final l$isFriend = isFriend;
    final l$isBlocked = isBlocked;
    final l$invitationAwaitings = invitationAwaitings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$screenId,
      l$nickname,
      l$avatarUrl,
      l$isMuted,
      l$isFriend,
      l$isBlocked,
      Object.hashAll(l$invitationAwaitings.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$userProfileScreenFragment) ||
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
    final l$isMuted = isMuted;
    final lOther$isMuted = other.isMuted;
    if (l$isMuted != lOther$isMuted) {
      return false;
    }
    final l$isFriend = isFriend;
    final lOther$isFriend = other.isFriend;
    if (l$isFriend != lOther$isFriend) {
      return false;
    }
    final l$isBlocked = isBlocked;
    final lOther$isBlocked = other.isBlocked;
    if (l$isBlocked != lOther$isBlocked) {
      return false;
    }
    final l$invitationAwaitings = invitationAwaitings;
    final lOther$invitationAwaitings = other.invitationAwaitings;
    if (l$invitationAwaitings.length != lOther$invitationAwaitings.length) {
      return false;
    }
    for (int i = 0; i < l$invitationAwaitings.length; i++) {
      final l$invitationAwaitings$entry = l$invitationAwaitings[i];
      final lOther$invitationAwaitings$entry = lOther$invitationAwaitings[i];
      if (l$invitationAwaitings$entry != lOther$invitationAwaitings$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$userProfileScreenFragment
    on Fragment$userProfileScreenFragment {
  CopyWith$Fragment$userProfileScreenFragment<
          Fragment$userProfileScreenFragment>
      get copyWith => CopyWith$Fragment$userProfileScreenFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$userProfileScreenFragment<TRes> {
  factory CopyWith$Fragment$userProfileScreenFragment(
    Fragment$userProfileScreenFragment instance,
    TRes Function(Fragment$userProfileScreenFragment) then,
  ) = _CopyWithImpl$Fragment$userProfileScreenFragment;

  factory CopyWith$Fragment$userProfileScreenFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$userProfileScreenFragment;

  TRes call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    bool? isFriend,
    bool? isBlocked,
    List<Fragment$invitationAwaitingListItemFragment>? invitationAwaitings,
    String? $__typename,
  });
  TRes invitationAwaitings(
      Iterable<Fragment$invitationAwaitingListItemFragment> Function(
              Iterable<
                  CopyWith$Fragment$invitationAwaitingListItemFragment<
                      Fragment$invitationAwaitingListItemFragment>>)
          _fn);
}

class _CopyWithImpl$Fragment$userProfileScreenFragment<TRes>
    implements CopyWith$Fragment$userProfileScreenFragment<TRes> {
  _CopyWithImpl$Fragment$userProfileScreenFragment(
    this._instance,
    this._then,
  );

  final Fragment$userProfileScreenFragment _instance;

  final TRes Function(Fragment$userProfileScreenFragment) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? screenId = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isMuted = _undefined,
    Object? isFriend = _undefined,
    Object? isBlocked = _undefined,
    Object? invitationAwaitings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$userProfileScreenFragment(
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
        isMuted: isMuted == _undefined || isMuted == null
            ? _instance.isMuted
            : (isMuted as bool),
        isFriend: isFriend == _undefined || isFriend == null
            ? _instance.isFriend
            : (isFriend as bool),
        isBlocked: isBlocked == _undefined || isBlocked == null
            ? _instance.isBlocked
            : (isBlocked as bool),
        invitationAwaitings:
            invitationAwaitings == _undefined || invitationAwaitings == null
                ? _instance.invitationAwaitings
                : (invitationAwaitings
                    as List<Fragment$invitationAwaitingListItemFragment>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes invitationAwaitings(
          Iterable<Fragment$invitationAwaitingListItemFragment> Function(
                  Iterable<
                      CopyWith$Fragment$invitationAwaitingListItemFragment<
                          Fragment$invitationAwaitingListItemFragment>>)
              _fn) =>
      call(
          invitationAwaitings: _fn(_instance.invitationAwaitings
              .map((e) => CopyWith$Fragment$invitationAwaitingListItemFragment(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$userProfileScreenFragment<TRes>
    implements CopyWith$Fragment$userProfileScreenFragment<TRes> {
  _CopyWithStubImpl$Fragment$userProfileScreenFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    bool? isFriend,
    bool? isBlocked,
    List<Fragment$invitationAwaitingListItemFragment>? invitationAwaitings,
    String? $__typename,
  }) =>
      _res;
  invitationAwaitings(_fn) => _res;
}

const fragmentDefinitionuserProfileScreenFragment = FragmentDefinitionNode(
  name: NameNode(value: 'userProfileScreenFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'User'),
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
      name: NameNode(value: 'isMuted'),
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
      name: NameNode(value: 'isBlocked'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'invitationAwaitings'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'invitationAwaitingListItemFragment'),
          directives: [],
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
);
const documentNodeFragmentuserProfileScreenFragment =
    DocumentNode(definitions: [
  fragmentDefinitionuserProfileScreenFragment,
  fragmentDefinitioninvitationAwaitingListItemFragment,
]);

extension ClientExtension$Fragment$userProfileScreenFragment
    on graphql.GraphQLClient {
  void writeFragment$userProfileScreenFragment({
    required Fragment$userProfileScreenFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'userProfileScreenFragment',
            document: documentNodeFragmentuserProfileScreenFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$userProfileScreenFragment? readFragment$userProfileScreenFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'userProfileScreenFragment',
          document: documentNodeFragmentuserProfileScreenFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$userProfileScreenFragment.fromJson(result);
  }
}

class Variables$Query$userProfileScreenUser {
  factory Variables$Query$userProfileScreenUser({required String userId}) =>
      Variables$Query$userProfileScreenUser._({
        r'userId': userId,
      });

  Variables$Query$userProfileScreenUser._(this._$data);

  factory Variables$Query$userProfileScreenUser.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Query$userProfileScreenUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$userProfileScreenUser<
          Variables$Query$userProfileScreenUser>
      get copyWith => CopyWith$Variables$Query$userProfileScreenUser(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$userProfileScreenUser) ||
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

abstract class CopyWith$Variables$Query$userProfileScreenUser<TRes> {
  factory CopyWith$Variables$Query$userProfileScreenUser(
    Variables$Query$userProfileScreenUser instance,
    TRes Function(Variables$Query$userProfileScreenUser) then,
  ) = _CopyWithImpl$Variables$Query$userProfileScreenUser;

  factory CopyWith$Variables$Query$userProfileScreenUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$userProfileScreenUser;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Query$userProfileScreenUser<TRes>
    implements CopyWith$Variables$Query$userProfileScreenUser<TRes> {
  _CopyWithImpl$Variables$Query$userProfileScreenUser(
    this._instance,
    this._then,
  );

  final Variables$Query$userProfileScreenUser _instance;

  final TRes Function(Variables$Query$userProfileScreenUser) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$userProfileScreenUser._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$userProfileScreenUser<TRes>
    implements CopyWith$Variables$Query$userProfileScreenUser<TRes> {
  _CopyWithStubImpl$Variables$Query$userProfileScreenUser(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Query$userProfileScreenUser {
  Query$userProfileScreenUser({
    required this.user,
    required this.$__typename,
  });

  factory Query$userProfileScreenUser.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$userProfileScreenUser(
      user: Fragment$userProfileScreenFragment.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$userProfileScreenFragment user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$userProfileScreenUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Query$userProfileScreenUser
    on Query$userProfileScreenUser {
  CopyWith$Query$userProfileScreenUser<Query$userProfileScreenUser>
      get copyWith => CopyWith$Query$userProfileScreenUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$userProfileScreenUser<TRes> {
  factory CopyWith$Query$userProfileScreenUser(
    Query$userProfileScreenUser instance,
    TRes Function(Query$userProfileScreenUser) then,
  ) = _CopyWithImpl$Query$userProfileScreenUser;

  factory CopyWith$Query$userProfileScreenUser.stub(TRes res) =
      _CopyWithStubImpl$Query$userProfileScreenUser;

  TRes call({
    Fragment$userProfileScreenFragment? user,
    String? $__typename,
  });
  CopyWith$Fragment$userProfileScreenFragment<TRes> get user;
}

class _CopyWithImpl$Query$userProfileScreenUser<TRes>
    implements CopyWith$Query$userProfileScreenUser<TRes> {
  _CopyWithImpl$Query$userProfileScreenUser(
    this._instance,
    this._then,
  );

  final Query$userProfileScreenUser _instance;

  final TRes Function(Query$userProfileScreenUser) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$userProfileScreenUser(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Fragment$userProfileScreenFragment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$userProfileScreenFragment<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Fragment$userProfileScreenFragment(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$userProfileScreenUser<TRes>
    implements CopyWith$Query$userProfileScreenUser<TRes> {
  _CopyWithStubImpl$Query$userProfileScreenUser(this._res);

  TRes _res;

  call({
    Fragment$userProfileScreenFragment? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$userProfileScreenFragment<TRes> get user =>
      CopyWith$Fragment$userProfileScreenFragment.stub(_res);
}

const documentNodeQueryuserProfileScreenUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'userProfileScreenUser'),
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
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'userProfileScreenFragment'),
            directives: [],
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
  fragmentDefinitionuserProfileScreenFragment,
  fragmentDefinitioninvitationAwaitingListItemFragment,
]);
Query$userProfileScreenUser _parserFn$Query$userProfileScreenUser(
        Map<String, dynamic> data) =>
    Query$userProfileScreenUser.fromJson(data);

class Options$Query$userProfileScreenUser
    extends graphql.QueryOptions<Query$userProfileScreenUser> {
  Options$Query$userProfileScreenUser({
    String? operationName,
    required Variables$Query$userProfileScreenUser variables,
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
          document: documentNodeQueryuserProfileScreenUser,
          parserFn: _parserFn$Query$userProfileScreenUser,
        );
}

class WatchOptions$Query$userProfileScreenUser
    extends graphql.WatchQueryOptions<Query$userProfileScreenUser> {
  WatchOptions$Query$userProfileScreenUser({
    String? operationName,
    required Variables$Query$userProfileScreenUser variables,
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
          document: documentNodeQueryuserProfileScreenUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$userProfileScreenUser,
        );
}

class FetchMoreOptions$Query$userProfileScreenUser
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$userProfileScreenUser({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$userProfileScreenUser variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryuserProfileScreenUser,
        );
}

extension ClientExtension$Query$userProfileScreenUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$userProfileScreenUser>>
      query$userProfileScreenUser(
              Options$Query$userProfileScreenUser options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$userProfileScreenUser>
      watchQuery$userProfileScreenUser(
              WatchOptions$Query$userProfileScreenUser options) =>
          this.watchQuery(options);
  void writeQuery$userProfileScreenUser({
    required Query$userProfileScreenUser data,
    required Variables$Query$userProfileScreenUser variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryuserProfileScreenUser),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$userProfileScreenUser? readQuery$userProfileScreenUser({
    required Variables$Query$userProfileScreenUser variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryuserProfileScreenUser),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$userProfileScreenUser.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$userProfileScreenUser>
    useQuery$userProfileScreenUser(
            Options$Query$userProfileScreenUser options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$userProfileScreenUser>
    useWatchQuery$userProfileScreenUser(
            WatchOptions$Query$userProfileScreenUser options) =>
        graphql_flutter.useWatchQuery(options);

class Query$userProfileScreenUser$Widget
    extends graphql_flutter.Query<Query$userProfileScreenUser> {
  Query$userProfileScreenUser$Widget({
    widgets.Key? key,
    required Options$Query$userProfileScreenUser options,
    required graphql_flutter.QueryBuilder<Query$userProfileScreenUser> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}
