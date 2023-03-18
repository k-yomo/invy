import 'friend_list_item_fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$pendingFriendRequestItemFragment {
  Fragment$pendingFriendRequestItemFragment({
    required this.id,
    required this.fromUser,
    this.$__typename = 'FriendshipRequest',
  });

  factory Fragment$pendingFriendRequestItemFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$fromUser = json['fromUser'];
    final l$$__typename = json['__typename'];
    return Fragment$pendingFriendRequestItemFragment(
      id: (l$id as String),
      fromUser: Fragment$friendListItemFragment.fromJson(
          (l$fromUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Fragment$friendListItemFragment fromUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$fromUser = fromUser;
    _resultData['fromUser'] = l$fromUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$fromUser = fromUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$fromUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$pendingFriendRequestItemFragment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$fromUser = fromUser;
    final lOther$fromUser = other.fromUser;
    if (l$fromUser != lOther$fromUser) {
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

extension UtilityExtension$Fragment$pendingFriendRequestItemFragment
    on Fragment$pendingFriendRequestItemFragment {
  CopyWith$Fragment$pendingFriendRequestItemFragment<
          Fragment$pendingFriendRequestItemFragment>
      get copyWith => CopyWith$Fragment$pendingFriendRequestItemFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$pendingFriendRequestItemFragment<TRes> {
  factory CopyWith$Fragment$pendingFriendRequestItemFragment(
    Fragment$pendingFriendRequestItemFragment instance,
    TRes Function(Fragment$pendingFriendRequestItemFragment) then,
  ) = _CopyWithImpl$Fragment$pendingFriendRequestItemFragment;

  factory CopyWith$Fragment$pendingFriendRequestItemFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$pendingFriendRequestItemFragment;

  TRes call({
    String? id,
    Fragment$friendListItemFragment? fromUser,
    String? $__typename,
  });
  CopyWith$Fragment$friendListItemFragment<TRes> get fromUser;
}

class _CopyWithImpl$Fragment$pendingFriendRequestItemFragment<TRes>
    implements CopyWith$Fragment$pendingFriendRequestItemFragment<TRes> {
  _CopyWithImpl$Fragment$pendingFriendRequestItemFragment(
    this._instance,
    this._then,
  );

  final Fragment$pendingFriendRequestItemFragment _instance;

  final TRes Function(Fragment$pendingFriendRequestItemFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? fromUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$pendingFriendRequestItemFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        fromUser: fromUser == _undefined || fromUser == null
            ? _instance.fromUser
            : (fromUser as Fragment$friendListItemFragment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$friendListItemFragment<TRes> get fromUser {
    final local$fromUser = _instance.fromUser;
    return CopyWith$Fragment$friendListItemFragment(
        local$fromUser, (e) => call(fromUser: e));
  }
}

class _CopyWithStubImpl$Fragment$pendingFriendRequestItemFragment<TRes>
    implements CopyWith$Fragment$pendingFriendRequestItemFragment<TRes> {
  _CopyWithStubImpl$Fragment$pendingFriendRequestItemFragment(this._res);

  TRes _res;

  call({
    String? id,
    Fragment$friendListItemFragment? fromUser,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$friendListItemFragment<TRes> get fromUser =>
      CopyWith$Fragment$friendListItemFragment.stub(_res);
}

const fragmentDefinitionpendingFriendRequestItemFragment =
    FragmentDefinitionNode(
  name: NameNode(value: 'pendingFriendRequestItemFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'FriendshipRequest'),
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
      name: NameNode(value: 'fromUser'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'friendListItemFragment'),
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
const documentNodeFragmentpendingFriendRequestItemFragment =
    DocumentNode(definitions: [
  fragmentDefinitionpendingFriendRequestItemFragment,
  fragmentDefinitionfriendListItemFragment,
]);

extension ClientExtension$Fragment$pendingFriendRequestItemFragment
    on graphql.GraphQLClient {
  void writeFragment$pendingFriendRequestItemFragment({
    required Fragment$pendingFriendRequestItemFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'pendingFriendRequestItemFragment',
            document: documentNodeFragmentpendingFriendRequestItemFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$pendingFriendRequestItemFragment?
      readFragment$pendingFriendRequestItemFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'pendingFriendRequestItemFragment',
          document: documentNodeFragmentpendingFriendRequestItemFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$pendingFriendRequestItemFragment.fromJson(result);
  }
}
