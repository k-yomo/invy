import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$invitationDetailFragment {
  Fragment$invitationDetailFragment({
    required this.id,
    required this.location,
    this.coordinate,
    required this.comment,
    required this.startsAt,
    required this.expiresAt,
    required this.user,
    required this.acceptedUsers,
    this.$__typename = 'Invitation',
  });

  factory Fragment$invitationDetailFragment.fromJson(
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
    return Fragment$invitationDetailFragment(
      id: (l$id as String),
      location: (l$location as String),
      coordinate: l$coordinate == null
          ? null
          : Fragment$invitationDetailFragment$coordinate.fromJson(
              (l$coordinate as Map<String, dynamic>)),
      comment: (l$comment as String),
      startsAt: DateTime.parse((l$startsAt as String)),
      expiresAt: DateTime.parse((l$expiresAt as String)),
      user: Fragment$invitationDetailFragment$user.fromJson(
          (l$user as Map<String, dynamic>)),
      acceptedUsers: (l$acceptedUsers as List<dynamic>)
          .map((e) => Fragment$invitationDetailFragment$acceptedUsers.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String location;

  final Fragment$invitationDetailFragment$coordinate? coordinate;

  final String comment;

  final DateTime startsAt;

  final DateTime expiresAt;

  final Fragment$invitationDetailFragment$user user;

  final List<Fragment$invitationDetailFragment$acceptedUsers> acceptedUsers;

  final String $__typename;

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
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$invitationDetailFragment) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$invitationDetailFragment
    on Fragment$invitationDetailFragment {
  CopyWith$Fragment$invitationDetailFragment<Fragment$invitationDetailFragment>
      get copyWith => CopyWith$Fragment$invitationDetailFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationDetailFragment<TRes> {
  factory CopyWith$Fragment$invitationDetailFragment(
    Fragment$invitationDetailFragment instance,
    TRes Function(Fragment$invitationDetailFragment) then,
  ) = _CopyWithImpl$Fragment$invitationDetailFragment;

  factory CopyWith$Fragment$invitationDetailFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$invitationDetailFragment;

  TRes call({
    String? id,
    String? location,
    Fragment$invitationDetailFragment$coordinate? coordinate,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    Fragment$invitationDetailFragment$user? user,
    List<Fragment$invitationDetailFragment$acceptedUsers>? acceptedUsers,
    String? $__typename,
  });
  CopyWith$Fragment$invitationDetailFragment$coordinate<TRes> get coordinate;
  CopyWith$Fragment$invitationDetailFragment$user<TRes> get user;
  TRes acceptedUsers(
      Iterable<Fragment$invitationDetailFragment$acceptedUsers> Function(
              Iterable<
                  CopyWith$Fragment$invitationDetailFragment$acceptedUsers<
                      Fragment$invitationDetailFragment$acceptedUsers>>)
          _fn);
}

class _CopyWithImpl$Fragment$invitationDetailFragment<TRes>
    implements CopyWith$Fragment$invitationDetailFragment<TRes> {
  _CopyWithImpl$Fragment$invitationDetailFragment(
    this._instance,
    this._then,
  );

  final Fragment$invitationDetailFragment _instance;

  final TRes Function(Fragment$invitationDetailFragment) _then;

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
  }) =>
      _then(Fragment$invitationDetailFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as String),
        coordinate: coordinate == _undefined
            ? _instance.coordinate
            : (coordinate as Fragment$invitationDetailFragment$coordinate?),
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
            : (user as Fragment$invitationDetailFragment$user),
        acceptedUsers: acceptedUsers == _undefined || acceptedUsers == null
            ? _instance.acceptedUsers
            : (acceptedUsers
                as List<Fragment$invitationDetailFragment$acceptedUsers>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$invitationDetailFragment$coordinate<TRes> get coordinate {
    final local$coordinate = _instance.coordinate;
    return local$coordinate == null
        ? CopyWith$Fragment$invitationDetailFragment$coordinate.stub(
            _then(_instance))
        : CopyWith$Fragment$invitationDetailFragment$coordinate(
            local$coordinate, (e) => call(coordinate: e));
  }

  CopyWith$Fragment$invitationDetailFragment$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Fragment$invitationDetailFragment$user(
        local$user, (e) => call(user: e));
  }

  TRes acceptedUsers(
          Iterable<Fragment$invitationDetailFragment$acceptedUsers> Function(
                  Iterable<
                      CopyWith$Fragment$invitationDetailFragment$acceptedUsers<
                          Fragment$invitationDetailFragment$acceptedUsers>>)
              _fn) =>
      call(
          acceptedUsers: _fn(_instance.acceptedUsers.map(
              (e) => CopyWith$Fragment$invitationDetailFragment$acceptedUsers(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$invitationDetailFragment<TRes>
    implements CopyWith$Fragment$invitationDetailFragment<TRes> {
  _CopyWithStubImpl$Fragment$invitationDetailFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? location,
    Fragment$invitationDetailFragment$coordinate? coordinate,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    Fragment$invitationDetailFragment$user? user,
    List<Fragment$invitationDetailFragment$acceptedUsers>? acceptedUsers,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$invitationDetailFragment$coordinate<TRes> get coordinate =>
      CopyWith$Fragment$invitationDetailFragment$coordinate.stub(_res);
  CopyWith$Fragment$invitationDetailFragment$user<TRes> get user =>
      CopyWith$Fragment$invitationDetailFragment$user.stub(_res);
  acceptedUsers(_fn) => _res;
}

const fragmentDefinitioninvitationDetailFragment = FragmentDefinitionNode(
  name: NameNode(value: 'invitationDetailFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Invitation'),
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
      name: NameNode(value: 'location'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'coordinate'),
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
      name: NameNode(value: 'comment'),
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
      name: NameNode(value: 'expiresAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'user'),
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
      name: NameNode(value: 'acceptedUsers'),
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
);
const documentNodeFragmentinvitationDetailFragment = DocumentNode(definitions: [
  fragmentDefinitioninvitationDetailFragment,
]);

extension ClientExtension$Fragment$invitationDetailFragment
    on graphql.GraphQLClient {
  void writeFragment$invitationDetailFragment({
    required Fragment$invitationDetailFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'invitationDetailFragment',
            document: documentNodeFragmentinvitationDetailFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$invitationDetailFragment? readFragment$invitationDetailFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'invitationDetailFragment',
          document: documentNodeFragmentinvitationDetailFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$invitationDetailFragment.fromJson(result);
  }
}

class Fragment$invitationDetailFragment$coordinate {
  Fragment$invitationDetailFragment$coordinate({
    required this.latitude,
    required this.longitude,
    this.$__typename = 'Coordinate',
  });

  factory Fragment$invitationDetailFragment$coordinate.fromJson(
      Map<String, dynamic> json) {
    final l$latitude = json['latitude'];
    final l$longitude = json['longitude'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationDetailFragment$coordinate(
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
    if (!(other is Fragment$invitationDetailFragment$coordinate) ||
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

extension UtilityExtension$Fragment$invitationDetailFragment$coordinate
    on Fragment$invitationDetailFragment$coordinate {
  CopyWith$Fragment$invitationDetailFragment$coordinate<
          Fragment$invitationDetailFragment$coordinate>
      get copyWith => CopyWith$Fragment$invitationDetailFragment$coordinate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationDetailFragment$coordinate<TRes> {
  factory CopyWith$Fragment$invitationDetailFragment$coordinate(
    Fragment$invitationDetailFragment$coordinate instance,
    TRes Function(Fragment$invitationDetailFragment$coordinate) then,
  ) = _CopyWithImpl$Fragment$invitationDetailFragment$coordinate;

  factory CopyWith$Fragment$invitationDetailFragment$coordinate.stub(TRes res) =
      _CopyWithStubImpl$Fragment$invitationDetailFragment$coordinate;

  TRes call({
    double? latitude,
    double? longitude,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$invitationDetailFragment$coordinate<TRes>
    implements CopyWith$Fragment$invitationDetailFragment$coordinate<TRes> {
  _CopyWithImpl$Fragment$invitationDetailFragment$coordinate(
    this._instance,
    this._then,
  );

  final Fragment$invitationDetailFragment$coordinate _instance;

  final TRes Function(Fragment$invitationDetailFragment$coordinate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? latitude = _undefined,
    Object? longitude = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationDetailFragment$coordinate(
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

class _CopyWithStubImpl$Fragment$invitationDetailFragment$coordinate<TRes>
    implements CopyWith$Fragment$invitationDetailFragment$coordinate<TRes> {
  _CopyWithStubImpl$Fragment$invitationDetailFragment$coordinate(this._res);

  TRes _res;

  call({
    double? latitude,
    double? longitude,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$invitationDetailFragment$user {
  Fragment$invitationDetailFragment$user({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    this.$__typename = 'User',
  });

  factory Fragment$invitationDetailFragment$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationDetailFragment$user(
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
    if (!(other is Fragment$invitationDetailFragment$user) ||
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

extension UtilityExtension$Fragment$invitationDetailFragment$user
    on Fragment$invitationDetailFragment$user {
  CopyWith$Fragment$invitationDetailFragment$user<
          Fragment$invitationDetailFragment$user>
      get copyWith => CopyWith$Fragment$invitationDetailFragment$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationDetailFragment$user<TRes> {
  factory CopyWith$Fragment$invitationDetailFragment$user(
    Fragment$invitationDetailFragment$user instance,
    TRes Function(Fragment$invitationDetailFragment$user) then,
  ) = _CopyWithImpl$Fragment$invitationDetailFragment$user;

  factory CopyWith$Fragment$invitationDetailFragment$user.stub(TRes res) =
      _CopyWithStubImpl$Fragment$invitationDetailFragment$user;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$invitationDetailFragment$user<TRes>
    implements CopyWith$Fragment$invitationDetailFragment$user<TRes> {
  _CopyWithImpl$Fragment$invitationDetailFragment$user(
    this._instance,
    this._then,
  );

  final Fragment$invitationDetailFragment$user _instance;

  final TRes Function(Fragment$invitationDetailFragment$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationDetailFragment$user(
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

class _CopyWithStubImpl$Fragment$invitationDetailFragment$user<TRes>
    implements CopyWith$Fragment$invitationDetailFragment$user<TRes> {
  _CopyWithStubImpl$Fragment$invitationDetailFragment$user(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$invitationDetailFragment$acceptedUsers {
  Fragment$invitationDetailFragment$acceptedUsers({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    this.$__typename = 'User',
  });

  factory Fragment$invitationDetailFragment$acceptedUsers.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationDetailFragment$acceptedUsers(
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
    if (!(other is Fragment$invitationDetailFragment$acceptedUsers) ||
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

extension UtilityExtension$Fragment$invitationDetailFragment$acceptedUsers
    on Fragment$invitationDetailFragment$acceptedUsers {
  CopyWith$Fragment$invitationDetailFragment$acceptedUsers<
          Fragment$invitationDetailFragment$acceptedUsers>
      get copyWith => CopyWith$Fragment$invitationDetailFragment$acceptedUsers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationDetailFragment$acceptedUsers<TRes> {
  factory CopyWith$Fragment$invitationDetailFragment$acceptedUsers(
    Fragment$invitationDetailFragment$acceptedUsers instance,
    TRes Function(Fragment$invitationDetailFragment$acceptedUsers) then,
  ) = _CopyWithImpl$Fragment$invitationDetailFragment$acceptedUsers;

  factory CopyWith$Fragment$invitationDetailFragment$acceptedUsers.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$invitationDetailFragment$acceptedUsers;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$invitationDetailFragment$acceptedUsers<TRes>
    implements CopyWith$Fragment$invitationDetailFragment$acceptedUsers<TRes> {
  _CopyWithImpl$Fragment$invitationDetailFragment$acceptedUsers(
    this._instance,
    this._then,
  );

  final Fragment$invitationDetailFragment$acceptedUsers _instance;

  final TRes Function(Fragment$invitationDetailFragment$acceptedUsers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationDetailFragment$acceptedUsers(
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

class _CopyWithStubImpl$Fragment$invitationDetailFragment$acceptedUsers<TRes>
    implements CopyWith$Fragment$invitationDetailFragment$acceptedUsers<TRes> {
  _CopyWithStubImpl$Fragment$invitationDetailFragment$acceptedUsers(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}
