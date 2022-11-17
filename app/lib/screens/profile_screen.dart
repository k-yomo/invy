import 'package:bump/state/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              ref.invalidate(loggedInUserProvider);
            },
            child: const Text('ログアウト',
                style: TextStyle(color: Colors.black, fontSize: 32.0)),
          )
        ]),
      ),
    );
  }
}
