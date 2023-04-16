import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NicknameEditForm extends StatefulHookConsumerWidget {
  const NicknameEditForm({super.key, required this.onSubmitted, this.nickname});

  final Future<void> Function(String nickname) onSubmitted;
  final String? nickname;

  @override
  ConsumerState<NicknameEditForm> createState() => NicknameEditFormState();
}

class NicknameEditFormState extends ConsumerState<NicknameEditForm> {
  late TextEditingController _nicknameController;

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController(text: widget.nickname);
    _nicknameController.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.nickname?.length ?? 0),
    );
  }

  String? validateNickname(value) {
    if (value == null || value.isEmpty) {
      return 'ニックネームを入力してください';
    }
    if (value.length < 3) {
      return '3文字以上入力してください';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final nicknameFormKey = useMemoized(() => GlobalKey<FormState>());

    onNicknameSubmitted() async {
      final nickname = _nicknameController.text;
      if (validateNickname(nickname) != null) {
        return;
      }
      await widget.onSubmitted(nickname);
    }

    return Column(
      children: [
        Expanded(
          child: Form(
            key: nicknameFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              autofocus: true,
              controller: _nicknameController,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                labelText: 'ニックネーム',
                labelStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: InputBorder.none,
              ),
              maxLength: 50,
              validator: validateNickname,
              onEditingComplete: () async {
                await onNicknameSubmitted();
              },
            ),
          ),
        ),
        SingleChildScrollView(
          controller: ModalScrollController.of(context),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TextButton(
            onPressed: () async {
              await onNicknameSubmitted();
            },
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(0),
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              '更新する',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
