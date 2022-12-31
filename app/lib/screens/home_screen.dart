import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/components/received_invitation_card.dart';
import 'package:invy/components/sent_invitation_card.dart';
import 'package:invy/graphql/home_screen.graphql.dart';
import 'package:invy/screens/invitation_screen.dart';
import 'package:invy/services/graphql_client.dart';

import '../components/sub_title.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = graphqlClient
        .watchQuery$homeScreenViewer(WatchOptions$Query$homeScreenViewer(
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    viewerQuery.fetchResults();

    return StreamBuilder<QueryResult<Query$homeScreenViewer>>(
      stream: viewerQuery.stream,
      builder: (context, viewerSnapshot) {
        final viewer = viewerSnapshot.data?.parsedData?.viewer;
        if (viewer == null) {
          return Scaffold(body: SingleChildScrollView(child: Container()));
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 30, bottom: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SubTitle(text: "送信済みの招待"),
                      Gap(10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: viewer.sentInvitations.length > 0
                            ? Column(
                                children: [
                                  ...viewer.sentInvitations
                                      .map((invitation) => (Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: SentInvitationCard(
                                              invitation: invitation,
                                            ),
                                          )))
                                ],
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
                                      child: Text("送信済みの招待はありません",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) =>
                                                InvitationScreen(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
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
                      const SubTitle(text: "回答済みの招待"),
                      Gap(10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            ...viewer?.acceptedInvitations
                                    .map((invitation) => (Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: ReceivedInvitationCard(
                                            invitation: invitation,
                                            accepted: true,
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
                      const SubTitle(text: "届いている招待"),
                      Gap(10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            ...viewer?.pendingInvitations
                                    .map((invitation) => (Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: ReceivedInvitationCard(
                                            invitation: invitation,
                                          ),
                                        ))) ??
                                []
                          ],
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
