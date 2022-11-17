import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$friendGroupListItemFragment {
  Fragment$friendGroupListItemFragment({
    required this.id,
    required this.name,
    required this.totalCount,
    required this.$__typename,
  });

  factory Fragment$friendGroupListItemFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Fragment$friendGroupListItemFragment(
      id: (l$id as String),
      name: (l$name as String),
      totalCount: (l$totalCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$totalCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$friendGroupListItemFragment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Fragment$friendGroupListItemFragment
    on Fragment$friendGroupListItemFragment {
  CopyWith$Fragment$friendGroupListItemFragment<
          Fragment$friendGroupListItemFragment>
      get copyWith => CopyWith$Fragment$friendGroupListItemFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$friendGroupListItemFragment<TRes> {
  factory CopyWith$Fragment$friendGroupListItemFragment(
    Fragment$friendGroupListItemFragment instance,
    TRes Function(Fragment$friendGroupListItemFragment) then,
  ) = _CopyWithImpl$Fragment$friendGroupListItemFragment;

  factory CopyWith$Fragment$friendGroupListItemFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$friendGroupListItemFragment;

  TRes call({
    String? id,
    String? name,
    int? totalCount,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$friendGroupListItemFragment<TRes>
    implements CopyWith$Fragment$friendGroupListItemFragment<TRes> {
  _CopyWithImpl$Fragment$friendGroupListItemFragment(
    this._instance,
    this._then,
  );

  final Fragment$friendGroupListItemFragment _instance;

  final TRes Function(Fragment$friendGroupListItemFragment) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$friendGroupListItemFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        totalCount: totalCount == _undefined || totalCount == null
            ? _instance.totalCount
            : (totalCount as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$friendGroupListItemFragment<TRes>
    implements CopyWith$Fragment$friendGroupListItemFragment<TRes> {
  _CopyWithStubImpl$Fragment$friendGroupListItemFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    int? totalCount,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionfriendGroupListItemFragment = FragmentDefinitionNode(
  name: NameNode(value: 'friendGroupListItemFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'FriendGroup'),
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
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'totalCount'),
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
const documentNodeFragmentfriendGroupListItemFragment =
    DocumentNode(definitions: [
  fragmentDefinitionfriendGroupListItemFragment,
]);

extension ClientExtension$Fragment$friendGroupListItemFragment
    on graphql.GraphQLClient {
  void writeFragment$friendGroupListItemFragment({
    required Fragment$friendGroupListItemFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'friendGroupListItemFragment',
            document: documentNodeFragmentfriendGroupListItemFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$friendGroupListItemFragment?
      readFragment$friendGroupListItemFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'friendGroupListItemFragment',
          document: documentNodeFragmentfriendGroupListItemFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$friendGroupListItemFragment.fromJson(result);
  }
}
