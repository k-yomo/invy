import 'dart:async';
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
    required this.isRequestingFriendship,
    required this.isFriend,
    required this.isMuted,
    required this.isBlocked,
    this.distanceKm,
    this.fuzzyCoordinate,
    this.$__typename = 'User',
  });

  factory Fragment$userProfileScreenFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$screenId = json['screenId'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isRequestingFriendship = json['isRequestingFriendship'];
    final l$isFriend = json['isFriend'];
    final l$isMuted = json['isMuted'];
    final l$isBlocked = json['isBlocked'];
    final l$distanceKm = json['distanceKm'];
    final l$fuzzyCoordinate = json['fuzzyCoordinate'];
    final l$$__typename = json['__typename'];
    return Fragment$userProfileScreenFragment(
      id: (l$id as String),
      screenId: (l$screenId as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isRequestingFriendship: (l$isRequestingFriendship as bool),
      isFriend: (l$isFriend as bool),
      isMuted: (l$isMuted as bool),
      isBlocked: (l$isBlocked as bool),
      distanceKm: (l$distanceKm as int?),
      fuzzyCoordinate: l$fuzzyCoordinate == null
          ? null
          : Fragment$userProfileScreenFragment$fuzzyCoordinate.fromJson(
              (l$fuzzyCoordinate as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String screenId;

  final String nickname;

  final String avatarUrl;

  final bool isRequestingFriendship;

  final bool isFriend;

  final bool isMuted;

  final bool isBlocked;

  final int? distanceKm;

  final Fragment$userProfileScreenFragment$fuzzyCoordinate? fuzzyCoordinate;

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
    final l$isRequestingFriendship = isRequestingFriendship;
    _resultData['isRequestingFriendship'] = l$isRequestingFriendship;
    final l$isFriend = isFriend;
    _resultData['isFriend'] = l$isFriend;
    final l$isMuted = isMuted;
    _resultData['isMuted'] = l$isMuted;
    final l$isBlocked = isBlocked;
    _resultData['isBlocked'] = l$isBlocked;
    final l$distanceKm = distanceKm;
    _resultData['distanceKm'] = l$distanceKm;
    final l$fuzzyCoordinate = fuzzyCoordinate;
    _resultData['fuzzyCoordinate'] = l$fuzzyCoordinate?.toJson();
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
    final l$isRequestingFriendship = isRequestingFriendship;
    final l$isFriend = isFriend;
    final l$isMuted = isMuted;
    final l$isBlocked = isBlocked;
    final l$distanceKm = distanceKm;
    final l$fuzzyCoordinate = fuzzyCoordinate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$screenId,
      l$nickname,
      l$avatarUrl,
      l$isRequestingFriendship,
      l$isFriend,
      l$isMuted,
      l$isBlocked,
      l$distanceKm,
      l$fuzzyCoordinate,
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
    final l$isRequestingFriendship = isRequestingFriendship;
    final lOther$isRequestingFriendship = other.isRequestingFriendship;
    if (l$isRequestingFriendship != lOther$isRequestingFriendship) {
      return false;
    }
    final l$isFriend = isFriend;
    final lOther$isFriend = other.isFriend;
    if (l$isFriend != lOther$isFriend) {
      return false;
    }
    final l$isMuted = isMuted;
    final lOther$isMuted = other.isMuted;
    if (l$isMuted != lOther$isMuted) {
      return false;
    }
    final l$isBlocked = isBlocked;
    final lOther$isBlocked = other.isBlocked;
    if (l$isBlocked != lOther$isBlocked) {
      return false;
    }
    final l$distanceKm = distanceKm;
    final lOther$distanceKm = other.distanceKm;
    if (l$distanceKm != lOther$distanceKm) {
      return false;
    }
    final l$fuzzyCoordinate = fuzzyCoordinate;
    final lOther$fuzzyCoordinate = other.fuzzyCoordinate;
    if (l$fuzzyCoordinate != lOther$fuzzyCoordinate) {
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
    bool? isRequestingFriendship,
    bool? isFriend,
    bool? isMuted,
    bool? isBlocked,
    int? distanceKm,
    Fragment$userProfileScreenFragment$fuzzyCoordinate? fuzzyCoordinate,
    String? $__typename,
  });
  CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate<TRes>
      get fuzzyCoordinate;
}

class _CopyWithImpl$Fragment$userProfileScreenFragment<TRes>
    implements CopyWith$Fragment$userProfileScreenFragment<TRes> {
  _CopyWithImpl$Fragment$userProfileScreenFragment(
    this._instance,
    this._then,
  );

  final Fragment$userProfileScreenFragment _instance;

  final TRes Function(Fragment$userProfileScreenFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? screenId = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isRequestingFriendship = _undefined,
    Object? isFriend = _undefined,
    Object? isMuted = _undefined,
    Object? isBlocked = _undefined,
    Object? distanceKm = _undefined,
    Object? fuzzyCoordinate = _undefined,
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
        isRequestingFriendship: isRequestingFriendship == _undefined ||
                isRequestingFriendship == null
            ? _instance.isRequestingFriendship
            : (isRequestingFriendship as bool),
        isFriend: isFriend == _undefined || isFriend == null
            ? _instance.isFriend
            : (isFriend as bool),
        isMuted: isMuted == _undefined || isMuted == null
            ? _instance.isMuted
            : (isMuted as bool),
        isBlocked: isBlocked == _undefined || isBlocked == null
            ? _instance.isBlocked
            : (isBlocked as bool),
        distanceKm: distanceKm == _undefined
            ? _instance.distanceKm
            : (distanceKm as int?),
        fuzzyCoordinate: fuzzyCoordinate == _undefined
            ? _instance.fuzzyCoordinate
            : (fuzzyCoordinate
                as Fragment$userProfileScreenFragment$fuzzyCoordinate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate<TRes>
      get fuzzyCoordinate {
    final local$fuzzyCoordinate = _instance.fuzzyCoordinate;
    return local$fuzzyCoordinate == null
        ? CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate.stub(
            _then(_instance))
        : CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate(
            local$fuzzyCoordinate, (e) => call(fuzzyCoordinate: e));
  }
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
    bool? isRequestingFriendship,
    bool? isFriend,
    bool? isMuted,
    bool? isBlocked,
    int? distanceKm,
    Fragment$userProfileScreenFragment$fuzzyCoordinate? fuzzyCoordinate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate<TRes>
      get fuzzyCoordinate =>
          CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate.stub(
              _res);
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
      name: NameNode(value: 'isRequestingFriendship'),
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
      name: NameNode(value: 'isMuted'),
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
      name: NameNode(value: 'distanceKm'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'fuzzyCoordinate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'latitude'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'longitude'),
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
);
const documentNodeFragmentuserProfileScreenFragment =
    DocumentNode(definitions: [
  fragmentDefinitionuserProfileScreenFragment,
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

class Fragment$userProfileScreenFragment$fuzzyCoordinate {
  Fragment$userProfileScreenFragment$fuzzyCoordinate({
    required this.latitude,
    required this.longitude,
    this.$__typename = 'Coordinate',
  });

  factory Fragment$userProfileScreenFragment$fuzzyCoordinate.fromJson(
      Map<String, dynamic> json) {
    final l$latitude = json['latitude'];
    final l$longitude = json['longitude'];
    final l$$__typename = json['__typename'];
    return Fragment$userProfileScreenFragment$fuzzyCoordinate(
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
    if (!(other is Fragment$userProfileScreenFragment$fuzzyCoordinate) ||
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

extension UtilityExtension$Fragment$userProfileScreenFragment$fuzzyCoordinate
    on Fragment$userProfileScreenFragment$fuzzyCoordinate {
  CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate<
          Fragment$userProfileScreenFragment$fuzzyCoordinate>
      get copyWith =>
          CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate<
    TRes> {
  factory CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate(
    Fragment$userProfileScreenFragment$fuzzyCoordinate instance,
    TRes Function(Fragment$userProfileScreenFragment$fuzzyCoordinate) then,
  ) = _CopyWithImpl$Fragment$userProfileScreenFragment$fuzzyCoordinate;

  factory CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$userProfileScreenFragment$fuzzyCoordinate;

  TRes call({
    double? latitude,
    double? longitude,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$userProfileScreenFragment$fuzzyCoordinate<TRes>
    implements
        CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate<TRes> {
  _CopyWithImpl$Fragment$userProfileScreenFragment$fuzzyCoordinate(
    this._instance,
    this._then,
  );

  final Fragment$userProfileScreenFragment$fuzzyCoordinate _instance;

  final TRes Function(Fragment$userProfileScreenFragment$fuzzyCoordinate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? latitude = _undefined,
    Object? longitude = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$userProfileScreenFragment$fuzzyCoordinate(
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

class _CopyWithStubImpl$Fragment$userProfileScreenFragment$fuzzyCoordinate<TRes>
    implements
        CopyWith$Fragment$userProfileScreenFragment$fuzzyCoordinate<TRes> {
  _CopyWithStubImpl$Fragment$userProfileScreenFragment$fuzzyCoordinate(
      this._res);

  TRes _res;

  call({
    double? latitude,
    double? longitude,
    String? $__typename,
  }) =>
      _res;
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

  static const _undefined = <dynamic, dynamic>{};

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
    this.$__typename = 'Query',
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

  static const _undefined = <dynamic, dynamic>{};

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
]);
Query$userProfileScreenUser _parserFn$Query$userProfileScreenUser(
        Map<String, dynamic> data) =>
    Query$userProfileScreenUser.fromJson(data);
typedef OnQueryComplete$Query$userProfileScreenUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$userProfileScreenUser?,
);

class Options$Query$userProfileScreenUser
    extends graphql.QueryOptions<Query$userProfileScreenUser> {
  Options$Query$userProfileScreenUser({
    String? operationName,
    required Variables$Query$userProfileScreenUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$userProfileScreenUser? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$userProfileScreenUser? onComplete,
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
                        : _parserFn$Query$userProfileScreenUser(data),
                  ),
          onError: onError,
          document: documentNodeQueryuserProfileScreenUser,
          parserFn: _parserFn$Query$userProfileScreenUser,
        );

  final OnQueryComplete$Query$userProfileScreenUser? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
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
    Query$userProfileScreenUser? typedOptimisticResult,
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
