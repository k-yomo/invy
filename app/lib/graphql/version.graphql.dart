import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$getMinRequiredAppVersion {
  Query$getMinRequiredAppVersion({
    required this.getMinRequiredAppVersion,
    this.$__typename = 'Query',
  });

  factory Query$getMinRequiredAppVersion.fromJson(Map<String, dynamic> json) {
    final l$getMinRequiredAppVersion = json['getMinRequiredAppVersion'];
    final l$$__typename = json['__typename'];
    return Query$getMinRequiredAppVersion(
      getMinRequiredAppVersion:
          Query$getMinRequiredAppVersion$getMinRequiredAppVersion.fromJson(
              (l$getMinRequiredAppVersion as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getMinRequiredAppVersion$getMinRequiredAppVersion
      getMinRequiredAppVersion;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMinRequiredAppVersion = getMinRequiredAppVersion;
    _resultData['getMinRequiredAppVersion'] =
        l$getMinRequiredAppVersion.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMinRequiredAppVersion = getMinRequiredAppVersion;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getMinRequiredAppVersion,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getMinRequiredAppVersion) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMinRequiredAppVersion = getMinRequiredAppVersion;
    final lOther$getMinRequiredAppVersion = other.getMinRequiredAppVersion;
    if (l$getMinRequiredAppVersion != lOther$getMinRequiredAppVersion) {
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

extension UtilityExtension$Query$getMinRequiredAppVersion
    on Query$getMinRequiredAppVersion {
  CopyWith$Query$getMinRequiredAppVersion<Query$getMinRequiredAppVersion>
      get copyWith => CopyWith$Query$getMinRequiredAppVersion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getMinRequiredAppVersion<TRes> {
  factory CopyWith$Query$getMinRequiredAppVersion(
    Query$getMinRequiredAppVersion instance,
    TRes Function(Query$getMinRequiredAppVersion) then,
  ) = _CopyWithImpl$Query$getMinRequiredAppVersion;

  factory CopyWith$Query$getMinRequiredAppVersion.stub(TRes res) =
      _CopyWithStubImpl$Query$getMinRequiredAppVersion;

  TRes call({
    Query$getMinRequiredAppVersion$getMinRequiredAppVersion?
        getMinRequiredAppVersion,
    String? $__typename,
  });
  CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<TRes>
      get getMinRequiredAppVersion;
}

class _CopyWithImpl$Query$getMinRequiredAppVersion<TRes>
    implements CopyWith$Query$getMinRequiredAppVersion<TRes> {
  _CopyWithImpl$Query$getMinRequiredAppVersion(
    this._instance,
    this._then,
  );

  final Query$getMinRequiredAppVersion _instance;

  final TRes Function(Query$getMinRequiredAppVersion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMinRequiredAppVersion = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getMinRequiredAppVersion(
        getMinRequiredAppVersion: getMinRequiredAppVersion == _undefined ||
                getMinRequiredAppVersion == null
            ? _instance.getMinRequiredAppVersion
            : (getMinRequiredAppVersion
                as Query$getMinRequiredAppVersion$getMinRequiredAppVersion),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<TRes>
      get getMinRequiredAppVersion {
    final local$getMinRequiredAppVersion = _instance.getMinRequiredAppVersion;
    return CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion(
        local$getMinRequiredAppVersion,
        (e) => call(getMinRequiredAppVersion: e));
  }
}

class _CopyWithStubImpl$Query$getMinRequiredAppVersion<TRes>
    implements CopyWith$Query$getMinRequiredAppVersion<TRes> {
  _CopyWithStubImpl$Query$getMinRequiredAppVersion(this._res);

  TRes _res;

  call({
    Query$getMinRequiredAppVersion$getMinRequiredAppVersion?
        getMinRequiredAppVersion,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<TRes>
      get getMinRequiredAppVersion =>
          CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion.stub(
              _res);
}

const documentNodeQuerygetMinRequiredAppVersion = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getMinRequiredAppVersion'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getMinRequiredAppVersion'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'minRequiredAppVersion'),
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
Query$getMinRequiredAppVersion _parserFn$Query$getMinRequiredAppVersion(
        Map<String, dynamic> data) =>
    Query$getMinRequiredAppVersion.fromJson(data);
typedef OnQueryComplete$Query$getMinRequiredAppVersion = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$getMinRequiredAppVersion?,
);

class Options$Query$getMinRequiredAppVersion
    extends graphql.QueryOptions<Query$getMinRequiredAppVersion> {
  Options$Query$getMinRequiredAppVersion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getMinRequiredAppVersion? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getMinRequiredAppVersion? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$getMinRequiredAppVersion(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetMinRequiredAppVersion,
          parserFn: _parserFn$Query$getMinRequiredAppVersion,
        );

  final OnQueryComplete$Query$getMinRequiredAppVersion? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getMinRequiredAppVersion
    extends graphql.WatchQueryOptions<Query$getMinRequiredAppVersion> {
  WatchOptions$Query$getMinRequiredAppVersion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getMinRequiredAppVersion? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerygetMinRequiredAppVersion,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getMinRequiredAppVersion,
        );
}

class FetchMoreOptions$Query$getMinRequiredAppVersion
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getMinRequiredAppVersion(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetMinRequiredAppVersion,
        );
}

extension ClientExtension$Query$getMinRequiredAppVersion
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getMinRequiredAppVersion>>
      query$getMinRequiredAppVersion(
              [Options$Query$getMinRequiredAppVersion? options]) async =>
          await this.query(options ?? Options$Query$getMinRequiredAppVersion());
  graphql.ObservableQuery<
      Query$getMinRequiredAppVersion> watchQuery$getMinRequiredAppVersion(
          [WatchOptions$Query$getMinRequiredAppVersion? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getMinRequiredAppVersion());
  void writeQuery$getMinRequiredAppVersion({
    required Query$getMinRequiredAppVersion data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerygetMinRequiredAppVersion)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getMinRequiredAppVersion? readQuery$getMinRequiredAppVersion(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetMinRequiredAppVersion)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getMinRequiredAppVersion.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getMinRequiredAppVersion>
    useQuery$getMinRequiredAppVersion(
            [Options$Query$getMinRequiredAppVersion? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$getMinRequiredAppVersion());
graphql.ObservableQuery<Query$getMinRequiredAppVersion>
    useWatchQuery$getMinRequiredAppVersion(
            [WatchOptions$Query$getMinRequiredAppVersion? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$getMinRequiredAppVersion());

class Query$getMinRequiredAppVersion$Widget
    extends graphql_flutter.Query<Query$getMinRequiredAppVersion> {
  Query$getMinRequiredAppVersion$Widget({
    widgets.Key? key,
    Options$Query$getMinRequiredAppVersion? options,
    required graphql_flutter.QueryBuilder<Query$getMinRequiredAppVersion>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getMinRequiredAppVersion(),
          builder: builder,
        );
}

class Query$getMinRequiredAppVersion$getMinRequiredAppVersion {
  Query$getMinRequiredAppVersion$getMinRequiredAppVersion({
    required this.minRequiredAppVersion,
    this.$__typename = 'GetMinRequiredAppVersionPayload',
  });

  factory Query$getMinRequiredAppVersion$getMinRequiredAppVersion.fromJson(
      Map<String, dynamic> json) {
    final l$minRequiredAppVersion = json['minRequiredAppVersion'];
    final l$$__typename = json['__typename'];
    return Query$getMinRequiredAppVersion$getMinRequiredAppVersion(
      minRequiredAppVersion: (l$minRequiredAppVersion as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String minRequiredAppVersion;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$minRequiredAppVersion = minRequiredAppVersion;
    _resultData['minRequiredAppVersion'] = l$minRequiredAppVersion;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$minRequiredAppVersion = minRequiredAppVersion;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$minRequiredAppVersion,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getMinRequiredAppVersion$getMinRequiredAppVersion) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$minRequiredAppVersion = minRequiredAppVersion;
    final lOther$minRequiredAppVersion = other.minRequiredAppVersion;
    if (l$minRequiredAppVersion != lOther$minRequiredAppVersion) {
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

extension UtilityExtension$Query$getMinRequiredAppVersion$getMinRequiredAppVersion
    on Query$getMinRequiredAppVersion$getMinRequiredAppVersion {
  CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<
          Query$getMinRequiredAppVersion$getMinRequiredAppVersion>
      get copyWith =>
          CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<
    TRes> {
  factory CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion(
    Query$getMinRequiredAppVersion$getMinRequiredAppVersion instance,
    TRes Function(Query$getMinRequiredAppVersion$getMinRequiredAppVersion) then,
  ) = _CopyWithImpl$Query$getMinRequiredAppVersion$getMinRequiredAppVersion;

  factory CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getMinRequiredAppVersion$getMinRequiredAppVersion;

  TRes call({
    String? minRequiredAppVersion,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<
        TRes>
    implements
        CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<TRes> {
  _CopyWithImpl$Query$getMinRequiredAppVersion$getMinRequiredAppVersion(
    this._instance,
    this._then,
  );

  final Query$getMinRequiredAppVersion$getMinRequiredAppVersion _instance;

  final TRes Function(Query$getMinRequiredAppVersion$getMinRequiredAppVersion)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? minRequiredAppVersion = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getMinRequiredAppVersion$getMinRequiredAppVersion(
        minRequiredAppVersion:
            minRequiredAppVersion == _undefined || minRequiredAppVersion == null
                ? _instance.minRequiredAppVersion
                : (minRequiredAppVersion as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<
        TRes>
    implements
        CopyWith$Query$getMinRequiredAppVersion$getMinRequiredAppVersion<TRes> {
  _CopyWithStubImpl$Query$getMinRequiredAppVersion$getMinRequiredAppVersion(
      this._res);

  TRes _res;

  call({
    String? minRequiredAppVersion,
    String? $__typename,
  }) =>
      _res;
}
