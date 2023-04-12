import '../../widgets/invitation_detail_fragment.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$invitationScreenViewer {
  Query$invitationScreenViewer({
    required this.viewer,
    this.$__typename = 'Query',
  });

  factory Query$invitationScreenViewer.fromJson(Map<String, dynamic> json) {
    final l$viewer = json['viewer'];
    final l$$__typename = json['__typename'];
    return Query$invitationScreenViewer(
      viewer: Query$invitationScreenViewer$viewer.fromJson(
          (l$viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$invitationScreenViewer$viewer viewer;

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
    if (!(other is Query$invitationScreenViewer) ||
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

extension UtilityExtension$Query$invitationScreenViewer
    on Query$invitationScreenViewer {
  CopyWith$Query$invitationScreenViewer<Query$invitationScreenViewer>
      get copyWith => CopyWith$Query$invitationScreenViewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationScreenViewer<TRes> {
  factory CopyWith$Query$invitationScreenViewer(
    Query$invitationScreenViewer instance,
    TRes Function(Query$invitationScreenViewer) then,
  ) = _CopyWithImpl$Query$invitationScreenViewer;

  factory CopyWith$Query$invitationScreenViewer.stub(TRes res) =
      _CopyWithStubImpl$Query$invitationScreenViewer;

  TRes call({
    Query$invitationScreenViewer$viewer? viewer,
    String? $__typename,
  });
  CopyWith$Query$invitationScreenViewer$viewer<TRes> get viewer;
}

class _CopyWithImpl$Query$invitationScreenViewer<TRes>
    implements CopyWith$Query$invitationScreenViewer<TRes> {
  _CopyWithImpl$Query$invitationScreenViewer(
    this._instance,
    this._then,
  );

  final Query$invitationScreenViewer _instance;

  final TRes Function(Query$invitationScreenViewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationScreenViewer(
        viewer: viewer == _undefined || viewer == null
            ? _instance.viewer
            : (viewer as Query$invitationScreenViewer$viewer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$invitationScreenViewer$viewer<TRes> get viewer {
    final local$viewer = _instance.viewer;
    return CopyWith$Query$invitationScreenViewer$viewer(
        local$viewer, (e) => call(viewer: e));
  }
}

class _CopyWithStubImpl$Query$invitationScreenViewer<TRes>
    implements CopyWith$Query$invitationScreenViewer<TRes> {
  _CopyWithStubImpl$Query$invitationScreenViewer(this._res);

  TRes _res;

  call({
    Query$invitationScreenViewer$viewer? viewer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$invitationScreenViewer$viewer<TRes> get viewer =>
      CopyWith$Query$invitationScreenViewer$viewer.stub(_res);
}

const documentNodeQueryinvitationScreenViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'invitationScreenViewer'),
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
            name: NameNode(value: 'sentInvitations'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'invitationDetailFragment'),
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
            name: NameNode(value: 'pendingInvitations'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'invitationDetailFragment'),
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
            name: NameNode(value: 'acceptedInvitations'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'invitationDetailFragment'),
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
  fragmentDefinitioninvitationDetailFragment,
  fragmentDefinitioninvitationDetailAcceptedUserFragment,
]);
Query$invitationScreenViewer _parserFn$Query$invitationScreenViewer(
        Map<String, dynamic> data) =>
    Query$invitationScreenViewer.fromJson(data);
typedef OnQueryComplete$Query$invitationScreenViewer = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$invitationScreenViewer?,
);

class Options$Query$invitationScreenViewer
    extends graphql.QueryOptions<Query$invitationScreenViewer> {
  Options$Query$invitationScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$invitationScreenViewer? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$invitationScreenViewer? onComplete,
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
                        : _parserFn$Query$invitationScreenViewer(data),
                  ),
          onError: onError,
          document: documentNodeQueryinvitationScreenViewer,
          parserFn: _parserFn$Query$invitationScreenViewer,
        );

  final OnQueryComplete$Query$invitationScreenViewer? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$invitationScreenViewer
    extends graphql.WatchQueryOptions<Query$invitationScreenViewer> {
  WatchOptions$Query$invitationScreenViewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$invitationScreenViewer? typedOptimisticResult,
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
          document: documentNodeQueryinvitationScreenViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$invitationScreenViewer,
        );
}

class FetchMoreOptions$Query$invitationScreenViewer
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$invitationScreenViewer(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryinvitationScreenViewer,
        );
}

extension ClientExtension$Query$invitationScreenViewer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$invitationScreenViewer>>
      query$invitationScreenViewer(
              [Options$Query$invitationScreenViewer? options]) async =>
          await this.query(options ?? Options$Query$invitationScreenViewer());
  graphql.ObservableQuery<
      Query$invitationScreenViewer> watchQuery$invitationScreenViewer(
          [WatchOptions$Query$invitationScreenViewer? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$invitationScreenViewer());
  void writeQuery$invitationScreenViewer({
    required Query$invitationScreenViewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryinvitationScreenViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$invitationScreenViewer? readQuery$invitationScreenViewer(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryinvitationScreenViewer)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$invitationScreenViewer.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$invitationScreenViewer>
    useQuery$invitationScreenViewer(
            [Options$Query$invitationScreenViewer? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$invitationScreenViewer());
graphql.ObservableQuery<Query$invitationScreenViewer>
    useWatchQuery$invitationScreenViewer(
            [WatchOptions$Query$invitationScreenViewer? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$invitationScreenViewer());

class Query$invitationScreenViewer$Widget
    extends graphql_flutter.Query<Query$invitationScreenViewer> {
  Query$invitationScreenViewer$Widget({
    widgets.Key? key,
    Options$Query$invitationScreenViewer? options,
    required graphql_flutter.QueryBuilder<Query$invitationScreenViewer> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$invitationScreenViewer(),
          builder: builder,
        );
}

class Query$invitationScreenViewer$viewer {
  Query$invitationScreenViewer$viewer({
    required this.sentInvitations,
    required this.pendingInvitations,
    required this.acceptedInvitations,
    this.$__typename = 'Viewer',
  });

  factory Query$invitationScreenViewer$viewer.fromJson(
      Map<String, dynamic> json) {
    final l$sentInvitations = json['sentInvitations'];
    final l$pendingInvitations = json['pendingInvitations'];
    final l$acceptedInvitations = json['acceptedInvitations'];
    final l$$__typename = json['__typename'];
    return Query$invitationScreenViewer$viewer(
      sentInvitations: (l$sentInvitations as List<dynamic>)
          .map((e) => Fragment$invitationDetailFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pendingInvitations: (l$pendingInvitations as List<dynamic>)
          .map((e) => Fragment$invitationDetailFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      acceptedInvitations: (l$acceptedInvitations as List<dynamic>)
          .map((e) => Fragment$invitationDetailFragment.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$invitationDetailFragment> sentInvitations;

  final List<Fragment$invitationDetailFragment> pendingInvitations;

  final List<Fragment$invitationDetailFragment> acceptedInvitations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sentInvitations = sentInvitations;
    _resultData['sentInvitations'] =
        l$sentInvitations.map((e) => e.toJson()).toList();
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
    final l$sentInvitations = sentInvitations;
    final l$pendingInvitations = pendingInvitations;
    final l$acceptedInvitations = acceptedInvitations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$sentInvitations.map((v) => v)),
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
    if (!(other is Query$invitationScreenViewer$viewer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sentInvitations = sentInvitations;
    final lOther$sentInvitations = other.sentInvitations;
    if (l$sentInvitations.length != lOther$sentInvitations.length) {
      return false;
    }
    for (int i = 0; i < l$sentInvitations.length; i++) {
      final l$sentInvitations$entry = l$sentInvitations[i];
      final lOther$sentInvitations$entry = lOther$sentInvitations[i];
      if (l$sentInvitations$entry != lOther$sentInvitations$entry) {
        return false;
      }
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

extension UtilityExtension$Query$invitationScreenViewer$viewer
    on Query$invitationScreenViewer$viewer {
  CopyWith$Query$invitationScreenViewer$viewer<
          Query$invitationScreenViewer$viewer>
      get copyWith => CopyWith$Query$invitationScreenViewer$viewer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$invitationScreenViewer$viewer<TRes> {
  factory CopyWith$Query$invitationScreenViewer$viewer(
    Query$invitationScreenViewer$viewer instance,
    TRes Function(Query$invitationScreenViewer$viewer) then,
  ) = _CopyWithImpl$Query$invitationScreenViewer$viewer;

  factory CopyWith$Query$invitationScreenViewer$viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$invitationScreenViewer$viewer;

  TRes call({
    List<Fragment$invitationDetailFragment>? sentInvitations,
    List<Fragment$invitationDetailFragment>? pendingInvitations,
    List<Fragment$invitationDetailFragment>? acceptedInvitations,
    String? $__typename,
  });
  TRes sentInvitations(
      Iterable<Fragment$invitationDetailFragment> Function(
              Iterable<
                  CopyWith$Fragment$invitationDetailFragment<
                      Fragment$invitationDetailFragment>>)
          _fn);
  TRes pendingInvitations(
      Iterable<Fragment$invitationDetailFragment> Function(
              Iterable<
                  CopyWith$Fragment$invitationDetailFragment<
                      Fragment$invitationDetailFragment>>)
          _fn);
  TRes acceptedInvitations(
      Iterable<Fragment$invitationDetailFragment> Function(
              Iterable<
                  CopyWith$Fragment$invitationDetailFragment<
                      Fragment$invitationDetailFragment>>)
          _fn);
}

class _CopyWithImpl$Query$invitationScreenViewer$viewer<TRes>
    implements CopyWith$Query$invitationScreenViewer$viewer<TRes> {
  _CopyWithImpl$Query$invitationScreenViewer$viewer(
    this._instance,
    this._then,
  );

  final Query$invitationScreenViewer$viewer _instance;

  final TRes Function(Query$invitationScreenViewer$viewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sentInvitations = _undefined,
    Object? pendingInvitations = _undefined,
    Object? acceptedInvitations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$invitationScreenViewer$viewer(
        sentInvitations:
            sentInvitations == _undefined || sentInvitations == null
                ? _instance.sentInvitations
                : (sentInvitations as List<Fragment$invitationDetailFragment>),
        pendingInvitations: pendingInvitations == _undefined ||
                pendingInvitations == null
            ? _instance.pendingInvitations
            : (pendingInvitations as List<Fragment$invitationDetailFragment>),
        acceptedInvitations: acceptedInvitations == _undefined ||
                acceptedInvitations == null
            ? _instance.acceptedInvitations
            : (acceptedInvitations as List<Fragment$invitationDetailFragment>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes sentInvitations(
          Iterable<Fragment$invitationDetailFragment> Function(
                  Iterable<
                      CopyWith$Fragment$invitationDetailFragment<
                          Fragment$invitationDetailFragment>>)
              _fn) =>
      call(
          sentInvitations: _fn(_instance.sentInvitations
              .map((e) => CopyWith$Fragment$invitationDetailFragment(
                    e,
                    (i) => i,
                  ))).toList());
  TRes pendingInvitations(
          Iterable<Fragment$invitationDetailFragment> Function(
                  Iterable<
                      CopyWith$Fragment$invitationDetailFragment<
                          Fragment$invitationDetailFragment>>)
              _fn) =>
      call(
          pendingInvitations: _fn(_instance.pendingInvitations
              .map((e) => CopyWith$Fragment$invitationDetailFragment(
                    e,
                    (i) => i,
                  ))).toList());
  TRes acceptedInvitations(
          Iterable<Fragment$invitationDetailFragment> Function(
                  Iterable<
                      CopyWith$Fragment$invitationDetailFragment<
                          Fragment$invitationDetailFragment>>)
              _fn) =>
      call(
          acceptedInvitations: _fn(_instance.acceptedInvitations
              .map((e) => CopyWith$Fragment$invitationDetailFragment(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$invitationScreenViewer$viewer<TRes>
    implements CopyWith$Query$invitationScreenViewer$viewer<TRes> {
  _CopyWithStubImpl$Query$invitationScreenViewer$viewer(this._res);

  TRes _res;

  call({
    List<Fragment$invitationDetailFragment>? sentInvitations,
    List<Fragment$invitationDetailFragment>? pendingInvitations,
    List<Fragment$invitationDetailFragment>? acceptedInvitations,
    String? $__typename,
  }) =>
      _res;
  sentInvitations(_fn) => _res;
  pendingInvitations(_fn) => _res;
  acceptedInvitations(_fn) => _res;
}

class Variables$Mutation$acceptInvitation {
  factory Variables$Mutation$acceptInvitation({required String invitationId}) =>
      Variables$Mutation$acceptInvitation._({
        r'invitationId': invitationId,
      });

  Variables$Mutation$acceptInvitation._(this._$data);

  factory Variables$Mutation$acceptInvitation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$invitationId = data['invitationId'];
    result$data['invitationId'] = (l$invitationId as String);
    return Variables$Mutation$acceptInvitation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get invitationId => (_$data['invitationId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$invitationId = invitationId;
    result$data['invitationId'] = l$invitationId;
    return result$data;
  }

  CopyWith$Variables$Mutation$acceptInvitation<
          Variables$Mutation$acceptInvitation>
      get copyWith => CopyWith$Variables$Mutation$acceptInvitation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$acceptInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitationId = invitationId;
    final lOther$invitationId = other.invitationId;
    if (l$invitationId != lOther$invitationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$invitationId = invitationId;
    return Object.hashAll([l$invitationId]);
  }
}

abstract class CopyWith$Variables$Mutation$acceptInvitation<TRes> {
  factory CopyWith$Variables$Mutation$acceptInvitation(
    Variables$Mutation$acceptInvitation instance,
    TRes Function(Variables$Mutation$acceptInvitation) then,
  ) = _CopyWithImpl$Variables$Mutation$acceptInvitation;

  factory CopyWith$Variables$Mutation$acceptInvitation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$acceptInvitation;

  TRes call({String? invitationId});
}

class _CopyWithImpl$Variables$Mutation$acceptInvitation<TRes>
    implements CopyWith$Variables$Mutation$acceptInvitation<TRes> {
  _CopyWithImpl$Variables$Mutation$acceptInvitation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$acceptInvitation _instance;

  final TRes Function(Variables$Mutation$acceptInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? invitationId = _undefined}) =>
      _then(Variables$Mutation$acceptInvitation._({
        ..._instance._$data,
        if (invitationId != _undefined && invitationId != null)
          'invitationId': (invitationId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$acceptInvitation<TRes>
    implements CopyWith$Variables$Mutation$acceptInvitation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$acceptInvitation(this._res);

  TRes _res;

  call({String? invitationId}) => _res;
}

class Mutation$acceptInvitation {
  Mutation$acceptInvitation({
    required this.acceptInvitation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$acceptInvitation.fromJson(Map<String, dynamic> json) {
    final l$acceptInvitation = json['acceptInvitation'];
    final l$$__typename = json['__typename'];
    return Mutation$acceptInvitation(
      acceptInvitation: Mutation$acceptInvitation$acceptInvitation.fromJson(
          (l$acceptInvitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$acceptInvitation$acceptInvitation acceptInvitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$acceptInvitation = acceptInvitation;
    _resultData['acceptInvitation'] = l$acceptInvitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$acceptInvitation = acceptInvitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$acceptInvitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$acceptInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$acceptInvitation = acceptInvitation;
    final lOther$acceptInvitation = other.acceptInvitation;
    if (l$acceptInvitation != lOther$acceptInvitation) {
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

extension UtilityExtension$Mutation$acceptInvitation
    on Mutation$acceptInvitation {
  CopyWith$Mutation$acceptInvitation<Mutation$acceptInvitation> get copyWith =>
      CopyWith$Mutation$acceptInvitation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$acceptInvitation<TRes> {
  factory CopyWith$Mutation$acceptInvitation(
    Mutation$acceptInvitation instance,
    TRes Function(Mutation$acceptInvitation) then,
  ) = _CopyWithImpl$Mutation$acceptInvitation;

  factory CopyWith$Mutation$acceptInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$acceptInvitation;

  TRes call({
    Mutation$acceptInvitation$acceptInvitation? acceptInvitation,
    String? $__typename,
  });
  CopyWith$Mutation$acceptInvitation$acceptInvitation<TRes>
      get acceptInvitation;
}

class _CopyWithImpl$Mutation$acceptInvitation<TRes>
    implements CopyWith$Mutation$acceptInvitation<TRes> {
  _CopyWithImpl$Mutation$acceptInvitation(
    this._instance,
    this._then,
  );

  final Mutation$acceptInvitation _instance;

  final TRes Function(Mutation$acceptInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? acceptInvitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$acceptInvitation(
        acceptInvitation: acceptInvitation == _undefined ||
                acceptInvitation == null
            ? _instance.acceptInvitation
            : (acceptInvitation as Mutation$acceptInvitation$acceptInvitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$acceptInvitation$acceptInvitation<TRes>
      get acceptInvitation {
    final local$acceptInvitation = _instance.acceptInvitation;
    return CopyWith$Mutation$acceptInvitation$acceptInvitation(
        local$acceptInvitation, (e) => call(acceptInvitation: e));
  }
}

class _CopyWithStubImpl$Mutation$acceptInvitation<TRes>
    implements CopyWith$Mutation$acceptInvitation<TRes> {
  _CopyWithStubImpl$Mutation$acceptInvitation(this._res);

  TRes _res;

  call({
    Mutation$acceptInvitation$acceptInvitation? acceptInvitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$acceptInvitation$acceptInvitation<TRes>
      get acceptInvitation =>
          CopyWith$Mutation$acceptInvitation$acceptInvitation.stub(_res);
}

const documentNodeMutationacceptInvitation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'acceptInvitation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'invitationId')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'acceptInvitation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'invitationId'),
            value: VariableNode(name: NameNode(value: 'invitationId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'invitation'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'invitationDetailFragment'),
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
  fragmentDefinitioninvitationDetailFragment,
  fragmentDefinitioninvitationDetailAcceptedUserFragment,
]);
Mutation$acceptInvitation _parserFn$Mutation$acceptInvitation(
        Map<String, dynamic> data) =>
    Mutation$acceptInvitation.fromJson(data);
typedef OnMutationCompleted$Mutation$acceptInvitation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$acceptInvitation?,
);

class Options$Mutation$acceptInvitation
    extends graphql.MutationOptions<Mutation$acceptInvitation> {
  Options$Mutation$acceptInvitation({
    String? operationName,
    required Variables$Mutation$acceptInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$acceptInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$acceptInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$acceptInvitation>? update,
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
                        : _parserFn$Mutation$acceptInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationacceptInvitation,
          parserFn: _parserFn$Mutation$acceptInvitation,
        );

  final OnMutationCompleted$Mutation$acceptInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$acceptInvitation
    extends graphql.WatchQueryOptions<Mutation$acceptInvitation> {
  WatchOptions$Mutation$acceptInvitation({
    String? operationName,
    required Variables$Mutation$acceptInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$acceptInvitation? typedOptimisticResult,
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
          document: documentNodeMutationacceptInvitation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$acceptInvitation,
        );
}

extension ClientExtension$Mutation$acceptInvitation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$acceptInvitation>>
      mutate$acceptInvitation(
              Options$Mutation$acceptInvitation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$acceptInvitation>
      watchMutation$acceptInvitation(
              WatchOptions$Mutation$acceptInvitation options) =>
          this.watchMutation(options);
}

class Mutation$acceptInvitation$HookResult {
  Mutation$acceptInvitation$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$acceptInvitation runMutation;

  final graphql.QueryResult<Mutation$acceptInvitation> result;
}

Mutation$acceptInvitation$HookResult useMutation$acceptInvitation(
    [WidgetOptions$Mutation$acceptInvitation? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$acceptInvitation());
  return Mutation$acceptInvitation$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$acceptInvitation>
    useWatchMutation$acceptInvitation(
            WatchOptions$Mutation$acceptInvitation options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$acceptInvitation
    extends graphql.MutationOptions<Mutation$acceptInvitation> {
  WidgetOptions$Mutation$acceptInvitation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$acceptInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$acceptInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$acceptInvitation>? update,
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
                        : _parserFn$Mutation$acceptInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationacceptInvitation,
          parserFn: _parserFn$Mutation$acceptInvitation,
        );

  final OnMutationCompleted$Mutation$acceptInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$acceptInvitation
    = graphql.MultiSourceResult<Mutation$acceptInvitation> Function(
  Variables$Mutation$acceptInvitation, {
  Object? optimisticResult,
  Mutation$acceptInvitation? typedOptimisticResult,
});
typedef Builder$Mutation$acceptInvitation = widgets.Widget Function(
  RunMutation$Mutation$acceptInvitation,
  graphql.QueryResult<Mutation$acceptInvitation>?,
);

class Mutation$acceptInvitation$Widget
    extends graphql_flutter.Mutation<Mutation$acceptInvitation> {
  Mutation$acceptInvitation$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$acceptInvitation? options,
    required Builder$Mutation$acceptInvitation builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$acceptInvitation(),
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

class Mutation$acceptInvitation$acceptInvitation {
  Mutation$acceptInvitation$acceptInvitation({
    required this.invitation,
    this.$__typename = 'AcceptInvitationPayload',
  });

  factory Mutation$acceptInvitation$acceptInvitation.fromJson(
      Map<String, dynamic> json) {
    final l$invitation = json['invitation'];
    final l$$__typename = json['__typename'];
    return Mutation$acceptInvitation$acceptInvitation(
      invitation: Fragment$invitationDetailFragment.fromJson(
          (l$invitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$invitationDetailFragment invitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$invitation = invitation;
    _resultData['invitation'] = l$invitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$invitation = invitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$invitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$acceptInvitation$acceptInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitation = invitation;
    final lOther$invitation = other.invitation;
    if (l$invitation != lOther$invitation) {
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

extension UtilityExtension$Mutation$acceptInvitation$acceptInvitation
    on Mutation$acceptInvitation$acceptInvitation {
  CopyWith$Mutation$acceptInvitation$acceptInvitation<
          Mutation$acceptInvitation$acceptInvitation>
      get copyWith => CopyWith$Mutation$acceptInvitation$acceptInvitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$acceptInvitation$acceptInvitation<TRes> {
  factory CopyWith$Mutation$acceptInvitation$acceptInvitation(
    Mutation$acceptInvitation$acceptInvitation instance,
    TRes Function(Mutation$acceptInvitation$acceptInvitation) then,
  ) = _CopyWithImpl$Mutation$acceptInvitation$acceptInvitation;

  factory CopyWith$Mutation$acceptInvitation$acceptInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$acceptInvitation$acceptInvitation;

  TRes call({
    Fragment$invitationDetailFragment? invitation,
    String? $__typename,
  });
  CopyWith$Fragment$invitationDetailFragment<TRes> get invitation;
}

class _CopyWithImpl$Mutation$acceptInvitation$acceptInvitation<TRes>
    implements CopyWith$Mutation$acceptInvitation$acceptInvitation<TRes> {
  _CopyWithImpl$Mutation$acceptInvitation$acceptInvitation(
    this._instance,
    this._then,
  );

  final Mutation$acceptInvitation$acceptInvitation _instance;

  final TRes Function(Mutation$acceptInvitation$acceptInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? invitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$acceptInvitation$acceptInvitation(
        invitation: invitation == _undefined || invitation == null
            ? _instance.invitation
            : (invitation as Fragment$invitationDetailFragment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$invitationDetailFragment<TRes> get invitation {
    final local$invitation = _instance.invitation;
    return CopyWith$Fragment$invitationDetailFragment(
        local$invitation, (e) => call(invitation: e));
  }
}

class _CopyWithStubImpl$Mutation$acceptInvitation$acceptInvitation<TRes>
    implements CopyWith$Mutation$acceptInvitation$acceptInvitation<TRes> {
  _CopyWithStubImpl$Mutation$acceptInvitation$acceptInvitation(this._res);

  TRes _res;

  call({
    Fragment$invitationDetailFragment? invitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$invitationDetailFragment<TRes> get invitation =>
      CopyWith$Fragment$invitationDetailFragment.stub(_res);
}

class Variables$Mutation$denyInvitation {
  factory Variables$Mutation$denyInvitation({required String invitationId}) =>
      Variables$Mutation$denyInvitation._({
        r'invitationId': invitationId,
      });

  Variables$Mutation$denyInvitation._(this._$data);

  factory Variables$Mutation$denyInvitation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$invitationId = data['invitationId'];
    result$data['invitationId'] = (l$invitationId as String);
    return Variables$Mutation$denyInvitation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get invitationId => (_$data['invitationId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$invitationId = invitationId;
    result$data['invitationId'] = l$invitationId;
    return result$data;
  }

  CopyWith$Variables$Mutation$denyInvitation<Variables$Mutation$denyInvitation>
      get copyWith => CopyWith$Variables$Mutation$denyInvitation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$denyInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitationId = invitationId;
    final lOther$invitationId = other.invitationId;
    if (l$invitationId != lOther$invitationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$invitationId = invitationId;
    return Object.hashAll([l$invitationId]);
  }
}

abstract class CopyWith$Variables$Mutation$denyInvitation<TRes> {
  factory CopyWith$Variables$Mutation$denyInvitation(
    Variables$Mutation$denyInvitation instance,
    TRes Function(Variables$Mutation$denyInvitation) then,
  ) = _CopyWithImpl$Variables$Mutation$denyInvitation;

  factory CopyWith$Variables$Mutation$denyInvitation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$denyInvitation;

  TRes call({String? invitationId});
}

class _CopyWithImpl$Variables$Mutation$denyInvitation<TRes>
    implements CopyWith$Variables$Mutation$denyInvitation<TRes> {
  _CopyWithImpl$Variables$Mutation$denyInvitation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$denyInvitation _instance;

  final TRes Function(Variables$Mutation$denyInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? invitationId = _undefined}) =>
      _then(Variables$Mutation$denyInvitation._({
        ..._instance._$data,
        if (invitationId != _undefined && invitationId != null)
          'invitationId': (invitationId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$denyInvitation<TRes>
    implements CopyWith$Variables$Mutation$denyInvitation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$denyInvitation(this._res);

  TRes _res;

  call({String? invitationId}) => _res;
}

class Mutation$denyInvitation {
  Mutation$denyInvitation({
    required this.denyInvitation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$denyInvitation.fromJson(Map<String, dynamic> json) {
    final l$denyInvitation = json['denyInvitation'];
    final l$$__typename = json['__typename'];
    return Mutation$denyInvitation(
      denyInvitation: Mutation$denyInvitation$denyInvitation.fromJson(
          (l$denyInvitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$denyInvitation$denyInvitation denyInvitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$denyInvitation = denyInvitation;
    _resultData['denyInvitation'] = l$denyInvitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$denyInvitation = denyInvitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$denyInvitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$denyInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$denyInvitation = denyInvitation;
    final lOther$denyInvitation = other.denyInvitation;
    if (l$denyInvitation != lOther$denyInvitation) {
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

extension UtilityExtension$Mutation$denyInvitation on Mutation$denyInvitation {
  CopyWith$Mutation$denyInvitation<Mutation$denyInvitation> get copyWith =>
      CopyWith$Mutation$denyInvitation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$denyInvitation<TRes> {
  factory CopyWith$Mutation$denyInvitation(
    Mutation$denyInvitation instance,
    TRes Function(Mutation$denyInvitation) then,
  ) = _CopyWithImpl$Mutation$denyInvitation;

  factory CopyWith$Mutation$denyInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$denyInvitation;

  TRes call({
    Mutation$denyInvitation$denyInvitation? denyInvitation,
    String? $__typename,
  });
  CopyWith$Mutation$denyInvitation$denyInvitation<TRes> get denyInvitation;
}

class _CopyWithImpl$Mutation$denyInvitation<TRes>
    implements CopyWith$Mutation$denyInvitation<TRes> {
  _CopyWithImpl$Mutation$denyInvitation(
    this._instance,
    this._then,
  );

  final Mutation$denyInvitation _instance;

  final TRes Function(Mutation$denyInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? denyInvitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$denyInvitation(
        denyInvitation: denyInvitation == _undefined || denyInvitation == null
            ? _instance.denyInvitation
            : (denyInvitation as Mutation$denyInvitation$denyInvitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$denyInvitation$denyInvitation<TRes> get denyInvitation {
    final local$denyInvitation = _instance.denyInvitation;
    return CopyWith$Mutation$denyInvitation$denyInvitation(
        local$denyInvitation, (e) => call(denyInvitation: e));
  }
}

class _CopyWithStubImpl$Mutation$denyInvitation<TRes>
    implements CopyWith$Mutation$denyInvitation<TRes> {
  _CopyWithStubImpl$Mutation$denyInvitation(this._res);

  TRes _res;

  call({
    Mutation$denyInvitation$denyInvitation? denyInvitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$denyInvitation$denyInvitation<TRes> get denyInvitation =>
      CopyWith$Mutation$denyInvitation$denyInvitation.stub(_res);
}

const documentNodeMutationdenyInvitation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'denyInvitation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'invitationId')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'denyInvitation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'invitationId'),
            value: VariableNode(name: NameNode(value: 'invitationId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'invitation'),
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
Mutation$denyInvitation _parserFn$Mutation$denyInvitation(
        Map<String, dynamic> data) =>
    Mutation$denyInvitation.fromJson(data);
typedef OnMutationCompleted$Mutation$denyInvitation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$denyInvitation?,
);

class Options$Mutation$denyInvitation
    extends graphql.MutationOptions<Mutation$denyInvitation> {
  Options$Mutation$denyInvitation({
    String? operationName,
    required Variables$Mutation$denyInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$denyInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$denyInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$denyInvitation>? update,
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
                        : _parserFn$Mutation$denyInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdenyInvitation,
          parserFn: _parserFn$Mutation$denyInvitation,
        );

  final OnMutationCompleted$Mutation$denyInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$denyInvitation
    extends graphql.WatchQueryOptions<Mutation$denyInvitation> {
  WatchOptions$Mutation$denyInvitation({
    String? operationName,
    required Variables$Mutation$denyInvitation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$denyInvitation? typedOptimisticResult,
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
          document: documentNodeMutationdenyInvitation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$denyInvitation,
        );
}

extension ClientExtension$Mutation$denyInvitation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$denyInvitation>> mutate$denyInvitation(
          Options$Mutation$denyInvitation options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$denyInvitation> watchMutation$denyInvitation(
          WatchOptions$Mutation$denyInvitation options) =>
      this.watchMutation(options);
}

class Mutation$denyInvitation$HookResult {
  Mutation$denyInvitation$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$denyInvitation runMutation;

  final graphql.QueryResult<Mutation$denyInvitation> result;
}

Mutation$denyInvitation$HookResult useMutation$denyInvitation(
    [WidgetOptions$Mutation$denyInvitation? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$denyInvitation());
  return Mutation$denyInvitation$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$denyInvitation>
    useWatchMutation$denyInvitation(
            WatchOptions$Mutation$denyInvitation options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$denyInvitation
    extends graphql.MutationOptions<Mutation$denyInvitation> {
  WidgetOptions$Mutation$denyInvitation({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$denyInvitation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$denyInvitation? onCompleted,
    graphql.OnMutationUpdate<Mutation$denyInvitation>? update,
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
                        : _parserFn$Mutation$denyInvitation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdenyInvitation,
          parserFn: _parserFn$Mutation$denyInvitation,
        );

  final OnMutationCompleted$Mutation$denyInvitation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$denyInvitation
    = graphql.MultiSourceResult<Mutation$denyInvitation> Function(
  Variables$Mutation$denyInvitation, {
  Object? optimisticResult,
  Mutation$denyInvitation? typedOptimisticResult,
});
typedef Builder$Mutation$denyInvitation = widgets.Widget Function(
  RunMutation$Mutation$denyInvitation,
  graphql.QueryResult<Mutation$denyInvitation>?,
);

class Mutation$denyInvitation$Widget
    extends graphql_flutter.Mutation<Mutation$denyInvitation> {
  Mutation$denyInvitation$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$denyInvitation? options,
    required Builder$Mutation$denyInvitation builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$denyInvitation(),
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

class Mutation$denyInvitation$denyInvitation {
  Mutation$denyInvitation$denyInvitation({
    required this.invitation,
    this.$__typename = 'DenyInvitationPayload',
  });

  factory Mutation$denyInvitation$denyInvitation.fromJson(
      Map<String, dynamic> json) {
    final l$invitation = json['invitation'];
    final l$$__typename = json['__typename'];
    return Mutation$denyInvitation$denyInvitation(
      invitation: Mutation$denyInvitation$denyInvitation$invitation.fromJson(
          (l$invitation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$denyInvitation$denyInvitation$invitation invitation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$invitation = invitation;
    _resultData['invitation'] = l$invitation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$invitation = invitation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$invitation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$denyInvitation$denyInvitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invitation = invitation;
    final lOther$invitation = other.invitation;
    if (l$invitation != lOther$invitation) {
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

extension UtilityExtension$Mutation$denyInvitation$denyInvitation
    on Mutation$denyInvitation$denyInvitation {
  CopyWith$Mutation$denyInvitation$denyInvitation<
          Mutation$denyInvitation$denyInvitation>
      get copyWith => CopyWith$Mutation$denyInvitation$denyInvitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$denyInvitation$denyInvitation<TRes> {
  factory CopyWith$Mutation$denyInvitation$denyInvitation(
    Mutation$denyInvitation$denyInvitation instance,
    TRes Function(Mutation$denyInvitation$denyInvitation) then,
  ) = _CopyWithImpl$Mutation$denyInvitation$denyInvitation;

  factory CopyWith$Mutation$denyInvitation$denyInvitation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$denyInvitation$denyInvitation;

  TRes call({
    Mutation$denyInvitation$denyInvitation$invitation? invitation,
    String? $__typename,
  });
  CopyWith$Mutation$denyInvitation$denyInvitation$invitation<TRes>
      get invitation;
}

class _CopyWithImpl$Mutation$denyInvitation$denyInvitation<TRes>
    implements CopyWith$Mutation$denyInvitation$denyInvitation<TRes> {
  _CopyWithImpl$Mutation$denyInvitation$denyInvitation(
    this._instance,
    this._then,
  );

  final Mutation$denyInvitation$denyInvitation _instance;

  final TRes Function(Mutation$denyInvitation$denyInvitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? invitation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$denyInvitation$denyInvitation(
        invitation: invitation == _undefined || invitation == null
            ? _instance.invitation
            : (invitation as Mutation$denyInvitation$denyInvitation$invitation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$denyInvitation$denyInvitation$invitation<TRes>
      get invitation {
    final local$invitation = _instance.invitation;
    return CopyWith$Mutation$denyInvitation$denyInvitation$invitation(
        local$invitation, (e) => call(invitation: e));
  }
}

class _CopyWithStubImpl$Mutation$denyInvitation$denyInvitation<TRes>
    implements CopyWith$Mutation$denyInvitation$denyInvitation<TRes> {
  _CopyWithStubImpl$Mutation$denyInvitation$denyInvitation(this._res);

  TRes _res;

  call({
    Mutation$denyInvitation$denyInvitation$invitation? invitation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$denyInvitation$denyInvitation$invitation<TRes>
      get invitation =>
          CopyWith$Mutation$denyInvitation$denyInvitation$invitation.stub(_res);
}

class Mutation$denyInvitation$denyInvitation$invitation {
  Mutation$denyInvitation$denyInvitation$invitation({
    required this.id,
    this.$__typename = 'Invitation',
  });

  factory Mutation$denyInvitation$denyInvitation$invitation.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$denyInvitation$denyInvitation$invitation(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$denyInvitation$denyInvitation$invitation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$denyInvitation$denyInvitation$invitation
    on Mutation$denyInvitation$denyInvitation$invitation {
  CopyWith$Mutation$denyInvitation$denyInvitation$invitation<
          Mutation$denyInvitation$denyInvitation$invitation>
      get copyWith =>
          CopyWith$Mutation$denyInvitation$denyInvitation$invitation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$denyInvitation$denyInvitation$invitation<
    TRes> {
  factory CopyWith$Mutation$denyInvitation$denyInvitation$invitation(
    Mutation$denyInvitation$denyInvitation$invitation instance,
    TRes Function(Mutation$denyInvitation$denyInvitation$invitation) then,
  ) = _CopyWithImpl$Mutation$denyInvitation$denyInvitation$invitation;

  factory CopyWith$Mutation$denyInvitation$denyInvitation$invitation.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$denyInvitation$denyInvitation$invitation;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$denyInvitation$denyInvitation$invitation<TRes>
    implements
        CopyWith$Mutation$denyInvitation$denyInvitation$invitation<TRes> {
  _CopyWithImpl$Mutation$denyInvitation$denyInvitation$invitation(
    this._instance,
    this._then,
  );

  final Mutation$denyInvitation$denyInvitation$invitation _instance;

  final TRes Function(Mutation$denyInvitation$denyInvitation$invitation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$denyInvitation$denyInvitation$invitation(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$denyInvitation$denyInvitation$invitation<TRes>
    implements
        CopyWith$Mutation$denyInvitation$denyInvitation$invitation<TRes> {
  _CopyWithStubImpl$Mutation$denyInvitation$denyInvitation$invitation(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
