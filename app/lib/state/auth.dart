import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class LoggedInUser {
  const LoggedInUser(
      {required this.id, required this.nickname, required this.avatarUrl});

  final String id;
  final String nickname;
  final String avatarUrl;
}

final loggedInUserProvider = StateProvider<LoggedInUser?>((ref) => null);
