import 'package:flutter/material.dart';
import 'friend_list_item_fragment.graphql.dart';
import 'friend_list_item.dart';

class FriendSelectionList extends StatelessWidget {
  const FriendSelectionList({
    super.key,
    required this.friends,
    required this.selectedFriends,
    required this.onChange,
  });

  final List<Fragment$friendListItemFragment> friends;
  final List<Fragment$friendListItemFragment> selectedFriends;
  final ValueChanged<List<Fragment$friendListItemFragment>> onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: friends.map((friend) {
      final isSelected = selectedFriends.contains(friend);
      return Column(
        children: [
          InkWell(
            onTap: () {
              if (isSelected) {
                selectedFriends.remove(friend);
              } else {
                selectedFriends.add(friend);
              }
              onChange(selectedFriends);
            },
            child: FriendListItem(
                key: Key(friend.id),
                friend: friend,
                rightWidget:
                    isSelected ? const Icon(Icons.check) : const SizedBox()),
          ),
          Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
        ],
      );
    }).toList());
  }
}
