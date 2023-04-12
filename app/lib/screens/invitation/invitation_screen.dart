import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/invitation/invitation_friend_select_screen.dart';
import 'package:invy/screens/invitation/invitation_screen.graphql.dart';
import 'package:invy/state/invitation.dart';
import 'package:invy/util/custom_date_time_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../widgets/app_bar_leading.dart';
import '../../widgets/friend_group_icon.dart';
import '../../graphql/schema.graphql.dart';
import '../../services/graphql_client.dart';

const dateTimeFormat = 'yyyy年MM月dd日 HH時mm分';

class InvitationScreen extends HookConsumerWidget {
  const InvitationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final invitationScreenViewerQuery = useMemoized(() =>
        graphqlClient.watchQuery$invitationScreenViewer(
            WatchOptions$Query$invitationScreenViewer(
          eagerlyFetchResults: true,
        )));
    final invitationViewer = useStream(invitationScreenViewerQuery.stream);
    final isInvitationViewerLoading =
        invitationViewer.connectionState == ConnectionState.waiting;
    final invitationLocation = ref.watch(invitationLocationProvider);
    final selectedFriendGroups =
        ref.watch(invitationSelectedFriendGroupsProvider);
    final selectedFriends = ref.watch(invitationSelectedFriendsProvider);

    onSubmittedForm({
      required String location,
      required DateTime startsAt,
      String? comment,
    }) async {
      if (invitationViewer.data?.parsedData == null) {
        return;
      }
      final targetFriendGroupIds = (selectedFriendGroups.isNotEmpty
              ? selectedFriendGroups
              : invitationViewer.data!.parsedData!.viewer.friendGroups)
          .map((fg) => fg.id)
          .toList();
      final targetFriendUserIds = (selectedFriends.isNotEmpty
              ? selectedFriends
              : invitationViewer.data!.parsedData!.viewer.friends.edges
                  .map((e) => e.node))
          .map((f) => f.id)
          .toList();
      final result = await graphqlClient
          .mutate$sendInvitation(Options$Mutation$sendInvitation(
        variables: Variables$Mutation$sendInvitation(
          input: Input$SendInvitationInput(
            location: location,
            latitude: invitationLocation?.latitude,
            longitude: invitationLocation?.longitude,
            startsAt: startsAt,
            comment: comment ?? '',
            targetFriendGroupIds: targetFriendGroupIds,
            targetFriendUserIds: targetFriendUserIds,
          ),
        ),
      ));
      if (result.hasException) {
        print(result.exception);
        // TODO: Show error
        return;
      }
      const HomeRoute().go(context);
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
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, left: 20),
                      child: const Text("送信するする友達・グループ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, right: 20),
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        const InvitationFriendSelectRoute().go(context);
                      },
                      child: const Text(
                        '選択',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              selectedFriendGroups.isEmpty && selectedFriends.isEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: isInvitationViewerLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 3,
                              ),
                            )
                          : Text(
                              '友達全員',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                    )
                  : const Gap(10),
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
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                friend.avatarUrl),
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
                child: isInvitationViewerLoading
                    ? const SizedBox()
                    : InvitationDetailForm(
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
  final startsAtController = TextEditingController(
      text: DateFormat(dateTimeFormat).format(DateTime.now()));
  final commentFocusNode = FocusNode();

  bool isLoading = false;

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final invitationLocation = ref.watch(invitationLocationProvider);
    final invitationLocationName = ref.read(invitationLocationNameProvider);
    final now = DateTime.now();
    final next30MinutesTime = now.minute <= 30
        ? DateTime(now.year, now.month, now.day, now.hour, 30)
        : DateTime(now.year, now.month, now.day, now.hour + 1);

    // form values
    String location = '';
    DateTime startsAt = now;
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
                  child: const Text("今から"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    startsAtController.text = DateFormat(dateTimeFormat).format(
                        now
                            .add(const Duration(hours: 1))
                            .subtract(Duration(minutes: now.minute)));
                  },
                  child: Text("${now.add(const Duration(hours: 1)).hour}時"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    startsAtController.text = DateFormat(dateTimeFormat).format(
                        now
                            .add(const Duration(hours: 3))
                            .subtract(Duration(minutes: now.minute)));
                  },
                  child: Text("${now.add(const Duration(hours: 3)).hour}時"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    startsAtController.text = DateFormat(dateTimeFormat).format(
                        now
                            .add(const Duration(hours: 6))
                            .subtract(Duration(minutes: now.minute)));
                  },
                  child: Text("${now.add(const Duration(hours: 6)).hour}時"),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: startsAtController,
                readOnly: true,
                onTap: () {
                  DatePicker.showPicker(
                    pickerModel: CustomDateTimePickerModel(
                      minTime: now,
                      maxTime: now.add(const Duration(days: 7)),
                      currentTime: startsAtController.text.isNotEmpty
                          ? DateFormat(dateTimeFormat)
                              .parse(startsAtController.text)
                          : next30MinutesTime,
                      locale: LocaleType.jp,
                    ),
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      startsAtController.text =
                          DateFormat(dateTimeFormat).format(date);
                    },
                  );
                },
                decoration: InputDecoration(
                  labelText: '空き時間の開始日時',
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
                        '送信する',
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
