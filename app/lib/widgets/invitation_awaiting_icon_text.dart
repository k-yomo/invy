import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invy/widgets/friend_list_item_fragment.graphql.dart';

class InvitationAwaitingIconText extends StatelessWidget {
  const InvitationAwaitingIconText({
    super.key,
    required this.invitationAwaiting,
  });

  final Fragment$friendListItemFragment$invitationAwaitings invitationAwaiting;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().toLocal();
    final startsAt = invitationAwaiting.startsAt.toLocal();
    final endsAt = invitationAwaiting.endsAt.toLocal();
    final endOfDay = DateTime(now.year, now.month, now.day + 1)
        .add(const Duration(milliseconds: -1));
    String displayText;
    if (startsAt.isBefore(now) && endsAt.isBefore(endOfDay)) {
      displayText = "${endsAt.hour}時まで";
    } else if (startsAt.isBefore(endOfDay)) {
      displayText = "${startsAt.hour}〜${endsAt.hour}時";
    } else {
      displayText =
          "${startsAt.day}日${startsAt.hour}時〜${endsAt.day}日${endsAt.hour}時";
    }
    if (invitationAwaiting.comment.isNotEmpty) {
      displayText = "$displayText / ${invitationAwaiting.comment}";
    }
    return Row(
      children: [
        ShaderMask(
          child: const Icon(
            Icons.emoji_people,
            size: 20,
            color: Colors.white,
          ),
          shaderCallback: (Rect rect) {
            return const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                Colors.pink,
                Colors.orange,
              ],
            ).createShader(rect);
          },
        ),
        const Gap(1),
        Text(
          displayText,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
