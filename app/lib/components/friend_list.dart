import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/user_mute.graphql.dart';

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
    super.key,
    required this.friend,
  });

  final Fragment$friendListItemFragment friend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final friend = useState(this.friend);

    onPressed(BuildContext context) async {
      if (friend.value.isMuted) {
        final result = await graphqlClient
            .mutate$unmuteFriend(Options$Mutation$unmuteFriend(
          variables: Variables$Mutation$unmuteFriend(userId: friend.value.id),
        ));
        if (result.parsedData?.unmuteUser != null) {
          friend.value = friend.value.copyWith(isMuted: false);
        }
      } else {
        final result =
            await graphqlClient.mutate$muteFriend(Options$Mutation$muteFriend(
          variables: Variables$Mutation$muteFriend(userId: friend.value.id),
        ));
        if (result.parsedData?.muteUser != null) {
          friend.value = friend.value.copyWith(isMuted: true);
        }
      }
    }

    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onPressed,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: friend.value.isMuted ? Icons.volume_off : Icons.volume_up,
            label: friend.value.isMuted ? 'Unmute' : 'mute',
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
          Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
        ],
      ),
    );
  }
}
