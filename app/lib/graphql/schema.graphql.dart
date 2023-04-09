import 'package:invy/graphql/scalars.dart';

class Input$SignUpInput {
  factory Input$SignUpInput({
    String? email,
    String? nickname,
    String? avatarUrl,
  }) =>
      Input$SignUpInput._({
        if (email != null) r'email': email,
        if (nickname != null) r'nickname': nickname,
        if (avatarUrl != null) r'avatarUrl': avatarUrl,
      });

  Input$SignUpInput._(this._$data);

  factory Input$SignUpInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('nickname')) {
      final l$nickname = data['nickname'];
      result$data['nickname'] = (l$nickname as String?);
    }
    if (data.containsKey('avatarUrl')) {
      final l$avatarUrl = data['avatarUrl'];
      result$data['avatarUrl'] = (l$avatarUrl as String?);
    }
    return Input$SignUpInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get email => (_$data['email'] as String?);
  String? get nickname => (_$data['nickname'] as String?);
  String? get avatarUrl => (_$data['avatarUrl'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('nickname')) {
      final l$nickname = nickname;
      result$data['nickname'] = l$nickname;
    }
    if (_$data.containsKey('avatarUrl')) {
      final l$avatarUrl = avatarUrl;
      result$data['avatarUrl'] = l$avatarUrl;
    }
    return result$data;
  }

  CopyWith$Input$SignUpInput<Input$SignUpInput> get copyWith =>
      CopyWith$Input$SignUpInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$SignUpInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$nickname = nickname;
    final lOther$nickname = other.nickname;
    if (_$data.containsKey('nickname') !=
        other._$data.containsKey('nickname')) {
      return false;
    }
    if (l$nickname != lOther$nickname) {
      return false;
    }
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (_$data.containsKey('avatarUrl') !=
        other._$data.containsKey('avatarUrl')) {
      return false;
    }
    if (l$avatarUrl != lOther$avatarUrl) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    return Object.hashAll([
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('nickname') ? l$nickname : const {},
      _$data.containsKey('avatarUrl') ? l$avatarUrl : const {},
    ]);
  }
}

abstract class CopyWith$Input$SignUpInput<TRes> {
  factory CopyWith$Input$SignUpInput(
    Input$SignUpInput instance,
    TRes Function(Input$SignUpInput) then,
  ) = _CopyWithImpl$Input$SignUpInput;

  factory CopyWith$Input$SignUpInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SignUpInput;

  TRes call({
    String? email,
    String? nickname,
    String? avatarUrl,
  });
}

class _CopyWithImpl$Input$SignUpInput<TRes>
    implements CopyWith$Input$SignUpInput<TRes> {
  _CopyWithImpl$Input$SignUpInput(
    this._instance,
    this._then,
  );

  final Input$SignUpInput _instance;

  final TRes Function(Input$SignUpInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
  }) =>
      _then(Input$SignUpInput._({
        ..._instance._$data,
        if (email != _undefined) 'email': (email as String?),
        if (nickname != _undefined) 'nickname': (nickname as String?),
        if (avatarUrl != _undefined) 'avatarUrl': (avatarUrl as String?),
      }));
}

class _CopyWithStubImpl$Input$SignUpInput<TRes>
    implements CopyWith$Input$SignUpInput<TRes> {
  _CopyWithStubImpl$Input$SignUpInput(this._res);

  TRes _res;

  call({
    String? email,
    String? nickname,
    String? avatarUrl,
  }) =>
      _res;
}

class Input$CreateUserInput {
  factory Input$CreateUserInput({
    required String nickname,
    String? avatarUrl,
  }) =>
      Input$CreateUserInput._({
        r'nickname': nickname,
        if (avatarUrl != null) r'avatarUrl': avatarUrl,
      });

  Input$CreateUserInput._(this._$data);

  factory Input$CreateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$nickname = data['nickname'];
    result$data['nickname'] = (l$nickname as String);
    if (data.containsKey('avatarUrl')) {
      final l$avatarUrl = data['avatarUrl'];
      result$data['avatarUrl'] = (l$avatarUrl as String?);
    }
    return Input$CreateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get nickname => (_$data['nickname'] as String);
  String? get avatarUrl => (_$data['avatarUrl'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$nickname = nickname;
    result$data['nickname'] = l$nickname;
    if (_$data.containsKey('avatarUrl')) {
      final l$avatarUrl = avatarUrl;
      result$data['avatarUrl'] = l$avatarUrl;
    }
    return result$data;
  }

  CopyWith$Input$CreateUserInput<Input$CreateUserInput> get copyWith =>
      CopyWith$Input$CreateUserInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateUserInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$nickname = nickname;
    final lOther$nickname = other.nickname;
    if (l$nickname != lOther$nickname) {
      return false;
    }
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (_$data.containsKey('avatarUrl') !=
        other._$data.containsKey('avatarUrl')) {
      return false;
    }
    if (l$avatarUrl != lOther$avatarUrl) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    return Object.hashAll([
      l$nickname,
      _$data.containsKey('avatarUrl') ? l$avatarUrl : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateUserInput<TRes> {
  factory CopyWith$Input$CreateUserInput(
    Input$CreateUserInput instance,
    TRes Function(Input$CreateUserInput) then,
  ) = _CopyWithImpl$Input$CreateUserInput;

  factory CopyWith$Input$CreateUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateUserInput;

  TRes call({
    String? nickname,
    String? avatarUrl,
  });
}

class _CopyWithImpl$Input$CreateUserInput<TRes>
    implements CopyWith$Input$CreateUserInput<TRes> {
  _CopyWithImpl$Input$CreateUserInput(
    this._instance,
    this._then,
  );

  final Input$CreateUserInput _instance;

  final TRes Function(Input$CreateUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
  }) =>
      _then(Input$CreateUserInput._({
        ..._instance._$data,
        if (nickname != _undefined && nickname != null)
          'nickname': (nickname as String),
        if (avatarUrl != _undefined) 'avatarUrl': (avatarUrl as String?),
      }));
}

class _CopyWithStubImpl$Input$CreateUserInput<TRes>
    implements CopyWith$Input$CreateUserInput<TRes> {
  _CopyWithStubImpl$Input$CreateUserInput(this._res);

  TRes _res;

  call({
    String? nickname,
    String? avatarUrl,
  }) =>
      _res;
}

class Input$SendChatMessageTextInput {
  factory Input$SendChatMessageTextInput({
    required String id,
    required String chatRoomId,
    required String text,
  }) =>
      Input$SendChatMessageTextInput._({
        r'id': id,
        r'chatRoomId': chatRoomId,
        r'text': text,
      });

  Input$SendChatMessageTextInput._(this._$data);

  factory Input$SendChatMessageTextInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$chatRoomId = data['chatRoomId'];
    result$data['chatRoomId'] = (l$chatRoomId as String);
    final l$text = data['text'];
    result$data['text'] = (l$text as String);
    return Input$SendChatMessageTextInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String get chatRoomId => (_$data['chatRoomId'] as String);
  String get text => (_$data['text'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$chatRoomId = chatRoomId;
    result$data['chatRoomId'] = l$chatRoomId;
    final l$text = text;
    result$data['text'] = l$text;
    return result$data;
  }

  CopyWith$Input$SendChatMessageTextInput<Input$SendChatMessageTextInput>
      get copyWith => CopyWith$Input$SendChatMessageTextInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$SendChatMessageTextInput) ||
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
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$chatRoomId = chatRoomId;
    final l$text = text;
    return Object.hashAll([
      l$id,
      l$chatRoomId,
      l$text,
    ]);
  }
}

abstract class CopyWith$Input$SendChatMessageTextInput<TRes> {
  factory CopyWith$Input$SendChatMessageTextInput(
    Input$SendChatMessageTextInput instance,
    TRes Function(Input$SendChatMessageTextInput) then,
  ) = _CopyWithImpl$Input$SendChatMessageTextInput;

  factory CopyWith$Input$SendChatMessageTextInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SendChatMessageTextInput;

  TRes call({
    String? id,
    String? chatRoomId,
    String? text,
  });
}

class _CopyWithImpl$Input$SendChatMessageTextInput<TRes>
    implements CopyWith$Input$SendChatMessageTextInput<TRes> {
  _CopyWithImpl$Input$SendChatMessageTextInput(
    this._instance,
    this._then,
  );

  final Input$SendChatMessageTextInput _instance;

  final TRes Function(Input$SendChatMessageTextInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? chatRoomId = _undefined,
    Object? text = _undefined,
  }) =>
      _then(Input$SendChatMessageTextInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (chatRoomId != _undefined && chatRoomId != null)
          'chatRoomId': (chatRoomId as String),
        if (text != _undefined && text != null) 'text': (text as String),
      }));
}

class _CopyWithStubImpl$Input$SendChatMessageTextInput<TRes>
    implements CopyWith$Input$SendChatMessageTextInput<TRes> {
  _CopyWithStubImpl$Input$SendChatMessageTextInput(this._res);

  TRes _res;

  call({
    String? id,
    String? chatRoomId,
    String? text,
  }) =>
      _res;
}

class Input$SendChatMessageImageInput {
  factory Input$SendChatMessageImageInput({
    required String id,
    required String chatRoomId,
    required MultipartFile image,
  }) =>
      Input$SendChatMessageImageInput._({
        r'id': id,
        r'chatRoomId': chatRoomId,
        r'image': image,
      });

  Input$SendChatMessageImageInput._(this._$data);

  factory Input$SendChatMessageImageInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$chatRoomId = data['chatRoomId'];
    result$data['chatRoomId'] = (l$chatRoomId as String);
    final l$image = data['image'];
    result$data['image'] = fileFromJson(l$image);
    return Input$SendChatMessageImageInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String get chatRoomId => (_$data['chatRoomId'] as String);
  MultipartFile get image => (_$data['image'] as MultipartFile);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$chatRoomId = chatRoomId;
    result$data['chatRoomId'] = l$chatRoomId;
    final l$image = image;
    result$data['image'] = fileToJson(l$image);
    return result$data;
  }

  CopyWith$Input$SendChatMessageImageInput<Input$SendChatMessageImageInput>
      get copyWith => CopyWith$Input$SendChatMessageImageInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$SendChatMessageImageInput) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$chatRoomId = chatRoomId;
    final l$image = image;
    return Object.hashAll([
      l$id,
      l$chatRoomId,
      l$image,
    ]);
  }
}

abstract class CopyWith$Input$SendChatMessageImageInput<TRes> {
  factory CopyWith$Input$SendChatMessageImageInput(
    Input$SendChatMessageImageInput instance,
    TRes Function(Input$SendChatMessageImageInput) then,
  ) = _CopyWithImpl$Input$SendChatMessageImageInput;

  factory CopyWith$Input$SendChatMessageImageInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SendChatMessageImageInput;

  TRes call({
    String? id,
    String? chatRoomId,
    MultipartFile? image,
  });
}

class _CopyWithImpl$Input$SendChatMessageImageInput<TRes>
    implements CopyWith$Input$SendChatMessageImageInput<TRes> {
  _CopyWithImpl$Input$SendChatMessageImageInput(
    this._instance,
    this._then,
  );

  final Input$SendChatMessageImageInput _instance;

  final TRes Function(Input$SendChatMessageImageInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? chatRoomId = _undefined,
    Object? image = _undefined,
  }) =>
      _then(Input$SendChatMessageImageInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (chatRoomId != _undefined && chatRoomId != null)
          'chatRoomId': (chatRoomId as String),
        if (image != _undefined && image != null)
          'image': (image as MultipartFile),
      }));
}

class _CopyWithStubImpl$Input$SendChatMessageImageInput<TRes>
    implements CopyWith$Input$SendChatMessageImageInput<TRes> {
  _CopyWithStubImpl$Input$SendChatMessageImageInput(this._res);

  TRes _res;

  call({
    String? id,
    String? chatRoomId,
    MultipartFile? image,
  }) =>
      _res;
}

class Input$UpdateChatLastReadAtInput {
  factory Input$UpdateChatLastReadAtInput({
    required String chatRoomId,
    required DateTime lastReadAt,
  }) =>
      Input$UpdateChatLastReadAtInput._({
        r'chatRoomId': chatRoomId,
        r'lastReadAt': lastReadAt,
      });

  Input$UpdateChatLastReadAtInput._(this._$data);

  factory Input$UpdateChatLastReadAtInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$chatRoomId = data['chatRoomId'];
    result$data['chatRoomId'] = (l$chatRoomId as String);
    final l$lastReadAt = data['lastReadAt'];
    result$data['lastReadAt'] = DateTime.parse((l$lastReadAt as String));
    return Input$UpdateChatLastReadAtInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get chatRoomId => (_$data['chatRoomId'] as String);
  DateTime get lastReadAt => (_$data['lastReadAt'] as DateTime);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$chatRoomId = chatRoomId;
    result$data['chatRoomId'] = l$chatRoomId;
    final l$lastReadAt = lastReadAt;
    result$data['lastReadAt'] = l$lastReadAt.toIso8601String();
    return result$data;
  }

  CopyWith$Input$UpdateChatLastReadAtInput<Input$UpdateChatLastReadAtInput>
      get copyWith => CopyWith$Input$UpdateChatLastReadAtInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateChatLastReadAtInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatRoomId = chatRoomId;
    final lOther$chatRoomId = other.chatRoomId;
    if (l$chatRoomId != lOther$chatRoomId) {
      return false;
    }
    final l$lastReadAt = lastReadAt;
    final lOther$lastReadAt = other.lastReadAt;
    if (l$lastReadAt != lOther$lastReadAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$chatRoomId = chatRoomId;
    final l$lastReadAt = lastReadAt;
    return Object.hashAll([
      l$chatRoomId,
      l$lastReadAt,
    ]);
  }
}

abstract class CopyWith$Input$UpdateChatLastReadAtInput<TRes> {
  factory CopyWith$Input$UpdateChatLastReadAtInput(
    Input$UpdateChatLastReadAtInput instance,
    TRes Function(Input$UpdateChatLastReadAtInput) then,
  ) = _CopyWithImpl$Input$UpdateChatLastReadAtInput;

  factory CopyWith$Input$UpdateChatLastReadAtInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateChatLastReadAtInput;

  TRes call({
    String? chatRoomId,
    DateTime? lastReadAt,
  });
}

class _CopyWithImpl$Input$UpdateChatLastReadAtInput<TRes>
    implements CopyWith$Input$UpdateChatLastReadAtInput<TRes> {
  _CopyWithImpl$Input$UpdateChatLastReadAtInput(
    this._instance,
    this._then,
  );

  final Input$UpdateChatLastReadAtInput _instance;

  final TRes Function(Input$UpdateChatLastReadAtInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? chatRoomId = _undefined,
    Object? lastReadAt = _undefined,
  }) =>
      _then(Input$UpdateChatLastReadAtInput._({
        ..._instance._$data,
        if (chatRoomId != _undefined && chatRoomId != null)
          'chatRoomId': (chatRoomId as String),
        if (lastReadAt != _undefined && lastReadAt != null)
          'lastReadAt': (lastReadAt as DateTime),
      }));
}

class _CopyWithStubImpl$Input$UpdateChatLastReadAtInput<TRes>
    implements CopyWith$Input$UpdateChatLastReadAtInput<TRes> {
  _CopyWithStubImpl$Input$UpdateChatLastReadAtInput(this._res);

  TRes _res;

  call({
    String? chatRoomId,
    DateTime? lastReadAt,
  }) =>
      _res;
}

class Input$CreateFriendGroupInput {
  factory Input$CreateFriendGroupInput({
    required String name,
    required List<String> friendUserIds,
  }) =>
      Input$CreateFriendGroupInput._({
        r'name': name,
        r'friendUserIds': friendUserIds,
      });

  Input$CreateFriendGroupInput._(this._$data);

  factory Input$CreateFriendGroupInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$friendUserIds = data['friendUserIds'];
    result$data['friendUserIds'] =
        (l$friendUserIds as List<dynamic>).map((e) => (e as String)).toList();
    return Input$CreateFriendGroupInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);
  List<String> get friendUserIds => (_$data['friendUserIds'] as List<String>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$friendUserIds = friendUserIds;
    result$data['friendUserIds'] = l$friendUserIds.map((e) => e).toList();
    return result$data;
  }

  CopyWith$Input$CreateFriendGroupInput<Input$CreateFriendGroupInput>
      get copyWith => CopyWith$Input$CreateFriendGroupInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateFriendGroupInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$friendUserIds = friendUserIds;
    final lOther$friendUserIds = other.friendUserIds;
    if (l$friendUserIds.length != lOther$friendUserIds.length) {
      return false;
    }
    for (int i = 0; i < l$friendUserIds.length; i++) {
      final l$friendUserIds$entry = l$friendUserIds[i];
      final lOther$friendUserIds$entry = lOther$friendUserIds[i];
      if (l$friendUserIds$entry != lOther$friendUserIds$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$friendUserIds = friendUserIds;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$friendUserIds.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Input$CreateFriendGroupInput<TRes> {
  factory CopyWith$Input$CreateFriendGroupInput(
    Input$CreateFriendGroupInput instance,
    TRes Function(Input$CreateFriendGroupInput) then,
  ) = _CopyWithImpl$Input$CreateFriendGroupInput;

  factory CopyWith$Input$CreateFriendGroupInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateFriendGroupInput;

  TRes call({
    String? name,
    List<String>? friendUserIds,
  });
}

class _CopyWithImpl$Input$CreateFriendGroupInput<TRes>
    implements CopyWith$Input$CreateFriendGroupInput<TRes> {
  _CopyWithImpl$Input$CreateFriendGroupInput(
    this._instance,
    this._then,
  );

  final Input$CreateFriendGroupInput _instance;

  final TRes Function(Input$CreateFriendGroupInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? friendUserIds = _undefined,
  }) =>
      _then(Input$CreateFriendGroupInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (friendUserIds != _undefined && friendUserIds != null)
          'friendUserIds': (friendUserIds as List<String>),
      }));
}

class _CopyWithStubImpl$Input$CreateFriendGroupInput<TRes>
    implements CopyWith$Input$CreateFriendGroupInput<TRes> {
  _CopyWithStubImpl$Input$CreateFriendGroupInput(this._res);

  TRes _res;

  call({
    String? name,
    List<String>? friendUserIds,
  }) =>
      _res;
}

class Input$UpdateFriendGroupInput {
  factory Input$UpdateFriendGroupInput({
    required String id,
    required String name,
    required List<String> friendUserIds,
  }) =>
      Input$UpdateFriendGroupInput._({
        r'id': id,
        r'name': name,
        r'friendUserIds': friendUserIds,
      });

  Input$UpdateFriendGroupInput._(this._$data);

  factory Input$UpdateFriendGroupInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$friendUserIds = data['friendUserIds'];
    result$data['friendUserIds'] =
        (l$friendUserIds as List<dynamic>).map((e) => (e as String)).toList();
    return Input$UpdateFriendGroupInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String get name => (_$data['name'] as String);
  List<String> get friendUserIds => (_$data['friendUserIds'] as List<String>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$name = name;
    result$data['name'] = l$name;
    final l$friendUserIds = friendUserIds;
    result$data['friendUserIds'] = l$friendUserIds.map((e) => e).toList();
    return result$data;
  }

  CopyWith$Input$UpdateFriendGroupInput<Input$UpdateFriendGroupInput>
      get copyWith => CopyWith$Input$UpdateFriendGroupInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$UpdateFriendGroupInput) ||
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
    final l$friendUserIds = friendUserIds;
    final lOther$friendUserIds = other.friendUserIds;
    if (l$friendUserIds.length != lOther$friendUserIds.length) {
      return false;
    }
    for (int i = 0; i < l$friendUserIds.length; i++) {
      final l$friendUserIds$entry = l$friendUserIds[i];
      final lOther$friendUserIds$entry = lOther$friendUserIds[i];
      if (l$friendUserIds$entry != lOther$friendUserIds$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$friendUserIds = friendUserIds;
    return Object.hashAll([
      l$id,
      l$name,
      Object.hashAll(l$friendUserIds.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Input$UpdateFriendGroupInput<TRes> {
  factory CopyWith$Input$UpdateFriendGroupInput(
    Input$UpdateFriendGroupInput instance,
    TRes Function(Input$UpdateFriendGroupInput) then,
  ) = _CopyWithImpl$Input$UpdateFriendGroupInput;

  factory CopyWith$Input$UpdateFriendGroupInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateFriendGroupInput;

  TRes call({
    String? id,
    String? name,
    List<String>? friendUserIds,
  });
}

class _CopyWithImpl$Input$UpdateFriendGroupInput<TRes>
    implements CopyWith$Input$UpdateFriendGroupInput<TRes> {
  _CopyWithImpl$Input$UpdateFriendGroupInput(
    this._instance,
    this._then,
  );

  final Input$UpdateFriendGroupInput _instance;

  final TRes Function(Input$UpdateFriendGroupInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? friendUserIds = _undefined,
  }) =>
      _then(Input$UpdateFriendGroupInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (name != _undefined && name != null) 'name': (name as String),
        if (friendUserIds != _undefined && friendUserIds != null)
          'friendUserIds': (friendUserIds as List<String>),
      }));
}

class _CopyWithStubImpl$Input$UpdateFriendGroupInput<TRes>
    implements CopyWith$Input$UpdateFriendGroupInput<TRes> {
  _CopyWithStubImpl$Input$UpdateFriendGroupInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    List<String>? friendUserIds,
  }) =>
      _res;
}

class Input$SendInvitationInput {
  factory Input$SendInvitationInput({
    required List<String> targetFriendGroupIds,
    required List<String> targetFriendUserIds,
    DateTime? expiresAt,
    required DateTime startsAt,
    required String location,
    double? latitude,
    double? longitude,
    required String comment,
  }) =>
      Input$SendInvitationInput._({
        r'targetFriendGroupIds': targetFriendGroupIds,
        r'targetFriendUserIds': targetFriendUserIds,
        if (expiresAt != null) r'expiresAt': expiresAt,
        r'startsAt': startsAt,
        r'location': location,
        if (latitude != null) r'latitude': latitude,
        if (longitude != null) r'longitude': longitude,
        r'comment': comment,
      });

  Input$SendInvitationInput._(this._$data);

  factory Input$SendInvitationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$targetFriendGroupIds = data['targetFriendGroupIds'];
    result$data['targetFriendGroupIds'] =
        (l$targetFriendGroupIds as List<dynamic>)
            .map((e) => (e as String))
            .toList();
    final l$targetFriendUserIds = data['targetFriendUserIds'];
    result$data['targetFriendUserIds'] =
        (l$targetFriendUserIds as List<dynamic>)
            .map((e) => (e as String))
            .toList();
    if (data.containsKey('expiresAt')) {
      final l$expiresAt = data['expiresAt'];
      result$data['expiresAt'] =
          l$expiresAt == null ? null : DateTime.parse((l$expiresAt as String));
    }
    final l$startsAt = data['startsAt'];
    result$data['startsAt'] = DateTime.parse((l$startsAt as String));
    final l$location = data['location'];
    result$data['location'] = (l$location as String);
    if (data.containsKey('latitude')) {
      final l$latitude = data['latitude'];
      result$data['latitude'] = (l$latitude as num?)?.toDouble();
    }
    if (data.containsKey('longitude')) {
      final l$longitude = data['longitude'];
      result$data['longitude'] = (l$longitude as num?)?.toDouble();
    }
    final l$comment = data['comment'];
    result$data['comment'] = (l$comment as String);
    return Input$SendInvitationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String> get targetFriendGroupIds =>
      (_$data['targetFriendGroupIds'] as List<String>);
  List<String> get targetFriendUserIds =>
      (_$data['targetFriendUserIds'] as List<String>);
  DateTime? get expiresAt => (_$data['expiresAt'] as DateTime?);
  DateTime get startsAt => (_$data['startsAt'] as DateTime);
  String get location => (_$data['location'] as String);
  double? get latitude => (_$data['latitude'] as double?);
  double? get longitude => (_$data['longitude'] as double?);
  String get comment => (_$data['comment'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$targetFriendGroupIds = targetFriendGroupIds;
    result$data['targetFriendGroupIds'] =
        l$targetFriendGroupIds.map((e) => e).toList();
    final l$targetFriendUserIds = targetFriendUserIds;
    result$data['targetFriendUserIds'] =
        l$targetFriendUserIds.map((e) => e).toList();
    if (_$data.containsKey('expiresAt')) {
      final l$expiresAt = expiresAt;
      result$data['expiresAt'] = l$expiresAt?.toIso8601String();
    }
    final l$startsAt = startsAt;
    result$data['startsAt'] = l$startsAt.toIso8601String();
    final l$location = location;
    result$data['location'] = l$location;
    if (_$data.containsKey('latitude')) {
      final l$latitude = latitude;
      result$data['latitude'] = l$latitude;
    }
    if (_$data.containsKey('longitude')) {
      final l$longitude = longitude;
      result$data['longitude'] = l$longitude;
    }
    final l$comment = comment;
    result$data['comment'] = l$comment;
    return result$data;
  }

  CopyWith$Input$SendInvitationInput<Input$SendInvitationInput> get copyWith =>
      CopyWith$Input$SendInvitationInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$SendInvitationInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$targetFriendGroupIds = targetFriendGroupIds;
    final lOther$targetFriendGroupIds = other.targetFriendGroupIds;
    if (l$targetFriendGroupIds.length != lOther$targetFriendGroupIds.length) {
      return false;
    }
    for (int i = 0; i < l$targetFriendGroupIds.length; i++) {
      final l$targetFriendGroupIds$entry = l$targetFriendGroupIds[i];
      final lOther$targetFriendGroupIds$entry = lOther$targetFriendGroupIds[i];
      if (l$targetFriendGroupIds$entry != lOther$targetFriendGroupIds$entry) {
        return false;
      }
    }
    final l$targetFriendUserIds = targetFriendUserIds;
    final lOther$targetFriendUserIds = other.targetFriendUserIds;
    if (l$targetFriendUserIds.length != lOther$targetFriendUserIds.length) {
      return false;
    }
    for (int i = 0; i < l$targetFriendUserIds.length; i++) {
      final l$targetFriendUserIds$entry = l$targetFriendUserIds[i];
      final lOther$targetFriendUserIds$entry = lOther$targetFriendUserIds[i];
      if (l$targetFriendUserIds$entry != lOther$targetFriendUserIds$entry) {
        return false;
      }
    }
    final l$expiresAt = expiresAt;
    final lOther$expiresAt = other.expiresAt;
    if (_$data.containsKey('expiresAt') !=
        other._$data.containsKey('expiresAt')) {
      return false;
    }
    if (l$expiresAt != lOther$expiresAt) {
      return false;
    }
    final l$startsAt = startsAt;
    final lOther$startsAt = other.startsAt;
    if (l$startsAt != lOther$startsAt) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$latitude = latitude;
    final lOther$latitude = other.latitude;
    if (_$data.containsKey('latitude') !=
        other._$data.containsKey('latitude')) {
      return false;
    }
    if (l$latitude != lOther$latitude) {
      return false;
    }
    final l$longitude = longitude;
    final lOther$longitude = other.longitude;
    if (_$data.containsKey('longitude') !=
        other._$data.containsKey('longitude')) {
      return false;
    }
    if (l$longitude != lOther$longitude) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$targetFriendGroupIds = targetFriendGroupIds;
    final l$targetFriendUserIds = targetFriendUserIds;
    final l$expiresAt = expiresAt;
    final l$startsAt = startsAt;
    final l$location = location;
    final l$latitude = latitude;
    final l$longitude = longitude;
    final l$comment = comment;
    return Object.hashAll([
      Object.hashAll(l$targetFriendGroupIds.map((v) => v)),
      Object.hashAll(l$targetFriendUserIds.map((v) => v)),
      _$data.containsKey('expiresAt') ? l$expiresAt : const {},
      l$startsAt,
      l$location,
      _$data.containsKey('latitude') ? l$latitude : const {},
      _$data.containsKey('longitude') ? l$longitude : const {},
      l$comment,
    ]);
  }
}

abstract class CopyWith$Input$SendInvitationInput<TRes> {
  factory CopyWith$Input$SendInvitationInput(
    Input$SendInvitationInput instance,
    TRes Function(Input$SendInvitationInput) then,
  ) = _CopyWithImpl$Input$SendInvitationInput;

  factory CopyWith$Input$SendInvitationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SendInvitationInput;

  TRes call({
    List<String>? targetFriendGroupIds,
    List<String>? targetFriendUserIds,
    DateTime? expiresAt,
    DateTime? startsAt,
    String? location,
    double? latitude,
    double? longitude,
    String? comment,
  });
}

class _CopyWithImpl$Input$SendInvitationInput<TRes>
    implements CopyWith$Input$SendInvitationInput<TRes> {
  _CopyWithImpl$Input$SendInvitationInput(
    this._instance,
    this._then,
  );

  final Input$SendInvitationInput _instance;

  final TRes Function(Input$SendInvitationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? targetFriendGroupIds = _undefined,
    Object? targetFriendUserIds = _undefined,
    Object? expiresAt = _undefined,
    Object? startsAt = _undefined,
    Object? location = _undefined,
    Object? latitude = _undefined,
    Object? longitude = _undefined,
    Object? comment = _undefined,
  }) =>
      _then(Input$SendInvitationInput._({
        ..._instance._$data,
        if (targetFriendGroupIds != _undefined && targetFriendGroupIds != null)
          'targetFriendGroupIds': (targetFriendGroupIds as List<String>),
        if (targetFriendUserIds != _undefined && targetFriendUserIds != null)
          'targetFriendUserIds': (targetFriendUserIds as List<String>),
        if (expiresAt != _undefined) 'expiresAt': (expiresAt as DateTime?),
        if (startsAt != _undefined && startsAt != null)
          'startsAt': (startsAt as DateTime),
        if (location != _undefined && location != null)
          'location': (location as String),
        if (latitude != _undefined) 'latitude': (latitude as double?),
        if (longitude != _undefined) 'longitude': (longitude as double?),
        if (comment != _undefined && comment != null)
          'comment': (comment as String),
      }));
}

class _CopyWithStubImpl$Input$SendInvitationInput<TRes>
    implements CopyWith$Input$SendInvitationInput<TRes> {
  _CopyWithStubImpl$Input$SendInvitationInput(this._res);

  TRes _res;

  call({
    List<String>? targetFriendGroupIds,
    List<String>? targetFriendUserIds,
    DateTime? expiresAt,
    DateTime? startsAt,
    String? location,
    double? latitude,
    double? longitude,
    String? comment,
  }) =>
      _res;
}

class Input$RegisterInvitationAwaitingInput {
  factory Input$RegisterInvitationAwaitingInput({
    required DateTime startsAt,
    required DateTime endsAt,
    required String comment,
  }) =>
      Input$RegisterInvitationAwaitingInput._({
        r'startsAt': startsAt,
        r'endsAt': endsAt,
        r'comment': comment,
      });

  Input$RegisterInvitationAwaitingInput._(this._$data);

  factory Input$RegisterInvitationAwaitingInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$startsAt = data['startsAt'];
    result$data['startsAt'] = DateTime.parse((l$startsAt as String));
    final l$endsAt = data['endsAt'];
    result$data['endsAt'] = DateTime.parse((l$endsAt as String));
    final l$comment = data['comment'];
    result$data['comment'] = (l$comment as String);
    return Input$RegisterInvitationAwaitingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime get startsAt => (_$data['startsAt'] as DateTime);
  DateTime get endsAt => (_$data['endsAt'] as DateTime);
  String get comment => (_$data['comment'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$startsAt = startsAt;
    result$data['startsAt'] = l$startsAt.toIso8601String();
    final l$endsAt = endsAt;
    result$data['endsAt'] = l$endsAt.toIso8601String();
    final l$comment = comment;
    result$data['comment'] = l$comment;
    return result$data;
  }

  CopyWith$Input$RegisterInvitationAwaitingInput<
          Input$RegisterInvitationAwaitingInput>
      get copyWith => CopyWith$Input$RegisterInvitationAwaitingInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$RegisterInvitationAwaitingInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$startsAt = startsAt;
    final lOther$startsAt = other.startsAt;
    if (l$startsAt != lOther$startsAt) {
      return false;
    }
    final l$endsAt = endsAt;
    final lOther$endsAt = other.endsAt;
    if (l$endsAt != lOther$endsAt) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$startsAt = startsAt;
    final l$endsAt = endsAt;
    final l$comment = comment;
    return Object.hashAll([
      l$startsAt,
      l$endsAt,
      l$comment,
    ]);
  }
}

abstract class CopyWith$Input$RegisterInvitationAwaitingInput<TRes> {
  factory CopyWith$Input$RegisterInvitationAwaitingInput(
    Input$RegisterInvitationAwaitingInput instance,
    TRes Function(Input$RegisterInvitationAwaitingInput) then,
  ) = _CopyWithImpl$Input$RegisterInvitationAwaitingInput;

  factory CopyWith$Input$RegisterInvitationAwaitingInput.stub(TRes res) =
      _CopyWithStubImpl$Input$RegisterInvitationAwaitingInput;

  TRes call({
    DateTime? startsAt,
    DateTime? endsAt,
    String? comment,
  });
}

class _CopyWithImpl$Input$RegisterInvitationAwaitingInput<TRes>
    implements CopyWith$Input$RegisterInvitationAwaitingInput<TRes> {
  _CopyWithImpl$Input$RegisterInvitationAwaitingInput(
    this._instance,
    this._then,
  );

  final Input$RegisterInvitationAwaitingInput _instance;

  final TRes Function(Input$RegisterInvitationAwaitingInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? startsAt = _undefined,
    Object? endsAt = _undefined,
    Object? comment = _undefined,
  }) =>
      _then(Input$RegisterInvitationAwaitingInput._({
        ..._instance._$data,
        if (startsAt != _undefined && startsAt != null)
          'startsAt': (startsAt as DateTime),
        if (endsAt != _undefined && endsAt != null)
          'endsAt': (endsAt as DateTime),
        if (comment != _undefined && comment != null)
          'comment': (comment as String),
      }));
}

class _CopyWithStubImpl$Input$RegisterInvitationAwaitingInput<TRes>
    implements CopyWith$Input$RegisterInvitationAwaitingInput<TRes> {
  _CopyWithStubImpl$Input$RegisterInvitationAwaitingInput(this._res);

  TRes _res;

  call({
    DateTime? startsAt,
    DateTime? endsAt,
    String? comment,
  }) =>
      _res;
}

class Input$RegisterPushNotificationTokenInput {
  factory Input$RegisterPushNotificationTokenInput({
    required String deviceId,
    required String fcmToken,
  }) =>
      Input$RegisterPushNotificationTokenInput._({
        r'deviceId': deviceId,
        r'fcmToken': fcmToken,
      });

  Input$RegisterPushNotificationTokenInput._(this._$data);

  factory Input$RegisterPushNotificationTokenInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$deviceId = data['deviceId'];
    result$data['deviceId'] = (l$deviceId as String);
    final l$fcmToken = data['fcmToken'];
    result$data['fcmToken'] = (l$fcmToken as String);
    return Input$RegisterPushNotificationTokenInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get deviceId => (_$data['deviceId'] as String);
  String get fcmToken => (_$data['fcmToken'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$deviceId = deviceId;
    result$data['deviceId'] = l$deviceId;
    final l$fcmToken = fcmToken;
    result$data['fcmToken'] = l$fcmToken;
    return result$data;
  }

  CopyWith$Input$RegisterPushNotificationTokenInput<
          Input$RegisterPushNotificationTokenInput>
      get copyWith => CopyWith$Input$RegisterPushNotificationTokenInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$RegisterPushNotificationTokenInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deviceId = deviceId;
    final lOther$deviceId = other.deviceId;
    if (l$deviceId != lOther$deviceId) {
      return false;
    }
    final l$fcmToken = fcmToken;
    final lOther$fcmToken = other.fcmToken;
    if (l$fcmToken != lOther$fcmToken) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$deviceId = deviceId;
    final l$fcmToken = fcmToken;
    return Object.hashAll([
      l$deviceId,
      l$fcmToken,
    ]);
  }
}

abstract class CopyWith$Input$RegisterPushNotificationTokenInput<TRes> {
  factory CopyWith$Input$RegisterPushNotificationTokenInput(
    Input$RegisterPushNotificationTokenInput instance,
    TRes Function(Input$RegisterPushNotificationTokenInput) then,
  ) = _CopyWithImpl$Input$RegisterPushNotificationTokenInput;

  factory CopyWith$Input$RegisterPushNotificationTokenInput.stub(TRes res) =
      _CopyWithStubImpl$Input$RegisterPushNotificationTokenInput;

  TRes call({
    String? deviceId,
    String? fcmToken,
  });
}

class _CopyWithImpl$Input$RegisterPushNotificationTokenInput<TRes>
    implements CopyWith$Input$RegisterPushNotificationTokenInput<TRes> {
  _CopyWithImpl$Input$RegisterPushNotificationTokenInput(
    this._instance,
    this._then,
  );

  final Input$RegisterPushNotificationTokenInput _instance;

  final TRes Function(Input$RegisterPushNotificationTokenInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deviceId = _undefined,
    Object? fcmToken = _undefined,
  }) =>
      _then(Input$RegisterPushNotificationTokenInput._({
        ..._instance._$data,
        if (deviceId != _undefined && deviceId != null)
          'deviceId': (deviceId as String),
        if (fcmToken != _undefined && fcmToken != null)
          'fcmToken': (fcmToken as String),
      }));
}

class _CopyWithStubImpl$Input$RegisterPushNotificationTokenInput<TRes>
    implements CopyWith$Input$RegisterPushNotificationTokenInput<TRes> {
  _CopyWithStubImpl$Input$RegisterPushNotificationTokenInput(this._res);

  TRes _res;

  call({
    String? deviceId,
    String? fcmToken,
  }) =>
      _res;
}

enum Enum$ChatMessageKind { TEXT, IMAGE, $unknown }

String toJson$Enum$ChatMessageKind(Enum$ChatMessageKind e) {
  switch (e) {
    case Enum$ChatMessageKind.TEXT:
      return r'TEXT';
    case Enum$ChatMessageKind.IMAGE:
      return r'IMAGE';
    case Enum$ChatMessageKind.$unknown:
      return r'$unknown';
  }
}

Enum$ChatMessageKind fromJson$Enum$ChatMessageKind(String value) {
  switch (value) {
    case r'TEXT':
      return Enum$ChatMessageKind.TEXT;
    case r'IMAGE':
      return Enum$ChatMessageKind.IMAGE;
    default:
      return Enum$ChatMessageKind.$unknown;
  }
}

enum Enum$InvitationStatus { ACTIVE, CLOSED, $unknown }

String toJson$Enum$InvitationStatus(Enum$InvitationStatus e) {
  switch (e) {
    case Enum$InvitationStatus.ACTIVE:
      return r'ACTIVE';
    case Enum$InvitationStatus.CLOSED:
      return r'CLOSED';
    case Enum$InvitationStatus.$unknown:
      return r'$unknown';
  }
}

Enum$InvitationStatus fromJson$Enum$InvitationStatus(String value) {
  switch (value) {
    case r'ACTIVE':
      return Enum$InvitationStatus.ACTIVE;
    case r'CLOSED':
      return Enum$InvitationStatus.CLOSED;
    default:
      return Enum$InvitationStatus.$unknown;
  }
}

enum Enum$PushNotificationType {
  FRIENDSHIP_REQUEST_RECEIVED,
  FRIENDSHIP_REQUEST_ACCEPTED,
  INVITATION_RECEIVED,
  INVITATION_ACCEPTED,
  INVITATION_DELETED,
  INVITATION_AWAITING_RECEIVED,
  CHAT_MESSAGE_RECEIVED,
  $unknown
}

String toJson$Enum$PushNotificationType(Enum$PushNotificationType e) {
  switch (e) {
    case Enum$PushNotificationType.FRIENDSHIP_REQUEST_RECEIVED:
      return r'FRIENDSHIP_REQUEST_RECEIVED';
    case Enum$PushNotificationType.FRIENDSHIP_REQUEST_ACCEPTED:
      return r'FRIENDSHIP_REQUEST_ACCEPTED';
    case Enum$PushNotificationType.INVITATION_RECEIVED:
      return r'INVITATION_RECEIVED';
    case Enum$PushNotificationType.INVITATION_ACCEPTED:
      return r'INVITATION_ACCEPTED';
    case Enum$PushNotificationType.INVITATION_DELETED:
      return r'INVITATION_DELETED';
    case Enum$PushNotificationType.INVITATION_AWAITING_RECEIVED:
      return r'INVITATION_AWAITING_RECEIVED';
    case Enum$PushNotificationType.CHAT_MESSAGE_RECEIVED:
      return r'CHAT_MESSAGE_RECEIVED';
    case Enum$PushNotificationType.$unknown:
      return r'$unknown';
  }
}

Enum$PushNotificationType fromJson$Enum$PushNotificationType(String value) {
  switch (value) {
    case r'FRIENDSHIP_REQUEST_RECEIVED':
      return Enum$PushNotificationType.FRIENDSHIP_REQUEST_RECEIVED;
    case r'FRIENDSHIP_REQUEST_ACCEPTED':
      return Enum$PushNotificationType.FRIENDSHIP_REQUEST_ACCEPTED;
    case r'INVITATION_RECEIVED':
      return Enum$PushNotificationType.INVITATION_RECEIVED;
    case r'INVITATION_ACCEPTED':
      return Enum$PushNotificationType.INVITATION_ACCEPTED;
    case r'INVITATION_DELETED':
      return Enum$PushNotificationType.INVITATION_DELETED;
    case r'INVITATION_AWAITING_RECEIVED':
      return Enum$PushNotificationType.INVITATION_AWAITING_RECEIVED;
    case r'CHAT_MESSAGE_RECEIVED':
      return Enum$PushNotificationType.CHAT_MESSAGE_RECEIVED;
    default:
      return Enum$PushNotificationType.$unknown;
  }
}

enum Enum$ConstraintFormat { EMAIL, URL, $unknown }

String toJson$Enum$ConstraintFormat(Enum$ConstraintFormat e) {
  switch (e) {
    case Enum$ConstraintFormat.EMAIL:
      return r'EMAIL';
    case Enum$ConstraintFormat.URL:
      return r'URL';
    case Enum$ConstraintFormat.$unknown:
      return r'$unknown';
  }
}

Enum$ConstraintFormat fromJson$Enum$ConstraintFormat(String value) {
  switch (value) {
    case r'EMAIL':
      return Enum$ConstraintFormat.EMAIL;
    case r'URL':
      return Enum$ConstraintFormat.URL;
    default:
      return Enum$ConstraintFormat.$unknown;
  }
}

enum Enum$ErrorCode {
  INVALID_ARGUMENT,
  UNAUTHENTICATED,
  FORBIDDEN,
  NOT_FOUND,
  ALREADY_EXISTS,
  CONFLICT,
  INTERNAL,
  $unknown
}

String toJson$Enum$ErrorCode(Enum$ErrorCode e) {
  switch (e) {
    case Enum$ErrorCode.INVALID_ARGUMENT:
      return r'INVALID_ARGUMENT';
    case Enum$ErrorCode.UNAUTHENTICATED:
      return r'UNAUTHENTICATED';
    case Enum$ErrorCode.FORBIDDEN:
      return r'FORBIDDEN';
    case Enum$ErrorCode.NOT_FOUND:
      return r'NOT_FOUND';
    case Enum$ErrorCode.ALREADY_EXISTS:
      return r'ALREADY_EXISTS';
    case Enum$ErrorCode.CONFLICT:
      return r'CONFLICT';
    case Enum$ErrorCode.INTERNAL:
      return r'INTERNAL';
    case Enum$ErrorCode.$unknown:
      return r'$unknown';
  }
}

Enum$ErrorCode fromJson$Enum$ErrorCode(String value) {
  switch (value) {
    case r'INVALID_ARGUMENT':
      return Enum$ErrorCode.INVALID_ARGUMENT;
    case r'UNAUTHENTICATED':
      return Enum$ErrorCode.UNAUTHENTICATED;
    case r'FORBIDDEN':
      return Enum$ErrorCode.FORBIDDEN;
    case r'NOT_FOUND':
      return Enum$ErrorCode.NOT_FOUND;
    case r'ALREADY_EXISTS':
      return Enum$ErrorCode.ALREADY_EXISTS;
    case r'CONFLICT':
      return Enum$ErrorCode.CONFLICT;
    case r'INTERNAL':
      return Enum$ErrorCode.INTERNAL;
    default:
      return Enum$ErrorCode.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Node': {
    'ChatRoom',
    'ChatMessage',
    'FriendGroup',
    'Invitation',
    'InvitationAwaiting',
    'FriendshipRequest',
    'Viewer',
    'User',
  },
  'ChatMessageBody': {
    'ChatMessageBodyText',
    'ChatMessageBodyImage',
  },
};
