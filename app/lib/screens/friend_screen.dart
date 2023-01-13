import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/friend_group_list.dart';
import 'package:invy/components/friend_list.dart';
import 'package:invy/components/sub_title.dart';
import 'package:invy/graphql/friend_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';

import '../components/pending_friendship_request_list.dart';
import 'freind_group_create_screen.dart';
import 'friendship_request_screen.dart';

class FriendScreen extends HookConsumerWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = graphqlClient.watchQuery$friendScreenViewer(
      WatchOptions$Query$friendScreenViewer(
          eagerlyFetchResults: true,
      )
    );

    return StreamBuilder<QueryResult<Query$friendScreenViewer>>(
        stream: viewerQuery.stream,
        builder: (context, viewerSnapshot) {
          final viewer = viewerSnapshot.data?.parsedData?.viewer;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Friends',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              shape: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SubTitle(text: "グループ"),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => FriendGroupCreateScreen(),
                              ),
                            );
                          },
                          child: _AddFriendGroup(),
                        ),
                        FriendGroupList(
                            friendGroups: viewer?.friendGroups.toList() ?? [])
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SubTitle(text: "友だち"),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => FriendshipRequestScreen(),
                              ),
                            );
                          },
                          child: _AddFriend(),
                        ),
                        PendingFriendshipRequestList(
                          pendingFriendshipRequests:
                              viewer?.pendingFriendshipRequests ?? [],
                          onClick: (String requestId) async {
                            final result = await viewerQuery.refetch();
                            if (result?.hasException ?? true) {
                              return;
                            }
                          },
                        ),
                        FriendList(
                            friends: viewer?.friends.edges
                                    .map((e) => e.node)
                                    .toList() ??
                                [])
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _AddFriendGroup extends StatelessWidget {
  const _AddFriendGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.group_add_outlined, color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 2),
            child: Text(
              "グループを作成する",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddFriend extends StatelessWidget {
  const _AddFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person_add_alt_outlined, color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 2),
            child: Text(
              "友だちを追加する",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
