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
  _T when<_T>({
    required _T Function(
            Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText)
        chatMessageBodyText,
    required _T Function(
            Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage)
        chatMessageBodyImage,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ChatMessageBodyText":
        return chatMessageBodyText(
            this as Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText);

      case "ChatMessageBodyImage":
        return chatMessageBodyImage(this
            as Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText)?
        chatMessageBodyText,
    _T Function(Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage)?
        chatMessageBodyImage,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ChatMessageBodyText":
        if (chatMessageBodyText != null) {
          return chatMessageBodyText(this
              as Fragment$ChatMessageTextFragment$body$$ChatMessageBodyText);
        } else {
          return orElse();
        }

      case "ChatMessageBodyImage":
        if (chatMessageBodyImage != null) {
          return chatMessageBodyImage(this
              as Fragment$ChatMessageTextFragment$body$$ChatMessageBodyImage);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
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
  _T when<_T>({
    required _T Function(
            Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage)
        chatMessageBodyImage,
    required _T Function(
            Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText)
        chatMessageBodyText,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ChatMessageBodyImage":
        return chatMessageBodyImage(this
            as Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage);

      case "ChatMessageBodyText":
        return chatMessageBodyText(this
            as Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage)?
        chatMessageBodyImage,
    _T Function(Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText)?
        chatMessageBodyText,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ChatMessageBodyImage":
        if (chatMessageBodyImage != null) {
          return chatMessageBodyImage(this
              as Fragment$ChatMessageImageFragment$body$$ChatMessageBodyImage);
        } else {
          return orElse();
        }

      case "ChatMessageBodyText":
        if (chatMessageBodyText != null) {
          return chatMessageBodyText(this
              as Fragment$ChatMessageImageFragment$body$$ChatMessageBodyText);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
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

class Variables$Query$getUserForChat {
  factory Variables$Query$getUserForChat({required String id}) =>
      Variables$Query$getUserForChat._({
        r'id': id,
      });

  Variables$Query$getUserForChat._(this._$data);

  factory Variables$Query$getUserForChat.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$getUserForChat._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getUserForChat<Variables$Query$getUserForChat>
      get copyWith => CopyWith$Variables$Query$getUserForChat(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getUserForChat) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$getUserForChat<TRes> {
  factory CopyWith$Variables$Query$getUserForChat(
    Variables$Query$getUserForChat instance,
    TRes Function(Variables$Query$getUserForChat) then,
  ) = _CopyWithImpl$Variables$Query$getUserForChat;

  factory CopyWith$Variables$Query$getUserForChat.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getUserForChat;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$getUserForChat<TRes>
    implements CopyWith$Variables$Query$getUserForChat<TRes> {
  _CopyWithImpl$Variables$Query$getUserForChat(
    this._instance,
    this._then,
  );

  final Variables$Query$getUserForChat _instance;

  final TRes Function(Variables$Query$getUserForChat) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getUserForChat._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getUserForChat<TRes>
    implements CopyWith$Variables$Query$getUserForChat<TRes> {
  _CopyWithStubImpl$Variables$Query$getUserForChat(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$getUserForChat {
  Query$getUserForChat({
    required this.user,
    this.$__typename = 'Query',
  });

  factory Query$getUserForChat.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getUserForChat(
      user:
          Query$getUserForChat$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getUserForChat$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getUserForChat) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Query$getUserForChat on Query$getUserForChat {
  CopyWith$Query$getUserForChat<Query$getUserForChat> get copyWith =>
      CopyWith$Query$getUserForChat(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getUserForChat<TRes> {
  factory CopyWith$Query$getUserForChat(
    Query$getUserForChat instance,
    TRes Function(Query$getUserForChat) then,
  ) = _CopyWithImpl$Query$getUserForChat;

  factory CopyWith$Query$getUserForChat.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserForChat;

  TRes call({
    Query$getUserForChat$user? user,
    String? $__typename,
  });
  CopyWith$Query$getUserForChat$user<TRes> get user;
}

class _CopyWithImpl$Query$getUserForChat<TRes>
    implements CopyWith$Query$getUserForChat<TRes> {
  _CopyWithImpl$Query$getUserForChat(
    this._instance,
    this._then,
  );

  final Query$getUserForChat _instance;

  final TRes Function(Query$getUserForChat) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserForChat(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$getUserForChat$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getUserForChat$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getUserForChat$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getUserForChat<TRes>
    implements CopyWith$Query$getUserForChat<TRes> {
  _CopyWithStubImpl$Query$getUserForChat(this._res);

  TRes _res;

  call({
    Query$getUserForChat$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getUserForChat$user<TRes> get user =>
      CopyWith$Query$getUserForChat$user.stub(_res);
}

const documentNodeQuerygetUserForChat = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserForChat'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
Query$getUserForChat _parserFn$Query$getUserForChat(
        Map<String, dynamic> data) =>
    Query$getUserForChat.fromJson(data);
typedef OnQueryComplete$Query$getUserForChat = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getUserForChat?,
);

class Options$Query$getUserForChat
    extends graphql.QueryOptions<Query$getUserForChat> {
  Options$Query$getUserForChat({
    String? operationName,
    required Variables$Query$getUserForChat variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getUserForChat? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getUserForChat? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
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
                    data == null ? null : _parserFn$Query$getUserForChat(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetUserForChat,
          parserFn: _parserFn$Query$getUserForChat,
        );

  final OnQueryComplete$Query$getUserForChat? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getUserForChat
    extends graphql.WatchQueryOptions<Query$getUserForChat> {
  WatchOptions$Query$getUserForChat({
    String? operationName,
    required Variables$Query$getUserForChat variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getUserForChat? typedOptimisticResult,
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
          document: documentNodeQuerygetUserForChat,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getUserForChat,
        );
}

class FetchMoreOptions$Query$getUserForChat extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getUserForChat({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getUserForChat variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetUserForChat,
        );
}

extension ClientExtension$Query$getUserForChat on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getUserForChat>> query$getUserForChat(
          Options$Query$getUserForChat options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getUserForChat> watchQuery$getUserForChat(
          WatchOptions$Query$getUserForChat options) =>
      this.watchQuery(options);
  void writeQuery$getUserForChat({
    required Query$getUserForChat data,
    required Variables$Query$getUserForChat variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetUserForChat),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getUserForChat? readQuery$getUserForChat({
    required Variables$Query$getUserForChat variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetUserForChat),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getUserForChat.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getUserForChat> useQuery$getUserForChat(
        Options$Query$getUserForChat options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getUserForChat> useWatchQuery$getUserForChat(
        WatchOptions$Query$getUserForChat options) =>
    graphql_flutter.useWatchQuery(options);

class Query$getUserForChat$Widget
    extends graphql_flutter.Query<Query$getUserForChat> {
  Query$getUserForChat$Widget({
    widgets.Key? key,
    required Options$Query$getUserForChat options,
    required graphql_flutter.QueryBuilder<Query$getUserForChat> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getUserForChat$user {
  Query$getUserForChat$user({
    required this.nickname,
    required this.avatarUrl,
    this.$__typename = 'User',
  });

  factory Query$getUserForChat$user.fromJson(Map<String, dynamic> json) {
    final l$nickname = json['nickname'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$getUserForChat$user(
      nickname: (l$nickname as String),
      avatarUrl: (l$avatarUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String nickname;

  final String avatarUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    if (!(other is Query$getUserForChat$user) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getUserForChat$user
    on Query$getUserForChat$user {
  CopyWith$Query$getUserForChat$user<Query$getUserForChat$user> get copyWith =>
      CopyWith$Query$getUserForChat$user(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getUserForChat$user<TRes> {
  factory CopyWith$Query$getUserForChat$user(
    Query$getUserForChat$user instance,
    TRes Function(Query$getUserForChat$user) then,
  ) = _CopyWithImpl$Query$getUserForChat$user;

  factory CopyWith$Query$getUserForChat$user.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserForChat$user;

  TRes call({
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getUserForChat$user<TRes>
    implements CopyWith$Query$getUserForChat$user<TRes> {
  _CopyWithImpl$Query$getUserForChat$user(
    this._instance,
    this._then,
  );

  final Query$getUserForChat$user _instance;

  final TRes Function(Query$getUserForChat$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserForChat$user(
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

class _CopyWithStubImpl$Query$getUserForChat$user<TRes>
    implements CopyWith$Query$getUserForChat$user<TRes> {
  _CopyWithStubImpl$Query$getUserForChat$user(this._res);

  TRes _res;

  call({
    String? nickname,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
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
    required this.body,
    required this.createdAt,
    this.$__typename = 'ChatMessage',
  });

  factory Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$body = json['body'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
      id: (l$id as String),
      body: Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body
          .fromJson((l$body as Map<String, dynamic>)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body
      body;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$body = body;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body? body,
    DateTime? createdAt,
    String? $__typename,
  });
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
      TRes> get body;
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
    Object? body = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        body: body == _undefined || body == null
            ? _instance.body
            : (body
                as Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
      TRes> get body {
    final local$body = _instance.body;
    return CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body(
        local$body, (e) => call(body: e));
  }
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
    Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body? body,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
          TRes>
      get body =>
          CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body
              .stub(_res);
}

class Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body {
  Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body(
      {required this.$__typename});

  factory Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ChatMessageBodyImage":
        return Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage
            .fromJson(json);

      case "ChatMessageBodyText":
        return Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body(
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
    if (!(other
            is Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body) ||
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

extension UtilityExtension$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body
    on Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body {
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body>
      get copyWith =>
          CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage)
        chatMessageBodyImage,
    required _T Function(
            Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText)
        chatMessageBodyText,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ChatMessageBodyImage":
        return chatMessageBodyImage(this
            as Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage);

      case "ChatMessageBodyText":
        return chatMessageBodyText(this
            as Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage)?
        chatMessageBodyImage,
    _T Function(
            Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText)?
        chatMessageBodyText,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ChatMessageBodyImage":
        if (chatMessageBodyImage != null) {
          return chatMessageBodyImage(this
              as Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage);
        } else {
          return orElse();
        }

      case "ChatMessageBodyText":
        if (chatMessageBodyText != null) {
          return chatMessageBodyText(this
              as Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
    TRes> {
  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body(
    Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body
        instance,
    TRes Function(
            Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body)
        then,
  ) = _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body;

  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
            TRes> {
  _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body
      _instance;

  final TRes Function(
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body<
            TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage
    implements
        Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body {
  Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage({
    required this.url,
    this.$__typename = 'ChatMessageBodyImage',
  });

  factory Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage.fromJson(
      Map<String, dynamic> json) {
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage(
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
            is Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage) ||
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

extension UtilityExtension$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage
    on Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage {
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage<
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage>
      get copyWith =>
          CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage<
    TRes> {
  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage(
    Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage
        instance,
    TRes Function(
            Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage)
        then,
  ) = _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage;

  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage;

  TRes call({
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage<
            TRes> {
  _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage
      _instance;

  final TRes Function(
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage(
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage<
            TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyImage(
      this._res);

  TRes _res;

  call({
    String? url,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText
    implements
        Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body {
  Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText(
      {this.$__typename = 'ChatMessageBodyText'});

  factory Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText(
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
            is Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText) ||
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

extension UtilityExtension$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText
    on Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText {
  CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText<
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText>
      get copyWith =>
          CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText<
    TRes> {
  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText(
    Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText
        instance,
    TRes Function(
            Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText)
        then,
  ) = _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText;

  factory CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText<
            TRes> {
  _CopyWithImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText(
    this._instance,
    this._then,
  );

  final Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText
      _instance;

  final TRes Function(
          Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText<
        TRes>
    implements
        CopyWith$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText<
            TRes> {
  _CopyWithStubImpl$Mutation$sendChatMessageImage$sendChatMessageImage$chatMessage$body$$ChatMessageBodyText(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Variables$Mutation$updateChatLastReadAt {
  factory Variables$Mutation$updateChatLastReadAt(
          {required Input$UpdateChatLastReadAtInput input}) =>
      Variables$Mutation$updateChatLastReadAt._({
        r'input': input,
      });

  Variables$Mutation$updateChatLastReadAt._(this._$data);

  factory Variables$Mutation$updateChatLastReadAt.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$UpdateChatLastReadAtInput.fromJson(
        (l$input as Map<String, dynamic>));
    return Variables$Mutation$updateChatLastReadAt._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UpdateChatLastReadAtInput get input =>
      (_$data['input'] as Input$UpdateChatLastReadAtInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateChatLastReadAt<
          Variables$Mutation$updateChatLastReadAt>
      get copyWith => CopyWith$Variables$Mutation$updateChatLastReadAt(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateChatLastReadAt) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$updateChatLastReadAt<TRes> {
  factory CopyWith$Variables$Mutation$updateChatLastReadAt(
    Variables$Mutation$updateChatLastReadAt instance,
    TRes Function(Variables$Mutation$updateChatLastReadAt) then,
  ) = _CopyWithImpl$Variables$Mutation$updateChatLastReadAt;

  factory CopyWith$Variables$Mutation$updateChatLastReadAt.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateChatLastReadAt;

  TRes call({Input$UpdateChatLastReadAtInput? input});
}

class _CopyWithImpl$Variables$Mutation$updateChatLastReadAt<TRes>
    implements CopyWith$Variables$Mutation$updateChatLastReadAt<TRes> {
  _CopyWithImpl$Variables$Mutation$updateChatLastReadAt(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateChatLastReadAt _instance;

  final TRes Function(Variables$Mutation$updateChatLastReadAt) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$updateChatLastReadAt._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$UpdateChatLastReadAtInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateChatLastReadAt<TRes>
    implements CopyWith$Variables$Mutation$updateChatLastReadAt<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateChatLastReadAt(this._res);

  TRes _res;

  call({Input$UpdateChatLastReadAtInput? input}) => _res;
}

class Mutation$updateChatLastReadAt {
  Mutation$updateChatLastReadAt({
    required this.updateChatLastReadAt,
    this.$__typename = 'Mutation',
  });

  factory Mutation$updateChatLastReadAt.fromJson(Map<String, dynamic> json) {
    final l$updateChatLastReadAt = json['updateChatLastReadAt'];
    final l$$__typename = json['__typename'];
    return Mutation$updateChatLastReadAt(
      updateChatLastReadAt:
          Mutation$updateChatLastReadAt$updateChatLastReadAt.fromJson(
              (l$updateChatLastReadAt as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$updateChatLastReadAt$updateChatLastReadAt updateChatLastReadAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateChatLastReadAt = updateChatLastReadAt;
    _resultData['updateChatLastReadAt'] = l$updateChatLastReadAt.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateChatLastReadAt = updateChatLastReadAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateChatLastReadAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateChatLastReadAt) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateChatLastReadAt = updateChatLastReadAt;
    final lOther$updateChatLastReadAt = other.updateChatLastReadAt;
    if (l$updateChatLastReadAt != lOther$updateChatLastReadAt) {
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

extension UtilityExtension$Mutation$updateChatLastReadAt
    on Mutation$updateChatLastReadAt {
  CopyWith$Mutation$updateChatLastReadAt<Mutation$updateChatLastReadAt>
      get copyWith => CopyWith$Mutation$updateChatLastReadAt(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateChatLastReadAt<TRes> {
  factory CopyWith$Mutation$updateChatLastReadAt(
    Mutation$updateChatLastReadAt instance,
    TRes Function(Mutation$updateChatLastReadAt) then,
  ) = _CopyWithImpl$Mutation$updateChatLastReadAt;

  factory CopyWith$Mutation$updateChatLastReadAt.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateChatLastReadAt;

  TRes call({
    Mutation$updateChatLastReadAt$updateChatLastReadAt? updateChatLastReadAt,
    String? $__typename,
  });
  CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt<TRes>
      get updateChatLastReadAt;
}

class _CopyWithImpl$Mutation$updateChatLastReadAt<TRes>
    implements CopyWith$Mutation$updateChatLastReadAt<TRes> {
  _CopyWithImpl$Mutation$updateChatLastReadAt(
    this._instance,
    this._then,
  );

  final Mutation$updateChatLastReadAt _instance;

  final TRes Function(Mutation$updateChatLastReadAt) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateChatLastReadAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateChatLastReadAt(
        updateChatLastReadAt:
            updateChatLastReadAt == _undefined || updateChatLastReadAt == null
                ? _instance.updateChatLastReadAt
                : (updateChatLastReadAt
                    as Mutation$updateChatLastReadAt$updateChatLastReadAt),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt<TRes>
      get updateChatLastReadAt {
    final local$updateChatLastReadAt = _instance.updateChatLastReadAt;
    return CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt(
        local$updateChatLastReadAt, (e) => call(updateChatLastReadAt: e));
  }
}

class _CopyWithStubImpl$Mutation$updateChatLastReadAt<TRes>
    implements CopyWith$Mutation$updateChatLastReadAt<TRes> {
  _CopyWithStubImpl$Mutation$updateChatLastReadAt(this._res);

  TRes _res;

  call({
    Mutation$updateChatLastReadAt$updateChatLastReadAt? updateChatLastReadAt,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt<TRes>
      get updateChatLastReadAt =>
          CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt.stub(
              _res);
}

const documentNodeMutationupdateChatLastReadAt = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateChatLastReadAt'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateChatLastReadAtInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateChatLastReadAt'),
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
            name: NameNode(value: 'chatRoomId'),
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
Mutation$updateChatLastReadAt _parserFn$Mutation$updateChatLastReadAt(
        Map<String, dynamic> data) =>
    Mutation$updateChatLastReadAt.fromJson(data);
typedef OnMutationCompleted$Mutation$updateChatLastReadAt = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$updateChatLastReadAt?,
);

class Options$Mutation$updateChatLastReadAt
    extends graphql.MutationOptions<Mutation$updateChatLastReadAt> {
  Options$Mutation$updateChatLastReadAt({
    String? operationName,
    required Variables$Mutation$updateChatLastReadAt variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateChatLastReadAt? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateChatLastReadAt? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateChatLastReadAt>? update,
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
                        : _parserFn$Mutation$updateChatLastReadAt(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateChatLastReadAt,
          parserFn: _parserFn$Mutation$updateChatLastReadAt,
        );

  final OnMutationCompleted$Mutation$updateChatLastReadAt?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateChatLastReadAt
    extends graphql.WatchQueryOptions<Mutation$updateChatLastReadAt> {
  WatchOptions$Mutation$updateChatLastReadAt({
    String? operationName,
    required Variables$Mutation$updateChatLastReadAt variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateChatLastReadAt? typedOptimisticResult,
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
          document: documentNodeMutationupdateChatLastReadAt,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateChatLastReadAt,
        );
}

extension ClientExtension$Mutation$updateChatLastReadAt
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateChatLastReadAt>>
      mutate$updateChatLastReadAt(
              Options$Mutation$updateChatLastReadAt options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateChatLastReadAt>
      watchMutation$updateChatLastReadAt(
              WatchOptions$Mutation$updateChatLastReadAt options) =>
          this.watchMutation(options);
}

class Mutation$updateChatLastReadAt$HookResult {
  Mutation$updateChatLastReadAt$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$updateChatLastReadAt runMutation;

  final graphql.QueryResult<Mutation$updateChatLastReadAt> result;
}

Mutation$updateChatLastReadAt$HookResult useMutation$updateChatLastReadAt(
    [WidgetOptions$Mutation$updateChatLastReadAt? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$updateChatLastReadAt());
  return Mutation$updateChatLastReadAt$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$updateChatLastReadAt>
    useWatchMutation$updateChatLastReadAt(
            WatchOptions$Mutation$updateChatLastReadAt options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$updateChatLastReadAt
    extends graphql.MutationOptions<Mutation$updateChatLastReadAt> {
  WidgetOptions$Mutation$updateChatLastReadAt({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateChatLastReadAt? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateChatLastReadAt? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateChatLastReadAt>? update,
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
                        : _parserFn$Mutation$updateChatLastReadAt(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateChatLastReadAt,
          parserFn: _parserFn$Mutation$updateChatLastReadAt,
        );

  final OnMutationCompleted$Mutation$updateChatLastReadAt?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$updateChatLastReadAt
    = graphql.MultiSourceResult<Mutation$updateChatLastReadAt> Function(
  Variables$Mutation$updateChatLastReadAt, {
  Object? optimisticResult,
  Mutation$updateChatLastReadAt? typedOptimisticResult,
});
typedef Builder$Mutation$updateChatLastReadAt = widgets.Widget Function(
  RunMutation$Mutation$updateChatLastReadAt,
  graphql.QueryResult<Mutation$updateChatLastReadAt>?,
);

class Mutation$updateChatLastReadAt$Widget
    extends graphql_flutter.Mutation<Mutation$updateChatLastReadAt> {
  Mutation$updateChatLastReadAt$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$updateChatLastReadAt? options,
    required Builder$Mutation$updateChatLastReadAt builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$updateChatLastReadAt(),
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

class Mutation$updateChatLastReadAt$updateChatLastReadAt {
  Mutation$updateChatLastReadAt$updateChatLastReadAt({
    required this.chatRoomId,
    this.$__typename = 'UpdateChatLastReadAtPayload',
  });

  factory Mutation$updateChatLastReadAt$updateChatLastReadAt.fromJson(
      Map<String, dynamic> json) {
    final l$chatRoomId = json['chatRoomId'];
    final l$$__typename = json['__typename'];
    return Mutation$updateChatLastReadAt$updateChatLastReadAt(
      chatRoomId: (l$chatRoomId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String chatRoomId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chatRoomId = chatRoomId;
    _resultData['chatRoomId'] = l$chatRoomId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chatRoomId = chatRoomId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$chatRoomId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateChatLastReadAt$updateChatLastReadAt) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatRoomId = chatRoomId;
    final lOther$chatRoomId = other.chatRoomId;
    if (l$chatRoomId != lOther$chatRoomId) {
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

extension UtilityExtension$Mutation$updateChatLastReadAt$updateChatLastReadAt
    on Mutation$updateChatLastReadAt$updateChatLastReadAt {
  CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt<
          Mutation$updateChatLastReadAt$updateChatLastReadAt>
      get copyWith =>
          CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt<
    TRes> {
  factory CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt(
    Mutation$updateChatLastReadAt$updateChatLastReadAt instance,
    TRes Function(Mutation$updateChatLastReadAt$updateChatLastReadAt) then,
  ) = _CopyWithImpl$Mutation$updateChatLastReadAt$updateChatLastReadAt;

  factory CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateChatLastReadAt$updateChatLastReadAt;

  TRes call({
    String? chatRoomId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateChatLastReadAt$updateChatLastReadAt<TRes>
    implements
        CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt<TRes> {
  _CopyWithImpl$Mutation$updateChatLastReadAt$updateChatLastReadAt(
    this._instance,
    this._then,
  );

  final Mutation$updateChatLastReadAt$updateChatLastReadAt _instance;

  final TRes Function(Mutation$updateChatLastReadAt$updateChatLastReadAt) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? chatRoomId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateChatLastReadAt$updateChatLastReadAt(
        chatRoomId: chatRoomId == _undefined || chatRoomId == null
            ? _instance.chatRoomId
            : (chatRoomId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateChatLastReadAt$updateChatLastReadAt<TRes>
    implements
        CopyWith$Mutation$updateChatLastReadAt$updateChatLastReadAt<TRes> {
  _CopyWithStubImpl$Mutation$updateChatLastReadAt$updateChatLastReadAt(
      this._res);

  TRes _res;

  call({
    String? chatRoomId,
    String? $__typename,
  }) =>
      _res;
}
