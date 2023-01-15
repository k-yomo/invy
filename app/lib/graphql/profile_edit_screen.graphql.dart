import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:invy/graphql/scalars.dart';

class Variables$Mutation$updateAvatar {
  factory Variables$Mutation$updateAvatar({required MultipartFile avatar}) =>
      Variables$Mutation$updateAvatar._({
        r'avatar': avatar,
      });

  Variables$Mutation$updateAvatar._(this._$data);

  factory Variables$Mutation$updateAvatar.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$avatar = data['avatar'];
    result$data['avatar'] = fileFromJson(l$avatar);
    return Variables$Mutation$updateAvatar._(result$data);
  }

  Map<String, dynamic> _$data;

  MultipartFile get avatar => (_$data['avatar'] as MultipartFile);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$avatar = avatar;
    result$data['avatar'] = fileToJson(l$avatar);
    return result$data;
  }

  CopyWith$Variables$Mutation$updateAvatar<Variables$Mutation$updateAvatar>
      get copyWith => CopyWith$Variables$Mutation$updateAvatar(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$updateAvatar ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$avatar = avatar;
    return Object.hashAll([l$avatar]);
  }
}

abstract class CopyWith$Variables$Mutation$updateAvatar<TRes> {
  factory CopyWith$Variables$Mutation$updateAvatar(
    Variables$Mutation$updateAvatar instance,
    TRes Function(Variables$Mutation$updateAvatar) then,
  ) = _CopyWithImpl$Variables$Mutation$updateAvatar;

  factory CopyWith$Variables$Mutation$updateAvatar.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateAvatar;

  TRes call({MultipartFile? avatar});
}

class _CopyWithImpl$Variables$Mutation$updateAvatar<TRes>
    implements CopyWith$Variables$Mutation$updateAvatar<TRes> {
  _CopyWithImpl$Variables$Mutation$updateAvatar(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateAvatar _instance;

  final TRes Function(Variables$Mutation$updateAvatar) _then;

  static const _undefined = {};

  @override
  TRes call({Object? avatar = _undefined}) =>
      _then(Variables$Mutation$updateAvatar._({
        ..._instance._$data,
        if (avatar != _undefined && avatar != null)
          'avatar': (avatar as MultipartFile),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateAvatar<TRes>
    implements CopyWith$Variables$Mutation$updateAvatar<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateAvatar(this._res);

  final TRes _res;

  @override
  call({MultipartFile? avatar}) => _res;
}

class Mutation$updateAvatar {
  Mutation$updateAvatar({
    required this.updateAvatar,
    required this.$__typename,
  });

  factory Mutation$updateAvatar.fromJson(Map<String, dynamic> json) {
    final l$updateAvatar = json['updateAvatar'];
    final l$$Typename = json['__typename'];
    return Mutation$updateAvatar(
      updateAvatar: Mutation$updateAvatar$updateAvatar.fromJson(
          (l$updateAvatar as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Mutation$updateAvatar$updateAvatar updateAvatar;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$updateAvatar = updateAvatar;
    resultData['updateAvatar'] = l$updateAvatar.toJson();
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$updateAvatar = updateAvatar;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$updateAvatar,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$updateAvatar || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateAvatar = updateAvatar;
    final lOther$updateAvatar = other.updateAvatar;
    if (l$updateAvatar != lOther$updateAvatar) {
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

extension UtilityExtension$Mutation$updateAvatar on Mutation$updateAvatar {
  CopyWith$Mutation$updateAvatar<Mutation$updateAvatar> get copyWith =>
      CopyWith$Mutation$updateAvatar(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$updateAvatar<TRes> {
  factory CopyWith$Mutation$updateAvatar(
    Mutation$updateAvatar instance,
    TRes Function(Mutation$updateAvatar) then,
  ) = _CopyWithImpl$Mutation$updateAvatar;

  factory CopyWith$Mutation$updateAvatar.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateAvatar;

  TRes call({
    Mutation$updateAvatar$updateAvatar? updateAvatar,
    String? $__typename,
  });
  CopyWith$Mutation$updateAvatar$updateAvatar<TRes> get updateAvatar;
}

class _CopyWithImpl$Mutation$updateAvatar<TRes>
    implements CopyWith$Mutation$updateAvatar<TRes> {
  _CopyWithImpl$Mutation$updateAvatar(
    this._instance,
    this._then,
  );

  final Mutation$updateAvatar _instance;

  final TRes Function(Mutation$updateAvatar) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? updateAvatar = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateAvatar(
        updateAvatar: updateAvatar == _undefined || updateAvatar == null
            ? _instance.updateAvatar
            : (updateAvatar as Mutation$updateAvatar$updateAvatar),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Mutation$updateAvatar$updateAvatar<TRes> get updateAvatar {
    final local$updateAvatar = _instance.updateAvatar;
    return CopyWith$Mutation$updateAvatar$updateAvatar(
        local$updateAvatar, (e) => call(updateAvatar: e));
  }
}

class _CopyWithStubImpl$Mutation$updateAvatar<TRes>
    implements CopyWith$Mutation$updateAvatar<TRes> {
  _CopyWithStubImpl$Mutation$updateAvatar(this._res);

  final TRes _res;

  @override
  call({
    Mutation$updateAvatar$updateAvatar? updateAvatar,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Mutation$updateAvatar$updateAvatar<TRes> get updateAvatar =>
      CopyWith$Mutation$updateAvatar$updateAvatar.stub(_res);
}

const documentNodeMutationupdateAvatar = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateAvatar'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'avatar')),
        type: NamedTypeNode(
          name: NameNode(value: 'Upload'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateAvatar'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'avatar'),
            value: VariableNode(name: NameNode(value: 'avatar')),
          )
        ],
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
]);
Mutation$updateAvatar _parserFn$Mutation$updateAvatar(
        Map<String, dynamic> data) =>
    Mutation$updateAvatar.fromJson(data);
typedef OnMutationCompleted$Mutation$updateAvatar = FutureOr<void> Function(
  dynamic,
  Mutation$updateAvatar?,
);

class Options$Mutation$updateAvatar
    extends graphql.MutationOptions<Mutation$updateAvatar> {
  Options$Mutation$updateAvatar({
    String? operationName,
    required Variables$Mutation$updateAvatar variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateAvatar? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateAvatar>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$updateAvatar(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateAvatar,
          parserFn: _parserFn$Mutation$updateAvatar,
        );

  final OnMutationCompleted$Mutation$updateAvatar? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateAvatar
    extends graphql.WatchQueryOptions<Mutation$updateAvatar> {
  WatchOptions$Mutation$updateAvatar({
    String? operationName,
    required Variables$Mutation$updateAvatar variables,
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
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationupdateAvatar,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateAvatar,
        );
}

extension ClientExtension$Mutation$updateAvatar on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateAvatar>> mutate$updateAvatar(
          Options$Mutation$updateAvatar options) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$updateAvatar> watchMutation$updateAvatar(
          WatchOptions$Mutation$updateAvatar options) =>
      watchMutation(options);
}

class Mutation$updateAvatar$HookResult {
  Mutation$updateAvatar$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$updateAvatar runMutation;

  final graphql.QueryResult<Mutation$updateAvatar> result;
}

Mutation$updateAvatar$HookResult useMutation$updateAvatar(
    [WidgetOptions$Mutation$updateAvatar? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$updateAvatar());
  return Mutation$updateAvatar$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$updateAvatar> useWatchMutation$updateAvatar(
        WatchOptions$Mutation$updateAvatar options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$updateAvatar
    extends graphql.MutationOptions<Mutation$updateAvatar> {
  WidgetOptions$Mutation$updateAvatar({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateAvatar? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateAvatar>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$updateAvatar(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateAvatar,
          parserFn: _parserFn$Mutation$updateAvatar,
        );

  final OnMutationCompleted$Mutation$updateAvatar? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$updateAvatar
    = graphql.MultiSourceResult<Mutation$updateAvatar> Function(
  Variables$Mutation$updateAvatar, {
  Object? optimisticResult,
});
typedef Builder$Mutation$updateAvatar = widgets.Widget Function(
  RunMutation$Mutation$updateAvatar,
  graphql.QueryResult<Mutation$updateAvatar>?,
);

class Mutation$updateAvatar$Widget
    extends graphql_flutter.Mutation<Mutation$updateAvatar> {
  Mutation$updateAvatar$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$updateAvatar? options,
    required Builder$Mutation$updateAvatar builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$updateAvatar(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult: optimisticResult,
            ),
            result,
          ),
        );
}

class Mutation$updateAvatar$updateAvatar {
  Mutation$updateAvatar$updateAvatar({
    required this.viewer,
    required this.$__typename,
  });

  factory Mutation$updateAvatar$updateAvatar.fromJson(
      Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$Typename = json['__typename'];
    return Mutation$updateAvatar$updateAvatar(
      viewer: Mutation$updateAvatar$updateAvatar$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Mutation$updateAvatar$updateAvatar$viewer viewer;

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
    if (other is! Mutation$updateAvatar$updateAvatar ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$updateAvatar$updateAvatar
    on Mutation$updateAvatar$updateAvatar {
  CopyWith$Mutation$updateAvatar$updateAvatar<
          Mutation$updateAvatar$updateAvatar>
      get copyWith => CopyWith$Mutation$updateAvatar$updateAvatar(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateAvatar$updateAvatar<TRes> {
  factory CopyWith$Mutation$updateAvatar$updateAvatar(
    Mutation$updateAvatar$updateAvatar instance,
    TRes Function(Mutation$updateAvatar$updateAvatar) then,
  ) = _CopyWithImpl$Mutation$updateAvatar$updateAvatar;

  factory CopyWith$Mutation$updateAvatar$updateAvatar.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateAvatar$updateAvatar;

  TRes call({
    Mutation$updateAvatar$updateAvatar$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Mutation$updateAvatar$updateAvatar$viewer<TRes> get viewer;
}

class _CopyWithImpl$Mutation$updateAvatar$updateAvatar<TRes>
    implements CopyWith$Mutation$updateAvatar$updateAvatar<TRes> {
  _CopyWithImpl$Mutation$updateAvatar$updateAvatar(
    this._instance,
    this._then,
  );

  final Mutation$updateAvatar$updateAvatar _instance;

  final TRes Function(Mutation$updateAvatar$updateAvatar) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateAvatar$updateAvatar(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Mutation$updateAvatar$updateAvatar$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Mutation$updateAvatar$updateAvatar$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Mutation$updateAvatar$updateAvatar$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Mutation$updateAvatar$updateAvatar<TRes>
    implements CopyWith$Mutation$updateAvatar$updateAvatar<TRes> {
  _CopyWithStubImpl$Mutation$updateAvatar$updateAvatar(this._res);

  final TRes _res;

  @override
  call({
    Mutation$updateAvatar$updateAvatar$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Mutation$updateAvatar$updateAvatar$viewer<TRes> get viewer =>
      CopyWith$Mutation$updateAvatar$updateAvatar$viewer.stub(_res);
}

class Mutation$updateAvatar$updateAvatar$viewer {
  Mutation$updateAvatar$updateAvatar$viewer({
    required this.id,
    required this.avatarUrl,
    required this.$__typename,
  });

  factory Mutation$updateAvatar$updateAvatar$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$Typename = json['__typename'];
    return Mutation$updateAvatar$updateAvatar$viewer(
      id: (l$id as String),
      avatarUrl: (l$avatarUrl as String),
      $__typename: (l$$Typename as String),
    );
  }

  final String id;

  final String avatarUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$avatarUrl = avatarUrl;
    resultData['avatarUrl'] = l$avatarUrl;
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$avatarUrl = avatarUrl;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$id,
      l$avatarUrl,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$updateAvatar$updateAvatar$viewer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$updateAvatar$updateAvatar$viewer
    on Mutation$updateAvatar$updateAvatar$viewer {
  CopyWith$Mutation$updateAvatar$updateAvatar$viewer<
          Mutation$updateAvatar$updateAvatar$viewer>
      get copyWith => CopyWith$Mutation$updateAvatar$updateAvatar$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateAvatar$updateAvatar$viewer<TRes> {
  factory CopyWith$Mutation$updateAvatar$updateAvatar$viewer(
    Mutation$updateAvatar$updateAvatar$viewer instance,
    TRes Function(Mutation$updateAvatar$updateAvatar$viewer) then,
  ) = _CopyWithImpl$Mutation$updateAvatar$updateAvatar$viewer;

  factory CopyWith$Mutation$updateAvatar$updateAvatar$viewer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateAvatar$updateAvatar$viewer;

  TRes call({
    String? id,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateAvatar$updateAvatar$viewer<TRes>
    implements CopyWith$Mutation$updateAvatar$updateAvatar$viewer<TRes> {
  _CopyWithImpl$Mutation$updateAvatar$updateAvatar$viewer(
    this._instance,
    this._then,
  );

  final Mutation$updateAvatar$updateAvatar$viewer _instance;

  final TRes Function(Mutation$updateAvatar$updateAvatar$viewer) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? id = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateAvatar$updateAvatar$viewer(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        avatarUrl: avatarUrl == _undefined || avatarUrl == null
            ? _instance.avatarUrl
            : (avatarUrl as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateAvatar$updateAvatar$viewer<TRes>
    implements CopyWith$Mutation$updateAvatar$updateAvatar$viewer<TRes> {
  _CopyWithStubImpl$Mutation$updateAvatar$updateAvatar$viewer(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateNickname {
  factory Variables$Mutation$updateNickname({required String nickname}) =>
      Variables$Mutation$updateNickname._({
        r'nickname': nickname,
      });

  Variables$Mutation$updateNickname._(this._$data);

  factory Variables$Mutation$updateNickname.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$nickname = data['nickname'];
    result$data['nickname'] = (l$nickname as String);
    return Variables$Mutation$updateNickname._(result$data);
  }

  Map<String, dynamic> _$data;

  String get nickname => (_$data['nickname'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$nickname = nickname;
    result$data['nickname'] = l$nickname;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateNickname<Variables$Mutation$updateNickname>
      get copyWith => CopyWith$Variables$Mutation$updateNickname(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$updateNickname ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$nickname = nickname;
    final lOther$nickname = other.nickname;
    if (l$nickname != lOther$nickname) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$nickname = nickname;
    return Object.hashAll([l$nickname]);
  }
}

abstract class CopyWith$Variables$Mutation$updateNickname<TRes> {
  factory CopyWith$Variables$Mutation$updateNickname(
    Variables$Mutation$updateNickname instance,
    TRes Function(Variables$Mutation$updateNickname) then,
  ) = _CopyWithImpl$Variables$Mutation$updateNickname;

  factory CopyWith$Variables$Mutation$updateNickname.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateNickname;

  TRes call({String? nickname});
}

class _CopyWithImpl$Variables$Mutation$updateNickname<TRes>
    implements CopyWith$Variables$Mutation$updateNickname<TRes> {
  _CopyWithImpl$Variables$Mutation$updateNickname(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateNickname _instance;

  final TRes Function(Variables$Mutation$updateNickname) _then;

  static const _undefined = {};

  @override
  TRes call({Object? nickname = _undefined}) =>
      _then(Variables$Mutation$updateNickname._({
        ..._instance._$data,
        if (nickname != _undefined && nickname != null)
          'nickname': (nickname as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateNickname<TRes>
    implements CopyWith$Variables$Mutation$updateNickname<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateNickname(this._res);

  final TRes _res;

  @override
  call({String? nickname}) => _res;
}

class Mutation$updateNickname {
  Mutation$updateNickname({
    required this.updateNickname,
    required this.$__typename,
  });

  factory Mutation$updateNickname.fromJson(Map<String, dynamic> json) {
    final l$updateNickname = json['updateNickname'];
    final l$$Typename = json['__typename'];
    return Mutation$updateNickname(
      updateNickname: Mutation$updateNickname$updateNickname.fromJson(
          (l$updateNickname as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Mutation$updateNickname$updateNickname updateNickname;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$updateNickname = updateNickname;
    resultData['updateNickname'] = l$updateNickname.toJson();
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$updateNickname = updateNickname;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$updateNickname,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$updateNickname ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateNickname = updateNickname;
    final lOther$updateNickname = other.updateNickname;
    if (l$updateNickname != lOther$updateNickname) {
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

extension UtilityExtension$Mutation$updateNickname on Mutation$updateNickname {
  CopyWith$Mutation$updateNickname<Mutation$updateNickname> get copyWith =>
      CopyWith$Mutation$updateNickname(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$updateNickname<TRes> {
  factory CopyWith$Mutation$updateNickname(
    Mutation$updateNickname instance,
    TRes Function(Mutation$updateNickname) then,
  ) = _CopyWithImpl$Mutation$updateNickname;

  factory CopyWith$Mutation$updateNickname.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateNickname;

  TRes call({
    Mutation$updateNickname$updateNickname? updateNickname,
    String? $__typename,
  });
  CopyWith$Mutation$updateNickname$updateNickname<TRes> get updateNickname;
}

class _CopyWithImpl$Mutation$updateNickname<TRes>
    implements CopyWith$Mutation$updateNickname<TRes> {
  _CopyWithImpl$Mutation$updateNickname(
    this._instance,
    this._then,
  );

  final Mutation$updateNickname _instance;

  final TRes Function(Mutation$updateNickname) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? updateNickname = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateNickname(
        updateNickname: updateNickname == _undefined || updateNickname == null
            ? _instance.updateNickname
            : (updateNickname as Mutation$updateNickname$updateNickname),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Mutation$updateNickname$updateNickname<TRes> get updateNickname {
    final local$updateNickname = _instance.updateNickname;
    return CopyWith$Mutation$updateNickname$updateNickname(
        local$updateNickname, (e) => call(updateNickname: e));
  }
}

class _CopyWithStubImpl$Mutation$updateNickname<TRes>
    implements CopyWith$Mutation$updateNickname<TRes> {
  _CopyWithStubImpl$Mutation$updateNickname(this._res);

  final TRes _res;

  @override
  call({
    Mutation$updateNickname$updateNickname? updateNickname,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Mutation$updateNickname$updateNickname<TRes> get updateNickname =>
      CopyWith$Mutation$updateNickname$updateNickname.stub(_res);
}

const documentNodeMutationupdateNickname = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateNickname'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'nickname')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateNickname'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'nickname'),
            value: VariableNode(name: NameNode(value: 'nickname')),
          )
        ],
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
                name: NameNode(value: 'nickname'),
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
]);
Mutation$updateNickname _parserFn$Mutation$updateNickname(
        Map<String, dynamic> data) =>
    Mutation$updateNickname.fromJson(data);
typedef OnMutationCompleted$Mutation$updateNickname = FutureOr<void> Function(
  dynamic,
  Mutation$updateNickname?,
);

class Options$Mutation$updateNickname
    extends graphql.MutationOptions<Mutation$updateNickname> {
  Options$Mutation$updateNickname({
    String? operationName,
    required Variables$Mutation$updateNickname variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateNickname? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateNickname>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateNickname(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateNickname,
          parserFn: _parserFn$Mutation$updateNickname,
        );

  final OnMutationCompleted$Mutation$updateNickname? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateNickname
    extends graphql.WatchQueryOptions<Mutation$updateNickname> {
  WatchOptions$Mutation$updateNickname({
    String? operationName,
    required Variables$Mutation$updateNickname variables,
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
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationupdateNickname,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateNickname,
        );
}

extension ClientExtension$Mutation$updateNickname on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateNickname>> mutate$updateNickname(
          Options$Mutation$updateNickname options) async =>
      await mutate(options);
  graphql.ObservableQuery<Mutation$updateNickname> watchMutation$updateNickname(
          WatchOptions$Mutation$updateNickname options) =>
      watchMutation(options);
}

class Mutation$updateNickname$HookResult {
  Mutation$updateNickname$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$updateNickname runMutation;

  final graphql.QueryResult<Mutation$updateNickname> result;
}

Mutation$updateNickname$HookResult useMutation$updateNickname(
    [WidgetOptions$Mutation$updateNickname? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$updateNickname());
  return Mutation$updateNickname$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$updateNickname>
    useWatchMutation$updateNickname(
            WatchOptions$Mutation$updateNickname options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$updateNickname
    extends graphql.MutationOptions<Mutation$updateNickname> {
  WidgetOptions$Mutation$updateNickname({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateNickname? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateNickname>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateNickname(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateNickname,
          parserFn: _parserFn$Mutation$updateNickname,
        );

  final OnMutationCompleted$Mutation$updateNickname? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$updateNickname
    = graphql.MultiSourceResult<Mutation$updateNickname> Function(
  Variables$Mutation$updateNickname, {
  Object? optimisticResult,
});
typedef Builder$Mutation$updateNickname = widgets.Widget Function(
  RunMutation$Mutation$updateNickname,
  graphql.QueryResult<Mutation$updateNickname>?,
);

class Mutation$updateNickname$Widget
    extends graphql_flutter.Mutation<Mutation$updateNickname> {
  Mutation$updateNickname$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$updateNickname? options,
    required Builder$Mutation$updateNickname builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$updateNickname(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult: optimisticResult,
            ),
            result,
          ),
        );
}

class Mutation$updateNickname$updateNickname {
  Mutation$updateNickname$updateNickname({
    required this.viewer,
    required this.$__typename,
  });

  factory Mutation$updateNickname$updateNickname.fromJson(
      Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$Typename = json['__typename'];
    return Mutation$updateNickname$updateNickname(
      viewer: Mutation$updateNickname$updateNickname$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Mutation$updateNickname$updateNickname$viewer viewer;

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
    if (other is! Mutation$updateNickname$updateNickname ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$updateNickname$updateNickname
    on Mutation$updateNickname$updateNickname {
  CopyWith$Mutation$updateNickname$updateNickname<
          Mutation$updateNickname$updateNickname>
      get copyWith => CopyWith$Mutation$updateNickname$updateNickname(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateNickname$updateNickname<TRes> {
  factory CopyWith$Mutation$updateNickname$updateNickname(
    Mutation$updateNickname$updateNickname instance,
    TRes Function(Mutation$updateNickname$updateNickname) then,
  ) = _CopyWithImpl$Mutation$updateNickname$updateNickname;

  factory CopyWith$Mutation$updateNickname$updateNickname.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateNickname$updateNickname;

  TRes call({
    Mutation$updateNickname$updateNickname$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Mutation$updateNickname$updateNickname$viewer<TRes> get viewer;
}

class _CopyWithImpl$Mutation$updateNickname$updateNickname<TRes>
    implements CopyWith$Mutation$updateNickname$updateNickname<TRes> {
  _CopyWithImpl$Mutation$updateNickname$updateNickname(
    this._instance,
    this._then,
  );

  final Mutation$updateNickname$updateNickname _instance;

  final TRes Function(Mutation$updateNickname$updateNickname) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateNickname$updateNickname(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Mutation$updateNickname$updateNickname$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  @override
  CopyWith$Mutation$updateNickname$updateNickname$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Mutation$updateNickname$updateNickname$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Mutation$updateNickname$updateNickname<TRes>
    implements CopyWith$Mutation$updateNickname$updateNickname<TRes> {
  _CopyWithStubImpl$Mutation$updateNickname$updateNickname(this._res);

  final TRes _res;

  @override
  call({
    Mutation$updateNickname$updateNickname$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  @override
  CopyWith$Mutation$updateNickname$updateNickname$viewer<TRes> get viewer =>
      CopyWith$Mutation$updateNickname$updateNickname$viewer.stub(_res);
}

class Mutation$updateNickname$updateNickname$viewer {
  Mutation$updateNickname$updateNickname$viewer({
    required this.id,
    required this.nickname,
    required this.$__typename,
  });

  factory Mutation$updateNickname$updateNickname$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nickname = json['nickname'];
    final l$$Typename = json['__typename'];
    return Mutation$updateNickname$updateNickname$viewer(
      id: (l$id as String),
      nickname: (l$nickname as String),
      $__typename: (l$$Typename as String),
    );
  }

  final String id;

  final String nickname;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$nickname = nickname;
    resultData['nickname'] = l$nickname;
    final l$$Typename = $__typename;
    resultData['__typename'] = l$$Typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$nickname = nickname;
    final l$$Typename = $__typename;
    return Object.hashAll([
      l$id,
      l$nickname,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$updateNickname$updateNickname$viewer ||
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
    final l$$Typename = $__typename;
    final lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateNickname$updateNickname$viewer
    on Mutation$updateNickname$updateNickname$viewer {
  CopyWith$Mutation$updateNickname$updateNickname$viewer<
          Mutation$updateNickname$updateNickname$viewer>
      get copyWith => CopyWith$Mutation$updateNickname$updateNickname$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateNickname$updateNickname$viewer<TRes> {
  factory CopyWith$Mutation$updateNickname$updateNickname$viewer(
    Mutation$updateNickname$updateNickname$viewer instance,
    TRes Function(Mutation$updateNickname$updateNickname$viewer) then,
  ) = _CopyWithImpl$Mutation$updateNickname$updateNickname$viewer;

  factory CopyWith$Mutation$updateNickname$updateNickname$viewer.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateNickname$updateNickname$viewer;

  TRes call({
    String? id,
    String? nickname,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateNickname$updateNickname$viewer<TRes>
    implements CopyWith$Mutation$updateNickname$updateNickname$viewer<TRes> {
  _CopyWithImpl$Mutation$updateNickname$updateNickname$viewer(
    this._instance,
    this._then,
  );

  final Mutation$updateNickname$updateNickname$viewer _instance;

  final TRes Function(Mutation$updateNickname$updateNickname$viewer) _then;

  static const _undefined = {};

  @override
  TRes call({
    Object? id = _undefined,
    Object? nickname = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateNickname$updateNickname$viewer(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        nickname: nickname == _undefined || nickname == null
            ? _instance.nickname
            : (nickname as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateNickname$updateNickname$viewer<TRes>
    implements CopyWith$Mutation$updateNickname$updateNickname$viewer<TRes> {
  _CopyWithStubImpl$Mutation$updateNickname$updateNickname$viewer(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? nickname,
    String? $__typename,
  }) =>
      _res;
}
