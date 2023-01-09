import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invy/components/app_bar_leading.dart';
import 'package:invy/components/friend_list_item_fragment.graphql.dart';
import 'package:invy/components/friend_selection_list.dart';
import 'package:invy/graphql/invitation_screen.graphql.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/screens/home_screen.dart';

import '../components/friend_group_fragment.graphql.dart';
import '../components/friend_group_icon.dart';
import '../components/friend_group_selection_list.dart';
import '../services/graphql_client.dart';

final dateTimeFormat = 'yyyy年MM月dd日 HH時mm分';

class InvitationScreen extends HookConsumerWidget {
  const InvitationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final viewerQuery = graphqlClient.watchQuery$invitationScreenViewer();
    viewerQuery.fetchResults();

    final selectedFriendGroups =
        useState<List<Fragment$friendGroupListItemFragment>>([]);
    final selectedFriends = useState<List<Fragment$friendListItemFragment>>([]);
    final selectedCount =
        selectedFriendGroups.value.length + selectedFriends.value.length;

    return StreamBuilder<QueryResult<Query$invitationScreenViewer>>(
        stream: viewerQuery.stream,
        builder: (context, snapshot) {
          final viewer = snapshot.data?.parsedData?.viewer;
          return Scaffold(
            appBar: AppBar(
              leading: AppBarLeading(),
              title: Text(
                selectedCount > 0 ? '選択中(${selectedCount})' : '友だちを選択',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    if (selectedCount == 0) {
                      return;
                    }
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return InvitationDetailFormModal(
                            selectedFriendGroups: selectedFriendGroups.value,
                            selectedFriends: selectedFriends.value,
                          );
                        });
                  },
                  child: Text(
                    "次へ",
                    style: TextStyle(
                        fontSize: 16,
                        color: selectedCount == 0
                            ? Colors.grey.shade600
                            : Colors.blue.shade600,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              shape: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TODO: show selected groups and friends at the top
                      // Column(
                      //   children: [
                      //     Row(
                      //       children: selectedFriendGroups.value.map((friendGroup) =>
                      //           FriendGroupIcon(friendGroup.name)).toList(),
                      //     ),
                      //     Row(
                      //       children: selectedFriends.value.map((friend) =>
                      //           CircleAvatar(
                      //             backgroundImage: NetworkImage(friend.avatarUrl),
                      //           )
                      //       ).toList(),
                      //     ),
                      //   ],
                      // ),
                      FriendGroupSelectionList(
                        friendGroups: viewer?.friendGroups.toList() ?? [],
                        selectedFriendGroups: selectedFriendGroups.value,
                        onChange: (list) {
                          selectedFriendGroups.value = list;
                          selectedFriendGroups.notifyListeners();
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FriendSelectionList(
                          friends: viewer?.friends.edges
                                  .map((e) => e.node)
                                  .toList() ??
                              [],
                          selectedFriends: selectedFriends.value,
                          onChange: (list) {
                            selectedFriends.value = list;
                            selectedFriends.notifyListeners();
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class InvitationDetailFormModal extends HookConsumerWidget {
  const InvitationDetailFormModal({
    super.key,
    required this.selectedFriendGroups,
    required this.selectedFriends,
  });

  final List<Fragment$friendGroupListItemFragment> selectedFriendGroups;
  final List<Fragment$friendListItemFragment> selectedFriends;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    return Container(
      margin: EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text("詳細設定",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text("選択中",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
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
                  InvitationDetailForm(
                    onSubmitted: ({
                      required String location,
                      required DateTime startsAt,
                      required DateTime expiresAt,
                      String? comment,
                    }) async {
                      final result = await graphqlClient.mutate$sendInvitation(
                          Options$Mutation$sendInvitation(
                        variables: Variables$Mutation$sendInvitation(
                          input: Input$SendInvitationInput(
                            location: location,
                            startsAt: startsAt.toIso8601String(),
                            expiresAt: expiresAt.toIso8601String(),
                            comment: comment ?? '',
                            targetFriendGroupIds: selectedFriendGroups
                                .map((fg) => fg.id)
                                .toList(),
                            targetFriendUserIds:
                                selectedFriends.map((fg) => fg.id).toList(),
                          ),
                        ),
                      ));
                      if (result.hasException) {
                        print(result.exception);
                        // TODO: Show error
                        return;
                      }
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return HomeScreen();
                      }), (r) => false);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InvitationDetailForm extends StatefulWidget {
  const InvitationDetailForm({super.key, required this.onSubmitted});

  final Function({
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

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    // form values
    String location = '';
    DateTime startsAt = now;
    DateTime expiresAt = now;
    String? comment;

    return KeyboardActions(
      // isDialog: true,
      disableScroll: true,
      config: buildKeyboardActionsConfig(context),
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                labelText: 'コメント',
                labelStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: InputBorder.none,
              ),
              onSaved: (value) {
                comment = value;
              },
            ),
            Gap(20),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onSubmitted(
                      location: location,
                      startsAt: startsAt,
                      expiresAt: expiresAt,
                      comment: comment,
                    );
                  }
                },
                child: Text(
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
