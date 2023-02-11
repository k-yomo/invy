import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$friendListItemFragment {
  Fragment$friendListItemFragment({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.isMuted,
    this.distanceKm,
    required this.invitationAwaitings,
    required this.$__typename,
  });

  factory Fragment$friendListItemFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isMuted = json['isMuted'];
    final l$distanceKm = json['distanceKm'];
    final l$invitationAwaitings = json['invitationAwaitings'];
    final l$$__typename = json['__typename'];
    return Fragment$friendListItemFragment(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isMuted: (l$isMuted as bool),
      distanceKm: (l$distanceKm as int?),
      invitationAwaitings: (l$invitationAwaitings as List<dynamic>)
          .map((e) =>
              Fragment$friendListItemFragment$invitationAwaitings.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final bool isMuted;

  final int? distanceKm;

  final List<Fragment$friendListItemFragment$invitationAwaitings>
      invitationAwaitings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$nickname = nickname;
    _resultData['nickname'] = l$nickname;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$isMuted = isMuted;
    _resultData['isMuted'] = l$isMuted;
    final l$distanceKm = distanceKm;
    _resultData['distanceKm'] = l$distanceKm;
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
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$isMuted = isMuted;
    final l$distanceKm = distanceKm;
    final l$invitationAwaitings = invitationAwaitings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$nickname,
      l$avatarUrl,
      l$isMuted,
      l$distanceKm,
      Object.hashAll(l$invitationAwaitings.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$friendListItemFragment) ||
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
    final l$isMuted = isMuted;
    final lOther$isMuted = other.isMuted;
    if (l$isMuted != lOther$isMuted) {
      return false;
    }
    final l$distanceKm = distanceKm;
    final lOther$distanceKm = other.distanceKm;
    if (l$distanceKm != lOther$distanceKm) {
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

extension UtilityExtension$Fragment$friendListItemFragment
    on Fragment$friendListItemFragment {
  CopyWith$Fragment$friendListItemFragment<Fragment$friendListItemFragment>
      get copyWith => CopyWith$Fragment$friendListItemFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$friendListItemFragment<TRes> {
  factory CopyWith$Fragment$friendListItemFragment(
    Fragment$friendListItemFragment instance,
    TRes Function(Fragment$friendListItemFragment) then,
  ) = _CopyWithImpl$Fragment$friendListItemFragment;

  factory CopyWith$Fragment$friendListItemFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$friendListItemFragment;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    int? distanceKm,
    List<Fragment$friendListItemFragment$invitationAwaitings>?
        invitationAwaitings,
    String? $__typename,
  });
  TRes invitationAwaitings(
      Iterable<Fragment$friendListItemFragment$invitationAwaitings> Function(
              Iterable<
                  CopyWith$Fragment$friendListItemFragment$invitationAwaitings<
                      Fragment$friendListItemFragment$invitationAwaitings>>)
          _fn);
}

class _CopyWithImpl$Fragment$friendListItemFragment<TRes>
    implements CopyWith$Fragment$friendListItemFragment<TRes> {
  _CopyWithImpl$Fragment$friendListItemFragment(
    this._instance,
    this._then,
  );

  final Fragment$friendListItemFragment _instance;

  final TRes Function(Fragment$friendListItemFragment) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isMuted = _undefined,
    Object? distanceKm = _undefined,
    Object? invitationAwaitings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$friendListItemFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        nickname: nickname == _undefined || nickname == null
            ? _instance.nickname
            : (nickname as String),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        isMuted: isMuted == _undefined || isMuted == null
            ? _instance.isMuted
            : (isMuted as bool),
        distanceKm: distanceKm == _undefined
            ? _instance.distanceKm
            : (distanceKm as int?),
        invitationAwaitings: invitationAwaitings == _undefined ||
                invitationAwaitings == null
            ? _instance.invitationAwaitings
            : (invitationAwaitings
                as List<Fragment$friendListItemFragment$invitationAwaitings>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes invitationAwaitings(
          Iterable<Fragment$friendListItemFragment$invitationAwaitings> Function(
                  Iterable<
                      CopyWith$Fragment$friendListItemFragment$invitationAwaitings<
                          Fragment$friendListItemFragment$invitationAwaitings>>)
              _fn) =>
      call(
          invitationAwaitings: _fn(_instance.invitationAwaitings.map((e) =>
              CopyWith$Fragment$friendListItemFragment$invitationAwaitings(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$friendListItemFragment<TRes>
    implements CopyWith$Fragment$friendListItemFragment<TRes> {
  _CopyWithStubImpl$Fragment$friendListItemFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    int? distanceKm,
    List<Fragment$friendListItemFragment$invitationAwaitings>?
        invitationAwaitings,
    String? $__typename,
  }) =>
      _res;
  invitationAwaitings(_fn) => _res;
}

const fragmentDefinitionfriendListItemFragment = FragmentDefinitionNode(
  name: NameNode(value: 'friendListItemFragment'),
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
      name: NameNode(value: 'isMuted'),
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
      name: NameNode(value: 'invitationAwaitings'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
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
const documentNodeFragmentfriendListItemFragment = DocumentNode(definitions: [
  fragmentDefinitionfriendListItemFragment,
]);

extension ClientExtension$Fragment$friendListItemFragment
    on graphql.GraphQLClient {
  void writeFragment$friendListItemFragment({
    required Fragment$friendListItemFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'friendListItemFragment',
            document: documentNodeFragmentfriendListItemFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$friendListItemFragment? readFragment$friendListItemFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'friendListItemFragment',
          document: documentNodeFragmentfriendListItemFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$friendListItemFragment.fromJson(result);
  }
}

class Fragment$friendListItemFragment$invitationAwaitings {
  Fragment$friendListItemFragment$invitationAwaitings({
    required this.startsAt,
    required this.endsAt,
    required this.comment,
    required this.$__typename,
  });

  factory Fragment$friendListItemFragment$invitationAwaitings.fromJson(
      Map<String, dynamic> json) {
    final l$startsAt = json['startsAt'];
    final l$endsAt = json['endsAt'];
    final l$comment = json['comment'];
    final l$$__typename = json['__typename'];
    return Fragment$friendListItemFragment$invitationAwaitings(
      startsAt: DateTime.parse((l$startsAt as String)),
      endsAt: DateTime.parse((l$endsAt as String)),
      comment: (l$comment as String),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime startsAt;

  final DateTime endsAt;

  final String comment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$startsAt = startsAt;
    final l$endsAt = endsAt;
    final l$comment = comment;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    if (!(other is Fragment$friendListItemFragment$invitationAwaitings) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$friendListItemFragment$invitationAwaitings
    on Fragment$friendListItemFragment$invitationAwaitings {
  CopyWith$Fragment$friendListItemFragment$invitationAwaitings<
          Fragment$friendListItemFragment$invitationAwaitings>
      get copyWith =>
          CopyWith$Fragment$friendListItemFragment$invitationAwaitings(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$friendListItemFragment$invitationAwaitings<
    TRes> {
  factory CopyWith$Fragment$friendListItemFragment$invitationAwaitings(
    Fragment$friendListItemFragment$invitationAwaitings instance,
    TRes Function(Fragment$friendListItemFragment$invitationAwaitings) then,
  ) = _CopyWithImpl$Fragment$friendListItemFragment$invitationAwaitings;

  factory CopyWith$Fragment$friendListItemFragment$invitationAwaitings.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$friendListItemFragment$invitationAwaitings;

  TRes call({
    DateTime? startsAt,
    DateTime? endsAt,
    String? comment,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$friendListItemFragment$invitationAwaitings<TRes>
    implements
        CopyWith$Fragment$friendListItemFragment$invitationAwaitings<TRes> {
  _CopyWithImpl$Fragment$friendListItemFragment$invitationAwaitings(
    this._instance,
    this._then,
  );

  final Fragment$friendListItemFragment$invitationAwaitings _instance;

  final TRes Function(Fragment$friendListItemFragment$invitationAwaitings)
      _then;

  static const _undefined = {};

  TRes call({
    Object? startsAt = _undefined,
    Object? endsAt = _undefined,
    Object? comment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$friendListItemFragment$invitationAwaitings(
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

class _CopyWithStubImpl$Fragment$friendListItemFragment$invitationAwaitings<
        TRes>
    implements
        CopyWith$Fragment$friendListItemFragment$invitationAwaitings<TRes> {
  _CopyWithStubImpl$Fragment$friendListItemFragment$invitationAwaitings(
      this._res);

  TRes _res;

  call({
    DateTime? startsAt,
    DateTime? endsAt,
    String? comment,
    String? $__typename,
  }) =>
      _res;
}
