import 'package:flutter/material.dart';

import 'friend_list_item.dart';
import 'friend_list_item_fragment.graphql.dart';

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
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: friends.map((friend) {
          final isSelected =
              selectedFriends.map((f) => f.id).contains(friend.id);
          return Column(
            children: [
              InkWell(
                onTap: () {
                  var updatedSelectedFriends = [...selectedFriends];
                  if (isSelected) {
                    updatedSelectedFriends
                        .removeWhere((f) => f.id == friend.id);
                  } else {
                    updatedSelectedFriends.add(friend);
                  }
                  onChange(updatedSelectedFriends);
                },
                child: FriendListItem(
                    key: Key(friend.id),
                    friend: friend,
                    rightWidget: Row(
                      children: [
                        friend.distanceKm != null
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: Text("~${friend.distanceKm}km"),
                              )
                            : const SizedBox(),
                        isSelected ? const Icon(Icons.check) : const SizedBox(),
                      ],
                    )),
              ),
              Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
            ],
          );
        }).toList());
  }
}
