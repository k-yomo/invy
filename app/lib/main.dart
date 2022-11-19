import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'services/firebase_options_dev.dart' as dev;
import 'services/firebase_options_prod.dart' as prod;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  await Firebase.initializeApp(options: dev.DefaultFirebaseOptions.currentPlatform);

  /// 縦固定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: App()));
}

FirebaseOptions getFirebaseOptions() {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'prod':
      return prod.DefaultFirebaseOptions.currentPlatform;
    default:
      return dev.DefaultFirebaseOptions.currentPlatform;
  }
}
