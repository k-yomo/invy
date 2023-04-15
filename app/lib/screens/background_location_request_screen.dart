import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:permission_handler/permission_handler.dart';

class BackgroundLocationRequestScreen extends HookConsumerWidget {
  const BackgroundLocationRequestScreen({super.key, this.from});

  final String? from;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useOnAppLifecycleStateChange((previous, current) async {
      if (current == AppLifecycleState.resumed) {
        final permission = await geolocator.Geolocator.checkPermission();
        if (permission != geolocator.LocationPermission.always) {
          return;
        }
        if (from != null &&
            from != const BackgroundLocationRequestRoute().location) {
          GoRouter.of(context).go(from!);
        } else {
          const MapRoute().go(context);
        }
      }
    });
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('位置情報を「常に」にセットする', style: TextStyle(fontSize: 20)),
            const Gap(20),
            const Text('友達との大まかな距離を表示するために、位置情報を「常に」に設定しましょう'),
            const Gap(30),
            const ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('設定から「位置情報」を選択', style: TextStyle(fontSize: 18)),
              horizontalTitleGap: 0,
              minLeadingWidth: 30,
            ),
            const ListTile(
              leading: Icon(Icons.looks_two),
              title: Text('「常に」を選択', style: TextStyle(fontSize: 18)),
              horizontalTitleGap: 0,
              minLeadingWidth: 30,
            ),
            const Gap(30),
            TextButton(
              onPressed: () {
                openAppSettings();
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(0),
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                '設定を開く',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
