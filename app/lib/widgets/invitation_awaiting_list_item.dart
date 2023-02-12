import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/util/toast.dart';
import 'package:invy/widgets/invitation_awaiting_list_item.graphql.dart';

class InvitationAwaitingListItem extends HookConsumerWidget {
  const InvitationAwaitingListItem({
    super.key,
    required this.invitationAwaiting,
  });

  final Fragment$invitationAwaitingListItemFragment invitationAwaiting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final isLoggedInUserItem =
        invitationAwaiting.userId == ref.read(loggedInUserProvider)?.id;
    final isDeleted = useState(false);

    final startsAt = invitationAwaiting.startsAt.toLocal();
    final endsAt = invitationAwaiting.endsAt.toLocal();

    onPressedDeleteButton() async {
      final result = await graphqlClient.mutate$deleteInvitationAwaiting(
          Options$Mutation$deleteInvitationAwaiting(
              variables: Variables$Mutation$deleteInvitationAwaiting(
                  invitationAwaitingId: invitationAwaiting.id)));
      if (result.hasException) {
        // TODO: Error handling
        print(result.exception);
        return;
      }
      isDeleted.value = true;
      showToast("おさそい待ちを削除しました", ToastLevel.info);
    }

    if (isDeleted.value) {
      return const SizedBox();
    }

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
              "${startsAt.day}日${startsAt.hour}時〜${endsAt.day}日${endsAt.hour}時"),
        ),
        isLoggedInUserItem
            ? CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 15),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    minimumSize: MaterialStateProperty.all(Size.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: onPressedDeleteButton,
                  splashRadius: 0.1,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
