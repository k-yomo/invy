import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/config/config.dart';
import 'package:invy/services/graphql_client.dart';

import 'app.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final config = getConfig();
  await Firebase.initializeApp(options: config.firebaseOptions);

  /// 縦固定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final graphqlClient = await initGraphQLClient(
    uri: '${config.apiBaseUrl}/query',
    subscriptionUri: '${config.apiBaseUrl}/subscriptions',
  );

  runApp(
    ProviderScope(
        overrides: [graphqlClientProvider.overrideWithValue(graphqlClient)],
        child: App()),
  );
}
