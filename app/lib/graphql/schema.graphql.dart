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

  static const _undefined = {};

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

  static const _undefined = {};

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

class Input$SendInvitationInput {
  factory Input$SendInvitationInput({
    required List<String> targetFriendGroupIds,
    required List<String> targetFriendUserIds,
    required String expiresAt,
    required String startsAt,
    required String location,
    required String comment,
  }) =>
      Input$SendInvitationInput._({
        r'targetFriendGroupIds': targetFriendGroupIds,
        r'targetFriendUserIds': targetFriendUserIds,
        r'expiresAt': expiresAt,
        r'startsAt': startsAt,
        r'location': location,
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
    final l$expiresAt = data['expiresAt'];
    result$data['expiresAt'] = (l$expiresAt as String);
    final l$startsAt = data['startsAt'];
    result$data['startsAt'] = (l$startsAt as String);
    final l$location = data['location'];
    result$data['location'] = (l$location as String);
    final l$comment = data['comment'];
    result$data['comment'] = (l$comment as String);
    return Input$SendInvitationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String> get targetFriendGroupIds =>
      (_$data['targetFriendGroupIds'] as List<String>);
  List<String> get targetFriendUserIds =>
      (_$data['targetFriendUserIds'] as List<String>);
  String get expiresAt => (_$data['expiresAt'] as String);
  String get startsAt => (_$data['startsAt'] as String);
  String get location => (_$data['location'] as String);
  String get comment => (_$data['comment'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$targetFriendGroupIds = targetFriendGroupIds;
    result$data['targetFriendGroupIds'] =
        l$targetFriendGroupIds.map((e) => e).toList();
    final l$targetFriendUserIds = targetFriendUserIds;
    result$data['targetFriendUserIds'] =
        l$targetFriendUserIds.map((e) => e).toList();
    final l$expiresAt = expiresAt;
    result$data['expiresAt'] = l$expiresAt;
    final l$startsAt = startsAt;
    result$data['startsAt'] = l$startsAt;
    final l$location = location;
    result$data['location'] = l$location;
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
    final l$comment = comment;
    return Object.hashAll([
      Object.hashAll(l$targetFriendGroupIds.map((v) => v)),
      Object.hashAll(l$targetFriendUserIds.map((v) => v)),
      l$expiresAt,
      l$startsAt,
      l$location,
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
    String? expiresAt,
    String? startsAt,
    String? location,
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

  static const _undefined = {};

  TRes call({
    Object? targetFriendGroupIds = _undefined,
    Object? targetFriendUserIds = _undefined,
    Object? expiresAt = _undefined,
    Object? startsAt = _undefined,
    Object? location = _undefined,
    Object? comment = _undefined,
  }) =>
      _then(Input$SendInvitationInput._({
        ..._instance._$data,
        if (targetFriendGroupIds != _undefined && targetFriendGroupIds != null)
          'targetFriendGroupIds': (targetFriendGroupIds as List<String>),
        if (targetFriendUserIds != _undefined && targetFriendUserIds != null)
          'targetFriendUserIds': (targetFriendUserIds as List<String>),
        if (expiresAt != _undefined && expiresAt != null)
          'expiresAt': (expiresAt as String),
        if (startsAt != _undefined && startsAt != null)
          'startsAt': (startsAt as String),
        if (location != _undefined && location != null)
          'location': (location as String),
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
    String? expiresAt,
    String? startsAt,
    String? location,
    String? comment,
  }) =>
      _res;
}

class Input$SignUpInput {
  factory Input$SignUpInput({
    String? email,
    required String nickname,
    String? avatarUrl,
  }) =>
      Input$SignUpInput._({
        if (email != null) r'email': email,
        r'nickname': nickname,
        if (avatarUrl != null) r'avatarUrl': avatarUrl,
      });

  Input$SignUpInput._(this._$data);

  factory Input$SignUpInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    final l$nickname = data['nickname'];
    result$data['nickname'] = (l$nickname as String);
    if (data.containsKey('avatarUrl')) {
      final l$avatarUrl = data['avatarUrl'];
      result$data['avatarUrl'] = (l$avatarUrl as String?);
    }
    return Input$SignUpInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get email => (_$data['email'] as String?);
  String get nickname => (_$data['nickname'] as String);
  String? get avatarUrl => (_$data['avatarUrl'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
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
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
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
      _$data.containsKey('email') ? l$email : const {},
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
        if (email != _undefined) 'email': (email as String?),
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
    'FriendGroup',
    'FriendshipRequest',
    'Invitation',
    'User',
    'Viewer',
  }
};
