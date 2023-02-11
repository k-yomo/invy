import 'invitation_awaiting_list_item.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$userProfileModalFragment {
  Fragment$userProfileModalFragment({
    required this.id,
    required this.screenId,
    required this.nickname,
    required this.avatarUrl,
    required this.isMuted,
    required this.invitationAwaitings,
    required this.$__typename,
  });

  factory Fragment$userProfileModalFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$screenId = json['screenId'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isMuted = json['isMuted'];
    final l$invitationAwaitings = json['invitationAwaitings'];
    final l$$__typename = json['__typename'];
    return Fragment$userProfileModalFragment(
      id: (l$id as String),
      screenId: (l$screenId as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isMuted: (l$isMuted as bool),
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
    final l$invitationAwaitings = invitationAwaitings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$screenId,
      l$nickname,
      l$avatarUrl,
      l$isMuted,
      Object.hashAll(l$invitationAwaitings.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$userProfileModalFragment) ||
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

extension UtilityExtension$Fragment$userProfileModalFragment
    on Fragment$userProfileModalFragment {
  CopyWith$Fragment$userProfileModalFragment<Fragment$userProfileModalFragment>
      get copyWith => CopyWith$Fragment$userProfileModalFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$userProfileModalFragment<TRes> {
  factory CopyWith$Fragment$userProfileModalFragment(
    Fragment$userProfileModalFragment instance,
    TRes Function(Fragment$userProfileModalFragment) then,
  ) = _CopyWithImpl$Fragment$userProfileModalFragment;

  factory CopyWith$Fragment$userProfileModalFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$userProfileModalFragment;

  TRes call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
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

class _CopyWithImpl$Fragment$userProfileModalFragment<TRes>
    implements CopyWith$Fragment$userProfileModalFragment<TRes> {
  _CopyWithImpl$Fragment$userProfileModalFragment(
    this._instance,
    this._then,
  );

  final Fragment$userProfileModalFragment _instance;

  final TRes Function(Fragment$userProfileModalFragment) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? screenId = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isMuted = _undefined,
    Object? invitationAwaitings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$userProfileModalFragment(
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

class _CopyWithStubImpl$Fragment$userProfileModalFragment<TRes>
    implements CopyWith$Fragment$userProfileModalFragment<TRes> {
  _CopyWithStubImpl$Fragment$userProfileModalFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    List<Fragment$invitationAwaitingListItemFragment>? invitationAwaitings,
    String? $__typename,
  }) =>
      _res;
  invitationAwaitings(_fn) => _res;
}

const fragmentDefinitionuserProfileModalFragment = FragmentDefinitionNode(
  name: NameNode(value: 'userProfileModalFragment'),
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
const documentNodeFragmentuserProfileModalFragment = DocumentNode(definitions: [
  fragmentDefinitionuserProfileModalFragment,
  fragmentDefinitioninvitationAwaitingListItemFragment,
]);

extension ClientExtension$Fragment$userProfileModalFragment
    on graphql.GraphQLClient {
  void writeFragment$userProfileModalFragment({
    required Fragment$userProfileModalFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'userProfileModalFragment',
            document: documentNodeFragmentuserProfileModalFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$userProfileModalFragment? readFragment$userProfileModalFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'userProfileModalFragment',
          document: documentNodeFragmentuserProfileModalFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$userProfileModalFragment.fromJson(result);
  }
}
