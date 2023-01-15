import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$viewer {
  Query$viewer({
    required this.viewer,
    required this.$__typename,
  });

  factory Query$viewer.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$Typename = json['__typename'];
    return Query$viewer(
      viewer: Query$viewer$viewer.fromJson((l$viewer as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Query$viewer$viewer viewer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$viewer = viewer;
    resultData['viewer'] = l$viewer.toJson();
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$viewer = viewer;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$viewer,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$viewer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$viewer = viewer;
    final lOther$viewer = other.viewer;
    if (l$viewer != lOther$viewer) {
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

extension UtilityExtension$Query$viewer on Query$viewer {
  CopyWith$Query$viewer<Query$viewer> get copyWith => CopyWith$Query$viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$viewer<TRes> {
  factory CopyWith$Query$viewer(
    Query$viewer instance,
    TRes Function(Query$viewer) then,
  ) = _CopyWithImpl$Query$viewer;

  factory CopyWith$Query$viewer.stub(TRes res) = _CopyWithStubImpl$Query$viewer;

  TRes call({
    Query$viewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$viewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$viewer<TRes> implements CopyWith$Query$viewer<TRes> {
  _CopyWithImpl$Query$viewer(
    this._instance,
    this._then,
  );

  final Query$viewer _instance;

  final TRes Function(Query$viewer) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$viewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$viewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Query$viewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$viewer$viewer(local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$viewer<TRes>
    implements CopyWith$Query$viewer<TRes> {
  _CopyWithStubImpl$Query$viewer(this._res);

  final TRes _res;

  @override
  call({
    Query$viewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Query$viewer$viewer<TRes> get viewer =>
      CopyWith$Query$viewer$viewer.stub(_res);
}

const documentNodeQueryviewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'viewer'),
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
Query$viewer _parserFn$Query$viewer(Map<String, dynamic> data) =>
    Query$viewer.fromJson(data);

class Options$Query$viewer extends graphql.QueryOptions<Query$viewer> {
  Options$Query$viewer({
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
          document: documentNodeQueryviewer,
          parserFn: _parserFn$Query$viewer,
        );
}

class WatchOptions$Query$viewer
    extends graphql.WatchQueryOptions<Query$viewer> {
  WatchOptions$Query$viewer({
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
          document: documentNodeQueryviewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$viewer,
        );
}

class FetchMoreOptions$Query$viewer extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$viewer({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryviewer,
        );
}

extension ClientExtension$Query$viewer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$viewer>> query$viewer(
          [Options$Query$viewer? options]) async =>
      await query(options ?? Options$Query$viewer());
  graphql.ObservableQuery<Query$viewer> watchQuery$viewer(
          [WatchOptions$Query$viewer? options]) =>
      watchQuery(options ?? WatchOptions$Query$viewer());
  void writeQuery$viewer({
    required Query$viewer data,
    bool broadcast = true,
  }) =>
      writeQuery(
        const graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryviewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$viewer? readQuery$viewer({bool optimistic = true}) {
    final result = readQuery(
      const graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryviewer)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$viewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$viewer> useQuery$viewer(
        [Options$Query$viewer? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$viewer());
graphql.ObservableQuery<Query$viewer> useWatchQuery$viewer(
        [WatchOptions$Query$viewer? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$viewer());

class Query$viewer$Widget extends graphql_flutter.Query<Query$viewer> {
  Query$viewer$Widget({
    widgets.Key? key,
    Options$Query$viewer? options,
    required graphql_flutter.QueryBuilder<Query$viewer> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$viewer(),
          builder: builder,
        );
}

class Query$viewer$viewer {
  Query$viewer$viewer({
    required this.id,
    required this.screenId,
    required this.nickname,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Query$viewer$viewer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$screenId = json['screenId'];
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$Typename = json['__typename'];
    return Query$viewer$viewer(
      id: (l$id as String),
      screenId: (l$screenId as String),
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      $__typename: (l$$Typename as String),
    );
  }

  final String id;

  final String screenId;

  final String nickname;

  final String avatarUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$screenId = screenId;
    resultData['screenId'] = l$screenId;
    final l$nickname = nickname;
    resultData['nickname'] = l$nickname;
    final l$avatarUrl = avatarUrl;
    resultData['avatarUrl'] = l$avatarUrl;
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$screenId = screenId;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$id,
      l$screenId,
      l$nickname,
      l$avatarUrl,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$viewer$viewer || runtimeType != other.runtimeType) {
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
    final l$$Typename = $__typename;
    final lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$viewer$viewer on Query$viewer$viewer {
  CopyWith$Query$viewer$viewer<Query$viewer$viewer> get copyWith =>
      CopyWith$Query$viewer$viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$viewer$viewer<TRes> {
  factory CopyWith$Query$viewer$viewer(
    Query$viewer$viewer instance,
    TRes Function(Query$viewer$viewer) then,
  ) = _CopyWithImpl$Query$viewer$viewer;

  factory CopyWith$Query$viewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$viewer$viewer;

  TRes call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$viewer$viewer<TRes>
    implements CopyWith$Query$viewer$viewer<TRes> {
  _CopyWithImpl$Query$viewer$viewer(
    this._instance,
    this._then,
  );

  final Query$viewer$viewer _instance;

  final TRes Function(Query$viewer$viewer) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? id = _undefined,
    Object? screenId = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$viewer$viewer(
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$viewer$viewer<TRes>
    implements CopyWith$Query$viewer$viewer<TRes> {
  _CopyWithStubImpl$Query$viewer$viewer(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? screenId,
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}
