import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/user_profile_modal_fragment.graphql.dart';
import 'package:invy/screens/blocked_friend_screen.graphql.dart';
import 'package:invy/util/toast.dart';

import '../graphql/user_block.graphql.dart';
import '../graphql/user_mute.graphql.dart';
import '../services/graphql_client.dart';

class UserProfileModal extends HookConsumerWidget {
  const UserProfileModal({super.key, required this.user});

  final Fragment$userProfileModalFragment user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final isMuted = useState(user.isMuted);
    final isBlocked = useState(false);

    onPressedMute() async {
      if (isMuted.value) {
        final result =
            await graphqlClient.mutate$unmuteUser(Options$Mutation$unmuteUser(
          variables: Variables$Mutation$unmuteUser(userId: user.id),
        ));
        if (result.parsedData?.unmuteUser != null) {
          isMuted.value = false;
        }
      } else {
        final result =
            await graphqlClient.mutate$muteUser(Options$Mutation$muteUser(
          variables: Variables$Mutation$muteUser(userId: user.id),
        ));
        if (result.parsedData?.muteUser != null) {
          isMuted.value = true;
        }
      }
    }

    onPressedBlock() async {
      if (isBlocked.value) {
        final result =
            await graphqlClient.mutate$unblockUser(Options$Mutation$unblockUser(
          variables: Variables$Mutation$unblockUser(userId: user.id),
        ));
        if (result.parsedData?.unblockUser != null) {
          isBlocked.value = false;
        }
      } else {
        final result =
            await graphqlClient.mutate$blockUser(Options$Mutation$blockUser(
          variables: Variables$Mutation$blockUser(userId: user.id),
        ));
        if (result.parsedData?.blockUser != null) {
          isBlocked.value = true;
        }
      }
    }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        user.nickname,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Gap(10),
                    isMuted.value
                        ? const Icon(Icons.volume_off,
                            size: 20, color: Colors.orange)
                        : const SizedBox(),
                    const Gap(5),
                    isBlocked.value
                        ? const Icon(Icons.do_not_disturb_on,
                            size: 20, color: Colors.red)
                        : const SizedBox(),
                  ],
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
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: Icon(
                          isMuted.value ? Icons.volume_up : Icons.volume_off),
                      label: Text(isMuted.value ? "ミュート解除" : "ミュート"),
                      onPressed: onPressedMute,
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: Icon(isBlocked.value
                          ? Icons.do_not_disturb_off
                          : Icons.do_not_disturb_on),
                      label: Text(isBlocked.value ? "ブロック解除" : "ブロック"),
                      onPressed: onPressedBlock,
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
