import 'package:bump/components/friend_fragment.graphql.dart';
import 'package:flutter/material.dart';

class FriendList extends StatelessWidget {
  const FriendList({
    Key? key,
    required this.friends,
  }) : super(key: key);

  final List<Fragment$friendListItemFragment> friends;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: friends
          .map((friend) => Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(friend.avatarUrl),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(friend.nickname,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
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
