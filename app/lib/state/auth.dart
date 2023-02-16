import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/viewer.graphql.dart';

@immutable
class LoggedInUser {
  const LoggedInUser(
      {required this.id,
      required this.screenId,
      required this.nickname,
      required this.avatarUrl});

  final String id;
  final String screenId;
  final String nickname;
  final String avatarUrl;

  LoggedInUser copyWith({
    String? screenId,
    String? nickname,
    String? avatarUrl,
  }) =>
      LoggedInUser(
        id: id,
        screenId: screenId ?? this.screenId,
        nickname: nickname ?? this.nickname,
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );
}

final isLoggedInProvider = StateProvider<bool>((ref) {
  final loggedInUser = ref.watch(loggedInUserProvider);
  return loggedInUser != null;
});
final loggedInUserProvider = StateProvider<LoggedInUser?>((ref) => null);

void setViewerToLoggedInUser(WidgetRef ref, Query$viewer$viewer viewer) {
  ref.read(loggedInUserProvider.notifier).state = LoggedInUser(
    id: viewer.id,
    screenId: viewer.screenId,
    nickname: viewer.nickname,
    avatarUrl: viewer.avatarUrl,
  );
}

class _AuthStateNotifier extends ValueNotifier<LoggedInUser?> {
  _AuthStateNotifier() : super(null);
  void change(LoggedInUser? v) => value = v;
}

final authStateNotifier = _AuthStateNotifier();
