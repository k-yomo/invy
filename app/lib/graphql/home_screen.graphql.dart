import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$pendingInvitations {
  Query$pendingInvitations({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$pendingInvitations.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$pendingInvitations(
      viewer: Query$pendingInvitations$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$pendingInvitations$viewer viewer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$viewer = viewer;
    _resultData['viewer'] = l$viewer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$viewer = viewer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$viewer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pendingInvitations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$viewer = viewer;
    final lOther$viewer = other.viewer;
    if (l$viewer != lOther$viewer) {
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

extension UtilityExtension$Query$pendingInvitations
    on Query$pendingInvitations {
  CopyWith$Query$pendingInvitations<Query$pendingInvitations> get copyWith =>
      CopyWith$Query$pendingInvitations(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$pendingInvitations<TRes> {
  factory CopyWith$Query$pendingInvitations(
    Query$pendingInvitations instance,
    TRes Function(Query$pendingInvitations) then,
  ) = _CopyWithImpl$Query$pendingInvitations;

  factory CopyWith$Query$pendingInvitations.stub(TRes res) =
      _CopyWithStubImpl$Query$pendingInvitations;

  TRes call({
    Query$pendingInvitations$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$pendingInvitations$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$pendingInvitations<TRes>
    implements CopyWith$Query$pendingInvitations<TRes> {
  _CopyWithImpl$Query$pendingInvitations(
    this._instance,
    this._then,
  );

  final Query$pendingInvitations _instance;

  final TRes Function(Query$pendingInvitations) _then;

  static const _undefined = {};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pendingInvitations(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$pendingInvitations$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pendingInvitations$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$pendingInvitations$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$pendingInvitations<TRes>
    implements CopyWith$Query$pendingInvitations<TRes> {
  _CopyWithStubImpl$Query$pendingInvitations(this._res);

  TRes _res;

  call({
    Query$pendingInvitations$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pendingInvitations$viewer<TRes> get viewer =>
      CopyWith$Query$pendingInvitations$viewer.stub(_res);
}

const documentNodeQuerypendingInvitations = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'pendingInvitations'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'viewer'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'pendingInvitations'),
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
          ),
          FieldNode(
            name: NameNode(value: 'acceptedInvitations'),
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
                name: NameNode(value: 'location'),
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
]);
Query$pendingInvitations _parserFn$Query$pendingInvitations(
        Map<String, dynamic> data) =>
    Query$pendingInvitations.fromJson(data);

class Options$Query$pendingInvitations
    extends graphql.QueryOptions<Query$pendingInvitations> {
  Options$Query$pendingInvitations({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerypendingInvitations,
          parserFn: _parserFn$Query$pendingInvitations,
        );
}

class WatchOptions$Query$pendingInvitations
    extends graphql.WatchQueryOptions<Query$pendingInvitations> {
  WatchOptions$Query$pendingInvitations({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerypendingInvitations,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$pendingInvitations,
        );
}

class FetchMoreOptions$Query$pendingInvitations
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$pendingInvitations(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerypendingInvitations,
        );
}

extension ClientExtension$Query$pendingInvitations on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$pendingInvitations>>
      query$pendingInvitations(
              [Options$Query$pendingInvitations? options]) async =>
          await this.query(options ?? Options$Query$pendingInvitations());
  graphql.ObservableQuery<Query$pendingInvitations>
      watchQuery$pendingInvitations(
              [WatchOptions$Query$pendingInvitations? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$pendingInvitations());
  void writeQuery$pendingInvitations({
    required Query$pendingInvitations data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerypendingInvitations)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$pendingInvitations? readQuery$pendingInvitations(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerypendingInvitations)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$pendingInvitations.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$pendingInvitations>
    useQuery$pendingInvitations([Options$Query$pendingInvitations? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$pendingInvitations());
graphql.ObservableQuery<Query$pendingInvitations>
    useWatchQuery$pendingInvitations(
            [WatchOptions$Query$pendingInvitations? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$pendingInvitations());

class Query$pendingInvitations$Widget
    extends graphql_flutter.Query<Query$pendingInvitations> {
  Query$pendingInvitations$Widget({
    widgets.Key? key,
    Options$Query$pendingInvitations? options,
    required graphql_flutter.QueryBuilder<Query$pendingInvitations> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$pendingInvitations(),
          builder: builder,
        );
}

class Query$pendingInvitations$viewer {
  Query$pendingInvitations$viewer({
    required this.pendingInvitations,
    required this.acceptedInvitations,
    required this.$__typename,
  });

  factory Query$pendingInvitations$viewer.fromJson(Map<String, dynamic> json) {
    final l$pendingInvitations = json['pendingInvitations'];
    final l$acceptedInvitations = json['acceptedInvitations'];
    final l$$__typename = json['__typename'];
    return Query$pendingInvitations$viewer(
      pendingInvitations: (l$pendingInvitations as List<dynamic>)
          .map((e) =>
              Query$pendingInvitations$viewer$pendingInvitations.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      acceptedInvitations: (l$acceptedInvitations as List<dynamic>)
          .map((e) =>
              Query$pendingInvitations$viewer$acceptedInvitations.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$pendingInvitations$viewer$pendingInvitations>
      pendingInvitations;

  final List<Query$pendingInvitations$viewer$acceptedInvitations>
      acceptedInvitations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pendingInvitations = pendingInvitations;
    _resultData['pendingInvitations'] =
        l$pendingInvitations.map((e) => e.toJson()).toList();
    final l$acceptedInvitations = acceptedInvitations;
    _resultData['acceptedInvitations'] =
        l$acceptedInvitations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pendingInvitations = pendingInvitations;
    final l$acceptedInvitations = acceptedInvitations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$pendingInvitations.map((v) => v)),
      Object.hashAll(l$acceptedInvitations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pendingInvitations$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pendingInvitations = pendingInvitations;
    final lOther$pendingInvitations = other.pendingInvitations;
    if (l$pendingInvitations.length != lOther$pendingInvitations.length) {
      return false;
    }
    for (int i = 0; i < l$pendingInvitations.length; i++) {
      final l$pendingInvitations$entry = l$pendingInvitations[i];
      final lOther$pendingInvitations$entry = lOther$pendingInvitations[i];
      if (l$pendingInvitations$entry != lOther$pendingInvitations$entry) {
        return false;
      }
    }
    final l$acceptedInvitations = acceptedInvitations;
    final lOther$acceptedInvitations = other.acceptedInvitations;
    if (l$acceptedInvitations.length != lOther$acceptedInvitations.length) {
      return false;
    }
    for (int i = 0; i < l$acceptedInvitations.length; i++) {
      final l$acceptedInvitations$entry = l$acceptedInvitations[i];
      final lOther$acceptedInvitations$entry = lOther$acceptedInvitations[i];
      if (l$acceptedInvitations$entry != lOther$acceptedInvitations$entry) {
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

extension UtilityExtension$Query$pendingInvitations$viewer
    on Query$pendingInvitations$viewer {
  CopyWith$Query$pendingInvitations$viewer<Query$pendingInvitations$viewer>
      get copyWith => CopyWith$Query$pendingInvitations$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pendingInvitations$viewer<TRes> {
  factory CopyWith$Query$pendingInvitations$viewer(
    Query$pendingInvitations$viewer instance,
    TRes Function(Query$pendingInvitations$viewer) then,
  ) = _CopyWithImpl$Query$pendingInvitations$viewer;

  factory CopyWith$Query$pendingInvitations$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$pendingInvitations$viewer;

  TRes call({
    List<Query$pendingInvitations$viewer$pendingInvitations>?
        pendingInvitations,
    List<Query$pendingInvitations$viewer$acceptedInvitations>?
        acceptedInvitations,
    String? $__typename,
  });
  TRes pendingInvitations(
      Iterable<Query$pendingInvitations$viewer$pendingInvitations> Function(
              Iterable<
                  CopyWith$Query$pendingInvitations$viewer$pendingInvitations<
                      Query$pendingInvitations$viewer$pendingInvitations>>)
          _fn);
  TRes acceptedInvitations(
      Iterable<Query$pendingInvitations$viewer$acceptedInvitations> Function(
              Iterable<
                  CopyWith$Query$pendingInvitations$viewer$acceptedInvitations<
                      Query$pendingInvitations$viewer$acceptedInvitations>>)
          _fn);
}

class _CopyWithImpl$Query$pendingInvitations$viewer<TRes>
    implements CopyWith$Query$pendingInvitations$viewer<TRes> {
  _CopyWithImpl$Query$pendingInvitations$viewer(
    this._instance,
    this._then,
  );

  final Query$pendingInvitations$viewer _instance;

  final TRes Function(Query$pendingInvitations$viewer) _then;

  static const _undefined = {};

  TRes call({
    Object? pendingInvitations = _undefined,
    Object? acceptedInvitations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pendingInvitations$viewer(
        pendingInvitations: pendingInvitations == _undefined ||
                pendingInvitations == null
            ? _instance.pendingInvitations
            : (pendingInvitations
                as List<Query$pendingInvitations$viewer$pendingInvitations>),
        acceptedInvitations: acceptedInvitations == _undefined ||
                acceptedInvitations == null
            ? _instance.acceptedInvitations
            : (acceptedInvitations
                as List<Query$pendingInvitations$viewer$acceptedInvitations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes pendingInvitations(
          Iterable<Query$pendingInvitations$viewer$pendingInvitations> Function(
                  Iterable<
                      CopyWith$Query$pendingInvitations$viewer$pendingInvitations<
                          Query$pendingInvitations$viewer$pendingInvitations>>)
              _fn) =>
      call(
          pendingInvitations: _fn(_instance.pendingInvitations.map((e) =>
              CopyWith$Query$pendingInvitations$viewer$pendingInvitations(
                e,
                (i) => i,
              ))).toList());
  TRes acceptedInvitations(
          Iterable<Query$pendingInvitations$viewer$acceptedInvitations> Function(
                  Iterable<
                      CopyWith$Query$pendingInvitations$viewer$acceptedInvitations<
                          Query$pendingInvitations$viewer$acceptedInvitations>>)
              _fn) =>
      call(
          acceptedInvitations: _fn(_instance.acceptedInvitations.map((e) =>
              CopyWith$Query$pendingInvitations$viewer$acceptedInvitations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$pendingInvitations$viewer<TRes>
    implements CopyWith$Query$pendingInvitations$viewer<TRes> {
  _CopyWithStubImpl$Query$pendingInvitations$viewer(this._res);

  TRes _res;

  call({
    List<Query$pendingInvitations$viewer$pendingInvitations>?
        pendingInvitations,
    List<Query$pendingInvitations$viewer$acceptedInvitations>?
        acceptedInvitations,
    String? $__typename,
  }) =>
      _res;
  pendingInvitations(_fn) => _res;
  acceptedInvitations(_fn) => _res;
}

class Query$pendingInvitations$viewer$pendingInvitations {
  Query$pendingInvitations$viewer$pendingInvitations({
    required this.id,
    required this.user,
    required this.acceptedUsers,
    required this.$__typename,
  });

  factory Query$pendingInvitations$viewer$pendingInvitations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$acceptedUsers = json['acceptedUsers'];
    final l$$__typename = json['__typename'];
    return Query$pendingInvitations$viewer$pendingInvitations(
      id: (l$id as String),
      user: Query$pendingInvitations$viewer$pendingInvitations$user.fromJson(
          (l$user as Map<String, dynamic>)),
      acceptedUsers: (l$acceptedUsers as List<dynamic>)
          .map((e) =>
              Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$pendingInvitations$viewer$pendingInvitations$user user;

  final List<Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers>
      acceptedUsers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$user = user;
    final l$acceptedUsers = acceptedUsers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Query$pendingInvitations$viewer$pendingInvitations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$pendingInvitations$viewer$pendingInvitations
    on Query$pendingInvitations$viewer$pendingInvitations {
  CopyWith$Query$pendingInvitations$viewer$pendingInvitations<
          Query$pendingInvitations$viewer$pendingInvitations>
      get copyWith =>
          CopyWith$Query$pendingInvitations$viewer$pendingInvitations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pendingInvitations$viewer$pendingInvitations<
    TRes> {
  factory CopyWith$Query$pendingInvitations$viewer$pendingInvitations(
    Query$pendingInvitations$viewer$pendingInvitations instance,
    TRes Function(Query$pendingInvitations$viewer$pendingInvitations) then,
  ) = _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations;

  factory CopyWith$Query$pendingInvitations$viewer$pendingInvitations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations;

  TRes call({
    String? id,
    Query$pendingInvitations$viewer$pendingInvitations$user? user,
    List<Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers>?
        acceptedUsers,
    String? $__typename,
  });
  CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user<TRes>
      get user;
  TRes acceptedUsers(
      Iterable<Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers> Function(
              Iterable<
                  CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers<
                      Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers>>)
          _fn);
}

class _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations<TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$pendingInvitations<TRes> {
  _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations(
    this._instance,
    this._then,
  );

  final Query$pendingInvitations$viewer$pendingInvitations _instance;

  final TRes Function(Query$pendingInvitations$viewer$pendingInvitations) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? acceptedUsers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pendingInvitations$viewer$pendingInvitations(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$pendingInvitations$viewer$pendingInvitations$user),
        acceptedUsers: acceptedUsers == _undefined || acceptedUsers == null
            ? _instance.acceptedUsers
            : (acceptedUsers as List<
                Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user(
        local$user, (e) => call(user: e));
  }

  TRes acceptedUsers(
          Iterable<Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers> Function(
                  Iterable<
                      CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers<
                          Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers>>)
              _fn) =>
      call(
          acceptedUsers: _fn(_instance.acceptedUsers.map((e) =>
              CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations<TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$pendingInvitations<TRes> {
  _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations(
      this._res);

  TRes _res;

  call({
    String? id,
    Query$pendingInvitations$viewer$pendingInvitations$user? user,
    List<Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers>?
        acceptedUsers,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user<TRes>
      get user =>
          CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user.stub(
              _res);
  acceptedUsers(_fn) => _res;
}

class Query$pendingInvitations$viewer$pendingInvitations$user {
  Query$pendingInvitations$viewer$pendingInvitations$user({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Query$pendingInvitations$viewer$pendingInvitations$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$pendingInvitations$viewer$pendingInvitations$user(
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
    if (!(other is Query$pendingInvitations$viewer$pendingInvitations$user) ||
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

extension UtilityExtension$Query$pendingInvitations$viewer$pendingInvitations$user
    on Query$pendingInvitations$viewer$pendingInvitations$user {
  CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user<
          Query$pendingInvitations$viewer$pendingInvitations$user>
      get copyWith =>
          CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user<
    TRes> {
  factory CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user(
    Query$pendingInvitations$viewer$pendingInvitations$user instance,
    TRes Function(Query$pendingInvitations$viewer$pendingInvitations$user) then,
  ) = _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations$user;

  factory CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations$user;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations$user<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user<TRes> {
  _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations$user(
    this._instance,
    this._then,
  );

  final Query$pendingInvitations$viewer$pendingInvitations$user _instance;

  final TRes Function(Query$pendingInvitations$viewer$pendingInvitations$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pendingInvitations$viewer$pendingInvitations$user(
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

class _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations$user<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$pendingInvitations$user<TRes> {
  _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations$user(
      this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

class Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers {
  Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers(
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
    if (!(other
            is Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers) ||
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

extension UtilityExtension$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers
    on Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers {
  CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers<
          Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers>
      get copyWith =>
          CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers<
    TRes> {
  factory CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers(
    Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers instance,
    TRes Function(
            Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers)
        then,
  ) = _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers;

  factory CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers.stub(
          TRes res) =
      _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers<
            TRes> {
  _CopyWithImpl$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers(
    this._instance,
    this._then,
  );

  final Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers
      _instance;

  final TRes Function(
      Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers(
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

class _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers<
            TRes> {
  _CopyWithStubImpl$Query$pendingInvitations$viewer$pendingInvitations$acceptedUsers(
      this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

class Query$pendingInvitations$viewer$acceptedInvitations {
  Query$pendingInvitations$viewer$acceptedInvitations({
    required this.id,
    required this.user,
    required this.location,
    required this.startsAt,
    required this.acceptedUsers,
    required this.$__typename,
  });

  factory Query$pendingInvitations$viewer$acceptedInvitations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$location = json['location'];
    final l$startsAt = json['startsAt'];
    final l$acceptedUsers = json['acceptedUsers'];
    final l$$__typename = json['__typename'];
    return Query$pendingInvitations$viewer$acceptedInvitations(
      id: (l$id as String),
      user: Query$pendingInvitations$viewer$acceptedInvitations$user.fromJson(
          (l$user as Map<String, dynamic>)),
      location: (l$location as String),
      startsAt: (l$startsAt as String),
      acceptedUsers: (l$acceptedUsers as List<dynamic>)
          .map((e) =>
              Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$pendingInvitations$viewer$acceptedInvitations$user user;

  final String location;

  final String startsAt;

  final List<Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers>
      acceptedUsers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$location = location;
    _resultData['location'] = l$location;
    final l$startsAt = startsAt;
    _resultData['startsAt'] = l$startsAt;
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
    final l$user = user;
    final l$location = location;
    final l$startsAt = startsAt;
    final l$acceptedUsers = acceptedUsers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$location,
      l$startsAt,
      Object.hashAll(l$acceptedUsers.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$pendingInvitations$viewer$acceptedInvitations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$startsAt = startsAt;
    final lOther$startsAt = other.startsAt;
    if (l$startsAt != lOther$startsAt) {
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

extension UtilityExtension$Query$pendingInvitations$viewer$acceptedInvitations
    on Query$pendingInvitations$viewer$acceptedInvitations {
  CopyWith$Query$pendingInvitations$viewer$acceptedInvitations<
          Query$pendingInvitations$viewer$acceptedInvitations>
      get copyWith =>
          CopyWith$Query$pendingInvitations$viewer$acceptedInvitations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pendingInvitations$viewer$acceptedInvitations<
    TRes> {
  factory CopyWith$Query$pendingInvitations$viewer$acceptedInvitations(
    Query$pendingInvitations$viewer$acceptedInvitations instance,
    TRes Function(Query$pendingInvitations$viewer$acceptedInvitations) then,
  ) = _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations;

  factory CopyWith$Query$pendingInvitations$viewer$acceptedInvitations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations;

  TRes call({
    String? id,
    Query$pendingInvitations$viewer$acceptedInvitations$user? user,
    String? location,
    String? startsAt,
    List<Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers>?
        acceptedUsers,
    String? $__typename,
  });
  CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user<TRes>
      get user;
  TRes acceptedUsers(
      Iterable<Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers> Function(
              Iterable<
                  CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers<
                      Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers>>)
          _fn);
}

class _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations<TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$acceptedInvitations<TRes> {
  _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations(
    this._instance,
    this._then,
  );

  final Query$pendingInvitations$viewer$acceptedInvitations _instance;

  final TRes Function(Query$pendingInvitations$viewer$acceptedInvitations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? location = _undefined,
    Object? startsAt = _undefined,
    Object? acceptedUsers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pendingInvitations$viewer$acceptedInvitations(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$pendingInvitations$viewer$acceptedInvitations$user),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as String),
        startsAt: startsAt == _undefined || startsAt == null
            ? _instance.startsAt
            : (startsAt as String),
        acceptedUsers: acceptedUsers == _undefined || acceptedUsers == null
            ? _instance.acceptedUsers
            : (acceptedUsers as List<
                Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user(
        local$user, (e) => call(user: e));
  }

  TRes acceptedUsers(
          Iterable<Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers> Function(
                  Iterable<
                      CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers<
                          Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers>>)
              _fn) =>
      call(
          acceptedUsers: _fn(_instance.acceptedUsers.map((e) =>
              CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$acceptedInvitations<TRes> {
  _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations(
      this._res);

  TRes _res;

  call({
    String? id,
    Query$pendingInvitations$viewer$acceptedInvitations$user? user,
    String? location,
    String? startsAt,
    List<Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers>?
        acceptedUsers,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user<TRes>
      get user =>
          CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user
              .stub(_res);
  acceptedUsers(_fn) => _res;
}

class Query$pendingInvitations$viewer$acceptedInvitations$user {
  Query$pendingInvitations$viewer$acceptedInvitations$user({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Query$pendingInvitations$viewer$acceptedInvitations$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$pendingInvitations$viewer$acceptedInvitations$user(
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
    if (!(other is Query$pendingInvitations$viewer$acceptedInvitations$user) ||
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

extension UtilityExtension$Query$pendingInvitations$viewer$acceptedInvitations$user
    on Query$pendingInvitations$viewer$acceptedInvitations$user {
  CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user<
          Query$pendingInvitations$viewer$acceptedInvitations$user>
      get copyWith =>
          CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user<
    TRes> {
  factory CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user(
    Query$pendingInvitations$viewer$acceptedInvitations$user instance,
    TRes Function(Query$pendingInvitations$viewer$acceptedInvitations$user)
        then,
  ) = _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations$user;

  factory CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations$user;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations$user<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user<
            TRes> {
  _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations$user(
    this._instance,
    this._then,
  );

  final Query$pendingInvitations$viewer$acceptedInvitations$user _instance;

  final TRes Function(Query$pendingInvitations$viewer$acceptedInvitations$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pendingInvitations$viewer$acceptedInvitations$user(
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

class _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations$user<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$user<
            TRes> {
  _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations$user(
      this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

class Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers {
  Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers(
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
    if (!(other
            is Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers) ||
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

extension UtilityExtension$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers
    on Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers {
  CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers<
          Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers>
      get copyWith =>
          CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers<
    TRes> {
  factory CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers(
    Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers instance,
    TRes Function(
            Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers)
        then,
  ) = _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers;

  factory CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers.stub(
          TRes res) =
      _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers;

  TRes call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers<
            TRes> {
  _CopyWithImpl$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers(
    this._instance,
    this._then,
  );

  final Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers
      _instance;

  final TRes Function(
      Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers(
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

class _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers<
        TRes>
    implements
        CopyWith$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers<
            TRes> {
  _CopyWithStubImpl$Query$pendingInvitations$viewer$acceptedInvitations$acceptedUsers(
      this._res);

  TRes _res;

  call({
    String? id,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}
