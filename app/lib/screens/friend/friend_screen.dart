import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/widgets/friend_group_list.dart';
import 'package:invy/widgets/friend_list.dart';
import 'package:invy/widgets/sub_title.dart';
import 'package:invy/screens/friend/friend_screen.graphql.dart';
import 'package:invy/widgets/user_profile_modal.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgets/pending_friendship_request_list.dart';
import '../friend/freind_group_create_screen.dart';
import '../friend/friendship_request_screen.dart';

class FriendScreen extends HookConsumerWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = graphqlClient
        .watchQuery$friendScreenViewer(WatchOptions$Query$friendScreenViewer(
      eagerlyFetchResults: true,
    ));

    return StreamBuilder<QueryResult<Query$friendScreenViewer>>(
        stream: viewerQuery.stream,
        builder: (context, viewerSnapshot) {
          final viewer = viewerSnapshot.data?.parsedData?.viewer;
          final sortedFriends = viewer?.friends.edges ?? [];
          // TODO: Sort in backend would be better
          sortedFriends.sort((a, b) {
            if (a.node.invitationAwaitings.isNotEmpty &&
                a.node.invitationAwaitings.isNotEmpty) {
              final aInvitationAwaiting = a.node.invitationAwaitings.first;
              final bInvitationAwaiting = b.node.invitationAwaitings.first;
              return aInvitationAwaiting.startsAt
                  .compareTo(bInvitationAwaiting.startsAt);
            } else if (a.node.invitationAwaitings.isNotEmpty ||
                b.node.invitationAwaitings.isNotEmpty) {
              return b.node.invitationAwaitings.length
                  .compareTo(a.node.invitationAwaitings.length);
            }
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
                                builder: (context) =>
                                    const FriendGroupCreateScreen(),
                              ),
                            );
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
                        const SubTitle(text: "友だち"),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) =>
                                    const FriendshipRequestScreen(),
                              ),
                            );
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
                          friends: sortedFriends.map((f) => f.node).toList(),
                          onFriendPressed: (friendUserId) {
                            showMaterialModalBottomSheet(
                              context: context,
                              duration: const Duration(milliseconds: 300),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.85,
                                  child: UserProfileModal(
                                      user: viewer!.friends.edges
                                          .singleWhere((edge) =>
                                              edge.node.id == friendUserId)
                                          .node),
                                );
                              },
                            );
                          },
                        ),
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
              "友だちを追加する",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
