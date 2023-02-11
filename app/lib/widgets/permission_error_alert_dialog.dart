import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionErrorAlertDialog extends StatelessWidget {
  const PermissionErrorAlertDialog({
    super.key,
    required this.permissionName,
  });

  final String permissionName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('"$permissionName"へのアクセスがありません。'),
      content: Text("設定から$permissionNameへのアクセスを許可してください。"),
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
  }
}
