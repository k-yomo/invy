import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invy/components/invitation_card_fragment.graphql.dart';

const dateTimeFormat = 'MM月dd日 HH時mm分';

class SentInvitationCard extends StatelessWidget {
  SentInvitationCard({
    super.key,
    required this.invitation,
    this.accepted = false,
  });

  final Fragment$invitationCardFragment invitation;
  bool accepted;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5, left: 4, bottom: 5),
                child: Row(children: [
                  const Icon(Icons.location_pin, size: 25),
                  Text(invitation.location),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 6, bottom: 5),
                child: Row(
                  children: [
                    const Icon(Icons.today, size: 25),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(DateFormat(dateTimeFormat)
                          .format(invitation.startsAt.toLocal())),
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
                const Icon(Icons.notes, size: 20),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(invitation.comment),
                ))
              ],
            ),
          ),
          Column(
            children: invitation.acceptedUsers.isNotEmpty
                ? [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: const Text("参加者",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Row(
                              children: invitation.acceptedUsers
                                  .map((acceptedUser) => SizedBox(
                                        width: 50,
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  acceptedUser.avatarUrl),
                                            ),
                                            Text(
                                              acceptedUser.nickname,
                                              style: const TextStyle(fontSize: 12),
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
        ],
      ),
    );
  }
}
