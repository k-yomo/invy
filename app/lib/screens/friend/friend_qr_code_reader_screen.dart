import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/constants/urls.dart';
import 'package:invy/router.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/widgets/app_bar_leading.dart';
import 'package:invy/widgets/screen_wrapper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FriendQRCodeReaderRoute extends GoRouteData {
  const FriendQRCodeReaderRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScreenWrapper(child: FriendQRCodeReaderScreen());
}

class FriendQRCodeReaderScreen extends StatefulHookConsumerWidget {
  const FriendQRCodeReaderScreen({Key? key}) : super(key: key);

  @override
  FriendQRCodeReaderScreenState createState() =>
      FriendQRCodeReaderScreenState();
}

class FriendQRCodeReaderScreenState
    extends ConsumerState<FriendQRCodeReaderScreen> {
  bool isQRScanned = false;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
  }

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
              overlay: QrScannerOverlayShape(
                overlayColor: const Color.fromRGBO(0, 0, 0, 150),
                borderColor: Colors.black,
                borderRadius: 16,
                borderLength: 24,
                borderWidth: 8,
              ),
            ),
          ),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    duration: const Duration(milliseconds: 300),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 50, horizontal: 60),
                          child: QrImage(
                            data: buildUserProfileLink(loggedInUser.id)
                                .toString()
                                .toString(),
                            version: QrVersions.auto,
                            size: 180.0,
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
                )),
          ))
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (isQRScanned) {
        return;
      }
      if (scanData.code == null) {
        return;
      }
      final url = Uri.parse(scanData.code!);
      if (url.host != invyAppUrlHost) {
        return;
      }
      setState(() {
        isQRScanned = true;
      });
      GoRouter.of(context).push(url.path).then((_) {
        setState(() {
          isQRScanned = false;
        });
      });
    });
  }
}
