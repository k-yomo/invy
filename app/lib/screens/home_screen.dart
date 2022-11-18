import 'package:bump/graphql/home_screen.graphql.dart';
import 'package:bump/screens/invitation_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingInvitationsResult = useQuery$pendingInvitations();
    final acceptedInvitationsResult = useQuery$acceptedInvitations();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ホーム',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          shape:
              Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        body: Container(
            child: Center(
          child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => InvitationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text('さそぼ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
        )));
  }
}
