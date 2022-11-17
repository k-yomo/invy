import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendRequestScreen extends HookConsumerWidget {
  const FriendRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = useState("");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '友だち追加',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '友だちのユーザーIDを入力...',
              ),
              autofocus: true,
              onChanged: (text) {
                userId.value = text;
              },
            ),
          ),
          OutlinedButton(
            child: Text('検索', style: TextStyle(color: Colors.grey.shade800)),
            onPressed: () {
              print(userId);
              // TODO: GetUser
            },
          ),
        ],
      ),
    );
  }
}
