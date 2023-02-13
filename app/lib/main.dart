import 'dart:async';

import 'package:background_locator_2/background_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/config/config.dart';
import 'package:invy/graphql/push_notification.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/device.dart';
import 'package:invy/state/onboarding.dart';
import 'package:invy/util/background_location.dart';
import 'package:invy/util/device.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'graphql/schema.graphql.dart';
import 'state/badge_count.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("バックグラウンドでメッセージを受け取りました");
  print(message.data);
  await Hive.initFlutter();
  if (message.data["type"] ==
      toJson$Enum$PushNotificationType(
          Enum$PushNotificationType.INVITATION_RECEIVED)) {
    final badgeCounter = await BadgeCounter.open();
    await badgeCounter.setBadgeCount(badgeCounter.badgeCount + 1);
  }
}

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Hive.initFlutter();

  /// Fix vertical screen
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final config = getConfig();
  await Firebase.initializeApp(options: config.firebaseOptions);

  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(kReleaseMode);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  final graphqlClient = await initGraphQLClient(
    uri: '${config.apiBaseUrl}/query',
    subscriptionUri: '${config.apiBaseUrl}/subscriptions',
  );

  final deviceInfo = await getDeviceInfo();
  final packageInfo = await PackageInfo.fromPlatform();
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    final mutateOptions = Options$Mutation$registerPushNotificationToken(
      variables: Variables$Mutation$registerPushNotificationToken(
          input: Input$RegisterPushNotificationTokenInput(
        deviceId: deviceInfo.deviceId,
        fcmToken: fcmToken,
      )),
    );
    if (FirebaseAuth.instance.currentUser != null) {
      graphqlClient.mutate$registerPushNotificationToken(mutateOptions);
    } else {
      FirebaseAuth.instance.authStateChanges().take(1).listen((user) {
        graphqlClient.mutate$registerPushNotificationToken(mutateOptions);
      });
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await BackgroundLocator.initialize();
  startBackgroundLocationService();

  final onboarding = await Onboarding.open();
  final badgeCounter = await BadgeCounter.open();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://bc241da02a4b48858c55b5b790efcf14@o4504672984498176.ingest.sentry.io/4504672985874432';
      if (config.environment == Environment.Local) {
        options.tracesSampleRate = 0.0;
      } else {
        options.tracesSampleRate = 1.0;
      }
      options.environment = config.environment.name.toLowerCase();
      options.release = "${packageInfo.version}+${packageInfo.buildNumber}";
    },
    appRunner: () => runApp(
      ProviderScope(overrides: [
        graphqlClientProvider.overrideWithValue(graphqlClient),
        onboardingProvider.overrideWithValue(onboarding),
        pushNotificationBadgeCounter.overrideWithValue(badgeCounter),
        deviceInfoProvider.overrideWithValue(deviceInfo),
        packageInfoProvider.overrideWithValue(packageInfo),
      ], child: const App()),
    ),
  );
}
