import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/home_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/badge_count.dart';

import '../components/invitation_list_item.dart';
import '../components/sub_title.dart';
import '../state/bottom_navigation.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final badgeCounter = ref.watch(pushNotificationBadgeCounter);
    final viewerQuery = graphqlClient
        .watchQuery$homeScreenViewer(WatchOptions$Query$homeScreenViewer(
      eagerlyFetchResults: true,
    ));
    viewerQuery.startPolling(const Duration(seconds: 30));

    return StreamBuilder<QueryResult<Query$homeScreenViewer>>(
      stream: viewerQuery.stream,
      builder: (context, viewerSnapshot) {
        final viewer = viewerSnapshot.data?.parsedData?.viewer;
        if (viewer == null) {
          return Scaffold(body: SingleChildScrollView(child: Container()));
        }
        final answeredInvitations = [
          ...viewer.sentInvitations,
          ...viewer.acceptedInvitations
        ];
        answeredInvitations.sort((a, b) => a.startsAt.compareTo(b.startsAt));
        badgeCounter.setBadgeCount(viewer.pendingInvitations.length);

        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 30, bottom: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: viewer.pendingInvitations.isEmpty
                        ? []
                        : [
                            const SubTitle(text: "届いている招待"),
                            const Gap(10),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                children: [
                                  ...viewer.pendingInvitations
                                          .map((invitation) => (Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: InvitationListItem(
                                                  invitation: invitation,
                                                  onAccepted:
                                                      (invitationId) async {
                                                    final result = await graphqlClient
                                                        .mutate$acceptInvitation(
                                                            Options$Mutation$acceptInvitation(
                                                      variables:
                                                          Variables$Mutation$acceptInvitation(
                                                              invitationId:
                                                                  invitationId),
                                                    ));
                                                    if (result.parsedData
                                                            ?.acceptInvitation !=
                                                        null) {
                                                      viewerQuery.refetch();
                                                    }
                                                  },
                                                  onDenied:
                                                      (invitationId) async {
                                                    final result = await graphqlClient
                                                        .mutate$denyInvitation(
                                                            Options$Mutation$denyInvitation(
                                                      variables:
                                                          Variables$Mutation$denyInvitation(
                                                              invitationId:
                                                                  invitationId),
                                                    ));
                                                    if (result.parsedData
                                                            ?.denyInvitation !=
                                                        null) {
                                                      viewerQuery.refetch();
                                                    }
                                                  },
                                                ),
                                              ))) ??
                                      []
                                ],
                              ),
                            ),
                          ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      const Divider(),
                      const Gap(10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: viewer.sentInvitations.isNotEmpty ||
                                viewer.acceptedInvitations.isNotEmpty
                            ? Column(
                                children: answeredInvitations
                                    .map((invitation) => (Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: InvitationListItem(
                                            invitation: invitation,
                                            accepted: true,
                                          ),
                                        )))
                                    .toList(),
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.edit_calendar,
                                        size: 50, color: Colors.grey.shade600),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: const Text("送信済みの招待はありません",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        ref
                                                .read(
                                                    bottomNavigationTabProvider
                                                        .notifier)
                                                .state =
                                            BottomNavigationTab.invitation;
                                        Navigator.popUntil(
                                            context, (route) => route.isFirst);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 60,
                                        ),
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                      ),
                                      child: const Text(
                                        'さそう',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: const [],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
