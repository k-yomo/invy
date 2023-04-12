import 'dart:ui';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/constants/urls.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/friend/blocked_friends_screen.graphql.dart';
import 'package:invy/screens/friend/friendship_request_screen.graphql.dart';
import 'package:invy/screens/invitation/invitation_form_screen.dart';
import 'package:invy/screens/user/user_friends_screen.dart';
import 'package:invy/screens/user/user_profile_screen.graphql.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/state/invitation.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/app_bar_leading.dart';
import 'package:invy/widgets/friend_list_item_fragment.graphql.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../graphql/user_block.graphql.dart';
import '../../../graphql/user_mute.graphql.dart';
import '../../../services/graphql_client.dart';

class UserProfileScreen extends HookConsumerWidget {
  const UserProfileScreen({super.key, required this.userId, this.user});

  final String userId;
  final Fragment$userProfileScreenFragment? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedInUser = ref.read(loggedInUserProvider);
    final graphqlClient = ref.read(graphqlClientProvider);
    final fetchUser = useMemoized(() async {
      if (this.user != null) {
        return this.user!;
      }
      final resp = await graphqlClient
          .query$userProfileScreenUser(Options$Query$userProfileScreenUser(
              variables: Variables$Query$userProfileScreenUser(
        userId: userId,
      )));
      if (resp.hasException) {
        throw resp.exception.toString();
      }
      return resp.parsedData!.user;
    });
    final snapshot = useFuture(fetchUser);

    if (!snapshot.hasData) {
      return const SizedBox();
    }

    final user = snapshot.data!;
    final isUserLoggedInUser = user.id == loggedInUser?.id;
    final isMuted = useState(user.isMuted);
    final isBlocked = useState(user.isBlocked);
    final isRequestingFriendship = useState(user.isRequestingFriendship);

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

    onPressedFriendRequest() async {
      final result = await graphqlClient
          .mutate$requestFriendship(Options$Mutation$requestFriendship(
        variables: Variables$Mutation$requestFriendship(userId: user.id),
      ));
      if (result.parsedData?.requestFriendship != null) {
        isRequestingFriendship.value = true;
      }
    }

    onPressedInvitation() async {
      ref.read(invitationFormProvider.notifier).reset();
      ref.read(invitationFormProvider.notifier).set(
        ref.read(invitationFormProvider).copyWith(
          selectedFriends: [
            Fragment$friendListItemFragment(
              id: user.id,
              nickname: user.nickname,
              avatarUrl: user.avatarUrl,
              isMuted: user.isMuted,
            )
          ]
        )
      );
      const InvitationFormRoute().push(context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(children: [
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
            margin: const EdgeInsets.symmetric(horizontal: 30),
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
                ),
                const Gap(10),
                Row(
                  children: [
                    Text(
                      user.nickname,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
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
                    const Gap(10),
                    user.isFriend
                        ? Row(
                            children: [
                              Icon(Icons.how_to_reg,
                                  size: 16, color: Colors.grey.shade700),
                              Text("友達",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 16)),
                              const Gap(10),
                              TextButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  minimumSize: Size.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  UserFriendsRoute(userId,
                                          userNickname: user.nickname)
                                      .push(context);
                                },
                                child: const Text(
                                  "友達一覧",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
                const Gap(2),
                !user.isFriend && !isUserLoggedInUser
                    ? Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: TextButton(
                          onPressed: isRequestingFriendship.value
                              ? null
                              : onPressedFriendRequest,
                          style: TextButton.styleFrom(
                            minimumSize: const Size.fromHeight(0),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.grey,
                            disabledForegroundColor: Colors.white,
                          ),
                          child: Text(
                            isRequestingFriendship.value ? '友達申請済み' : '友達申請する',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : const SizedBox(),
                user.isFriend
                    ? Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 60),
                        child: TextButton(
                          onPressed: onPressedInvitation,
                          style: TextButton.styleFrom(
                            minimumSize: const Size.fromHeight(0),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.grey,
                            disabledForegroundColor: Colors.white,
                          ),
                          child: Text(
                            'さそう',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ]),
        const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 5, left: 5),
            child: AppBarLeading(),
          ),
        ),
        user.isFriend
            ? Positioned(
                top: 220,
                right: 20,
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () async {
                    final result = await showModalActionSheet(
                        context: context,
                        cancelLabel: "キャンセル",
                        actions: [
                          SheetAction(
                            key: 'mute',
                            icon: isMuted.value
                                ? Icons.volume_up
                                : Icons.volume_off,
                            label: isMuted.value ? "ミュート解除" : "ミュート",
                          ),
                          SheetAction(
                            key: 'block',
                            icon: isBlocked.value
                                ? Icons.do_not_disturb_off
                                : Icons.do_not_disturb_on,
                            label: isBlocked.value ? "ブロック解除" : "ブロック",
                            isDestructiveAction: !isBlocked.value,
                          ),
                          const SheetAction(
                            key: "reportObjectionableContent",
                            label: "通報",
                            isDestructiveAction: true,
                          )
                        ]);
                    switch (result) {
                      case "mute":
                        await onPressedMute();
                        break;
                      case "block":
                        await onPressedBlock();
                        break;
                      case "reportObjectionableContent":
                        launchUrl(objectionableContentReportFormUrl);
                        break;
                    }
                  },
                ),
              )
            : const SizedBox(),
      ]),
    );
  }
}
