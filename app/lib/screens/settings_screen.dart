import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/constants/urls.dart';
import 'package:invy/screens/profile/my_profile_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/state/device.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/divider.dart';
import 'package:invy/widgets/screen_wrapper.dart';
import 'package:invy/widgets/setting_item.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScreenWrapper(child: SettingsScreen());
}

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final packageInfo = ref.read(packageInfoProvider);

    clientLogout() async {
      await FirebaseAuth.instance.signOut();
      graphqlClient.cache.store.reset();
      ref.read(loggedInUserProvider.notifier).state = null;
      Sentry.configureScope(
        (scope) => scope.setUser(null),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '設定',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          shape:
              Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              SettingItem(
                title: "ログアウト",
                onPressed: () async {
                  final result = await showOkCancelAlertDialog(
                      context: context,
                      title: "ログアウト",
                      message: "ログアウトしてもよろしいですか？",
                      cancelLabel: "キャンセル",
                      isDestructiveAction: true);
                  if (result == OkCancelResult.ok) {
                    await graphqlClient.mutate$signOut();
                    clientLogout();
                  }
                },
              ),
              const GreyDivider(),
              SettingItem(
                title: "利用規約",
                onPressed: () async {
                  await launchUrl(termsOfServiceUrl);
                },
              ),
              const GreyDivider(),
              SettingItem(
                title: "プライバシーポリシー",
                onPressed: () async {
                  await launchUrl(privacyPolicyUrl);
                },
              ),
              const GreyDivider(),
              SettingItem(
                title: "退会",
                onPressed: () async {
                  final result = await showOkCancelAlertDialog(
                      context: context,
                      title: "退会",
                      message: "退会するとデータは消去され復元が出来ません。退会してもよろしいですか？",
                      cancelLabel: "キャンセル",
                      okLabel: "退会",
                      isDestructiveAction: true);
                  if (result == OkCancelResult.ok) {
                    final deleteAccountResult = await graphqlClient.mutate$deleteAccount();
                    if (deleteAccountResult.hasException) {
                      showToast("退会処理に失敗しました。時間をおいて再度お試し下さい。", ToastLevel.error);
                      return;
                    }
                    clientLogout();
                  }
                },
              ),
              const GreyDivider(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text("バージョン ${packageInfo.version}")),
              ),
            ],
          ),
        ));
  }
}
