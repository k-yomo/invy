import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/screens/friend/blocked_friends_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/widgets/screen_wrapper.dart';

import '../../widgets/friend_list_item_fragment.graphql.dart';

class BlockedFriendsRoute extends GoRouteData {
  const BlockedFriendsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScreenWrapper(child: BlockedFriendsScreen());
}

class BlockedFriendsScreen extends HookConsumerWidget {
  const BlockedFriendsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = graphqlClient.watchQuery$blockedFriendScreenViewer(
        WatchOptions$Query$blockedFriendScreenViewer(
      eagerlyFetchResults: true,
    ));

    return StreamBuilder<QueryResult<Query$blockedFriendScreenViewer>>(
      stream: viewerQuery.stream,
      builder: (context, viewerSnapshot) {
        final viewer = viewerSnapshot.data?.parsedData?.viewer;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'ブロック中のユーザー',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            shape: Border(
                bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlockedFriendList(
                    friends: viewer?.blockedFriends.edges
                            .map((e) => e.node)
                            .toList() ??
                        [],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BlockedFriendList extends HookConsumerWidget {
  const BlockedFriendList({
    super.key,
    required this.friends,
  });

  final List<Fragment$friendListItemFragment> friends;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: friends
          .map((friend) => _FriendListItem(
                friend: friend,
              ))
          .toList(),
    );
  }
}

class _FriendListItem extends HookConsumerWidget {
  const _FriendListItem({
    required this.friend,
  });

  final Fragment$friendListItemFragment friend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final isUnblocked = useState(false);

    onPressed() async {
      final result = await graphqlClient.mutate$unblockUser(
          Options$Mutation$unblockUser(
              variables: Variables$Mutation$unblockUser(userId: friend.id)));
      if (result.hasException) {
        // TODO: error handling
        return;
      }
      isUnblocked.value = true;
    }

    if (isUnblocked.value) {
      return const SizedBox();
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: CachedNetworkImageProvider(friend.avatarUrl),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 5),
                child: Text(
                  friend.nickname,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style:
                        ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                    onPressed: onPressed,
                    child: const Text("解除"),
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
      ],
    );
  }
}
