import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/app_bar_leading.dart';
import 'package:invy/components/friend_list_item_fragment.graphql.dart';
import 'package:invy/components/friend_selection_list.dart';
import 'package:invy/graphql/invitation_screen.graphql.dart';

import '../components/friend_group_fragment.graphql.dart';
import '../components/friend_group_selection_list.dart';
import '../services/graphql_client.dart';
import 'inivitation_detail_form_screen.dart';

class InvitationScreen extends HookConsumerWidget {
  const InvitationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = graphqlClient.watchQuery$invitationScreenViewer();
    viewerQuery.fetchResults();

    final selectedFriendGroups =
        useState<List<Fragment$friendGroupListItemFragment>>([]);
    final selectedFriends = useState<List<Fragment$friendListItemFragment>>([]);
    final selectedCount =
        selectedFriendGroups.value.length + selectedFriends.value.length;

    return StreamBuilder<QueryResult<Query$invitationScreenViewer>>(
        stream: viewerQuery.stream,
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;
          return Scaffold(
            appBar: AppBar(
              leading: const AppBarLeading(),
              title: Text(
                selectedCount > 0 ? '選択中($selectedCount)' : '友だちを選択',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    if (selectedCount == 0) {
                      return;
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => InvitationDetailFormScreen(
                          selectedFriendGroups: selectedFriendGroups.value,
                          selectedFriends: selectedFriends.value,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "次へ",
                    style: TextStyle(
                        fontSize: 16,
                        color: selectedCount == 0
                            ? Colors.grey.shade600
                            : Colors.blue.shade600,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              shape: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TODO: show selected groups and friends at the top
                      // Column(
                      //   children: [
                      //     Row(
                      //       children: selectedFriendGroups.value.map((friendGroup) =>
                      //           FriendGroupIcon(friendGroup.name)).toList(),
                      //     ),
                      //     Row(
                      //       children: selectedFriends.value.map((friend) =>
                      //           CircleAvatar(
                      //             backgroundImage: NetworkImage(friend.avatarUrl),
                      //           )
                      //       ).toList(),
                      //     ),
                      //   ],
                      // ),
                      FriendGroupSelectionList(
                        friendGroups: viewer?.friendGroups.toList() ?? [],
                        selectedFriendGroups: selectedFriendGroups.value,
                        onChange: (list) {
                          selectedFriendGroups.value = list;
                          selectedFriendGroups.notifyListeners();
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FriendSelectionList(
                          friends: viewer?.friends.edges
                                  .map((e) => e.node)
                                  .toList() ??
                              [],
                          selectedFriends: selectedFriends.value,
                          onChange: (list) {
                            selectedFriends.value = list;
                            selectedFriends.notifyListeners();
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
