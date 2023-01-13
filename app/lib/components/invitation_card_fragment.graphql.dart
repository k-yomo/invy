import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$invitationCardFragment {
  Fragment$invitationCardFragment({
    required this.id,
    required this.location,
    required this.comment,
    required this.startsAt,
    required this.expiresAt,
    required this.user,
    required this.acceptedUsers,
    required this.$__typename,
  });

  factory Fragment$invitationCardFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$location = json['location'];
    final l$comment = json['comment'];
    final l$startsAt = json['startsAt'];
    final l$expiresAt = json['expiresAt'];
    final l$user = json['user'];
    final l$acceptedUsers = json['acceptedUsers'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationCardFragment(
      id: (l$id as String),
      location: (l$location as String),
      comment: (l$comment as String),
      startsAt: DateTime.parse((l$startsAt as String)),
      expiresAt: DateTime.parse((l$expiresAt as String)),
      user: Fragment$invitationCardFragment$user.fromJson(
          (l$user as Map<String, dynamic>)),
      acceptedUsers: (l$acceptedUsers as List<dynamic>)
          .map((e) => Fragment$invitationCardFragment$acceptedUsers.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String location;

  final String comment;

  final DateTime startsAt;

  final DateTime expiresAt;

  final Fragment$invitationCardFragment$user user;

  final List<Fragment$invitationCardFragment$acceptedUsers> acceptedUsers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$location = location;
    _resultData['location'] = l$location;
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
    final l$comment = comment;
    final l$startsAt = startsAt;
    final l$expiresAt = expiresAt;
    final l$user = user;
    final l$acceptedUsers = acceptedUsers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$location,
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
    if (!(other is Fragment$invitationCardFragment) ||
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

extension UtilityExtension$Fragment$invitationCardFragment
    on Fragment$invitationCardFragment {
  CopyWith$Fragment$invitationCardFragment<Fragment$invitationCardFragment>
      get copyWith => CopyWith$Fragment$invitationCardFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationCardFragment<TRes> {
  factory CopyWith$Fragment$invitationCardFragment(
    Fragment$invitationCardFragment instance,
    TRes Function(Fragment$invitationCardFragment) then,
  ) = _CopyWithImpl$Fragment$invitationCardFragment;

  factory CopyWith$Fragment$invitationCardFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$invitationCardFragment;

  TRes call({
    String? id,
    String? location,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    Fragment$invitationCardFragment$user? user,
    List<Fragment$invitationCardFragment$acceptedUsers>? acceptedUsers,
    String? $__typename,
  });
  CopyWith$Fragment$invitationCardFragment$user<TRes> get user;
  TRes acceptedUsers(
      Iterable<Fragment$invitationCardFragment$acceptedUsers> Function(
              Iterable<
                  CopyWith$Fragment$invitationCardFragment$acceptedUsers<
                      Fragment$invitationCardFragment$acceptedUsers>>)
          _fn);
}

class _CopyWithImpl$Fragment$invitationCardFragment<TRes>
    implements CopyWith$Fragment$invitationCardFragment<TRes> {
  _CopyWithImpl$Fragment$invitationCardFragment(
    this._instance,
    this._then,
  );

  final Fragment$invitationCardFragment _instance;

  final TRes Function(Fragment$invitationCardFragment) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? location = _undefined,
    Object? comment = _undefined,
    Object? startsAt = _undefined,
    Object? expiresAt = _undefined,
    Object? user = _undefined,
    Object? acceptedUsers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationCardFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as String),
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
            : (user as Fragment$invitationCardFragment$user),
        acceptedUsers: acceptedUsers == _undefined || acceptedUsers == null
            ? _instance.acceptedUsers
            : (acceptedUsers
                as List<Fragment$invitationCardFragment$acceptedUsers>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$invitationCardFragment$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Fragment$invitationCardFragment$user(
        local$user, (e) => call(user: e));
  }

  TRes acceptedUsers(
          Iterable<Fragment$invitationCardFragment$acceptedUsers> Function(
                  Iterable<
                      CopyWith$Fragment$invitationCardFragment$acceptedUsers<
                          Fragment$invitationCardFragment$acceptedUsers>>)
              _fn) =>
      call(
          acceptedUsers: _fn(_instance.acceptedUsers.map(
              (e) => CopyWith$Fragment$invitationCardFragment$acceptedUsers(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$invitationCardFragment<TRes>
    implements CopyWith$Fragment$invitationCardFragment<TRes> {
  _CopyWithStubImpl$Fragment$invitationCardFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? location,
    String? comment,
    DateTime? startsAt,
    DateTime? expiresAt,
    Fragment$invitationCardFragment$user? user,
    List<Fragment$invitationCardFragment$acceptedUsers>? acceptedUsers,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$invitationCardFragment$user<TRes> get user =>
      CopyWith$Fragment$invitationCardFragment$user.stub(_res);
  acceptedUsers(_fn) => _res;
}

const fragmentDefinitioninvitationCardFragment = FragmentDefinitionNode(
  name: NameNode(value: 'invitationCardFragment'),
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
const documentNodeFragmentinvitationCardFragment = DocumentNode(definitions: [
  fragmentDefinitioninvitationCardFragment,
]);

extension ClientExtension$Fragment$invitationCardFragment
    on graphql.GraphQLClient {
  void writeFragment$invitationCardFragment({
    required Fragment$invitationCardFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'invitationCardFragment',
            document: documentNodeFragmentinvitationCardFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$invitationCardFragment? readFragment$invitationCardFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'invitationCardFragment',
          document: documentNodeFragmentinvitationCardFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$invitationCardFragment.fromJson(result);
  }
}

class Fragment$invitationCardFragment$user {
  Fragment$invitationCardFragment$user({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Fragment$invitationCardFragment$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationCardFragment$user(
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
    if (!(other is Fragment$invitationCardFragment$user) ||
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

extension UtilityExtension$Fragment$invitationCardFragment$user
    on Fragment$invitationCardFragment$user {
  CopyWith$Fragment$invitationCardFragment$user<
          Fragment$invitationCardFragment$user>
      get copyWith => CopyWith$Fragment$invitationCardFragment$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationCardFragment$user<TRes> {
  factory CopyWith$Fragment$invitationCardFragment$user(
    Fragment$invitationCardFragment$user instance,
    TRes Function(Fragment$invitationCardFragment$user) then,
  ) = _CopyWithImpl$Fragment$invitationCardFragment$user;

  factory CopyWith$Fragment$invitationCardFragment$user.stub(TRes res) =
      _CopyWithStubImpl$Fragment$invitationCardFragment$user;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$invitationCardFragment$user<TRes>
    implements CopyWith$Fragment$invitationCardFragment$user<TRes> {
  _CopyWithImpl$Fragment$invitationCardFragment$user(
    this._instance,
    this._then,
  );

  final Fragment$invitationCardFragment$user _instance;

  final TRes Function(Fragment$invitationCardFragment$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationCardFragment$user(
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

class _CopyWithStubImpl$Fragment$invitationCardFragment$user<TRes>
    implements CopyWith$Fragment$invitationCardFragment$user<TRes> {
  _CopyWithStubImpl$Fragment$invitationCardFragment$user(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$invitationCardFragment$acceptedUsers {
  Fragment$invitationCardFragment$acceptedUsers({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Fragment$invitationCardFragment$acceptedUsers.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Fragment$invitationCardFragment$acceptedUsers(
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
    if (!(other is Fragment$invitationCardFragment$acceptedUsers) ||
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

extension UtilityExtension$Fragment$invitationCardFragment$acceptedUsers
    on Fragment$invitationCardFragment$acceptedUsers {
  CopyWith$Fragment$invitationCardFragment$acceptedUsers<
          Fragment$invitationCardFragment$acceptedUsers>
      get copyWith => CopyWith$Fragment$invitationCardFragment$acceptedUsers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$invitationCardFragment$acceptedUsers<TRes> {
  factory CopyWith$Fragment$invitationCardFragment$acceptedUsers(
    Fragment$invitationCardFragment$acceptedUsers instance,
    TRes Function(Fragment$invitationCardFragment$acceptedUsers) then,
  ) = _CopyWithImpl$Fragment$invitationCardFragment$acceptedUsers;

  factory CopyWith$Fragment$invitationCardFragment$acceptedUsers.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$invitationCardFragment$acceptedUsers;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$invitationCardFragment$acceptedUsers<TRes>
    implements CopyWith$Fragment$invitationCardFragment$acceptedUsers<TRes> {
  _CopyWithImpl$Fragment$invitationCardFragment$acceptedUsers(
    this._instance,
    this._then,
  );

  final Fragment$invitationCardFragment$acceptedUsers _instance;

  final TRes Function(Fragment$invitationCardFragment$acceptedUsers) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$invitationCardFragment$acceptedUsers(
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

class _CopyWithStubImpl$Fragment$invitationCardFragment$acceptedUsers<TRes>
    implements CopyWith$Fragment$invitationCardFragment$acceptedUsers<TRes> {
  _CopyWithStubImpl$Fragment$invitationCardFragment$acceptedUsers(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}
