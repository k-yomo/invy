import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/constants/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class RequireVersionUpDialog extends ConsumerWidget {
  const RequireVersionUpDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = Text("アップデートのお知らせ");
    const content = Text('新しいバージョンのアプリが利用可能です。ストアよりアップデートしてご利用下さい。');
    const buttonText = Text('今すぐアップデート');
    return WillPopScope(
        onWillPop: () async => false,
        child: Platform.isIOS
            ? CupertinoAlertDialog(
                title: title,
                content: content,
                actions: [
                  TextButton(
                    onPressed: () {
                      launchUrl(appStorePageUrl);
                    },
                    child: buttonText,
                  ),
                ],
              )
            : AlertDialog(
                title: title,
                content: content,
                actions: [
                  TextButton(
                    onPressed: () {
                      // TODO: launch android url
                    },
                    child: buttonText,
                  ),
                ],
              ));
  }
}
