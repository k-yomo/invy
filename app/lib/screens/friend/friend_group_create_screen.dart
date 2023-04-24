import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/screens/friend/friends_screen.graphql.dart';
import 'package:invy/util/logger.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/screen_wrapper.dart';
import 'package:invy/widgets/friend_selection_list.dart';
import 'package:invy/screens/friend/friend_group_create_screen.graphql.dart';
import 'package:invy/graphql/schema.graphql.dart';

import '../../widgets/app_bar_leading.dart';
import '../../widgets/friend_list_item_fragment.graphql.dart';
import '../../services/graphql_client.dart';

class FriendGroupCreateRoute extends GoRouteData {
  const FriendGroupCreateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScreenWrapper(child: FriendGroupCreateScreen());
}

class FriendGroupCreateScreen extends HookConsumerWidget {
  const FriendGroupCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final groupName = useState<String>('');
    final selectedFriends = useState<List<Fragment$friendListItemFragment>>([]);
    final selectedCount = selectedFriends.value.length;

    onGroupCreateButtonPressed() async {
      if (groupName.value.isEmpty) {
        return;
      }
      final result = await graphqlClient.mutate$createFriendGroup(
        Options$Mutation$createFriendGroup(
            variables: Variables$Mutation$createFriendGroup(
              input: Input$CreateFriendGroupInput(
                name: groupName.value,
                friendUserIds:
                    selectedFriends.value.map((friend) => friend.id).toList(),
              ),
            ),
            update: (cache, result) {
              if (result?.parsedData?.createFriendGroup == null) {
                return;
              }
              final friendScreenViewer =
                  graphqlClient.readQuery$friendsScreenViewer();
              if (friendScreenViewer == null) {
                return;
              }
              graphqlClient.writeQuery$friendsScreenViewer(
                data: friendScreenViewer.copyWith(
                    viewer: friendScreenViewer.viewer.copyWith(
                  friendGroups: [
                    ...friendScreenViewer.viewer.friendGroups,
                    result!.parsedData!.createFriendGroup.friendGroup,
                  ],
                )),
              );
            }),
      );
      if (result.hasException) {
        logger.e(result.exception);
        showServerErrorToast();
        return;
      }
      Navigator.of(context).pop();
    }

    return FutureBuilder<QueryResult<Query$friendGroupCreateScreenViewer>>(
        future: graphqlClient.query$friendGroupCreateScreenViewer(),
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;

          return Scaffold(
              appBar: AppBar(
                leading: const AppBarLeading(),
                title: Text(
                  selectedCount > 0 ? '選択中($selectedCount)' : 'グループ作成',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: onGroupCreateButtonPressed,
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
                margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
                      },
                    ),
                    FriendSelectionList(
                      friends:
                          viewer?.friends.edges.map((f) => f.node).toList() ??
                              [],
                      selectedFriends: selectedFriends.value,
                      onChange: (list) {
                        selectedFriends.value = list;
                        return;
                      },
                    )
                  ],
                ),
              ));
        });
  }
}
