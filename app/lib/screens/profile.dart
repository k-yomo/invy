import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
      ),
      body: const Center(
          child: Text('プロフィール画面', style: TextStyle(fontSize: 32.0))),
    );
  }
}
