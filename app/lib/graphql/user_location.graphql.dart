import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$updateLocation {
  factory Variables$Mutation$updateLocation({
    required double latitude,
    required double longitude,
  }) =>
      Variables$Mutation$updateLocation._({
        r'latitude': latitude,
        r'longitude': longitude,
      });

  Variables$Mutation$updateLocation._(this._$data);

  factory Variables$Mutation$updateLocation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$latitude = data['latitude'];
    result$data['latitude'] = (l$latitude as num).toDouble();
    final l$longitude = data['longitude'];
    result$data['longitude'] = (l$longitude as num).toDouble();
    return Variables$Mutation$updateLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  double get latitude => (_$data['latitude'] as double);
  double get longitude => (_$data['longitude'] as double);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$latitude = latitude;
    result$data['latitude'] = l$latitude;
    final l$longitude = longitude;
    result$data['longitude'] = l$longitude;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateLocation<Variables$Mutation$updateLocation>
      get copyWith => CopyWith$Variables$Mutation$updateLocation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateLocation) ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$latitude = latitude;
    final l$longitude = longitude;
    return Object.hashAll([
      l$latitude,
      l$longitude,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateLocation<TRes> {
  factory CopyWith$Variables$Mutation$updateLocation(
    Variables$Mutation$updateLocation instance,
    TRes Function(Variables$Mutation$updateLocation) then,
  ) = _CopyWithImpl$Variables$Mutation$updateLocation;

  factory CopyWith$Variables$Mutation$updateLocation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateLocation;

  TRes call({
    double? latitude,
    double? longitude,
  });
}

class _CopyWithImpl$Variables$Mutation$updateLocation<TRes>
    implements CopyWith$Variables$Mutation$updateLocation<TRes> {
  _CopyWithImpl$Variables$Mutation$updateLocation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateLocation _instance;

  final TRes Function(Variables$Mutation$updateLocation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? latitude = _undefined,
    Object? longitude = _undefined,
  }) =>
      _then(Variables$Mutation$updateLocation._({
        ..._instance._$data,
        if (latitude != _undefined && latitude != null)
          'latitude': (latitude as double),
        if (longitude != _undefined && longitude != null)
          'longitude': (longitude as double),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateLocation<TRes>
    implements CopyWith$Variables$Mutation$updateLocation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateLocation(this._res);

  TRes _res;

  call({
    double? latitude,
    double? longitude,
  }) =>
      _res;
}

class Mutation$updateLocation {
  Mutation$updateLocation({
    required this.updateLocation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$updateLocation.fromJson(Map<String, dynamic> json) {
    final l$updateLocation = json['updateLocation'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLocation(
      updateLocation: Mutation$updateLocation$updateLocation.fromJson(
          (l$updateLocation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$updateLocation$updateLocation updateLocation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateLocation = updateLocation;
    _resultData['updateLocation'] = l$updateLocation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateLocation = updateLocation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateLocation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateLocation = updateLocation;
    final lOther$updateLocation = other.updateLocation;
    if (l$updateLocation != lOther$updateLocation) {
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

extension UtilityExtension$Mutation$updateLocation on Mutation$updateLocation {
  CopyWith$Mutation$updateLocation<Mutation$updateLocation> get copyWith =>
      CopyWith$Mutation$updateLocation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$updateLocation<TRes> {
  factory CopyWith$Mutation$updateLocation(
    Mutation$updateLocation instance,
    TRes Function(Mutation$updateLocation) then,
  ) = _CopyWithImpl$Mutation$updateLocation;

  factory CopyWith$Mutation$updateLocation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateLocation;

  TRes call({
    Mutation$updateLocation$updateLocation? updateLocation,
    String? $__typename,
  });
  CopyWith$Mutation$updateLocation$updateLocation<TRes> get updateLocation;
}

class _CopyWithImpl$Mutation$updateLocation<TRes>
    implements CopyWith$Mutation$updateLocation<TRes> {
  _CopyWithImpl$Mutation$updateLocation(
    this._instance,
    this._then,
  );

  final Mutation$updateLocation _instance;

  final TRes Function(Mutation$updateLocation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateLocation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLocation(
        updateLocation: updateLocation == _undefined || updateLocation == null
            ? _instance.updateLocation
            : (updateLocation as Mutation$updateLocation$updateLocation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateLocation$updateLocation<TRes> get updateLocation {
    final local$updateLocation = _instance.updateLocation;
    return CopyWith$Mutation$updateLocation$updateLocation(
        local$updateLocation, (e) => call(updateLocation: e));
  }
}

class _CopyWithStubImpl$Mutation$updateLocation<TRes>
    implements CopyWith$Mutation$updateLocation<TRes> {
  _CopyWithStubImpl$Mutation$updateLocation(this._res);

  TRes _res;

  call({
    Mutation$updateLocation$updateLocation? updateLocation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateLocation$updateLocation<TRes> get updateLocation =>
      CopyWith$Mutation$updateLocation$updateLocation.stub(_res);
}

const documentNodeMutationupdateLocation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'latitude')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'longitude')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateLocation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'latitude'),
            value: VariableNode(name: NameNode(value: 'latitude')),
          ),
          ArgumentNode(
            name: NameNode(value: 'longitude'),
            value: VariableNode(name: NameNode(value: 'longitude')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'updatedUserLocationId'),
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
Mutation$updateLocation _parserFn$Mutation$updateLocation(
        Map<String, dynamic> data) =>
    Mutation$updateLocation.fromJson(data);
typedef OnMutationCompleted$Mutation$updateLocation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$updateLocation?,
);

class Options$Mutation$updateLocation
    extends graphql.MutationOptions<Mutation$updateLocation> {
  Options$Mutation$updateLocation({
    String? operationName,
    required Variables$Mutation$updateLocation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateLocation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateLocation? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateLocation>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateLocation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateLocation,
          parserFn: _parserFn$Mutation$updateLocation,
        );

  final OnMutationCompleted$Mutation$updateLocation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateLocation
    extends graphql.WatchQueryOptions<Mutation$updateLocation> {
  WatchOptions$Mutation$updateLocation({
    String? operationName,
    required Variables$Mutation$updateLocation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateLocation? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationupdateLocation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateLocation,
        );
}

extension ClientExtension$Mutation$updateLocation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateLocation>> mutate$updateLocation(
          Options$Mutation$updateLocation options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateLocation> watchMutation$updateLocation(
          WatchOptions$Mutation$updateLocation options) =>
      this.watchMutation(options);
}

class Mutation$updateLocation$HookResult {
  Mutation$updateLocation$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$updateLocation runMutation;

  final graphql.QueryResult<Mutation$updateLocation> result;
}

Mutation$updateLocation$HookResult useMutation$updateLocation(
    [WidgetOptions$Mutation$updateLocation? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$updateLocation());
  return Mutation$updateLocation$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$updateLocation>
    useWatchMutation$updateLocation(
            WatchOptions$Mutation$updateLocation options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$updateLocation
    extends graphql.MutationOptions<Mutation$updateLocation> {
  WidgetOptions$Mutation$updateLocation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateLocation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateLocation? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateLocation>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateLocation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateLocation,
          parserFn: _parserFn$Mutation$updateLocation,
        );

  final OnMutationCompleted$Mutation$updateLocation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$updateLocation
    = graphql.MultiSourceResult<Mutation$updateLocation> Function(
  Variables$Mutation$updateLocation, {
  Object? optimisticResult,
  Mutation$updateLocation? typedOptimisticResult,
});
typedef Builder$Mutation$updateLocation = widgets.Widget Function(
  RunMutation$Mutation$updateLocation,
  graphql.QueryResult<Mutation$updateLocation>?,
);

class Mutation$updateLocation$Widget
    extends graphql_flutter.Mutation<Mutation$updateLocation> {
  Mutation$updateLocation$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$updateLocation? options,
    required Builder$Mutation$updateLocation builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$updateLocation(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$updateLocation$updateLocation {
  Mutation$updateLocation$updateLocation({
    required this.updatedUserLocationId,
    this.$__typename = 'UpdateLocationPayload',
  });

  factory Mutation$updateLocation$updateLocation.fromJson(
      Map<String, dynamic> json) {
    final l$updatedUserLocationId = json['updatedUserLocationId'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLocation$updateLocation(
      updatedUserLocationId: (l$updatedUserLocationId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String updatedUserLocationId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updatedUserLocationId = updatedUserLocationId;
    _resultData['updatedUserLocationId'] = l$updatedUserLocationId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updatedUserLocationId = updatedUserLocationId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updatedUserLocationId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateLocation$updateLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updatedUserLocationId = updatedUserLocationId;
    final lOther$updatedUserLocationId = other.updatedUserLocationId;
    if (l$updatedUserLocationId != lOther$updatedUserLocationId) {
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

extension UtilityExtension$Mutation$updateLocation$updateLocation
    on Mutation$updateLocation$updateLocation {
  CopyWith$Mutation$updateLocation$updateLocation<
          Mutation$updateLocation$updateLocation>
      get copyWith => CopyWith$Mutation$updateLocation$updateLocation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLocation$updateLocation<TRes> {
  factory CopyWith$Mutation$updateLocation$updateLocation(
    Mutation$updateLocation$updateLocation instance,
    TRes Function(Mutation$updateLocation$updateLocation) then,
  ) = _CopyWithImpl$Mutation$updateLocation$updateLocation;

  factory CopyWith$Mutation$updateLocation$updateLocation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateLocation$updateLocation;

  TRes call({
    String? updatedUserLocationId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateLocation$updateLocation<TRes>
    implements CopyWith$Mutation$updateLocation$updateLocation<TRes> {
  _CopyWithImpl$Mutation$updateLocation$updateLocation(
    this._instance,
    this._then,
  );

  final Mutation$updateLocation$updateLocation _instance;

  final TRes Function(Mutation$updateLocation$updateLocation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updatedUserLocationId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLocation$updateLocation(
        updatedUserLocationId:
            updatedUserLocationId == _undefined || updatedUserLocationId == null
                ? _instance.updatedUserLocationId
                : (updatedUserLocationId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateLocation$updateLocation<TRes>
    implements CopyWith$Mutation$updateLocation$updateLocation<TRes> {
  _CopyWithStubImpl$Mutation$updateLocation$updateLocation(this._res);

  TRes _res;

  call({
    String? updatedUserLocationId,
    String? $__typename,
  }) =>
      _res;
}
