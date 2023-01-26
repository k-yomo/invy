import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/profile_screen.graphql.dart';
import 'package:invy/screens/profile_edit_screen.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/state/device.dart';
import 'package:invy/util/toast.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final user = ref.watch(loggedInUserProvider)!;
    final packageInfo = ref.read(packageInfoProvider)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(user.avatarUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    user.nickname,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("ユーザーID | ${user.screenId}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 10),
                        ),
                        onPressed: () async {
                          Clipboard.setData(ClipboardData(text: user.screenId))
                              .then(
                            (_) => showToast("コピーしました", ToastLevel.info),
                          );
                        },
                        child: Row(
                          children: const [
                            Text("コピー",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Icon(Icons.copy_all, color: Colors.black)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfileEditScreen(),
                    ));
                  },
                  child: const Text("プロフィールを編集",
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              TextButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("ログアウト"),
                        content: Text("ログアウトしてもよろしいですか？"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("キャンセル"),
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.grey,
                            ),
                          ),
                          TextButton(
                            child: Text("OK"),
                            onPressed: () async {
                              await graphqlClient.mutate$signOut();
                              await FirebaseAuth.instance.signOut();
                              graphqlClient.cache.store.reset();
                              ref.invalidate(loggedInUserProvider);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("ログアウト")),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.grey, height: 0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text("バージョン ${packageInfo.version}")),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
