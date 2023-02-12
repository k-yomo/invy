import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invy/screens/invitation/invitation_awaiting_form_screen.graphql.dart';
import 'package:invy/util/toast.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../graphql/schema.graphql.dart';
import '../../services/graphql_client.dart';
import '../../state/bottom_navigation.dart';
import '../../widgets/app_bar_leading.dart';

const dateTimeFormat = 'yyyy年MM月dd日 HH時mm分';

class InvitationAwaitingFormScreen extends HookConsumerWidget {
  const InvitationAwaitingFormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);

    onSubmittedForm({
      required DateTime startsAt,
      required DateTime endsAt,
      String? comment,
    }) async {
      if (endsAt.isBefore(startsAt)) {
        showToast("終了時間を開始時間よりも後に設定してください", ToastLevel.error);
        return;
      }
      if (await Permission.locationAlways.isDenied) {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('おおまかな位置情報を共有しますか'),
              content: const Text("おおまかな位置情報を共有すると、近くにいる人からのさそわれやすくなります。"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  child: const Text("キャンセル"),
                ),
                TextButton(
                  onPressed: () async {
                    await openAppSettings();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  child: const Text("設定に移動する"),
                ),
              ],
            );
          },
        );
      }
      final result = await graphqlClient.mutate$registerInvitationAwaiting(
          Options$Mutation$registerInvitationAwaiting(
        variables: Variables$Mutation$registerInvitationAwaiting(
          input: Input$RegisterInvitationAwaitingInput(
            startsAt: startsAt,
            endsAt: endsAt,
            comment: comment ?? '',
          ),
        ),
      ));
      if (result.hasException) {
        final errorExtensions =
            result.exception!.graphqlErrors.first.extensions;
        if (errorExtensions != null &&
            errorExtensions["code"] ==
                toJson$Enum$ErrorCode(Enum$ErrorCode.ALREADY_EXISTS)) {
          showToast("登録済みの期間と被っています", ToastLevel.error);
        }
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
          '時間帯の設定',
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: InvitationAwaitingForm(
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

class InvitationAwaitingForm extends StatefulHookConsumerWidget {
  const InvitationAwaitingForm({super.key, required this.onSubmitted});

  final Future Function({
    required DateTime startsAt,
    required DateTime endsAt,
    String? comment,
  }) onSubmitted;

  @override
  InvitationAwaitingFormState createState() {
    return InvitationAwaitingFormState();
  }
}

class InvitationAwaitingFormState
    extends ConsumerState<InvitationAwaitingForm> {
  final _formKey = GlobalKey<FormState>();
  final startsAtController = TextEditingController();
  final endsAtController = TextEditingController();
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

    DateTime startsAt = now;
    DateTime endsAt = now;
    String? comment;

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
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    endsAtController.text = DateFormat(dateTimeFormat)
                        .format(now.add(const Duration(hours: 1)));
                  },
                  child: const Text("2時間後"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    endsAtController.text = DateFormat(dateTimeFormat)
                        .format(now.add(const Duration(hours: 3)));
                  },
                  child: const Text("5時間後"),
                ),
                const Gap(5),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    endsAtController.text = DateFormat(dateTimeFormat).format(
                        DateTime(now.year, now.month, now.day + 1)
                            .subtract(const Duration(milliseconds: 1)));
                  },
                  child: const Text("今日中"),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: endsAtController,
                readOnly: true,
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: now.add(const Duration(minutes: 30)),
                    maxTime: now.add(const Duration(days: 7)),
                    onConfirm: (date) {
                      endsAtController.text =
                          DateFormat(dateTimeFormat).format(date);
                    },
                    currentTime: endsAtController.text.isNotEmpty
                        ? DateFormat(dateTimeFormat)
                            .parse(endsAtController.text)
                        : now.add(const Duration(minutes: 30)),
                    locale: LocaleType.jp,
                  );
                },
                decoration: InputDecoration(
                  labelText: '終了時間',
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '終了時間を設定してください';
                  }
                  try {
                    DateFormat(dateTimeFormat).parse(value);
                  } catch (e) {
                    return '不正なフォーマットです。日時を選択し直して下さい';
                  }
                  return null;
                },
                onSaved: (value) {
                  endsAt = DateFormat(dateTimeFormat).parse(value!).toUtc();
                },
              ),
            ),
            const Gap(10),
            TextFormField(
              keyboardType: TextInputType.multiline,
              focusNode: commentFocusNode,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                labelText: 'コメント(任意)',
                labelStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: InputBorder.none,
              ),
              maxLength: 30,
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
                          startsAt: startsAt,
                          endsAt: endsAt,
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
                        'おさそいを待つ',
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
