import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/friend_group_list.dart';
import 'package:invy/components/friend_list.dart';
import 'package:invy/graphql/friend_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';

import '../components/pending_friendship_request_list.dart';
import '../components/pending_friendship_request_list_fragment.graphql.dart';
import 'freind_group_create_screen.dart';
import 'friend_request_screen.dart';

class FriendScreen extends HookConsumerWidget {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);

    return FutureBuilder<QueryResult<Query$friendScreenViewer>>(
        future: graphqlClient
            .query$friendScreenViewer(Options$Query$friendScreenViewer(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        )),
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
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Title(text: "グループ"),
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
                      const _Title(text: "友だち"),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => FriendRequestScreen(),
                            ),
                          );
                        },
                        child: _AddFriend(),
                      ),
                      PendingFriendshipRequestList(
                        pendingFriendshipRequests:
                            viewer?.pendingFriendshipRequests ?? [],
                        onClick: (Fragment$pendingFriendRequestItemFragment
                            request) {},
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
          );
        });
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      padding: const EdgeInsets.only(bottom: 3),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3, color: Colors.black),
        ),
        color: Colors.white,
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}

class _AddFriendGroup extends StatelessWidget {
  const _AddFriendGroup({
    Key? key,
  }) : super(key: key);

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
  const _AddFriend({
    Key? key,
  }) : super(key: key);

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
