import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'friend_list_item_fragment.graphql.dart';

class FriendListItem extends StatelessWidget {
  const FriendListItem({
    super.key,
    required this.friend,
    this.rightWidget,
  });

  final Fragment$friendListItemFragment friend;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: CachedNetworkImageProvider(friend.avatarUrl),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 2),
              child: Text(
                friend.nickname,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          rightWidget != null ? rightWidget! : const SizedBox(),
        ],
      ),
    );
  }
}
