import 'package:bump/components/friend_group_list.dart';
import 'package:bump/components/friend_list.dart';
import 'package:bump/graphql/friend_screen.graphql.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendScreen extends HookConsumerWidget {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerQueryResult = useQuery$friendScreenViewer(Options$Query$friendScreenViewer(
    )).result;

    final viewer = viewerQueryResult.parsedData?.viewer;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Friends',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1)
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Title(text: "グループ"),
                viewer?.friendGroups != null
                    ? FriendGroupList(
                        friendGroups: viewer!.friendGroups!.toList())
                    : Container(
                        child: Column(children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("グループを作る"),
                        )
                      ])),
                viewer?.friendGroups != null
                    ? FriendGroupList(
                        friendGroups: viewer!.friendGroups!.toList())
                    : Container(
                        child: Column(children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("グループを作る"),
                        )
                      ])),
                viewer?.friendGroups != null
                    ? FriendGroupList(
                        friendGroups: viewer!.friendGroups!.toList())
                    : Container(
                        child: Column(children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("グループを作る"),
                        )
                      ])),
                viewer?.friendGroups != null
                    ? FriendGroupList(
                        friendGroups: viewer!.friendGroups!.toList())
                    : Container(
                        child: Column(children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("グループを作る"),
                        )
                      ])),
                viewer?.friendGroups != null
                    ? FriendGroupList(
                        friendGroups: viewer!.friendGroups!.toList())
                    : Container(
                        child: Column(children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("グループを作る"),
                        )
                      ])),
                viewer?.friendGroups != null
                    ? FriendGroupList(
                        friendGroups: viewer!.friendGroups!.toList())
                    : Container(
                        child: Column(children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("グループを作る"),
                        )
                      ])),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Title(text: "友達"),
                viewer?.friendGroups != null
                    ? FriendList(
                        friends:
                            viewer!.friends.edges.map((e) => e.node).toList())
                    : Container(),
                viewer?.friendGroups != null
                    ? FriendList(
                        friends:
                            viewer!.friends.edges.map((e) => e.node).toList())
                    : Container(),
                viewer?.friendGroups != null
                    ? FriendList(
                        friends:
                            viewer!.friends.edges.map((e) => e.node).toList())
                    : Container(),
                viewer?.friendGroups != null
                    ? FriendList(
                        friends:
                            viewer!.friends.edges.map((e) => e.node).toList())
                    : Container(),
                viewer?.friendGroups != null
                    ? FriendList(
                        friends:
                            viewer!.friends.edges.map((e) => e.node).toList())
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
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
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3, color: Colors.black),
        ),
        color: Colors.white,
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
