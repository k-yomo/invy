class Input$SignUpInput {
  factory Input$SignUpInput({
    required String email,
    required String nickname,
    String? avatarUrl,
  }) =>
      Input$SignUpInput._({
        r'email': email,
        r'nickname': nickname,
        if (avatarUrl != null) r'avatarUrl': avatarUrl,
      });

  Input$SignUpInput._(this._$data);

  factory Input$SignUpInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$nickname = data['nickname'];
    result$data['nickname'] = (l$nickname as String);
    if (data.containsKey('avatarUrl')) {
      final l$avatarUrl = data['avatarUrl'];
      result$data['avatarUrl'] = (l$avatarUrl as String?);
    }
    return Input$SignUpInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);
  String get nickname => (_$data['nickname'] as String);
  String? get avatarUrl => (_$data['avatarUrl'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$nickname = nickname;
    result$data['nickname'] = l$nickname;
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
    if (l$email != lOther$email) {
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
    final l$email = email;
    final l$nickname = nickname;
    final l$avatarUrl = avatarUrl;
    return Object.hashAll([
      l$email,
      l$nickname,
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

  static const _undefined = {};

  TRes call({
    Object? email = _undefined,
    Object? nickname = _undefined,
    Object? avatarUrl = _undefined,
  }) =>
      _then(Input$SignUpInput._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (nickname != _undefined && nickname != null)
          'nickname': (nickname as String),
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

  static const _undefined = {};

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

  static const _undefined = {};

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

const possibleTypesMap = {
  'Node': {
    'User',
    'FriendshipRequest',
    'FriendGroup',
  }
};
