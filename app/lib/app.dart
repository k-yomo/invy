import 'package:invy/screens/invitation_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';

import 'services/graphql_client.dart';
import 'screens/login_screen.dart';
import 'state/auth.dart';
import 'screens/home_screen.dart';
import 'screens/friend_screen.dart';
import 'screens/profile_screen.dart';

String get host {
// https://github.com/flutter/flutter/issues/36126#issuecomment-596215587
  if (UniversalPlatform.isAndroid) {
    return '10.0.2.2';
  } else {
    return '127.0.0.1';
  }
}

final graphqlEndpoint = 'http://$host:8000/query';
final graphqlSubscriptionEndpoint = 'ws://$host:8000/subscriptions';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

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
    final loggedInUser = ref.watch(loggedInUserProvider);
    return ClientProvider(
      uri: graphqlEndpoint,
      subscriptionUri: graphqlSubscriptionEndpoint,
      child: MaterialApp(
        title: 'Bump',
        theme: ThemeData(
          primarySwatch: materialWhite,
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: (loggedInUser != null) ? const RootWidget() : const LoginScreen(),
      ),
    );
  }
}

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  static const screens = [
    HomeScreen(),
    InvitationScreen(),
    FriendScreen(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
