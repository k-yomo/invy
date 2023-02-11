import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/widgets/invitation_awaiting_list_item.dart';
import 'package:invy/widgets/invitation_awaiting_list_item.graphql.dart';

class InvitationAwaitingListCarousel extends HookConsumerWidget {
  const InvitationAwaitingListCarousel({
    super.key,
    required this.invitationAwaitings,
  });

  final List<Fragment$invitationAwaitingListItemFragment> invitationAwaitings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: invitationAwaitings
            .map((invitationAwaiting) => InvitationAwaitingListItem(
                invitationAwaiting: invitationAwaiting))
            .toList(),
      ),
    );
  }
}
