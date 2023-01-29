import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/divider.dart';
import 'package:invy/graphql/user_mute.graphql.dart';
import 'package:invy/graphql/user_block.graphql.dart';

import '../services/graphql_client.dart';
import 'friend_list_item_fragment.graphql.dart';

class FriendList extends HookConsumerWidget {
  const FriendList({
    super.key,
    required this.friends,
  });

  final List<Fragment$friendListItemFragment> friends;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children:
          friends.map((friend) => _FriendListItem(friend: friend)).toList(),
    );
  }
}

class _FriendListItem extends HookConsumerWidget {
  const _FriendListItem({
    required this.friend,
  });

  final Fragment$friendListItemFragment friend;

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
            icon: Icons.block,
            label: 'ブロック',
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(friend.value.avatarUrl),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  child: Text(
                    friend.value.nickname,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                friend.value.isMuted
                    ? Icon(Icons.volume_off,
                        size: 15, color: Colors.grey.shade600)
                    : const SizedBox()
              ],
            ),
          ),
          const GreyDivider()
        ],
      ),
    );
  }
}
