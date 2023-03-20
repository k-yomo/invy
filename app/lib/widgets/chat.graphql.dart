import '../graphql/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$ChatMessageTextFragment {
  Fragment$ChatMessageTextFragment({
    required this.id,
    required this.chatRoomId,
    required this.userId,
    required this.kind,
    required this.body,
    required this.createdAt,
    this.$__typename = 'ChatMessage',
  });

  factory Fragment$ChatMessageTextFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$chatRoomId = json['chatRoomId'];
    final l$userId = json['userId'];
    final l$kind = json['kind'];
    final l$body = json['body'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Fragment$ChatMessageTextFragment(
      id: (l$id as String),
      chatRoomId: (l$chatRoomId as String),
      userId: (l$userId as String),
      kind: fromJson$Enum$ChatMessageKind((l$kind as String)),
      body: Fragment$ChatMessageTextFragment$body.fromJson(
          (l$body as Map<String, dynamic>)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String chatRoomId;

  final String userId;

  final Enum$ChatMessageKind kind;

  final Fragment$ChatMessageTextFragment$body body;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$chatRoomId = chatRoomId;
    _resultData['chatRoomId'] = l$chatRoomId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$kind = kind;
    _resultData['kind'] = toJson$Enum$ChatMessageKind(l$kind);
    final l$body = body;
    _resultData['body'] = l$body.toJson();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$chatRoomId = chatRoomId;
    final l$userId = userId;
    final l$kind = kind;
    final l$body = body;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$chatRoomId,
      l$userId,
      l$kind,
      l$body,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ChatMessageTextFragment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$chatRoomId = chatRoomId;
    final lOther$chatRoomId = other.chatRoomId;
    if (l$chatRoomId != lOther$chatRoomId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Fragment$ChatMessageTextFragment
    on Fragment$ChatMessageTextFragment {
  CopyWith$Fragment$ChatMessageTextFragment<Fragment$ChatMessageTextFragment>
      get copyWith => CopyWith$Fragment$ChatMessageTextFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ChatMessageTextFragment<TRes> {
  factory CopyWith$Fragment$ChatMessageTextFragment(
    Fragment$ChatMessageTextFragment instance,
    TRes Function(Fragment$ChatMessageTextFragment) then,
  ) = _CopyWithImpl$Fragment$ChatMessageTextFragment;

  factory CopyWith$Fragment$ChatMessageTextFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ChatMessageTextFragment;

  TRes call({
    String? id,
    String? chatRoomId,
    String? userId,
    Enum$ChatMessageKind? kind,
    Fragment$ChatMessageTextFragment$body? body,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Fragment$ChatMessageTextFragment$body<TRes> get body;
}

class _CopyWithImpl$Fragment$ChatMessageTextFragment<TRes>
    implements CopyWith$Fragment$ChatMessageTextFragment<TRes> {
  _CopyWithImpl$Fragment$ChatMessageTextFragment(
    this._instance,
    this._then,
  );

  final Fragment$ChatMessageTextFragment _instance;

  final TRes Function(Fragment$ChatMessageTextFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? chatRoomId = _undefined,
    Object? userId = _undefined,
    Object? kind = _undefined,
    Object? body = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ChatMessageTextFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        chatRoomId: chatRoomId == _undefined || chatRoomId == null
            ? _instance.chatRoomId
            : (chatRoomId as String),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        kind: kind == _undefined || kind == null
            ? _instance.kind
            : (kind as Enum$ChatMessageKind),
        body: body == _undefined || body == null
            ? _instance.body
            : (body as Fragment$ChatMessageTextFragment$body),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ChatMessageTextFragment$body<TRes> get body {
    final local$body = _instance.body;
    return CopyWith$Fragment$ChatMessageTextFragment$body(
        local$body, (e) => call(body: e));
  }
}

class _CopyWithStubImpl$Fragment$ChatMessageTextFragment<TRes>
    implements CopyWith$Fragment$ChatMessageTextFragment<TRes> {
  _CopyWithStubImpl$Fragment$ChatMessageTextFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? chatRoomId,
    String? userId,
    Enum$ChatMessageKind? kind,
    Fragment$ChatMessageTextFragment$body? body,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ChatMessageTextFragment$body<TRes> get body =>
      CopyWith$Fragment$ChatMessageTextFragment$body.stub(_res);
}

const fragmentDefinitionChatMessageTextFragment = FragmentDefinitionNode(
  name: NameNode(value: 'ChatMessageTextFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ChatMessage'),
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
      name: NameNode(value: 'chatRoomId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'userId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'kind'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'body'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'ChatMessageBodyText'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'text'),
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
      name: NameNode(value: 'createdAt'),
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
const documentNodeFragmentChatMessageTextFragment = DocumentNode(definitions: [
  fragmentDefinitionChatMessageTextFragment,
]);

extension ClientExtension$Fragment$ChatMessageTextFragment
    on graphql.GraphQLClient {
  void writeFragment$ChatMessageTextFragment({
    required Fragment$ChatMessageTextFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ChatMessageTextFragment',
            document: documentNodeFragmentChatMessageTextFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ChatMessageTextFragment? readFragment$ChatMessageTextFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ChatMessageTextFragment',
          document: documentNodeFragmentChatMessageTextFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$ChatMessageTextFragment.fromJson(result);
  }
}

class Fragment$ChatMessageTextFragment$body {
  Fragment$ChatMessageTextFragment$body({required this.$__typename});

  factory Fragment$ChatMessageTextFragment$body.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ChatMessageBodyText":
        return Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText
            .fromJson(json);

      case "ChatMessageBodyImage":
        return Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$ChatMessageTextFragment$body(
            $__typename: (l$$__typename as String));
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ChatMessageTextFragment$body) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$ChatMessageTextFragment$body
    on Fragment$ChatMessageTextFragment$body {
  CopyWith$Fragment$ChatMessageTextFragment$body<
          Fragment$ChatMessageTextFragment$body>
      get copyWith => CopyWith$Fragment$ChatMessageTextFragment$body(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ChatMessageTextFragment$body<TRes> {
  factory CopyWith$Fragment$ChatMessageTextFragment$body(
    Fragment$ChatMessageTextFragment$body instance,
    TRes Function(Fragment$ChatMessageTextFragment$body) then,
  ) = _CopyWithImpl$Fragment$ChatMessageTextFragment$body;

  factory CopyWith$Fragment$ChatMessageTextFragment$body.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ChatMessageTextFragment$body<TRes>
    implements CopyWith$Fragment$ChatMessageTextFragment$body<TRes> {
  _CopyWithImpl$Fragment$ChatMessageTextFragment$body(
    this._instance,
    this._then,
  );

  final Fragment$ChatMessageTextFragment$body _instance;

  final TRes Function(Fragment$ChatMessageTextFragment$body) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$ChatMessageTextFragment$body(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body<TRes>
    implements CopyWith$Fragment$ChatMessageTextFragment$body<TRes> {
  _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText
    implements Fragment$ChatMessageTextFragment$body {
  Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText({
    required this.text,
    this.$__typename = 'ChatMessageBodyText',
  });

  factory Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText.fromJson(
      Map<String, dynamic> json) {
    final l$text = json['text'];
    final l$$__typename = json['__typename'];
    return Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText(
      text: (l$text as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$text = text;
    _resultData['text'] = l$text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$text = text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
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

extension UtilityExtension$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText
    on Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText {
  CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText<
          Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText>
      get copyWith =>
          CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText<
    TRes> {
  factory CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText(
    Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText instance,
    TRes Function(Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText)
        then,
  ) = _CopyWithImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText;

  factory CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText;

  TRes call({
    String? text,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText<
        TRes>
    implements
        CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText<
            TRes> {
  _CopyWithImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText(
    this._instance,
    this._then,
  );

  final Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText _instance;

  final TRes Function(
      Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText(
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText<
        TRes>
    implements
        CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText<
            TRes> {
  _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText(
      this._res);

  TRes _res;

  call({
    String? text,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage
    implements Fragment$ChatMessageTextFragment$body {
  Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage(
      {this.$__typename = 'ChatMessageBodyImage'});

  factory Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage(
        $__typename: (l$$__typename as String));
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage
    on Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage {
  CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage<
          Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage>
      get copyWith =>
          CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage<
    TRes> {
  factory CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage(
    Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage instance,
    TRes Function(Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage)
        then,
  ) = _CopyWithImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage;

  factory CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage<
        TRes>
    implements
        CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage<
            TRes> {
  _CopyWithImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage(
    this._instance,
    this._then,
  );

  final Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage _instance;

  final TRes Function(
      Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage<
        TRes>
    implements
        CopyWith$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage<
            TRes> {
  _CopyWithStubImpl$Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$ChatMessageImageFragment {
  Fragment$ChatMessageImageFragment({
    required this.id,
    required this.chatRoomId,
    required this.userId,
    required this.kind,
    required this.body,
    required this.createdAt,
    this.$__typename = 'ChatMessage',
  });

  factory Fragment$ChatMessageImageFragment.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$chatRoomId = json['chatRoomId'];
    final l$userId = json['userId'];
    final l$kind = json['kind'];
    final l$body = json['body'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Fragment$ChatMessageImageFragment(
      id: (l$id as String),
      chatRoomId: (l$chatRoomId as String),
      userId: (l$userId as String),
      kind: fromJson$Enum$ChatMessageKind((l$kind as String)),
      body: Fragment$ChatMessageImageFragment$body.fromJson(
          (l$body as Map<String, dynamic>)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String chatRoomId;

  final String userId;

  final Enum$ChatMessageKind kind;

  final Fragment$ChatMessageImageFragment$body body;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$chatRoomId = chatRoomId;
    _resultData['chatRoomId'] = l$chatRoomId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$kind = kind;
    _resultData['kind'] = toJson$Enum$ChatMessageKind(l$kind);
    final l$body = body;
    _resultData['body'] = l$body.toJson();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$chatRoomId = chatRoomId;
    final l$userId = userId;
    final l$kind = kind;
    final l$body = body;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$chatRoomId,
      l$userId,
      l$kind,
      l$body,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ChatMessageImageFragment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$chatRoomId = chatRoomId;
    final lOther$chatRoomId = other.chatRoomId;
    if (l$chatRoomId != lOther$chatRoomId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Fragment$ChatMessageImageFragment
    on Fragment$ChatMessageImageFragment {
  CopyWith$Fragment$ChatMessageImageFragment<Fragment$ChatMessageImageFragment>
      get copyWith => CopyWith$Fragment$ChatMessageImageFragment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ChatMessageImageFragment<TRes> {
  factory CopyWith$Fragment$ChatMessageImageFragment(
    Fragment$ChatMessageImageFragment instance,
    TRes Function(Fragment$ChatMessageImageFragment) then,
  ) = _CopyWithImpl$Fragment$ChatMessageImageFragment;

  factory CopyWith$Fragment$ChatMessageImageFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ChatMessageImageFragment;

  TRes call({
    String? id,
    String? chatRoomId,
    String? userId,
    Enum$ChatMessageKind? kind,
    Fragment$ChatMessageImageFragment$body? body,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Fragment$ChatMessageImageFragment$body<TRes> get body;
}

class _CopyWithImpl$Fragment$ChatMessageImageFragment<TRes>
    implements CopyWith$Fragment$ChatMessageImageFragment<TRes> {
  _CopyWithImpl$Fragment$ChatMessageImageFragment(
    this._instance,
    this._then,
  );

  final Fragment$ChatMessageImageFragment _instance;

  final TRes Function(Fragment$ChatMessageImageFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? chatRoomId = _undefined,
    Object? userId = _undefined,
    Object? kind = _undefined,
    Object? body = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ChatMessageImageFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        chatRoomId: chatRoomId == _undefined || chatRoomId == null
            ? _instance.chatRoomId
            : (chatRoomId as String),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        kind: kind == _undefined || kind == null
            ? _instance.kind
            : (kind as Enum$ChatMessageKind),
        body: body == _undefined || body == null
            ? _instance.body
            : (body as Fragment$ChatMessageImageFragment$body),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ChatMessageImageFragment$body<TRes> get body {
    final local$body = _instance.body;
    return CopyWith$Fragment$ChatMessageImageFragment$body(
        local$body, (e) => call(body: e));
  }
}

class _CopyWithStubImpl$Fragment$ChatMessageImageFragment<TRes>
    implements CopyWith$Fragment$ChatMessageImageFragment<TRes> {
  _CopyWithStubImpl$Fragment$ChatMessageImageFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? chatRoomId,
    String? userId,
    Enum$ChatMessageKind? kind,
    Fragment$ChatMessageImageFragment$body? body,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ChatMessageImageFragment$body<TRes> get body =>
      CopyWith$Fragment$ChatMessageImageFragment$body.stub(_res);
}

const fragmentDefinitionChatMessageImageFragment = FragmentDefinitionNode(
  name: NameNode(value: 'ChatMessageImageFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ChatMessage'),
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
      name: NameNode(value: 'chatRoomId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'userId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'kind'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'body'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'ChatMessageBodyImage'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'url'),
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
      name: NameNode(value: 'createdAt'),
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
const documentNodeFragmentChatMessageImageFragment = DocumentNode(definitions: [
  fragmentDefinitionChatMessageImageFragment,
]);

extension ClientExtension$Fragment$ChatMessageImageFragment
    on graphql.GraphQLClient {
  void writeFragment$ChatMessageImageFragment({
    required Fragment$ChatMessageImageFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ChatMessageImageFragment',
            document: documentNodeFragmentChatMessageImageFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ChatMessageImageFragment? readFragment$ChatMessageImageFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ChatMessageImageFragment',
          document: documentNodeFragmentChatMessageImageFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$ChatMessageImageFragment.fromJson(result);
  }
}

class Fragment$ChatMessageImageFragment$body {
  Fragment$ChatMessageImageFragment$body({required this.$__typename});

  factory Fragment$ChatMessageImageFragment$body.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ChatMessageBodyImage":
        return Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage
            .fromJson(json);

      case "ChatMessageBodyText":
        return Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$ChatMessageImageFragment$body(
            $__typename: (l$$__typename as String));
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ChatMessageImageFragment$body) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$ChatMessageImageFragment$body
    on Fragment$ChatMessageImageFragment$body {
  CopyWith$Fragment$ChatMessageImageFragment$body<
          Fragment$ChatMessageImageFragment$body>
      get copyWith => CopyWith$Fragment$ChatMessageImageFragment$body(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ChatMessageImageFragment$body<TRes> {
  factory CopyWith$Fragment$ChatMessageImageFragment$body(
    Fragment$ChatMessageImageFragment$body instance,
    TRes Function(Fragment$ChatMessageImageFragment$body) then,
  ) = _CopyWithImpl$Fragment$ChatMessageImageFragment$body;

  factory CopyWith$Fragment$ChatMessageImageFragment$body.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ChatMessageImageFragment$body<TRes>
    implements CopyWith$Fragment$ChatMessageImageFragment$body<TRes> {
  _CopyWithImpl$Fragment$ChatMessageImageFragment$body(
    this._instance,
    this._then,
  );

  final Fragment$ChatMessageImageFragment$body _instance;

  final TRes Function(Fragment$ChatMessageImageFragment$body) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$ChatMessageImageFragment$body(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body<TRes>
    implements CopyWith$Fragment$ChatMessageImageFragment$body<TRes> {
  _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage
    implements Fragment$ChatMessageImageFragment$body {
  Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage({
    required this.url,
    this.$__typename = 'ChatMessageBodyImage',
  });

  factory Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage.fromJson(
      Map<String, dynamic> json) {
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage(
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
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

extension UtilityExtension$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage
    on Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage {
  CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage<
          Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage>
      get copyWith =>
          CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage<
    TRes> {
  factory CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage(
    Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage instance,
    TRes Function(Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage)
        then,
  ) = _CopyWithImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage;

  factory CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage;

  TRes call({
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage<
        TRes>
    implements
        CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage<
            TRes> {
  _CopyWithImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage(
    this._instance,
    this._then,
  );

  final Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage _instance;

  final TRes Function(
      Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage(
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage<
        TRes>
    implements
        CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage<
            TRes> {
  _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage(
      this._res);

  TRes _res;

  call({
    String? url,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText
    implements Fragment$ChatMessageImageFragment$body {
  Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText(
      {this.$__typename = 'ChatMessageBodyText'});

  factory Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText(
        $__typename: (l$$__typename as String));
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText
    on Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText {
  CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText<
          Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText>
      get copyWith =>
          CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText<
    TRes> {
  factory CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText(
    Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText instance,
    TRes Function(Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText)
        then,
  ) = _CopyWithImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText;

  factory CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText<
        TRes>
    implements
        CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText<
            TRes> {
  _CopyWithImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText(
    this._instance,
    this._then,
  );

  final Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText _instance;

  final TRes Function(
      Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText<
        TRes>
    implements
        CopyWith$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText<
            TRes> {
  _CopyWithStubImpl$Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Variables$Mutation$sendChatMessageText {
  factory Variables$Mutation$sendChatMessageText(
          {Input$SendChatMessageTextInput? input}) =>
      Variables$Mutation$sendChatMessageText._({
        if (input != null) r'input': input,
      });

  Variables$Mutation$sendChatMessageText._(this._$data);

  factory Variables$Mutation$sendChatMessageText.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('input')) {
      final l$input = data['input'];
      result$data['input'] = l$input == null
          ? null
          : Input$SendChatMessageTextInput.fromJson(
              (l$input as Map<String, dynamic>));
    }
    return Variables$Mutation$sendChatMessageText._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SendChatMessageTextInput? get input =>
      (_$data['input'] as Input$SendChatMessageTextInput?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('input')) {
      final l$input = input;
      result$data['input'] = l$input?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$sendChatMessageText<
          Variables$Mutation$sendChatMessageText>
      get copyWith => CopyWith$Variables$Mutation$sendChatMessageText(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$sendChatMessageText) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (_$data.containsKey('input') != other._$data.containsKey('input')) {
      return false;
    }
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([_$data.containsKey('input') ? l$input : const {}]);
  }
}

abstract class CopyWith$Variables$Mutation$sendChatMessageText<TRes> {
  factory CopyWith$Variables$Mutation$sendChatMessageText(
    Variables$Mutation$sendChatMessageText instance,
    TRes Function(Variables$Mutation$sendChatMessageText) then,
  ) = _CopyWithImpl$Variables$Mutation$sendChatMessageText;

  factory CopyWith$Variables$Mutation$sendChatMessageText.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$sendChatMessageText;

  TRes call({Input$SendChatMessageTextInput? input});
}

class _CopyWithImpl$Variables$Mutation$sendChatMessageText<TRes>
    implements CopyWith$Variables$Mutation$sendChatMessageText<TRes> {
  _CopyWithImpl$Variables$Mutation$sendChatMessageText(
    this._instance,
    this._then,
  );

  final Variables$Mutation$sendChatMessageText _instance;

  final TRes Function(Variables$Mutation$sendChatMessageText) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$sendChatMessageText._({
        ..._instance._$data,
        if (input != _undefined)
          'input': (input as Input$SendChatMessageTextInput?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$sendChatMessageText<TRes>
    implements CopyWith$Variables$Mutation$sendChatMessageText<TRes> {
  _CopyWithStubImpl$Variables$Mutation$sendChatMessageText(this._res);

  TRes _res;

  call({Input$SendChatMessageTextInput? input}) => _res;
}

class Mutation$sendChatMessageText {
  Mutation$sendChatMessageText({
    required this.sendChatMessageText,
    this.$__typename = 'Mutation',
  });

  factory Mutation$sendChatMessageText.fromJson(Map<String, dynamic> json) {
    final l$sendChatMessageText = json['sendChatMessageText'];
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageText(
      sendChatMessageText:
          Mutation$sendChatMessageText$sendChatMessageText.fromJson(
              (l$sendChatMessageText as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$sendChatMessageText$sendChatMessageText sendChatMessageText;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendChatMessageText = sendChatMessageText;
    _resultData['sendChatMessageText'] = l$sendChatMessageText.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendChatMessageText = sendChatMessageText;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sendChatMessageText,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendChatMessageText) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendChatMessageText = sendChatMessageText;
    final lOther$sendChatMessageText = other.sendChatMessageText;
    if (l$sendChatMessageText != lOther$sendChatMessageText) {
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

extension UtilityExtension$Mutation$sendChatMessageText
    on Mutation$sendChatMessageText {
  CopyWith$Mutation$sendChatMessageText<Mutation$sendChatMessageText>
      get copyWith => CopyWith$Mutation$sendChatMessageText(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendChatMessageText<TRes> {
  factory CopyWith$Mutation$sendChatMessageText(
    Mutation$sendChatMessageText instance,
    TRes Function(Mutation$sendChatMessageText) then,
  ) = _CopyWithImpl$Mutation$sendChatMessageText;

  factory CopyWith$Mutation$sendChatMessageText.stub(TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageText;

  TRes call({
    Mutation$sendChatMessageText$sendChatMessageText? sendChatMessageText,
    String? $__typename,
  });
  CopyWith$Mutation$sendChatMessageText$sendChatMessageText<TRes>
      get sendChatMessageText;
}

class _CopyWithImpl$Mutation$sendChatMessageText<TRes>
    implements CopyWith$Mutation$sendChatMessageText<TRes> {
  _CopyWithImpl$Mutation$sendChatMessageText(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageText _instance;

  final TRes Function(Mutation$sendChatMessageText) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendChatMessageText = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendChatMessageText(
        sendChatMessageText:
            sendChatMessageText == _undefined || sendChatMessageText == null
                ? _instance.sendChatMessageText
                : (sendChatMessageText
                    as Mutation$sendChatMessageText$sendChatMessageText),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$sendChatMessageText$sendChatMessageText<TRes>
      get sendChatMessageText {
    final local$sendChatMessageText = _instance.sendChatMessageText;
    return CopyWith$Mutation$sendChatMessageText$sendChatMessageText(
        local$sendChatMessageText, (e) => call(sendChatMessageText: e));
  }
}

class _CopyWithStubImpl$Mutation$sendChatMessageText<TRes>
    implements CopyWith$Mutation$sendChatMessageText<TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageText(this._res);

  TRes _res;

  call({
    Mutation$sendChatMessageText$sendChatMessageText? sendChatMessageText,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$sendChatMessageText$sendChatMessageText<TRes>
      get sendChatMessageText =>
          CopyWith$Mutation$sendChatMessageText$sendChatMessageText.stub(_res);
}

const documentNodeMutationsendChatMessageText = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'sendChatMessageText'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SendChatMessageTextInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'sendChatMessageText'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'chatMessage'),
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
                name: NameNode(value: 'createdAt'),
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
Mutation$sendChatMessageText _parserFn$Mutation$sendChatMessageText(
        Map<String, dynamic> data) =>
    Mutation$sendChatMessageText.fromJson(data);
typedef OnMutationCompleted$Mutation$sendChatMessageText = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$sendChatMessageText?,
);

class Options$Mutation$sendChatMessageText
    extends graphql.MutationOptions<Mutation$sendChatMessageText> {
  Options$Mutation$sendChatMessageText({
    String? operationName,
    Variables$Mutation$sendChatMessageText? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendChatMessageText? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendChatMessageText? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendChatMessageText>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$sendChatMessageText(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendChatMessageText,
          parserFn: _parserFn$Mutation$sendChatMessageText,
        );

  final OnMutationCompleted$Mutation$sendChatMessageText? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$sendChatMessageText
    extends graphql.WatchQueryOptions<Mutation$sendChatMessageText> {
  WatchOptions$Mutation$sendChatMessageText({
    String? operationName,
    Variables$Mutation$sendChatMessageText? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendChatMessageText? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationsendChatMessageText,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$sendChatMessageText,
        );
}

extension ClientExtension$Mutation$sendChatMessageText
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$sendChatMessageText>>
      mutate$sendChatMessageText(
              [Options$Mutation$sendChatMessageText? options]) async =>
          await this.mutate(options ?? Options$Mutation$sendChatMessageText());
  graphql.ObservableQuery<Mutation$sendChatMessageText>
      watchMutation$sendChatMessageText(
              [WatchOptions$Mutation$sendChatMessageText? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$sendChatMessageText());
}

class Mutation$sendChatMessageText$HookResult {
  Mutation$sendChatMessageText$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$sendChatMessageText runMutation;

  final graphql.QueryResult<Mutation$sendChatMessageText> result;
}

Mutation$sendChatMessageText$HookResult useMutation$sendChatMessageText(
    [WidgetOptions$Mutation$sendChatMessageText? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$sendChatMessageText());
  return Mutation$sendChatMessageText$HookResult(
    ({variables, optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables?.toJson() ?? const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$sendChatMessageText>
    useWatchMutation$sendChatMessageText(
            [WatchOptions$Mutation$sendChatMessageText? options]) =>
        graphql_flutter.useWatchMutation(
            options ?? WatchOptions$Mutation$sendChatMessageText());

class WidgetOptions$Mutation$sendChatMessageText
    extends graphql.MutationOptions<Mutation$sendChatMessageText> {
  WidgetOptions$Mutation$sendChatMessageText({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendChatMessageText? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendChatMessageText? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendChatMessageText>? update,
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
                        : _parserFn$Mutation$sendChatMessageText(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendChatMessageText,
          parserFn: _parserFn$Mutation$sendChatMessageText,
        );

  final OnMutationCompleted$Mutation$sendChatMessageText? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$sendChatMessageText
    = graphql.MultiSourceResult<Mutation$sendChatMessageText> Function({
  Variables$Mutation$sendChatMessageText? variables,
  Object? optimisticResult,
  Mutation$sendChatMessageText? typedOptimisticResult,
});
typedef Builder$Mutation$sendChatMessageText = widgets.Widget Function(
  RunMutation$Mutation$sendChatMessageText,
  graphql.QueryResult<Mutation$sendChatMessageText>?,
);

class Mutation$sendChatMessageText$Widget
    extends graphql_flutter.Mutation<Mutation$sendChatMessageText> {
  Mutation$sendChatMessageText$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$sendChatMessageText? options,
    required Builder$Mutation$sendChatMessageText builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$sendChatMessageText(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              variables,
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables?.toJson() ?? const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$sendChatMessageText$sendChatMessageText {
  Mutation$sendChatMessageText$sendChatMessageText({
    required this.chatMessage,
    this.$__typename = 'SendChatMessageTextPayload',
  });

  factory Mutation$sendChatMessageText$sendChatMessageText.fromJson(
      Map<String, dynamic> json) {
    final l$chatMessage = json['chatMessage'];
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageText$sendChatMessageText(
      chatMessage:
          Mutation$sendChatMessageText$sendChatMessageText$chatMessage.fromJson(
              (l$chatMessage as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$sendChatMessageText$sendChatMessageText$chatMessage
      chatMessage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chatMessage = chatMessage;
    _resultData['chatMessage'] = l$chatMessage.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chatMessage = chatMessage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$chatMessage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendChatMessageText$sendChatMessageText) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatMessage = chatMessage;
    final lOther$chatMessage = other.chatMessage;
    if (l$chatMessage != lOther$chatMessage) {
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

extension UtilityExtension$Mutation$sendChatMessageText$sendChatMessageText
    on Mutation$sendChatMessageText$sendChatMessageText {
  CopyWith$Mutation$sendChatMessageText$sendChatMessageText<
          Mutation$sendChatMessageText$sendChatMessageText>
      get copyWith => CopyWith$Mutation$sendChatMessageText$sendChatMessageText(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendChatMessageText$sendChatMessageText<TRes> {
  factory CopyWith$Mutation$sendChatMessageText$sendChatMessageText(
    Mutation$sendChatMessageText$sendChatMessageText instance,
    TRes Function(Mutation$sendChatMessageText$sendChatMessageText) then,
  ) = _CopyWithImpl$Mutation$sendChatMessageText$sendChatMessageText;

  factory CopyWith$Mutation$sendChatMessageText$sendChatMessageText.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageText$sendChatMessageText;

  TRes call({
    Mutation$sendChatMessageText$sendChatMessageText$chatMessage? chatMessage,
    String? $__typename,
  });
  CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<TRes>
      get chatMessage;
}

class _CopyWithImpl$Mutation$sendChatMessageText$sendChatMessageText<TRes>
    implements CopyWith$Mutation$sendChatMessageText$sendChatMessageText<TRes> {
  _CopyWithImpl$Mutation$sendChatMessageText$sendChatMessageText(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageText$sendChatMessageText _instance;

  final TRes Function(Mutation$sendChatMessageText$sendChatMessageText) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? chatMessage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendChatMessageText$sendChatMessageText(
        chatMessage: chatMessage == _undefined || chatMessage == null
            ? _instance.chatMessage
            : (chatMessage
                as Mutation$sendChatMessageText$sendChatMessageText$chatMessage),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<TRes>
      get chatMessage {
    final local$chatMessage = _instance.chatMessage;
    return CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage(
        local$chatMessage, (e) => call(chatMessage: e));
  }
}

class _CopyWithStubImpl$Mutation$sendChatMessageText$sendChatMessageText<TRes>
    implements CopyWith$Mutation$sendChatMessageText$sendChatMessageText<TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageText$sendChatMessageText(this._res);

  TRes _res;

  call({
    Mutation$sendChatMessageText$sendChatMessageText$chatMessage? chatMessage,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<TRes>
      get chatMessage =>
          CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage
              .stub(_res);
}

class Mutation$sendChatMessageText$sendChatMessageText$chatMessage {
  Mutation$sendChatMessageText$sendChatMessageText$chatMessage({
    required this.id,
    required this.createdAt,
    this.$__typename = 'ChatMessage',
  });

  factory Mutation$sendChatMessageText$sendChatMessageText$chatMessage.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageText$sendChatMessageText$chatMessage(
      id: (l$id as String),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$sendChatMessageText$sendChatMessageText$chatMessage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Mutation$sendChatMessageText$sendChatMessageText$chatMessage
    on Mutation$sendChatMessageText$sendChatMessageText$chatMessage {
  CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<
          Mutation$sendChatMessageText$sendChatMessageText$chatMessage>
      get copyWith =>
          CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<
    TRes> {
  factory CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage(
    Mutation$sendChatMessageText$sendChatMessageText$chatMessage instance,
    TRes Function(Mutation$sendChatMessageText$sendChatMessageText$chatMessage)
        then,
  ) = _CopyWithImpl$Mutation$sendChatMessageText$sendChatMessageText$chatMessage;

  factory CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageText$sendChatMessageText$chatMessage;

  TRes call({
    String? id,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<
            TRes> {
  _CopyWithImpl$Mutation$sendChatMessageText$sendChatMessageText$chatMessage(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageText$sendChatMessageText$chatMessage _instance;

  final TRes Function(
      Mutation$sendChatMessageText$sendChatMessageText$chatMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendChatMessageText$sendChatMessageText$chatMessage(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageText$sendChatMessageText$chatMessage<
            TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageText$sendChatMessageText$chatMessage(
      this._res);

  TRes _res;

  call({
    String? id,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$sendChatMessageImage {
  factory Variables$Mutation$sendChatMessageImage(
          {Input$SendChatMessageImageInput? input}) =>
      Variables$Mutation$sendChatMessageImage._({
        if (input != null) r'input': input,
      });

  Variables$Mutation$sendChatMessageImage._(this._$data);

  factory Variables$Mutation$sendChatMessageImage.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('input')) {
      final l$input = data['input'];
      result$data['input'] = l$input == null
          ? null
          : Input$SendChatMessageImageInput.fromJson(
              (l$input as Map<String, dynamic>));
    }
    return Variables$Mutation$sendChatMessageImage._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SendChatMessageImageInput? get input =>
      (_$data['input'] as Input$SendChatMessageImageInput?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('input')) {
      final l$input = input;
      result$data['input'] = l$input?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$sendChatMessageImage<
          Variables$Mutation$sendChatMessageImage>
      get copyWith => CopyWith$Variables$Mutation$sendChatMessageImage(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$sendChatMessageImage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (_$data.containsKey('input') != other._$data.containsKey('input')) {
      return false;
    }
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([_$data.containsKey('input') ? l$input : const {}]);
  }
}

abstract class CopyWith$Variables$Mutation$sendChatMessageImage<TRes> {
  factory CopyWith$Variables$Mutation$sendChatMessageImage(
    Variables$Mutation$sendChatMessageImage instance,
    TRes Function(Variables$Mutation$sendChatMessageImage) then,
  ) = _CopyWithImpl$Variables$Mutation$sendChatMessageImage;

  factory CopyWith$Variables$Mutation$sendChatMessageImage.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$sendChatMessageImage;

  TRes call({Input$SendChatMessageImageInput? input});
}

class _CopyWithImpl$Variables$Mutation$sendChatMessageImage<TRes>
    implements CopyWith$Variables$Mutation$sendChatMessageImage<TRes> {
  _CopyWithImpl$Variables$Mutation$sendChatMessageImage(
    this._instance,
    this._then,
  );

  final Variables$Mutation$sendChatMessageImage _instance;

  final TRes Function(Variables$Mutation$sendChatMessageImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$sendChatMessageImage._({
        ..._instance._$data,
        if (input != _undefined)
          'input': (input as Input$SendChatMessageImageInput?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$sendChatMessageImage<TRes>
    implements CopyWith$Variables$Mutation$sendChatMessageImage<TRes> {
  _CopyWithStubImpl$Variables$Mutation$sendChatMessageImage(this._res);

  TRes _res;

  call({Input$SendChatMessageImageInput? input}) => _res;
}

class Mutation$sendChatMessageImage {
  Mutation$sendChatMessageImage({
    required this.sendChatMessageImage,
    this.$__typename = 'Mutation',
  });

  factory Mutation$sendChatMessageImage.fromJson(Map<String, dynamic> json) {
    final l$sendChatMessageImage = json['sendChatMessageImage'];
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageImage(
      sendChatMessageImage:
          Mutation$sendChatMessageImage$sendChatMessageImage.fromJson(
              (l$sendChatMessageImage as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$sendChatMessageImage$sendChatMessageImage sendChatMessageImage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendChatMessageImage = sendChatMessageImage;
    _resultData['sendChatMessageImage'] = l$sendChatMessageImage.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendChatMessageImage = sendChatMessageImage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sendChatMessageImage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendChatMessageImage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendChatMessageImage = sendChatMessageImage;
    final lOther$sendChatMessageImage = other.sendChatMessageImage;
    if (l$sendChatMessageImage != lOther$sendChatMessageImage) {
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

extension UtilityExtension$Mutation$sendChatMessageImage
    on Mutation$sendChatMessageImage {
  CopyWith$Mutation$sendChatMessageImage<Mutation$sendChatMessageImage>
      get copyWith => CopyWith$Mutation$sendChatMessageImage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendChatMessageImage<TRes> {
  factory CopyWith$Mutation$sendChatMessageImage(
    Mutation$sendChatMessageImage instance,
    TRes Function(Mutation$sendChatMessageImage) then,
  ) = _CopyWithImpl$Mutation$sendChatMessageImage;

  factory CopyWith$Mutation$sendChatMessageImage.stub(TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageImage;

  TRes call({
    Mutation$sendChatMessageImage$sendChatMessageImage? sendChatMessageImage,
    String? $__typename,
  });
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage<TRes>
      get sendChatMessageImage;
}

class _CopyWithImpl$Mutation$sendChatMessageImage<TRes>
    implements CopyWith$Mutation$sendChatMessageImage<TRes> {
  _CopyWithImpl$Mutation$sendChatMessageImage(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageImage _instance;

  final TRes Function(Mutation$sendChatMessageImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendChatMessageImage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendChatMessageImage(
        sendChatMessageImage:
            sendChatMessageImage == _undefined || sendChatMessageImage == null
                ? _instance.sendChatMessageImage
                : (sendChatMessageImage
                    as Mutation$sendChatMessageImage$sendChatMessageImage),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage<TRes>
      get sendChatMessageImage {
    final local$sendChatMessageImage = _instance.sendChatMessageImage;
    return CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage(
        local$sendChatMessageImage, (e) => call(sendChatMessageImage: e));
  }
}

class _CopyWithStubImpl$Mutation$sendChatMessageImage<TRes>
    implements CopyWith$Mutation$sendChatMessageImage<TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageImage(this._res);

  TRes _res;

  call({
    Mutation$sendChatMessageImage$sendChatMessageImage? sendChatMessageImage,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage<TRes>
      get sendChatMessageImage =>
          CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage.stub(
              _res);
}

const documentNodeMutationsendChatMessageImage = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'sendChatMessageImage'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SendChatMessageImageInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'sendChatMessageImage'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'chatMessage'),
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
                name: NameNode(value: 'createdAt'),
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
Mutation$sendChatMessageImage _parserFn$Mutation$sendChatMessageImage(
        Map<String, dynamic> data) =>
    Mutation$sendChatMessageImage.fromJson(data);
typedef OnMutationCompleted$Mutation$sendChatMessageImage = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$sendChatMessageImage?,
);

class Options$Mutation$sendChatMessageImage
    extends graphql.MutationOptions<Mutation$sendChatMessageImage> {
  Options$Mutation$sendChatMessageImage({
    String? operationName,
    Variables$Mutation$sendChatMessageImage? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendChatMessageImage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendChatMessageImage? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendChatMessageImage>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$sendChatMessageImage(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendChatMessageImage,
          parserFn: _parserFn$Mutation$sendChatMessageImage,
        );

  final OnMutationCompleted$Mutation$sendChatMessageImage?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$sendChatMessageImage
    extends graphql.WatchQueryOptions<Mutation$sendChatMessageImage> {
  WatchOptions$Mutation$sendChatMessageImage({
    String? operationName,
    Variables$Mutation$sendChatMessageImage? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendChatMessageImage? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationsendChatMessageImage,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$sendChatMessageImage,
        );
}

extension ClientExtension$Mutation$sendChatMessageImage
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$sendChatMessageImage>>
      mutate$sendChatMessageImage(
              [Options$Mutation$sendChatMessageImage? options]) async =>
          await this.mutate(options ?? Options$Mutation$sendChatMessageImage());
  graphql.ObservableQuery<Mutation$sendChatMessageImage>
      watchMutation$sendChatMessageImage(
              [WatchOptions$Mutation$sendChatMessageImage? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$sendChatMessageImage());
}

class Mutation$sendChatMessageImage$HookResult {
  Mutation$sendChatMessageImage$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$sendChatMessageImage runMutation;

  final graphql.QueryResult<Mutation$sendChatMessageImage> result;
}

Mutation$sendChatMessageImage$HookResult useMutation$sendChatMessageImage(
    [WidgetOptions$Mutation$sendChatMessageImage? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$sendChatMessageImage());
  return Mutation$sendChatMessageImage$HookResult(
    ({variables, optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables?.toJson() ?? const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$sendChatMessageImage>
    useWatchMutation$sendChatMessageImage(
            [WatchOptions$Mutation$sendChatMessageImage? options]) =>
        graphql_flutter.useWatchMutation(
            options ?? WatchOptions$Mutation$sendChatMessageImage());

class WidgetOptions$Mutation$sendChatMessageImage
    extends graphql.MutationOptions<Mutation$sendChatMessageImage> {
  WidgetOptions$Mutation$sendChatMessageImage({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendChatMessageImage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendChatMessageImage? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendChatMessageImage>? update,
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
                        : _parserFn$Mutation$sendChatMessageImage(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendChatMessageImage,
          parserFn: _parserFn$Mutation$sendChatMessageImage,
        );

  final OnMutationCompleted$Mutation$sendChatMessageImage?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$sendChatMessageImage
    = graphql.MultiSourceResult<Mutation$sendChatMessageImage> Function({
  Variables$Mutation$sendChatMessageImage? variables,
  Object? optimisticResult,
  Mutation$sendChatMessageImage? typedOptimisticResult,
});
typedef Builder$Mutation$sendChatMessageImage = widgets.Widget Function(
  RunMutation$Mutation$sendChatMessageImage,
  graphql.QueryResult<Mutation$sendChatMessageImage>?,
);

class Mutation$sendChatMessageImage$Widget
    extends graphql_flutter.Mutation<Mutation$sendChatMessageImage> {
  Mutation$sendChatMessageImage$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$sendChatMessageImage? options,
    required Builder$Mutation$sendChatMessageImage builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$sendChatMessageImage(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              variables,
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables?.toJson() ?? const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$sendChatMessageImage$sendChatMessageImage {
  Mutation$sendChatMessageImage$sendChatMessageImage({
    required this.chatMessage,
    this.$__typename = 'SendChatMessageImagePayload',
  });

  factory Mutation$sendChatMessageImage$sendChatMessageImage.fromJson(
      Map<String, dynamic> json) {
    final l$chatMessage = json['chatMessage'];
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageImage$sendChatMessageImage(
      chatMessage:
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage
              .fromJson((l$chatMessage as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage
      chatMessage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chatMessage = chatMessage;
    _resultData['chatMessage'] = l$chatMessage.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chatMessage = chatMessage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$chatMessage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendChatMessageImage$sendChatMessageImage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatMessage = chatMessage;
    final lOther$chatMessage = other.chatMessage;
    if (l$chatMessage != lOther$chatMessage) {
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

extension UtilityExtension$Mutation$sendChatMessageImage$sendChatMessageImage
    on Mutation$sendChatMessageImage$sendChatMessageImage {
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage<
          Mutation$sendChatMessageImage$sendChatMessageImage>
      get copyWith =>
          CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage<
    TRes> {
  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage(
    Mutation$sendChatMessageImage$sendChatMessageImage instance,
    TRes Function(Mutation$sendChatMessageImage$sendChatMessageImage) then,
  ) = _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage;

  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage;

  TRes call({
    Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage? chatMessage,
    String? $__typename,
  });
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<TRes>
      get chatMessage;
}

class _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage<TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage<TRes> {
  _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageImage$sendChatMessageImage _instance;

  final TRes Function(Mutation$sendChatMessageImage$sendChatMessageImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? chatMessage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendChatMessageImage$sendChatMessageImage(
        chatMessage: chatMessage == _undefined || chatMessage == null
            ? _instance.chatMessage
            : (chatMessage
                as Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<TRes>
      get chatMessage {
    final local$chatMessage = _instance.chatMessage;
    return CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
        local$chatMessage, (e) => call(chatMessage: e));
  }
}

class _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage<TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage<TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage(
      this._res);

  TRes _res;

  call({
    Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage? chatMessage,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<TRes>
      get chatMessage =>
          CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage
              .stub(_res);
}

class Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage {
  Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage({
    required this.id,
    required this.createdAt,
    this.$__typename = 'ChatMessage',
  });

  factory Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
      id: (l$id as String),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage
    on Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage {
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage>
      get copyWith =>
          CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<
    TRes> {
  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
    Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage instance,
    TRes Function(
            Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage)
        then,
  ) = _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage;

  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage;

  TRes call({
    String? id,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<
            TRes> {
  _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage
      _instance;

  final TRes Function(
      Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage<
            TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
      this._res);

  TRes _res;

  call({
    String? id,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}
