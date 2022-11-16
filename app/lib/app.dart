import 'package:bump/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'graphql_client_perovider.dart';
import 'repositories/auth.dart';
import 'screens/home.dart';
import 'screens/chat.dart';
import 'screens/notification.dart';
import 'screens/profile.dart';

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
    final authState = ref.watch(authStateProvider);
    return ClientProvider(
      uri: graphqlEndpoint,
      subscriptionUri: graphqlSubscriptionEndpoint,
      child: MaterialApp(
        title: 'Bump',
        theme: ThemeData(
          primarySwatch: materialWhite,
        ),
        darkTheme: ThemeData.dark(),
        home: authState.when(
          data: (data) {
            if (data != null) {
              return const RootWidget();
            } else {
              return const LoginScreen();
            }
          },
          error: (e, trace) => const CircularProgressIndicator(),
          loading: () => const CircularProgressIndicator(),
        ),
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
    ChatScreen(),
    NotificationScreen(),
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
                icon: Icon(Icons.chat_rounded), label: 'チャット'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: '通知'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red,
          unselectedItemColor: Colors.white,
          enableFeedback: true,
        ));
  }
}
