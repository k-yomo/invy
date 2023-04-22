import '../graphql/schema.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$invitationDetailFragment {
  Fragment$invitationDetailFragment({
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
    required this.deniedUsers,
    this.$__typename = 'Invitation',
  });

  factory Fragment$invitationDetailFragment.fromJson(
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
    final l$deniedUsers = json['deniedUsers'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationDetailFragment(
      id: (l$id as String),
      status: fromJson$Enum$InvitationStatus((l$status as String)),
      location: (l$location as String),
      coordinate: l$coordinate == null
          ? null
          : Fragment$invitationDetailFragment$coordinate.fromJson(
              (l$coordinate as Map<String, dynamic>)),
      comment: (l$comment as String),
      startsAt: DateTime.parse((l$startsAt as String)),
      expiresAt: DateTime.parse((l$expiresAt as String)),
      chatRoomId: (l$chatRoomId as String?),
      user: Fragment$invitationDetailFragment$user.fromJson(
          (l$user as Map<String, dynamic>)),
      acceptedUsers: (l$acceptedUsers as List<dynamic>)
          .map((e) => Fragment$invitationDetailAcceptedUserFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      deniedUsers: (l$deniedUsers as List<dynamic>)
          .map((e) => Fragment$invitationDetailDeniedUserFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$InvitationStatus status;

  final String location;

  final Fragment$invitationDetailFragment$coordinate? coordinate;

  final String comment;

  final DateTime startsAt;

  final DateTime expiresAt;

  final String? chatRoomId;

  final Fragment$invitationDetailFragment$user user;

  final List<Fragment$invitationDetailAcceptedUserFragment> acceptedUsers;

  final List<Fragment$invitationDetailDeniedUserFragment> deniedUsers;

  final String $__typename;

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
    final l$deniedUsers = deniedUsers;
    _resultData['deniedUsers'] = l$deniedUsers.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    final l$deniedUsers = deniedUsers;
    final l$$__typename = $__typename;
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
      Object.hashAll(l$deniedUsers.map((v) => v)),
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
    final l$deniedUsers = deniedUsers;
    final lOther$deniedUsers = other.deniedUsers;
    if (l$deniedUsers.length != lOther$deniedUsers.length) {
      return false;
    }
    for (int i = 0; i < l$deniedUsers.length; i++) {
      final l$deniedUsers$entry = l$deniedUsers[i];
      final lOther$deniedUsers$entry = lOther$deniedUsers[i];
      if (l$deniedUsers$entry != lOther$deniedUsers$entry) {
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
    Enum$InvitationStatus? status,
    String? location,
    Fragment$invitationDetailFragment$coordinate? coordinate,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    String? chatRoomId,
    Fragment$invitationDetailFragment$user? user,
    List<Fragment$invitationDetailAcceptedUserFragment>? acceptedUsers,
    List<Fragment$invitationDetailDeniedUserFragment>? deniedUsers,
    String? $__typename,
  });
  CopyWith$Fragment$invitationDetailFragment$coordinate<TRes> get coordinate;
  CopyWith$Fragment$invitationDetailFragment$user<TRes> get user;
  TRes acceptedUsers(
      Iterable<Fragment$invitationDetailAcceptedUserFragment> Function(
              Iterable<
                  CopyWith$Fragment$invitationDetailAcceptedUserFragment<
                      Fragment$invitationDetailAcceptedUserFragment>>)
          _fn);
  TRes deniedUsers(
      Iterable<Fragment$invitationDetailDeniedUserFragment> Function(
              Iterable<
                  CopyWith$Fragment$invitationDetailDeniedUserFragment<
                      Fragment$invitationDetailDeniedUserFragment>>)
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
    Object? status = _undefined,
    Object? location = _undefined,
    Object? coordinate = _undefined,
    Object? comment = _undefined,
    Object? startsAt = _undefined,
    Object? expiresAt = _undefined,
    Object? chatRoomId = _undefined,
    Object? user = _undefined,
    Object? acceptedUsers = _undefined,
    Object? deniedUsers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationDetailFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$InvitationStatus),
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
        chatRoomId: chatRoomId == _undefined
            ? _instance.chatRoomId
            : (chatRoomId as String?),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Fragment$invitationDetailFragment$user),
        acceptedUsers: acceptedUsers == _undefined || acceptedUsers == null
            ? _instance.acceptedUsers
            : (acceptedUsers
                as List<Fragment$invitationDetailAcceptedUserFragment>),
        deniedUsers: deniedUsers == _undefined || deniedUsers == null
            ? _instance.deniedUsers
            : (deniedUsers
                as List<Fragment$invitationDetailDeniedUserFragment>),
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
  TRes deniedUsers(
          Iterable<Fragment$invitationDetailDeniedUserFragment> Function(
                  Iterable<
                      CopyWith$Fragment$invitationDetailDeniedUserFragment<
                          Fragment$invitationDetailDeniedUserFragment>>)
              _fn) =>
      call(
          deniedUsers: _fn(_instance.deniedUsers
              .map((e) => CopyWith$Fragment$invitationDetailDeniedUserFragment(
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
    Enum$InvitationStatus? status,
    String? location,
    Fragment$invitationDetailFragment$coordinate? coordinate,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    String? chatRoomId,
    Fragment$invitationDetailFragment$user? user,
    List<Fragment$invitationDetailAcceptedUserFragment>? acceptedUsers,
    List<Fragment$invitationDetailDeniedUserFragment>? deniedUsers,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$invitationDetailFragment$coordinate<TRes> get coordinate =>
      CopyWith$Fragment$invitationDetailFragment$coordinate.stub(_res);
  CopyWith$Fragment$invitationDetailFragment$user<TRes> get user =>
      CopyWith$Fragment$invitationDetailFragment$user.stub(_res);
  acceptedUsers(_fn) => _res;
  deniedUsers(_fn) => _res;
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
      name: NameNode(value: 'status'),
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
      name: NameNode(value: 'chatRoomId'),
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
        FragmentSpreadNode(
          name: NameNode(value: 'invitationDetailAcceptedUserFragment'),
          directives: [],
        ),
        FieldNode(
          name: NameNode(value: 'distanceKm'),
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
        FragmentSpreadNode(
          name: NameNode(value: 'invitationDetailAcceptedUserFragment'),
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
      name: NameNode(value: 'deniedUsers'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'invitationDetailDeniedUserFragment'),
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
const documentNodeFragmentinvitationDetailFragment = DocumentNode(definitions: [
  fragmentDefinitioninvitationDetailFragment,
  fragmentDefinitioninvitationDetailAcceptedUserFragment,
  fragmentDefinitioninvitationDetailDeniedUserFragment,
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

class Fragment$invitationDetailFragment$user
    implements Fragment$invitationDetailAcceptedUserFragment {
  Fragment$invitationDetailFragment$user({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    this.$__typename = 'User',
    this.distanceKm,
  });

  factory Fragment$invitationDetailFragment$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    final l$distanceKm = json['distanceKm'];
    return Fragment$invitationDetailFragment$user(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      $__typename: (l$$__typename as String),
      distanceKm: (l$distanceKm as int?),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final String $__typename;

  final int? distanceKm;

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
    final l$distanceKm = distanceKm;
    _resultData['distanceKm'] = l$distanceKm;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$$__typename = $__typename;
    final l$distanceKm = distanceKm;
    return Object.hashAll([
      l$id,
      l$nickname,
      l$avatarUrl,
      l$$__typename,
      l$distanceKm,
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
    final l$distanceKm = distanceKm;
    final lOther$distanceKm = other.distanceKm;
    if (l$distanceKm != lOther$distanceKm) {
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
    int? distanceKm,
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
    Object? distanceKm = _undefined,
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
        distanceKm: distanceKm == _undefined
            ? _instance.distanceKm
            : (distanceKm as int?),
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
    int? distanceKm,
  }) =>
      _res;
}

class Fragment$invitationDetailAcceptedUserFragment {
  Fragment$invitationDetailAcceptedUserFragment({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    this.$__typename = 'User',
  });

  factory Fragment$invitationDetailAcceptedUserFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationDetailAcceptedUserFragment(
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
    if (!(other is Fragment$invitationDetailAcceptedUserFragment) ||
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

extension UtilityExtension$Fragment$invitationDetailAcceptedUserFragment
    on Fragment$invitationDetailAcceptedUserFragment {
  CopyWith$Fragment$invitationDetailAcceptedUserFragment<
          Fragment$invitationDetailAcceptedUserFragment>
      get copyWith => CopyWith$Fragment$invitationDetailAcceptedUserFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationDetailAcceptedUserFragment<TRes> {
  factory CopyWith$Fragment$invitationDetailAcceptedUserFragment(
    Fragment$invitationDetailAcceptedUserFragment instance,
    TRes Function(Fragment$invitationDetailAcceptedUserFragment) then,
  ) = _CopyWithImpl$Fragment$invitationDetailAcceptedUserFragment;

  factory CopyWith$Fragment$invitationDetailAcceptedUserFragment.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$invitationDetailAcceptedUserFragment;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$invitationDetailAcceptedUserFragment<TRes>
    implements CopyWith$Fragment$invitationDetailAcceptedUserFragment<TRes> {
  _CopyWithImpl$Fragment$invitationDetailAcceptedUserFragment(
    this._instance,
    this._then,
  );

  final Fragment$invitationDetailAcceptedUserFragment _instance;

  final TRes Function(Fragment$invitationDetailAcceptedUserFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationDetailAcceptedUserFragment(
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

class _CopyWithStubImpl$Fragment$invitationDetailAcceptedUserFragment<TRes>
    implements CopyWith$Fragment$invitationDetailAcceptedUserFragment<TRes> {
  _CopyWithStubImpl$Fragment$invitationDetailAcceptedUserFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitioninvitationDetailAcceptedUserFragment =
    FragmentDefinitionNode(
  name: NameNode(value: 'invitationDetailAcceptedUserFragment'),
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
);
const documentNodeFragmentinvitationDetailAcceptedUserFragment =
    DocumentNode(definitions: [
  fragmentDefinitioninvitationDetailAcceptedUserFragment,
]);

extension ClientExtension$Fragment$invitationDetailAcceptedUserFragment
    on graphql.GraphQLClient {
  void writeFragment$invitationDetailAcceptedUserFragment({
    required Fragment$invitationDetailAcceptedUserFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'invitationDetailAcceptedUserFragment',
            document: documentNodeFragmentinvitationDetailAcceptedUserFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$invitationDetailAcceptedUserFragment?
      readFragment$invitationDetailAcceptedUserFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'invitationDetailAcceptedUserFragment',
          document: documentNodeFragmentinvitationDetailAcceptedUserFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$invitationDetailAcceptedUserFragment.fromJson(result);
  }
}

class Fragment$invitationDetailDeniedUserFragment {
  Fragment$invitationDetailDeniedUserFragment({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    this.$__typename = 'User',
  });

  factory Fragment$invitationDetailDeniedUserFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationDetailDeniedUserFragment(
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
    if (!(other is Fragment$invitationDetailDeniedUserFragment) ||
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

extension UtilityExtension$Fragment$invitationDetailDeniedUserFragment
    on Fragment$invitationDetailDeniedUserFragment {
  CopyWith$Fragment$invitationDetailDeniedUserFragment<
          Fragment$invitationDetailDeniedUserFragment>
      get copyWith => CopyWith$Fragment$invitationDetailDeniedUserFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationDetailDeniedUserFragment<TRes> {
  factory CopyWith$Fragment$invitationDetailDeniedUserFragment(
    Fragment$invitationDetailDeniedUserFragment instance,
    TRes Function(Fragment$invitationDetailDeniedUserFragment) then,
  ) = _CopyWithImpl$Fragment$invitationDetailDeniedUserFragment;

  factory CopyWith$Fragment$invitationDetailDeniedUserFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$invitationDetailDeniedUserFragment;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$invitationDetailDeniedUserFragment<TRes>
    implements CopyWith$Fragment$invitationDetailDeniedUserFragment<TRes> {
  _CopyWithImpl$Fragment$invitationDetailDeniedUserFragment(
    this._instance,
    this._then,
  );

  final Fragment$invitationDetailDeniedUserFragment _instance;

  final TRes Function(Fragment$invitationDetailDeniedUserFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationDetailDeniedUserFragment(
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

class _CopyWithStubImpl$Fragment$invitationDetailDeniedUserFragment<TRes>
    implements CopyWith$Fragment$invitationDetailDeniedUserFragment<TRes> {
  _CopyWithStubImpl$Fragment$invitationDetailDeniedUserFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitioninvitationDetailDeniedUserFragment =
    FragmentDefinitionNode(
  name: NameNode(value: 'invitationDetailDeniedUserFragment'),
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
);
const documentNodeFragmentinvitationDetailDeniedUserFragment =
    DocumentNode(definitions: [
  fragmentDefinitioninvitationDetailDeniedUserFragment,
]);

extension ClientExtension$Fragment$invitationDetailDeniedUserFragment
    on graphql.GraphQLClient {
  void writeFragment$invitationDetailDeniedUserFragment({
    required Fragment$invitationDetailDeniedUserFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'invitationDetailDeniedUserFragment',
            document: documentNodeFragmentinvitationDetailDeniedUserFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$invitationDetailDeniedUserFragment?
      readFragment$invitationDetailDeniedUserFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'invitationDetailDeniedUserFragment',
          document: documentNodeFragmentinvitationDetailDeniedUserFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$invitationDetailDeniedUserFragment.fromJson(result);
  }
}
