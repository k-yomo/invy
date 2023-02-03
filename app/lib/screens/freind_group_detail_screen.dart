import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/friend_list.dart';
import 'package:invy/components/user_profile_modal.dart';
import 'package:invy/screens/friend_group_edit_screen.dart';

import '../components/app_bar_leading.dart';
import '../screens/friend_group_detail_screen.graphql.dart';
import '../services/graphql_client.dart';

class FriendGroupDetailScreen extends HookConsumerWidget {
  final String friendGroupId;

  const FriendGroupDetailScreen({super.key, required this.friendGroupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = graphqlClient.watchQuery$friendGroupDetailScreenViewer(
        WatchOptions$Query$friendGroupDetailScreenViewer(
      variables: Variables$Query$friendGroupDetailScreenViewer(
        friendGroupId: friendGroupId,
      ),
      eagerlyFetchResults: true,
    ));

    return StreamBuilder<QueryResult<Query$friendGroupDetailScreenViewer>>(
        stream: viewerQuery.stream,
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;
          return Scaffold(
            appBar: AppBar(
              leading: const AppBarLeading(),
              title: Text(
                viewer?.friendGroup.name ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FriendGroupEditScreen(
                          friendGroup: viewer!.friendGroup,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "編集",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              shape: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
            ),
            body: FriendList(
              friends: viewer?.friendGroup.friendUsers ?? [],
              onFriendPressed: (String friendUserId) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: UserProfileModal(
                          user: viewer!.friendGroup.friendUsers.singleWhere(
                              (friend) => friend.id == friendUserId)),
                    );
                  },
                );
              },
            ),
          );
        });
  }
}
