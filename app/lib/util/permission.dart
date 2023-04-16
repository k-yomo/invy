import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:invy/util/toast.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requirePhotoPermission(BuildContext context) async {
  PermissionStatus permissionStatus;
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      permissionStatus = await Permission.storage.status;
      if (permissionStatus.isDenied) {
        permissionStatus = await Permission.storage.request();
      }
    } else {
      permissionStatus = await Permission.photos.status;
      if (permissionStatus.isDenied) {
        permissionStatus = await Permission.photos.request();
      }
    }
  } else {
    permissionStatus = await Permission.photos.status;
    if (permissionStatus.isDenied) {
      final status = await Permission.photos.request();
      // Don't show alert right after user denied to allow the permission
      if (status.isGranted) {
        permissionStatus = status;
      } else {
        showToast('プロフィール写真の変更には、"写真"へのアクセス許可が必要です。', ToastLevel.error);
        return false;
      }
    }
  }

  if (permissionStatus.isGranted || permissionStatus.isLimited) {
    return true;
  }

  if (!context.mounted) {
    return false;
  }
  final result = await showOkCancelAlertDialog(
    context: context,
    title: '"写真"へのアクセスがありません。',
    message: 'プロフィール写真を変更するには、設定から"写真"へのアクセスを許可してください。',
    cancelLabel: "キャンセル",
    okLabel: "設定に移動",
  );
  if (result == OkCancelResult.ok) {
    await openAppSettings();
  }
  return false;
}
