import 'package:graphql/client.dart';
import 'package:invy/components/app_bar_leading.dart';
import 'package:invy/components/friend_group_icon.dart';
import 'package:invy/components/friend_list_item_fragment.graphql.dart';
import 'package:invy/components/friend_selection_list.dart';
import 'package:invy/graphql/invitation_screen.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/friend_group_fragment.graphql.dart';
import '../components/friend_group_selection_list.dart';
import '../services/graphql_client.dart';

class InvitationScreen extends HookConsumerWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final selectedFriendGroups =
        useState<List<Fragment$friendGroupListItemFragment>>([]);
    final selectedFriends = useState<List<Fragment$friendListItemFragment>>([]);
    final selectedCount =
        selectedFriendGroups.value.length + selectedFriends.value.length;

    return FutureBuilder<QueryResult<Query$invitationScreenViewer>>(
        future: graphqlClient.query$invitationScreenViewer(),
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;
          return Scaffold(
            appBar: AppBar(
              leading: AppBarLeading(),
              title: Text(
                selectedCount > 0 ? '選択中(${selectedCount})' : '友だちを選択',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              margin: EdgeInsets.only(top: 100),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Container(
                                  child: Column(
                                children: [Text("詳細設定")],
                              )));
                        });
                  },
                  child: Text("次へ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
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
