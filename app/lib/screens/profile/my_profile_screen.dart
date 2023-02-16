import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/settings_screen.dart';
import 'package:invy/widgets/divider.dart';
import 'package:invy/screens/profile/profile_edit_screen.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/setting_item.dart';

import '../friend/blocked_friends_screen.dart';

class MyProfileScreen extends HookConsumerWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedInUserProvider)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(user.avatarUrl),
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
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
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
                    const ProfileEditRoute().go(context);
                  },
                  child: const Text("プロフィールを編集",
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SettingItem(
                icon: Icons.do_not_disturb_on_outlined,
                title: "ブロック中のユーザー",
                onPressed: () {
                  const BlockedFriendsRoute().go(context);
                },
              ),
              const GreyDivider(),
              SettingItem(
                icon: Icons.settings,
                title: "設定",
                onPressed: () {
                  const SettingsRoute().go(context);
                },
              ),
              const GreyDivider(),
            ],
          )
        ]),
      ),
    );
  }
}
