import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/invitation/invitation_detail_screen.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/chat.dart';
import 'package:invy/widgets/dynamic_links_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../graphql/schema.graphql.dart';
import '../../widgets/app_bar_leading.dart';

const dateTimeFormat = 'M月d日 H時m分';

String _convertToDisplayTime(DateTime time) {
  final localTime = time.toLocal();
  final now = DateTime.now().toLocal();
  if (localTime.day == now.day) {
    return DateFormat('H時m分').format(localTime);
  }
  return DateFormat(dateTimeFormat).format(localTime);
}

class InvitationDetailRoute extends GoRouteData {
  const InvitationDetailRoute(
    this.invitationId,
  );

  final String invitationId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DynamicLinksManager(
          child: InvitationDetailScreen(invitationId: invitationId));
}

class InvitationDetailScreen extends HookConsumerWidget {
  const InvitationDetailScreen({
    super.key,
    required this.invitationId,
  });

  final String invitationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invitationLocationMarker = useState(BitmapDescriptor.defaultMarker);

    useEffect(() {
      BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size.square(10)),
        "assets/images/location_pin.png",
      ).then(
        (icon) {
          invitationLocationMarker.value = icon;
        },
      );
      return null;
    }, []);

    final loggedInUser = ref.read(loggedInUserProvider)!;
    final graphqlClient = ref.read(graphqlClientProvider);
    final invitationQuery = useMemoized(() => graphqlClient
            .watchQuery$invitationDetail(WatchOptions$Query$invitationDetail(
          variables: Variables$Query$invitationDetail(id: invitationId),
          eagerlyFetchResults: true,
        )));
    final invitation =
        useStream(invitationQuery.stream).data?.parsedData?.invitation;

    if (invitation == null) {
      return const SizedBox();
    }

    final invitationStatus = useState(invitation.status);
    final isInvitationSentByLoggedInUser =
        invitation.user.id == loggedInUser.id;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  ExpansionTile(
                    textColor: Colors.black,
                    iconColor: Colors.grey.shade600,
                    title: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    invitation.user,
                                    ...invitation.acceptedUsers
                                  ]
                                      .map((acceptedUser) => SizedBox(
                                            width: 50,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                          acceptedUser
                                                              .avatarUrl),
                                                ),
                                                Text(
                                                  acceptedUser.nickname,
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 10, right: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.fmd_good, size: 20),
                                          Text(
                                            invitation.location,
                                            style:
                                                const TextStyle(fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 5, left: 5, bottom: 5),
                                child: Text(
                                  "${_convertToDisplayTime(invitation.startsAt)}〜",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    children: [
                      isInvitationSentByLoggedInUser
                          ? Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                            invitationStatus.value ==
                                                    Enum$InvitationStatus.ACTIVE
                                                ? Icons.stop_circle
                                                : Icons.play_circle,
                                            color: Colors.black),
                                        const Gap(5),
                                        Text(
                                            invitationStatus.value ==
                                                    Enum$InvitationStatus.ACTIVE
                                                ? "募集停止"
                                                : "募集再開",
                                            style:
                                                const TextStyle(color: Colors.black))
                                      ],
                                    ),
                                    onPressed: () async {
                                      if (invitationStatus.value ==
                                          Enum$InvitationStatus.ACTIVE) {
                                        final result = await graphqlClient
                                            .mutate$closeInvitation(
                                                Options$Mutation$closeInvitation(
                                                    variables:
                                                        Variables$Mutation$closeInvitation(
                                                            id: invitation
                                                                .id)));
                                        if (result.hasException) {
                                          // TODO: error handling
                                          return;
                                        }
                                        invitationStatus.value =
                                            Enum$InvitationStatus.CLOSED;
                                        showToast("募集を停止しました", ToastLevel.info);
                                      } else {
                                        final result = await graphqlClient
                                            .mutate$activateInvitation(
                                                Options$Mutation$activateInvitation(
                                                    variables:
                                                        Variables$Mutation$activateInvitation(
                                                            id: invitation
                                                                .id)));
                                        if (result.hasException) {
                                          // TODO: error handling
                                          return;
                                        }
                                        invitationStatus.value =
                                            Enum$InvitationStatus.ACTIVE;
                                        showToast("募集を再開しました", ToastLevel.info);
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.delete, color: Colors.black),
                                        Gap(5),
                                        Text("削除",
                                            style:
                                                TextStyle(color: Colors.black))
                                      ],
                                    ),
                                    onPressed: () async {
                                      final dialogResult =
                                          await showOkCancelAlertDialog(
                                              context: context,
                                              title: "おさそいの削除",
                                              message:
                                                  "おさそいを削除すると、参加可否、チャットの内容が全て削除されます。おさそいを削除してもよろしいですか？",
                                              cancelLabel: "キャンセル",
                                              isDestructiveAction: true);
                                      if (dialogResult != OkCancelResult.ok) {
                                        return;
                                      }
                                      final result = await graphqlClient
                                          .mutate$deleteInvitation(
                                              Options$Mutation$deleteInvitation(
                                                  variables:
                                                      Variables$Mutation$deleteInvitation(
                                                          id: invitation.id)));
                                      if (result.hasException) {
                                        // TODO: error handling
                                        return;
                                      }
                                      const HomeRoute().go(context);
                                      showToast("おさそいを削除しました", ToastLevel.info);
                                    },
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      invitation.coordinate != null
                          ? SizedBox(
                              height: 280,
                              child: Stack(children: [
                                GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          invitation.coordinate!.latitude,
                                          invitation.coordinate!.longitude),
                                      zoom: 16,
                                    ),
                                    myLocationEnabled: false,
                                    myLocationButtonEnabled: false,
                                    markers: {
                                      Marker(
                                          markerId: const MarkerId("location"),
                                          position: LatLng(
                                              invitation.coordinate!.latitude,
                                              invitation.coordinate!.longitude),
                                          icon: invitationLocationMarker.value)
                                    }),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: TextButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                    ),
                                    onPressed: () {
                                      _launchMapApp(
                                          invitation.coordinate!.latitude,
                                          invitation.coordinate!.longitude);
                                    },
                                    child: const Text(
                                      '地図アプリで開く',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          : const SizedBox(height: 10),
                    ],
                  ),
                  invitation.chatRoomId != null
                      ? Expanded(
                          child: Chat(
                          chatRoomId: invitation.chatRoomId!,
                          users: [invitation.user, ...invitation.acceptedUsers],
                        ))
                      : const SizedBox()
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, left: 5),
                child: AppBarLeading(),
              ),
            ],
          ),
        ));
  }
}

_launchMapApp(double latitude, double longitude) async {
  final googleUrl =
      Uri.parse('comgooglemaps://?q=$latitude,$longitude&zoom=16');
  final appleUrl =
      Uri.parse('https://maps.apple.com/?sll=$latitude},$longitude}');
  if (await canLaunchUrl(Uri.parse("comgooglemaps://"))) {
    await launchUrl(googleUrl);
  } else if (await canLaunchUrl(appleUrl)) {
    await launchUrl(appleUrl);
  } else {
    throw 'Could not launch url';
  }
}
