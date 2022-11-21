import 'package:graphql/client.dart';
import 'package:invy/components/friend_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../components/app_bar_leading.dart';
import '../graphql/friend_group_detail_screen.graphql.dart';
import '../services/graphql_client.dart';

class FriendGroupDetailScreen extends HookConsumerWidget {
  final String friendGroupId;

  const FriendGroupDetailScreen({Key? key, required this.friendGroupId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);

    return FutureBuilder<QueryResult<Query$friendGroupDetailScreenViewer>>(
        future: graphqlClient.query$friendGroupDetailScreenViewer(
            Options$Query$friendGroupDetailScreenViewer(
                variables: Variables$Query$friendGroupDetailScreenViewer(
          friendGroupId: friendGroupId,
        ))),
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;
          return Scaffold(
            appBar: AppBar(
              leading: AppBarLeading(),
              title: Text(
                viewer?.friendGroup.name ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              shape: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
            ),
            body: Column(
              children: [
                FriendList(friends: viewer?.friendGroup.friendUsers ?? [])
              ],
            ),
          );
        });
  }
}
