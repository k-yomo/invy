import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/screens/invitation/invitation_form_screen.graphql.dart';
import 'package:invy/state/invitation.dart';
import 'package:invy/widgets/app_bar_leading.dart';
import 'package:invy/widgets/screen_wrapper.dart';
import 'package:invy/widgets/friend_selection_list.dart';

import '../../widgets/friend_group_selection_list.dart';
import '../../services/graphql_client.dart';

class InvitationFriendSelectRoute extends GoRouteData {
  const InvitationFriendSelectRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScreenWrapper(child: InvitationFriendSelectScreen());
}

class InvitationFriendSelectScreen extends HookConsumerWidget {
  const InvitationFriendSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = graphqlClient.watchQuery$invitationFormScreenViewer();
    viewerQuery.fetchResults();

    final selectedFriendGroups =
        useState(ref.read(invitationFormProvider).selectedFriendGroups);
    final selectedFriends =
        useState(ref.read(invitationFormProvider).selectedFriends);
    final selectedCount =
        selectedFriendGroups.value.length + selectedFriends.value.length;

    return StreamBuilder<QueryResult<Query$invitationFormScreenViewer>>(
        stream: viewerQuery.stream,
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;

          final sortedFriends = viewer?.friends.edges ?? [];
          // TODO: Sort in backend would be better
          sortedFriends.sort((a, b) {
            return (a.node.distanceKm ?? double.nan)
                .compareTo(b.node.distanceKm ?? double.nan);
          });

          return Scaffold(
            appBar: AppBar(
              leading: const AppBarLeading(),
              title: Text(
                selectedCount > 0 ? '選択中($selectedCount)' : '友達を選択',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    ref.read(invitationFormProvider.notifier).set(
                          defaultInvitationFormState.copyWith(
                            selectedFriendGroups: selectedFriendGroups.value,
                            selectedFriends: selectedFriends.value,
                          ),
                        );
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    "完了",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              shape: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TODO: show selected groups and friends at the top
                      // Column(
                      //   children: [
                      //     Row(
                      //       children: selectedFriendGroups.value.map((friendGroup) =>
                      //           FriendGroupIcon(friendGroup.name)).toList(),
                      //     ),
                      //     Row(
                      //       children: selectedFriends.value.map((friend) =>
                      //           CircleAvatar(
                      //             backgroundColor: Colors.transparent,
                      //             backgroundImage: NetworkImage(friend.avatarUrl),
                      //           )
                      //       ).toList(),
                      //     ),
                      //   ],
                      // ),
                      FriendGroupSelectionList(
                        friendGroups: viewer?.friendGroups.toList() ?? [],
                        selectedFriendGroups: selectedFriendGroups.value,
                        onChange: (list) {
                          selectedFriendGroups.value = list;
                          selectedFriendGroups.notifyListeners();
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FriendSelectionList(
                          friends: sortedFriends.map((e) => e.node).toList(),
                          selectedFriends: selectedFriends.value,
                          onChange: (list) {
                            selectedFriends.value = list;
                            selectedFriends.notifyListeners();
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
