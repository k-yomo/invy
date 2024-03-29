import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/viewer.graphql.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/invitation/invitation_detail_screen.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/badge_count.dart';
import 'package:invy/util/device.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'graphql/push_notification.graphql.dart';
import 'graphql/schema.graphql.dart';
import 'state/auth.dart';

const materialWhite = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

ThemeData lightTheme() => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        primary: Colors.blue.shade500,
        seedColor: materialWhite,
      ),
      useMaterial3: true,
    );

class App extends StatefulHookConsumerWidget {
  const App({super.key, required this.initialRoute});

  final Uri? initialRoute;

  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) async {
    await handlePushMessage(message);

    final messageType =
        fromJson$Enum$PushNotificationType(message.data["type"]);
    switch (messageType) {
      case Enum$PushNotificationType.CHAT_MESSAGE_RECEIVED:
        InvitationDetailRoute(message.data["invitationId"] as String)
            .go(context);
        break;
      case Enum$PushNotificationType.FRIENDSHIP_REQUEST_RECEIVED:
        const FriendsRoute().go(context);
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    Future(() async {
      await setupInteractedMessage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router =
        ref.watch(routerProvider.call(initialRoute: widget.initialRoute));
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        return FutureBuilder<Query$viewer$viewer?>(
          future: () async {
            if (isLoggedIn) {
              return null;
            }
            if (authSnapshot.hasData) {
              final graphqlClient = ref.read(graphqlClientProvider);
              final viewer = await graphqlClient.query$viewer(
                Options$Query$viewer(fetchPolicy: FetchPolicy.cacheFirst),
              );
              if (viewer.hasException) {
                return null;
              }
              if (viewer.parsedData != null) {
                setViewerToLoggedInUser(ref, viewer.parsedData!.viewer);

                Sentry.configureScope(
                  (scope) {
                    scope.setUser(SentryUser(id: viewer.parsedData!.viewer.id));
                  },
                );
                await FirebaseMessaging.instance
                    .requestPermission(
                  alert: true,
                  announcement: false,
                  badge: true,
                  carPlay: false,
                  criticalAlert: false,
                  provisional: false,
                  sound: true,
                )
                    .whenComplete(() async {
                  final fcmToken = await FirebaseMessaging.instance.getToken();
                  if (fcmToken != null) {
                    final deviceInfo = await getDeviceInfo();
                    final result = await graphqlClient
                        .mutate$registerPushNotificationToken(
                            Options$Mutation$registerPushNotificationToken(
                      variables:
                          Variables$Mutation$registerPushNotificationToken(
                              input: Input$RegisterPushNotificationTokenInput(
                        deviceId: deviceInfo.deviceId,
                        fcmToken: fcmToken,
                      )),
                    ));
                    if (result.hasException) {
                      print(result.exception);
                    }
                  }
                });
              }
            }
            return null;
          }(),
          builder: (context, viewerSnapshot) {
            FlutterNativeSplash.remove();

            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Invy',
              theme: lightTheme(),
              // TODO: Dark theme
              themeMode: ThemeMode.system,
              routerConfig: router,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          },
        );
      },
    );
  }
}
