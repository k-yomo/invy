import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/services/graphql_client.dart';

import 'app.dart';
import 'services/firebase_options_dev.dart' as dev;
import 'services/firebase_options_prod.dart' as prod;

String getGraphqlApiRootUrl() {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'prod':
      return 'https://api.invy-app.com';
    case 'dev':
      return 'https://api.invy-app.dev';
    default:
      return 'http://$host:8000';
  }
}

final graphqlEndpoint = 'http://$host:8000/query';
final graphqlSubscriptionEndpoint = 'ws://$host:8000/subscriptions';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
      options: dev.DefaultFirebaseOptions.currentPlatform);

  /// 縦固定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final graphqlClient = await initGraphQLClient(
    uri: graphqlEndpoint,
    subscriptionUri: graphqlSubscriptionEndpoint,
  );

  runApp(
    ProviderScope(
        overrides: [graphqlClientProvider.overrideWithValue(graphqlClient)],
        child: App()),
  );
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
