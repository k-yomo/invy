import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/app_bar_leading.dart';
import '../../components/invitation_detail_fragment.graphql.dart';

const dateTimeFormat = 'M月d日 H時m分';

String _convertToDisplayTime(DateTime time) {
  final localTime = time.toLocal();
  final now = DateTime.now().toLocal();
  if (localTime.day == now.day) {
    return DateFormat('H時m分').format(localTime);
  }
  return DateFormat(dateTimeFormat).format(localTime);
}

class InvitationDetailScreen extends HookConsumerWidget {
  const InvitationDetailScreen({
    super.key,
    required this.invitation,
    required this.accepted,
  });

  final Fragment$invitationDetailFragment invitation;
  final bool accepted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invitationLocationMarker = useState(BitmapDescriptor.defaultMarker);
    final mapDisplayed = invitation.coordinate != null;

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

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: !mapDisplayed
            ? AppBar(
                leading: const AppBarLeading(),
                title: const Text(
                  '招待の詳細',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                shape: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
              )
            : null,
        body: Column(
          children: [
            invitation.coordinate != null
                ? SizedBox(
                    height: 280,
                    child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(invitation.coordinate!.latitude,
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
                          const Positioned(
                            top: 40,
                            left: 10,
                            child: AppBarLeading(),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: TextButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                              ),
                              onPressed: () {
                                _launchMapApp(invitation.coordinate!.latitude,
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(invitation.user.avatarUrl),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 5),
                          child: Text(
                            invitation.user.nickname,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: const Text(
                                "開催日時",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "${_convertToDisplayTime(invitation.startsAt)}〜",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: const Text(
                                "開催場所",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            invitation.location,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  invitation.comment.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.notes, size: 20),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  invitation.comment,
                                  style: const TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
                  Column(
                    children: invitation.acceptedUsers.isNotEmpty
                        ? [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text("参加者",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Row(
                                      children: invitation.acceptedUsers
                                          .map((acceptedUser) => SizedBox(
                                                width: 50,
                                                child: Column(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
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
                            ),
                          ]
                        : [],
                  ),
                ],
              ),
            ),
          ],
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
