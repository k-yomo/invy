import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/user_block.graphql.dart';
import 'package:invy/graphql/user_mute.graphql.dart';
import 'package:invy/widgets/divider.dart';

import '../services/graphql_client.dart';
import 'friend_list_item_fragment.graphql.dart';

class FriendList extends HookConsumerWidget {
  const FriendList({
    super.key,
    required this.friends,
    required this.onFriendPressed,
  });

  final List<Fragment$friendListItemFragment> friends;
  final Function(String friendUserId) onFriendPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        key: UniqueKey(),
        shrinkWrap: true,
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return _FriendListItem(
              friend: friends[index], onPressed: onFriendPressed);
        });
  }
}

class _FriendListItem extends HookConsumerWidget {
  const _FriendListItem({
    required this.friend,
    required this.onPressed,
  });

  final Fragment$friendListItemFragment friend;
  final Function(String friendUserId) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final friend = useState(this.friend);
    final isBlocked = useState(false);

    onPressedMute(BuildContext context) async {
      if (friend.value.isMuted) {
        final result =
            await graphqlClient.mutate$unmuteUser(Options$Mutation$unmuteUser(
          variables: Variables$Mutation$unmuteUser(userId: friend.value.id),
        ));
        if (result.parsedData?.unmuteUser != null) {
          friend.value = friend.value.copyWith(isMuted: false);
        }
      } else {
        final result =
            await graphqlClient.mutate$muteUser(Options$Mutation$muteUser(
          variables: Variables$Mutation$muteUser(userId: friend.value.id),
        ));
        if (result.parsedData?.muteUser != null) {
          friend.value = friend.value.copyWith(isMuted: true);
        }
      }
    }

    onPressedBlock(BuildContext context) async {
      final result =
          await graphqlClient.mutate$blockUser(Options$Mutation$blockUser(
        variables: Variables$Mutation$blockUser(userId: friend.value.id),
      ));
      if (result.parsedData?.blockUser != null) {
        isBlocked.value = true;
      }
    }

    if (isBlocked.value) {
      return const SizedBox();
    }

    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onPressedMute,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: friend.value.isMuted ? Icons.volume_off : Icons.volume_up,
            label: friend.value.isMuted ? '解除' : 'ミュート',
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onPressedBlock,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.do_not_disturb_on,
            label: 'ブロック',
          ),
        ],
      ),
      child: Column(
        children: [
          TextButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () {
              onPressed(friend.value.id);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.purple,
                          Colors.pink,
                          Colors.orange,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          CachedNetworkImageProvider(friend.value.avatarUrl),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          friend.value.nickname,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        friend.value.invitationAwaitings.isNotEmpty
                            ? InvitationAwaitingIconText(
                                invitationAwaiting:
                                    friend.value.invitationAwaitings.first)
                            : const SizedBox()
                      ],
                    ),
                  ),
                  friend.value.isMuted
                      ? Icon(Icons.volume_off,
                          size: 15, color: Colors.grey.shade600)
                      : const SizedBox(),
                  friend.value.distanceKm != null
                      ? Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("~${friend.value.distanceKm}km"),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          const GreyDivider()
        ],
      ),
    );
  }
}

class InvitationAwaitingIconText extends StatelessWidget {
  const InvitationAwaitingIconText({
    super.key,
    required this.invitationAwaiting,
  });

  final Fragment$friendListItemFragment$invitationAwaitings invitationAwaiting;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().toLocal();
    final startsAt = invitationAwaiting.startsAt.toLocal();
    final endsAt = invitationAwaiting.endsAt.toLocal();
    final endOfDay = DateTime(now.year, now.month, now.day + 1)
        .add(const Duration(milliseconds: -1));
    String displayText;
    if (startsAt.isBefore(now) && endsAt.isBefore(endOfDay)) {
      displayText = "${endsAt.hour}時まで";
    } else if (startsAt.isBefore(endOfDay)) {
      displayText = "${startsAt.hour}〜${endsAt.hour}時";
    } else {
      displayText =
          "${startsAt.day}日${startsAt.hour}時〜${endsAt.day}日${endsAt.hour}時";
    }
    if (invitationAwaiting.comment.isNotEmpty) {
      displayText = "$displayText / ${invitationAwaiting.comment}";
    }
    return Row(
      children: [
        ShaderMask(
          child: const Icon(
            Icons.emoji_people,
            size: 20,
            color: Colors.white,
          ),
          shaderCallback: (Rect rect) {
            return const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                Colors.pink,
                Colors.orange,
              ],
            ).createShader(rect);
          },
        ),
        const Gap(1),
        Text(displayText,
            style: TextStyle(color: Colors.grey.shade800, fontSize: 12)),
      ],
    );
  }
}
