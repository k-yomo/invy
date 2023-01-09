import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invy/components/invitation_card_fragment.graphql.dart';

final dateTimeFormat = 'MM月dd日 HH時mm分';

class ReceivedInvitationCard extends StatelessWidget {
  ReceivedInvitationCard({
    super.key,
    required this.invitation,
    this.accepted = false,
    this.onAccepted,
    this.onDenied,
  });

  final Fragment$invitationCardFragment invitation;
  bool accepted;
  ValueSetter<String>? onAccepted;
  ValueSetter<String>? onDenied;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(invitation.user.avatarUrl),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 5),
                child: Text(
                  invitation.user.nickname,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5, left: 4, bottom: 5),
                child: Row(children: [
                  Icon(Icons.location_pin, size: 25),
                  Text(invitation.location),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 6, bottom: 5),
                child: Row(
                  children: [
                    Icon(Icons.today, size: 25),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(DateFormat(dateTimeFormat)
                          .format(DateTime.parse(invitation.startsAt).toLocal())),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.notes, size: 20),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(invitation.comment),
                )
              ],
            ),
          ),
          Column(
            children: invitation.acceptedUsers.length > 0
                ? [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Text("参加者",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Row(
                              children: invitation.acceptedUsers
                                  .map((acceptedUser) => Container(
                                        width: 50,
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  acceptedUser.avatarUrl),
                                            ),
                                            Text(
                                              acceptedUser.nickname,
                                              style: TextStyle(fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
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
          ...(accepted
              ? []
              : [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("回答期限: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            DateFormat(dateTimeFormat)
                                .format(DateTime.parse(invitation.expiresAt).toLocal()),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            onDenied?.call(invitation.id);
                          },
                          child: Text(
                            '断る',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.shade600),
                          ),
                        ),
                      ),
                      Container(margin: EdgeInsets.symmetric(horizontal: 5)),
                      Expanded(
                        child: TextButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            onAccepted?.call(invitation.id);
                          },
                          child: Text(
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
                  )
                ]),
        ],
      ),
    );
  }
}
