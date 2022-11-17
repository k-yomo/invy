import 'package:bump/components/friend_group_fragment.graphql.dart';
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
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.purple,
                                Colors.pink,
                                Colors.orange,
                              ],
                            ),
                          ),
                          child: CircleAvatar(
                            child: Text(friendGroup.name.substring(0, 1)),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 2),
                          child: Text(friendGroup.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Text("(${friendGroup.totalCount.toString()})",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
                ],
              ))
          .toList(),
    );
  }
}
