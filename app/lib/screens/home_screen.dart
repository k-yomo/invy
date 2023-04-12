import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/home_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/badge_count.dart';
import 'package:invy/state/location.dart';

import '../widgets/invitation_list_item.dart';
import '../widgets/sub_title.dart';

class HomeScreen extends HookConsumerWidget {
  HomeScreen({super.key});

  late Future<LatLng?> currentLocationFuture = getCurrentLocation();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final badgeCounter = ref.watch(pushNotificationBadgeCounter);
    final viewerQuery = graphqlClient
        .watchQuery$homeScreenViewer(WatchOptions$Query$homeScreenViewer(
      eagerlyFetchResults: true,
    ));
    viewerQuery.startPolling(const Duration(seconds: 30));

    return FutureBuilder(
        future: getCurrentLocation(),
        builder: (context, currentLocation) {
          return StreamBuilder<QueryResult<Query$homeScreenViewer>>(
            stream: viewerQuery.stream,
            builder: (context, viewerSnapshot) {
              final viewer = viewerSnapshot.data?.parsedData?.viewer;
              if (viewer == null) {
                return Scaffold(
                    body: SingleChildScrollView(child: Container()));
              }
              final answeredInvitations = [
                ...viewer.sentInvitations,
                ...viewer.acceptedInvitations
              ];
              answeredInvitations
                  .sort((a, b) => a.startsAt.compareTo(b.startsAt));
              badgeCounter.setBadgeCount(viewer.pendingInvitations.length);

              final noInvitations = viewer.pendingInvitations.isEmpty &&
                  answeredInvitations.isEmpty;

              return Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: viewer.pendingInvitations.isEmpty
                                      ? []
                                      : [
                                          const SubTitle(text: "届いているおさそい"),
                                          const Gap(10),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Column(
                                              children: [
                                                ...viewer.pendingInvitations
                                                    .map((invitation) =>
                                                        (Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5),
                                                          child:
                                                              InvitationListItem(
                                                            invitation:
                                                                invitation,
                                                            currentLocation:
                                                                currentLocation
                                                                    .data,
                                                            onAccepted:
                                                                (invitationId) async {
                                                              final result =
                                                                  await graphqlClient
                                                                      .mutate$acceptInvitation(
                                                                          Options$Mutation$acceptInvitation(
                                                                variables: Variables$Mutation$acceptInvitation(
                                                                    invitationId:
                                                                        invitationId),
                                                              ));
                                                              if (result
                                                                      .parsedData
                                                                      ?.acceptInvitation !=
                                                                  null) {
                                                                viewerQuery
                                                                    .refetch();
                                                              }
                                                            },
                                                            onDenied:
                                                                (invitationId) async {
                                                              final result =
                                                                  await graphqlClient
                                                                      .mutate$denyInvitation(
                                                                          Options$Mutation$denyInvitation(
                                                                variables: Variables$Mutation$denyInvitation(
                                                                    invitationId:
                                                                        invitationId),
                                                              ));
                                                              if (result
                                                                      .parsedData
                                                                      ?.denyInvitation !=
                                                                  null) {
                                                                viewerQuery
                                                                    .refetch();
                                                              }
                                                            },
                                                          ),
                                                        )))
                                              ],
                                            ),
                                          ),
                                        ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(10),
                                    const SubTitle(text: "おさそい待ち"),
                                    const Gap(10),
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: viewer.sentInvitations
                                                    .isNotEmpty ||
                                                viewer.acceptedInvitations
                                                    .isNotEmpty
                                            ? Column(
                                                children: answeredInvitations
                                                    .map((invitation) =>
                                                        (Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5),
                                                          child:
                                                              InvitationListItem(
                                                            invitation:
                                                                invitation,
                                                            currentLocation:
                                                                currentLocation
                                                                    .data,
                                                            accepted: true,
                                                          ),
                                                        )))
                                                    .toList(),
                                              )
                                            : const SizedBox())
                                  ],
                                ),
                                noInvitations
                                    ? Center(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 30),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  'assets/images/cat.png'),
                                              const Gap(15),
                                              const Text("参加予定のイベントはありません",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const Gap(15),
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  const InvitationRoute().go(context);
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: const Size.fromHeight(0),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  'おさそいを待つ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(15)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
