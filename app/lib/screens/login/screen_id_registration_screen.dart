import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/state/post_login_redict.dart';
import 'package:invy/widgets/app_bar_leading.dart';
import 'package:invy/widgets/screen_id_edit_form.dart';

class ScreenIdRegistrationScreen extends HookConsumerWidget {
  const ScreenIdRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onScreenIdSubmitted(String screenId) async {
      final postLoginRedirectScreen = ref.read(postLoginRedirectProvider);
      if (postLoginRedirectScreen != null) {
        ref.read(postLoginRedirectProvider.notifier).state = null;
        GoRouter.of(context).go(postLoginRedirectScreen);
      } else {
        const FriendsRoute().go(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const Text(
          'ユーザーID登録',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      backgroundColor: Colors.white,
      body: ScreenIdEditForm(
        onSubmitted: onScreenIdSubmitted,
      )
    );
  }
}
