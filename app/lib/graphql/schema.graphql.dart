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

const possibleTypesMap = {
  'Node': {
    'User',
    'FriendshipRequest',
  }
};
