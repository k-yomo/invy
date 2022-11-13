import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();
    FirebaseAuth.instance.currentUser!
        .getIdToken()
        .then((idToken) => {printWrapped(idToken)});
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body:
          const Center(child: Text('ホーム画面', style: TextStyle(fontSize: 32.0))),
    );
  }
}

void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
