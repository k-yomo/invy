import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/widgets/pending_friendship_request_list_fragment.graphql.dart';
import 'package:invy/screens/friend/friends_screen.graphql.dart';

import '../services/graphql_client.dart';
import 'friend_list_item.dart';

class PendingFriendshipRequestList extends HookConsumerWidget {
  const PendingFriendshipRequestList({
    super.key,
    required this.pendingFriendshipRequests,
    required this.onClick,
  });

  final List<Fragment$pendingFriendRequestItemFragment>
      pendingFriendshipRequests;
  final Function(String requestId) onClick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);

    onPressedDenyFriendship(String requestId) async {
      final result = await graphqlClient.mutate$denyFriendshipRequest(
        Options$Mutation$denyFriendshipRequest(
          variables: Variables$Mutation$denyFriendshipRequest(
              friendshipRequestId: requestId),
        ),
      );
      if (result.hasException) {
        // TODO: show error;
        return;
      }
      onClick(requestId);
    }

    onPressedAcceptFriendship(String requestId) async {
      final result = await graphqlClient.mutate$acceptFriendshipRequest(
        Options$Mutation$acceptFriendshipRequest(
          variables: Variables$Mutation$acceptFriendshipRequest(
              friendshipRequestId: requestId),
        ),
      );
      if (result.hasException) {
        // TODO: show error;
        print(result.exception);
        return;
      }
      onClick(requestId);
    }

    return Column(
        children: pendingFriendshipRequests.map((request) {
      return Column(
        children: [
          FriendListItem(
              key: Key(request.fromUser.id),
              friend: request.fromUser,
              rightWidget: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.transparent)),
                      ),
                      onPressed: () async =>
                          onPressedDenyFriendship(request.id),
                      child: const Text('拒否',
                          style: TextStyle(color: Colors.black))),
                  Container(margin: const EdgeInsets.symmetric(horizontal: 2)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () async =>
                          onPressedAcceptFriendship(request.id),
                      child: const Text('承認',
                          style: TextStyle(color: Colors.white))),
                ],
              )),
          Divider(height: 0, thickness: 1, color: Colors.grey.shade200),
        ],
      );
    }).toList());
  }
}
