import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/friend/friends_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/widgets/api_query_error_message.dart';
import 'package:invy/widgets/friend_group_list.dart';
import 'package:invy/widgets/friend_list.dart';
import 'package:invy/widgets/sub_title.dart';

import '../../widgets/pending_friendship_request_list.dart';
import '../friend/freind_group_create_screen.dart';
import '../friend/friendship_request_screen.dart';

class FriendsScreen extends HookConsumerWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = useMemoized(() => graphqlClient
        .watchQuery$friendScreenViewer(WatchOptions$Query$friendScreenViewer(
      eagerlyFetchResults: true,
    )));
    final viewerStream = useStream(viewerQuery.stream);
    final viewer = viewerStream.data?.parsedData?.viewer;
    final sortedFriends = viewer?.friends.edges ?? [];
    
    // TODO: Sort in backend would be better
    sortedFriends.sort((a, b) {
      return (a.node.distanceKm ?? double.nan)
          .compareTo(b.node.distanceKm ?? double.nan);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '友達・グループ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        shape: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      backgroundColor: Colors.white,
      body: (viewerStream.hasError || viewerStream.data?.hasException == true) ? APIQueryErrorMessage(refetch: viewerQuery.refetch, isNetworkError: viewerStream.hasError) : SingleChildScrollView(
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
                      const FriendGroupCreateRoute().go(context);
                    },
                    child: const _AddFriendGroup(),
                  ),
                  FriendGroupList(
                      friendGroups: viewer?.friendGroups.toList() ?? [])
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SubTitle(text: "友建"),
                  InkWell(
                    onTap: () {
                      const FriendshipRequestRoute().push(context);
                    },
                    child: const _AddFriend(),
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
                    disableScroll: true,
                    friends: sortedFriends.map((f) => f.node).toList(),
                    onFriendPressed: (friendUserId) {
                      UserProfileRoute(
                        friendUserId,
                        $extra: sortedFriends
                            .singleWhere((f) => f.node.id == friendUserId)
                            .node,
                      ).push(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddFriendGroup extends StatelessWidget {
  const _AddFriendGroup();

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
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.group_add_outlined, color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 2),
            child: const Text(
              "グループを作成する",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddFriend extends StatelessWidget {
  const _AddFriend();

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
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.person_add_alt_outlined, color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 2),
            child: const Text(
              "友達を追加する",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
