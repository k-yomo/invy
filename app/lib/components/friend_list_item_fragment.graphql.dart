import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$friendListItemFragment {
  Fragment$friendListItemFragment({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.isMuted,
    required this.$__typename,
  });

  factory Fragment$friendListItemFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$isMuted = json['isMuted'];
    final l$$Typename = json['__typename'];
    return Fragment$friendListItemFragment(
      id: (l$id as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      isMuted: (l$isMuted as bool),
      $__typename: (l$$Typename as String),
    );
  }

  final String id;

  final String nickname;

  final String avatarUrl;

  final bool isMuted;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$nickname = nickname;
    resultData['nickname'] = l$nickname;
    final l$avatarUrl = avatarUrl;
    resultData['avatarUrl'] = l$avatarUrl;
    final l$isMuted = isMuted;
    resultData['isMuted'] = l$isMuted;
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$isMuted = isMuted;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$id,
      l$nickname,
      l$avatarUrl,
      l$isMuted,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$friendListItemFragment ||
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
    final l$$Typename = $__typename;
    final lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
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
    String? $__typename,
  });
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

  @override
  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? isMuted = _undefined,
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$friendListItemFragment<TRes>
    implements CopyWith$Fragment$friendListItemFragment<TRes> {
  _CopyWithStubImpl$Fragment$friendListItemFragment(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    bool? isMuted,
    String? $__typename,
  }) =>
      _res;
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
      writeFragment(
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
    final result = readFragment(
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
