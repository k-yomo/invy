import 'package:flutter/material.dart';
import 'friend_fragment.graphql.dart';

class FriendSelectionList extends StatelessWidget {
  const FriendSelectionList({
    Key? key,
    required this.friends,
    required this.selectedFriends,
    required this.onChange,
  }) : super(key: key);

  final List<Fragment$friendListItemFragment> friends;
  final List<Fragment$friendListItemFragment> selectedFriends;
  final ValueChanged<List<Fragment$friendListItemFragment>> onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: friends.map((friend) {
          final isSelected =
          selectedFriends.contains(friend);
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
                child: _FriendListItem(
                    key: Key(friend.id),
                    friend: friend,
                    isSelected: isSelected),
              ),
              Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
            ],
          );
        }).toList());
  }
}

class _FriendListItem extends StatelessWidget {
  const _FriendListItem({
    Key? key,
    required this.friend,
    required this.isSelected,
  }) : super(key: key);

  final Fragment$friendListItemFragment friend;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(friend.avatarUrl),
          ),
          Expanded(
          child:
          Container(
            margin: const EdgeInsets.only(left: 10, right: 2),
            child: Text(
              friend.nickname,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ),
          isSelected ? Icon(Icons.check) : SizedBox(),
        ],
      ),
    );
  }
}
