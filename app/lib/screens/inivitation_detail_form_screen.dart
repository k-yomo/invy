import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invy/graphql/invitation_screen.graphql.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../components/app_bar_leading.dart';
import '../components/friend_group_fragment.graphql.dart';
import '../components/friend_group_icon.dart';
import '../components/friend_list_item_fragment.graphql.dart';
import '../graphql/schema.graphql.dart';
import '../services/graphql_client.dart';
import '../state/bottom_navigation.dart';
import '../state/location.dart';

const dateTimeFormat = 'yyyy年MM月dd日 HH時mm分';

class InvitationDetailFormScreen extends HookConsumerWidget {
  const InvitationDetailFormScreen({
    super.key,
    required this.selectedFriendGroups,
    required this.selectedFriends,
  });

  final List<Fragment$friendGroupListItemFragment> selectedFriendGroups;
  final List<Fragment$friendListItemFragment> selectedFriends;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final invitationLocation = ref.watch(invitationLocationProvider);

    onSubmittedForm({
      required String location,
      required DateTime startsAt,
      required DateTime expiresAt,
      String? comment,
    }) async {
      final result = await graphqlClient
          .mutate$sendInvitation(Options$Mutation$sendInvitation(
        variables: Variables$Mutation$sendInvitation(
          input: Input$SendInvitationInput(
            location: location,
            latitude: invitationLocation.latitude,
            longitude: invitationLocation.longitude,
            startsAt: startsAt,
            expiresAt: expiresAt,
            comment: comment ?? '',
            targetFriendGroupIds:
                selectedFriendGroups.map((fg) => fg.id).toList(),
            targetFriendUserIds: selectedFriends.map((fg) => fg.id).toList(),
          ),
        ),
      ));
      if (result.hasException) {
        print(result.exception);
        // TODO: Show error
        return;
      }
      ref.read(bottomNavigationTabProvider.notifier).state =
          BottomNavigationTab.home;
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const Text(
          '詳細設定',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: const Text("選択中",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Row(
                        children: selectedFriendGroups
                            .map((friendGroup) => SizedBox(
                                  width: 50,
                                  child: Column(
                                    children: [
                                      FriendGroupIcon(friendGroup.name),
                                      Text(
                                        friendGroup.name,
                                        style: const TextStyle(fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      Row(
                        children: selectedFriends
                            .map((friend) => SizedBox(
                                  width: 50,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(friend.avatarUrl),
                                      ),
                                      Text(
                                        friend.nickname,
                                        style: const TextStyle(fontSize: 14),
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
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: InvitationDetailForm(
                  onSubmitted: onSubmittedForm,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InvitationDetailForm extends StatefulHookConsumerWidget {
  const InvitationDetailForm({super.key, required this.onSubmitted});

  final Future Function({
    required String location,
    required DateTime startsAt,
    required DateTime expiresAt,
    String? comment,
  }) onSubmitted;

  @override
  InvitationDetailFormState createState() {
    return InvitationDetailFormState();
  }
}

class InvitationDetailFormState extends ConsumerState<InvitationDetailForm> {
  final _formKey = GlobalKey<FormState>();
  final locationController = TextEditingController();
  final startsAtController = TextEditingController();
  final expiresAtController = TextEditingController();
  final commentFocusNode = FocusNode();

  bool isLoading = false;

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final invitationLocationName = ref.read(locationNameProvider);
    final now = DateTime.now();

    // form values
    String location = '';
    DateTime startsAt = now;
    DateTime expiresAt = now;
    String? comment;

    useEffect(() {
      locationController.text = invitationLocationName;
      return null;
    }, []);

    return KeyboardActions(
      disableScroll: true,
      config: buildKeyboardActionsConfig(context),
      child: Form(
        key: _formKey,
        child: Container(
          child: Column(children: [
            TextFormField(
              controller: locationController,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                labelText: '開催地',
                labelStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '開催地を入力してください';
                }
                return null;
              },
              onSaved: (value) {
                location = value!;
              },
            ),
            const Gap(10),
            Row(
              children: [
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    startsAtController.text =
                        DateFormat(dateTimeFormat).format(now);
                  },
                  child: const Text("開催中"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    startsAtController.text = DateFormat(dateTimeFormat)
                        .format(now.add(const Duration(hours: 1)));
                  },
                  child: const Text("1時間後"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    startsAtController.text = DateFormat(dateTimeFormat)
                        .format(now.add(const Duration(hours: 3)));
                  },
                  child: const Text("3時間後"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    startsAtController.text = DateFormat(dateTimeFormat)
                        .format(now.add(const Duration(hours: 12)));
                  },
                  child: const Text("12時間後"),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: startsAtController,
                readOnly: true,
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: now,
                    maxTime: now.add(const Duration(days: 7)),
                    onConfirm: (date) {
                      startsAtController.text =
                          DateFormat(dateTimeFormat).format(date);
                    },
                    currentTime: startsAtController.text.isNotEmpty
                        ? DateFormat(dateTimeFormat)
                            .parse(startsAtController.text)
                        : now,
                    locale: LocaleType.jp,
                  );
                },
                decoration: InputDecoration(
                  labelText: '開始日時',
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '開始日時を入力してください';
                  }
                  try {
                    DateFormat(dateTimeFormat).parse(value);
                  } catch (e) {
                    return '不正なフォーマットです。日時を選択し直して下さい';
                  }
                  return null;
                },
                onSaved: (value) {
                  startsAt = DateFormat(dateTimeFormat).parse(value!).toUtc();
                },
              ),
            ),
            const Gap(10),
            Row(
              children: [
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    expiresAtController.text = startsAtController.text;
                  },
                  child: const Text("開始日時と同じ"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    expiresAtController.text = DateFormat(dateTimeFormat)
                        .format(DateTime(now.year, now.month, now.day + 1)
                            .subtract(const Duration(milliseconds: 1)));
                  },
                  child: const Text("今日中"),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: expiresAtController,
                readOnly: true,
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: now.add(const Duration(minutes: 30)),
                    maxTime: now.add(const Duration(days: 7)),
                    onConfirm: (date) {
                      expiresAtController.text =
                          DateFormat(dateTimeFormat).format(date);
                    },
                    currentTime: expiresAtController.text.isNotEmpty
                        ? DateFormat(dateTimeFormat)
                            .parse(expiresAtController.text)
                        : now.add(const Duration(minutes: 30)),
                    locale: LocaleType.jp,
                  );
                },
                decoration: InputDecoration(
                  labelText: '返答期限',
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '返答期限を設定してください';
                  }
                  try {
                    DateFormat(dateTimeFormat).parse(value);
                  } catch (e) {
                    return '不正なフォーマットです。日時を選択し直して下さい';
                  }
                  return null;
                },
                onSaved: (value) {
                  expiresAt = DateFormat(dateTimeFormat).parse(value!).toUtc();
                },
              ),
            ),
            const Gap(10),
            TextFormField(
              keyboardType: TextInputType.multiline,
              focusNode: commentFocusNode,
              minLines: 2,
              maxLines: null,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                labelText: 'コメント(任意)',
                labelStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: InputBorder.none,
              ),
              onSaved: (value) {
                comment = value;
              },
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setLoading(true);
                    _formKey.currentState!.save();
                    widget
                        .onSubmitted(
                          location: location,
                          startsAt: startsAt,
                          expiresAt: expiresAt,
                          comment: comment,
                        )
                        .whenComplete(() => setLoading(false));
                  }
                },
                child: isLoading
                    ? const SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 3,
                        ),
                      )
                    : const Text(
                        '招待を送信する',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  KeyboardActionsConfig buildKeyboardActionsConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: commentFocusNode,
          displayArrows: false,
          toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "完了",
                  ),
                ),
              );
            }
          ],
        ),
      ],
    );
  }
}
