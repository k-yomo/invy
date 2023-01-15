import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/config/config.dart';
import 'package:invy/graphql/push_notification.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/onboarding.dart';
import 'package:invy/util/device.dart';

import 'app.dart';
import 'graphql/schema.graphql.dart';
import 'state/badge_count.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Hive.initFlutter();
  await Firebase.initializeApp();

  if (message.data["type"] ==
      toJson$Enum$PushNotificationType(
          Enum$PushNotificationType.INVITATION_RECEIVED)) {
    final badgeCounter = await BadgeCounter.open();
    badgeCounter.setBadgeCount(badgeCounter.badgeCount + 1);
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

  final onboarding = await Onboarding.open();
  final badgeCounter = await BadgeCounter.open();

  runApp(
    ProviderScope(overrides: [
      graphqlClientProvider.overrideWithValue(graphqlClient),
      onboardingProvider.overrideWithValue(onboarding),
      pushNotificationBadgeCounter.overrideWithValue(badgeCounter)
    ], child: App()),
  );
}
