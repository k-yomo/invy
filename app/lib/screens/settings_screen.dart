import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/constants/notion_page_urls.dart';
import 'package:invy/screens/profile/my_profile_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/state/device.dart';
import 'package:invy/widgets/divider.dart';
import 'package:invy/widgets/setting_item.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("ログアウト"),
                        content: const Text("ログアウトしてもよろしいですか？"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.grey.shade800,
                            ),
                            child: const Text("キャンセル"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await graphqlClient.mutate$signOut();
                              clientLogout();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                            ),
                            child: const Text("ログアウト"),
                          ),
                        ],
                      );
                    },
                  );
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("退会"),
                        content:
                            const Text("退会するとデータは消去され復元が出来ません。退会してもよろしいですか？"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.grey.shade800,
                            ),
                            child: const Text("キャンセル"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await graphqlClient.mutate$deleteAccount();
                              clientLogout();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                            ),
                            child: const Text("退会する",
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      );
                    },
                  );
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
