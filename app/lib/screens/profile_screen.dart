import 'dart:ui';

import 'package:invy/state/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(loggedInUserProvider)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(user.avatarUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    user.nickname,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("ユーザーID | ${user.screenId}",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                        ),
                        onPressed: () async {
                          Clipboard.setData(ClipboardData(text: user.screenId))
                              .then((_) => Fluttertoast.showToast(
                                  msg: "コピーしました",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0));
                        },
                        child: Row(
                          children: [
                            Text("コピー",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Icon(Icons.copy_all, color: Colors.black)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: OutlinedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    ref.invalidate(loggedInUserProvider);
                  },
                  child: const Text('ログアウト',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
