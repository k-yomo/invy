import 'package:bump/components/friend_fragment.graphql.dart';
import 'package:bump/graphql/user_mute.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendList extends HookConsumerWidget {
  const FriendList({
    Key? key,
    required this.friends,
  }) : super(key: key);

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
    Key? key,
    required this.friend,
  }) : super(key: key);

  final Fragment$friendListItemFragment friend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friend = useState(this.friend);
    final muteFriendMutation = useMutation$muteFriend();
    final unmuteFriendMutation = useMutation$unmuteFriend();

    onPressed(BuildContext context) async {
      if (friend.value.isMuted) {
        final result = await unmuteFriendMutation
            .runMutation(
              Variables$Mutation$unmuteFriend(muteUserId: friend.value.id),
            )
            .networkResult;
        if (result?.parsedData?.unmuteUser ?? false) {
          friend.value = friend.value.copyWith(isMuted: false);
        }
      } else {
        final result = await muteFriendMutation
            .runMutation(
              Variables$Mutation$muteFriend(muteUserId: friend.value.id),
            )
            .networkResult;
        if (result?.parsedData?.muteUser ?? false) {
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
            label: friend.value.isMuted ? 'Mute' : 'Unmute',
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
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
