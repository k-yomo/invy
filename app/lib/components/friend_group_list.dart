import 'package:invy/components/friend_group_fragment.graphql.dart';
import 'package:invy/components/friend_group_icon.dart';
import 'package:invy/screens/freind_group_detail_screen.dart';
import 'package:flutter/material.dart';

class FriendGroupList extends StatelessWidget {
  const FriendGroupList({
    Key? key,
    required this.friendGroups,
  }) : super(key: key);

  final List<Fragment$friendGroupListItemFragment> friendGroups;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: friendGroups
            .map((friendGroup) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FriendGroupDetailScreen(
                                friendGroupId: friendGroup.id),
                          ),
                        );
                      },
                      child: _FriendGroupListItem(friendGroup: friendGroup),
                    ),
                    Divider(
                        height: 0, thickness: 1, color: Colors.grey.shade200),
                  ],
                ))
            .toList());
  }
}

class _FriendGroupListItem extends StatelessWidget {
  const _FriendGroupListItem({
    Key? key,
    required this.friendGroup,
  }) : super(key: key);

  final Fragment$friendGroupListItemFragment friendGroup;

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
          Text("(${friendGroup.totalCount.toString()})",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
