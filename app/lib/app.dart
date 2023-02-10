import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/viewer.graphql.dart';
import 'package:invy/screens/invitation/invitation_screen.dart';
import 'package:invy/screens/login/login_landing_screen.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/bottom_navigation.dart';
import 'package:invy/util/device.dart';

import 'graphql/push_notification.graphql.dart';
import 'graphql/schema.graphql.dart';
import 'screens/friend/friend_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile/my_profile_screen.dart';
import 'state/auth.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  final MaterialColor materialWhite = const MaterialColor(
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              }
            }
            return null;
          }(),
          builder: (context, viewerSnapshot) {
            FlutterNativeSplash.remove();

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Invy',
              theme: ThemeData(
                primarySwatch: materialWhite,
                useMaterial3: true,
              ),
              // TODO: support dark mode
              // darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.system,
              home:
                  isLoggedIn ? const RootWidget() : const LoginLandingScreen(),
            );
          },
        );
      },
    );
  }
}

class RootWidget extends HookConsumerWidget {
  const RootWidget({super.key});
  // The order must be same BottomNavigationTab
  static List<HookConsumerWidget> screens = [
    HomeScreen(),
    const InvitationScreen(),
    const FriendScreen(),
    const MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(bottomNavigationTabProvider);
    final graphqlClient = ref.read(graphqlClientProvider);

    useEffect(() {
      FirebaseMessaging.instance
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
          final result =
              await graphqlClient.mutate$registerPushNotificationToken(
                  Options$Mutation$registerPushNotificationToken(
            variables: Variables$Mutation$registerPushNotificationToken(
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
      return null;
    }, []);

    return Scaffold(
        body: screens[currentTab.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab.index,
          onTap: (index) {
            ref.read(bottomNavigationTabProvider.notifier).state =
                BottomNavigationTab.values[index];
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'ホーム'),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_invitation), label: 'さそう'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '友達'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade400,
          enableFeedback: true,
        ));
  }
}
