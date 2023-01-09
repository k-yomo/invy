import 'package:hooks_riverpod/hooks_riverpod.dart';

enum BottomNavigationTab { home, invitation, friend, profile }

final bottomNavigationTabProvider =
    StateProvider<BottomNavigationTab>((ref) => BottomNavigationTab.home);
