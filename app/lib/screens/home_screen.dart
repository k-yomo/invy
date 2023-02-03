import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/screens/home_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/badge_count.dart';
import 'package:invy/state/location.dart';

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
    final currentLocation = useState<LatLng?>(null);
    useEffect(() {
      getCurrentLocation().then((loc) {
        if (loc != null) {
          currentLocation.value = loc;
        }
      });
      return null;
    }, []);

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
          backgroundColor: Colors.white,
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
                                                  currentLocation:
                                                      currentLocation.value,
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
                                            currentLocation:
                                                currentLocation.value,
                                            accepted: true,
                                          ),
                                        )))
                                    .toList(),
                              )
                            : Center(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/cat.png'),
                                      const Gap(15),
                                      const Text("送信済みの招待はありません",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const Gap(15),
                                      TextButton(
                                        onPressed: () {
                                          ref
                                                  .read(
                                                      bottomNavigationTabProvider
                                                          .notifier)
                                                  .state =
                                              BottomNavigationTab.invitation;
                                          Navigator.popUntil(context,
                                              (route) => route.isFirst);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 100),
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
