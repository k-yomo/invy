import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ScreenIdEditForm extends StatefulHookConsumerWidget {
  const ScreenIdEditForm({super.key, required this.onSubmitted, this.screenId});

  final Future<void> Function(String nickname) onSubmitted;
  final String? screenId;

  @override
  ConsumerState<ScreenIdEditForm> createState() => ScreenIdEditFormState();
}

class ScreenIdEditFormState extends ConsumerState<ScreenIdEditForm> {
  late TextEditingController _screenIdController;

  @override
  void initState() {
    super.initState();
    _screenIdController = TextEditingController(text: widget.screenId);
    _screenIdController.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.screenId?.length ?? 0),
    );
  }

  String? validateScreenId(value) {
    final screenIdRegex = RegExp(r'(^[a-zA-Z0-9_]*$)');
    if (value == null || value.isEmpty) {
      return 'ユーザーIDを入力してください';
    }
    if (value.length < 3) {
      return '3文字以上入力してください';
    }
    if (!screenIdRegex.hasMatch(value)) {
      return '英数字、アンダースコア（_）のみ使用可能です';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenIdFormKey = useMemoized(() => GlobalKey<FormState>());

    Future<void> onScreenIdSubmitted() async {
      final screenId = _screenIdController.text;
      if (validateScreenId(screenId) != null) {
        return;
      }
      await widget.onSubmitted(screenId);
    }

    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: screenIdFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  autofocus: true,
                  controller: _screenIdController,
                  cursorColor: Colors.grey.shade600,
                  decoration: InputDecoration(
                    labelText: 'ユーザーID',
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: InputBorder.none,
                  ),
                  maxLength: 15,
                  validator: validateScreenId,
                  onEditingComplete: () async {
                    await onScreenIdSubmitted();
                  },
                ),
              ),
              const Text("英数字、アンダースコア（_）のみ使用可能です。",
                  style: TextStyle(fontSize: 12))
            ],
          ),
        ),
        SingleChildScrollView(
          controller: ModalScrollController.of(context),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TextButton(
            onPressed: () async {
              await onScreenIdSubmitted();
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
