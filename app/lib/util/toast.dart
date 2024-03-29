import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastLevel { info, success, warning, error }

showServerErrorToast() {
  showToast("予期せぬエラーが発生しました。時間を置いて再度お試しください。", ToastLevel.error);
}

showToast(String msg, ToastLevel level) {
  Color backgroundColor;
  Toast toastLength = Toast.LENGTH_SHORT;
  switch (level) {
    case ToastLevel.info:
      backgroundColor = Colors.black;
      break;
    case ToastLevel.success:
      backgroundColor = Colors.green;
      break;
    case ToastLevel.warning:
      backgroundColor = Colors.amber;
      toastLength = Toast.LENGTH_LONG;
      break;
    case ToastLevel.error:
      backgroundColor = Colors.red;
      toastLength = Toast.LENGTH_LONG;
      break;
  }
  // TODO: Use custom toast for better design
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.TOP,
    toastLength: toastLength,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
