import 'package:invy/components/friend_group_fragment.graphql.dart';
import 'package:invy/components/friend_group_icon.dart';
import 'package:flutter/material.dart';

class FriendGroupSelectionList extends StatelessWidget {
  const FriendGroupSelectionList({
    Key? key,
    required this.friendGroups,
    required this.selectedFriendGroups,
    required this.onChange,
  }) : super(key: key);

  final List<Fragment$friendGroupListItemFragment> friendGroups;
  final List<Fragment$friendGroupListItemFragment> selectedFriendGroups;
  final ValueChanged<List<Fragment$friendGroupListItemFragment>> onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: friendGroups.map((friendGroup) {
      final isSelected = selectedFriendGroups.contains(friendGroup);
      return Column(
        children: [
          InkWell(
            onTap: () {
              if (isSelected) {
                selectedFriendGroups.remove(friendGroup);
              } else {
                selectedFriendGroups.add(friendGroup);
              }
              onChange(selectedFriendGroups);
            },
            child: _FriendGroupListItem(
                key: Key(friendGroup.id),
                friendGroup: friendGroup,
                isSelected: isSelected),
          ),
          Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
        ],
      );
    }).toList());
  }
}

class _FriendGroupListItem extends StatelessWidget {
  const _FriendGroupListItem({
    Key? key,
    required this.friendGroup,
    required this.isSelected,
  }) : super(key: key);

  final Fragment$friendGroupListItemFragment friendGroup;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          FriendGroupIcon(friendGroup.name),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 2),
            child: Text(
              friendGroup.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
              child: Text("(${friendGroup.totalCount.toString()})",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold))),
          isSelected ? Icon(Icons.check) : SizedBox(),
        ],
      ),
    );
  }
}
