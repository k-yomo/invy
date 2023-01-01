import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invy/components/invitation_card_fragment.graphql.dart';

final dateTimeFormat = 'MM月dd日 HH時mm分';

class SentInvitationCard extends StatelessWidget {
  SentInvitationCard({
    Key? key,
    required this.invitation,
    this.accepted = false,
  }) : super(key: key);

  final Fragment$invitationCardFragment invitation;
  bool accepted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
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
                          .format(DateTime.parse(invitation.startsAt))),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.notes, size: 20),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(invitation.comment),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
