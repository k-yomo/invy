import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/router.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/widgets/app_bar_leading.dart';
import 'package:invy/widgets/dynamic_links_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FriendQRCodeReaderRoute extends GoRouteData {
  const FriendQRCodeReaderRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DynamicLinksManager(child: FriendQRCodeReaderScreen());
}

class FriendQRCodeReaderScreen extends StatefulHookConsumerWidget {
  const FriendQRCodeReaderScreen({Key? key}) : super(key: key);

  @override
  FriendQRCodeReaderScreenState createState() =>
      FriendQRCodeReaderScreenState();
}

class FriendQRCodeReaderScreenState
    extends ConsumerState<FriendQRCodeReaderScreen> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loggedInUser = ref.read(loggedInUserProvider)!;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const Text(
          'QRコードスキャン',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: TextButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    duration: const Duration(milliseconds: 300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 500,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 50, horizontal: 80),
                          child: QrImage(
                            data: loggedInUser.id,
                            version: QrVersions.auto,
                            size: 150.0,
                          ),
                        ),
                      );
                    },
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(0),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'マイQRコード',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        final userId = scanData.code!;
        UserProfileRoute(userId).go(context);
      }
    });
  }
}