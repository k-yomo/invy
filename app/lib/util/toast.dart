import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastLevel { info, success, warning, error }

showToast(String msg, ToastLevel level) {
  Color backgroundColor;
  switch (level) {
    case ToastLevel.info:
      backgroundColor = Colors.black;
      break;
    case ToastLevel.success:
      backgroundColor = Colors.green;
      break;
    case ToastLevel.warning:
      backgroundColor = Colors.amber;
      break;
    case ToastLevel.error:
      backgroundColor = Colors.red;
      break;
  }
  // TODO: Use custom toast to for better design
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
