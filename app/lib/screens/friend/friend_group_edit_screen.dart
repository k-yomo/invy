import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/util/logger.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/friend_group_fragment.graphql.dart';
import 'package:invy/widgets/friend_selection_list.dart';

import '../../services/graphql_client.dart';
import '../../widgets/app_bar_leading.dart';
import '../../widgets/friend_list_item_fragment.graphql.dart';
import '../friend/friend_group_edit_screen.graphql.dart';

class FriendGroupEditScreen extends HookConsumerWidget {
  FriendGroupEditScreen({
    super.key,
    required this.friendGroup,
  });

  final Fragment$friendGroupEditScreenFragment friendGroup;
  final groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final groupName = useState<String>(friendGroup.name);
    final selectedFriends = useState<List<Fragment$friendListItemFragment>>(
        friendGroup.friendUsers);
    final selectedCount = selectedFriends.value.length;
    final isValid = groupName.value.isNotEmpty && selectedCount > 0;

    onGroupSaveButtonPressed() async {
      if (!isValid) {
        return;
      }
      final result = await graphqlClient.mutate$updateFriendGroup(
        Options$Mutation$updateFriendGroup(
            variables: Variables$Mutation$updateFriendGroup(
              input: Input$UpdateFriendGroupInput(
                id: friendGroup.id,
                name: groupName.value,
                friendUserIds:
                    selectedFriends.value.map((friend) => friend.id).toList(),
              ),
            ),
            update: (cache, result) {
              if (result?.parsedData?.updateFriendGroup == null) {
                return;
              }
              graphqlClient.writeFragment$friendGroupListItemFragment(
                data: result!.parsedData!.updateFriendGroup.friendGroup,
                idFields: {
                  "__typename": fragmentDefinitionfriendGroupListItemFragment
                      .typeCondition.on.name.value,
                  "id": friendGroup.id,
                },
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

    useEffect(() {
      groupNameController.text = groupName.value;
      return null;
    }, []);

    return FutureBuilder<QueryResult<Query$friendGroupEditScreenViewer>>(
        future: graphqlClient.query$friendGroupEditScreenViewer(),
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;

          return Scaffold(
              appBar: AppBar(
                leading: const AppBarLeading(),
                title: Text(
                  selectedCount > 0 ? '選択中($selectedCount)' : 'グループ編集',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: onGroupSaveButtonPressed,
                    child: Text(
                      "保存する",
                      style: TextStyle(
                        fontSize: 16,
                        color: isValid ? Colors.blue : Colors.grey,
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
                      controller: groupNameController,
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
                    Expanded(
                      child: FriendSelectionList(
                        friends:
                            viewer?.friends.edges.map((f) => f.node).toList() ??
                                [],
                        selectedFriends: selectedFriends.value,
                        onChange: (list) {
                          selectedFriends.value = list;
                          return;
                        },
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
