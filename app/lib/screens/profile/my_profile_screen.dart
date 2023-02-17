import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/profile/profile_edit_screen.dart';
import 'package:invy/screens/settings_screen.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/divider.dart';
import 'package:invy/widgets/setting_item.dart';

import '../friend/blocked_friends_screen.dart';

class MyProfileScreen extends HookConsumerWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedInUserProvider)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(padding: EdgeInsets.zero, children: [
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
        Stack(
          children: [
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
                  ),
                  const Gap(10),
                  Text(
                    user.nickname,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Gap(2),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: user.screenId))
                              .then(
                            (_) => showToast("コピーしました", ToastLevel.info),
                          );
                        },
                        child: Text("@${user.screenId}",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 16)),
                      ),
                    ],
                  ),
                  const Gap(10),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: OutlinedButton(
                onPressed: () {
                  const ProfileEditRoute().go(context);
                },
                child: const Text("プロフィールを編集",
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
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
    );
  }
}
