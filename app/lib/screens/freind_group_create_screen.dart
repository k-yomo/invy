import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/friend_selection_list.dart';
import 'package:invy/graphql/friend_group_create_screen.graphql.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/screens/friend_screen.dart';

import '../components/app_bar_leading.dart';
import '../components/friend_list_item_fragment.graphql.dart';
import '../services/graphql_client.dart';

class FriendGroupCreateScreen extends HookConsumerWidget {
  const FriendGroupCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final groupName = useState<String>('');
    final selectedFriends = useState<List<Fragment$friendListItemFragment>>([]);
    final selectedCount = selectedFriends.value.length;

    return FutureBuilder<QueryResult<Query$friendGroupCreateScreenViewer>>(
        future: graphqlClient.query$friendGroupCreateScreenViewer(),
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;

          return Scaffold(
              appBar: AppBar(
                leading: AppBarLeading(),
                title: Text(
                  selectedCount > 0 ? '選択中(${selectedCount})' : 'グループ作成',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () async {
                      if (groupName.value.isEmpty) {
                        return;
                      }
                      final result =
                          await graphqlClient.mutate$createFriendGroup(
                              Options$Mutation$createFriendGroup(
                                  variables:
                                      Variables$Mutation$createFriendGroup(
                        input: Input$CreateFriendGroupInput(
                          name: groupName.value,
                          friendUserIds: selectedFriends.value
                              .map((friend) => friend.id)
                              .toList(),
                        ),
                      )));
                      if (result.hasException) {
                        // TODO: show error
                        return;
                      }
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => FriendScreen()));
                    },
                    child: Text(
                      "作成する",
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            groupName.value.isEmpty ? Colors.grey : Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                shape: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
              ),
              body: Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  children: [
                    TextField(
                      textInputAction: TextInputAction.search,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        hintText: 'グループ名を入力',
                      ),
                      autofocus: true,
                      onChanged: (text) {
                        groupName.value = text;
                        groupName.notifyListeners();
                      },
                    ),
                    FriendSelectionList(
                      friends:
                          viewer?.friends.edges.map((f) => f.node).toList() ??
                              [],
                      selectedFriends: selectedFriends.value,
                      onChange: (list) {
                        selectedFriends.value = list;
                        selectedFriends.notifyListeners();
                        return;
                      },
                    )
                  ],
                ),
              ));
        });
  }
}
