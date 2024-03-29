import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invy/router.dart';
import 'package:invy/widgets/invitation_detail_fragment.graphql.dart';
import 'package:invy/screens/invitation/invitation_detail_screen.dart';

const dateFormat = 'M月d日';
const timeFormat = 'H時m分';

String _convertToDisplayTime(DateTime time) {
  final localTime = time.toLocal();
  final now = DateTime.now().toLocal();
  if (localTime.day == now.day) {
    return DateFormat('今日 H時m分').format(localTime);
  }
  return '${DateFormat(dateFormat).format(localTime)}(${DateFormat.E('ja').format(localTime)}) ${DateFormat(timeFormat).format(localTime)}';
}

class InvitationListItem extends StatelessWidget {
  const InvitationListItem({
    super.key,
    required this.invitation,
    this.accepted = false,
    this.onAccepted,
    this.onDenied,
  });

  final Fragment$invitationDetailFragment invitation;
  final bool accepted;
  final ValueSetter<String>? onAccepted;
  final ValueSetter<String>? onDenied;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
            onPressed: () {
              InvitationDetailRoute(invitation.id).go(context);
            },
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          CachedNetworkImageProvider(invitation.user.avatarUrl),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              invitation.user.nickname,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.fmd_good, size: 20),
                                Text(
                                  invitation.location.isNotEmpty
                                      ? invitation.location
                                      : (invitation.user.distanceKm != null
                                          ? "${invitation.user.distanceKm! > 0 ? "〜" : ""}${invitation.user.distanceKm}km"
                                          : ""),
                                  style: const TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                      child: Text(
                        "${_convertToDisplayTime(invitation.startsAt)}〜",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                invitation.comment.isNotEmpty
                    ? Container(
                        margin:
                            const EdgeInsets.only(top: 5, left: 5, right: 5),
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
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: invitation.acceptedUsers.isNotEmpty
                        ? [
                            const SizedBox(
                              width: double.infinity,
                              child: Text("参加者",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: invitation.acceptedUsers
                                          .map((acceptedUser) => SizedBox(
                                                width: 30,
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
                            ),
                          ]
                        : [],
                  ),
                ),
              ],
            ),
          ),
          ...(accepted
              ? []
              : [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("返答期限: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(_convertToDisplayTime(invitation.expiresAt)),
                    ],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              onDenied?.call(invitation.id);
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.grey.shade600),
                            ),
                            child: Text(
                              '断る',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5)),
                        Expanded(
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              onAccepted?.call(invitation.id);
                            },
                            child: const Text(
                              '参加する',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
        ],
      ),
    );
  }
}
