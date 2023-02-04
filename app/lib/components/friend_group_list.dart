import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/friend_group_fragment.graphql.dart';
import 'package:invy/components/friend_group_icon.dart';
import 'package:invy/graphql/friend_group.graphql.dart';
import 'package:invy/screens/freind_group_detail_screen.dart';
import 'package:flutter/material.dart';

import '../services/graphql_client.dart';

class FriendGroupList extends StatelessWidget {
  const FriendGroupList({
    super.key,
    required this.friendGroups,
  });

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

class _FriendGroupListItem extends HookConsumerWidget {
  const _FriendGroupListItem({
    required this.friendGroup,
  });

  final Fragment$friendGroupListItemFragment friendGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final isDeleted = useState(false);

    onPressedDelete(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("グループ削除"),
            content: Text('"${friendGroup.name}"を削除してもよろしいですか？'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey.shade800,
                ),
                child: const Text("キャンセル"),
              ),
              TextButton(
                onPressed: () async {
                  await graphqlClient.mutate$deleteFriendGroup(
                      Options$Mutation$deleteFriendGroup(
                          variables: Variables$Mutation$deleteFriendGroup(
                    friendGroupId: friendGroup.id,
                  )));
                  isDeleted.value = true;
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }

    if (isDeleted.value) {
      return const SizedBox();
    }

    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onPressedDelete,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '削除',
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            FriendGroupIcon(friendGroup.name),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 2),
              child: Text(
                friendGroup.name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text("(${friendGroup.totalCount.toString()})",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
