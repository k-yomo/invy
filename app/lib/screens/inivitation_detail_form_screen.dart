import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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

final dateTimeFormat = 'yyyy年MM月dd日 HH時mm分';

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
        leading: AppBarLeading(),
        title: Text(
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
          padding: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text("選択中",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Row(
                        children: selectedFriendGroups
                            .map((friendGroup) => Container(
                                  width: 50,
                                  child: Column(
                                    children: [
                                      FriendGroupIcon(friendGroup.name),
                                      Text(
                                        friendGroup.name,
                                        style: TextStyle(fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      Row(
                        children: selectedFriends
                            .map((friend) => Container(
                                  width: 50,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(friend.avatarUrl),
                                      ),
                                      Text(
                                        friend.nickname,
                                        style: TextStyle(fontSize: 14),
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
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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

class InvitationDetailForm extends StatefulWidget {
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

class InvitationDetailFormState extends State<InvitationDetailForm> {
  final _formKey = GlobalKey<FormState>();
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
    final now = DateTime.now();

    // form values
    String location = '';
    DateTime startsAt = now;
    DateTime expiresAt = now;
    String? comment;

    return KeyboardActions(
      disableScroll: true,
      config: buildKeyboardActionsConfig(context),
      child: Form(
        key: _formKey,
        child: Container(
          child: Column(children: [
            TextFormField(
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
            Gap(10),
            Container(
              width: double.infinity,
              child: TextFormField(
                controller: startsAtController,
                readOnly: true,
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: now,
                    maxTime: now.add(Duration(days: 7)),
                    onConfirm: (date) {
                      startsAtController.text =
                          DateFormat(dateTimeFormat).format(date);
                    },
                    currentTime: now,
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
                  // TODO: adding 9 hour to get the JST time, but there must be smarter way to store
                  // time with timezone;
                  startsAt = DateFormat(dateTimeFormat).parse(value!).toUtc();
                },
              ),
            ),
            Gap(10),
            Container(
              width: double.infinity,
              child: TextFormField(
                controller: expiresAtController,
                readOnly: true,
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: now.add(Duration(minutes: 30)),
                    maxTime: now.add(Duration(days: 7)),
                    onConfirm: (date) {
                      expiresAtController.text =
                          DateFormat(dateTimeFormat).format(date);
                    },
                    currentTime: now.add(Duration(minutes: 30)),
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
                  // TODO: adding 9 hour to get the JST time, but there must be smarter way to store
                  // time with timezone;
                  expiresAt = DateFormat(dateTimeFormat).parse(value!).toUtc();
                },
              ),
            ),
            Gap(10),
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
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
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
                    ? CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 3,
                      )
                    : Text(
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
                  padding: EdgeInsets.all(8.0),
                  child: Text(
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