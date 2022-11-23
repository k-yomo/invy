import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/app_bar_leading.dart';
import 'package:invy/components/friend_list_item_fragment.graphql.dart';
import 'package:invy/components/friend_selection_list.dart';
import 'package:invy/graphql/invitation_screen.graphql.dart';

import '../components/friend_group_fragment.graphql.dart';
import '../components/friend_group_icon.dart';
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
                          return InvitationDetailForm(
                            selectedFriendGroups: selectedFriendGroups.value,
                            selectedFriends: selectedFriends.value,
                          );
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

class InvitationDetailForm extends HookConsumerWidget {
  const InvitationDetailForm({
    Key? key,
    required this.selectedFriendGroups,
    required this.selectedFriends,
  }) : super(key: key);

  final List<Fragment$friendGroupListItemFragment> selectedFriendGroups;
  final List<Fragment$friendListItemFragment> selectedFriends;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        margin: EdgeInsets.only(top: 20),
        child: Align(
          child: Column(
            children: [
              Text("詳細設定",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text("選択中",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Row(
                            children: selectedFriendGroups
                                .map((friendGroup) => Container(
                                      width: 50,
                                      child: Column(
                                        children: [
                                          FriendGroupIcon(friendGroup.name),
                                          Text(
                                            friendGroup.name,
                                            style: TextStyle(fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                          Row(
                            children: selectedFriends
                                .map((friend) => Container(
                                      width: 50,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(friend.avatarUrl),
                                          ),
                                          Text(
                                            friend.nickname,
                                            style: TextStyle(fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        TextFormField(
                          // controller: emailController,
                          decoration: const InputDecoration(
                            hintText: '開催地',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          // controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'コメント',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
