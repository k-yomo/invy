import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invy/constants/urls.dart';
import 'package:invy/screens/friend/blocked_friends_screen.dart';
import 'package:invy/screens/friend/freind_group_create_screen.dart';
import 'package:invy/screens/friend/freind_group_detail_screen.dart';
import 'package:invy/screens/friend/friends_screen.dart';
import 'package:invy/screens/friend/friendship_request_screen.dart';
import 'package:invy/screens/friend/friend_qr_code_reader_screen.dart';
import 'package:invy/screens/invitation/invitation_screen.dart';
import 'package:invy/screens/invitation/invitation_form_screen.dart';
import 'package:invy/screens/invitation/invitation_detail_screen.dart';
import 'package:invy/screens/invitation/invitation_friend_select_screen.dart';
import 'package:invy/screens/invitation/invitation_location_select_screen.dart';
import 'package:invy/screens/login/login_landing_screen.dart';
import 'package:invy/screens/home_screen.dart';
import 'package:invy/screens/profile/my_profile_screen.dart';
import 'package:invy/screens/profile/profile_edit_screen.dart';
import 'package:invy/screens/settings_screen.dart';
import 'package:invy/screens/user/user_friends_screen.dart';
import 'package:invy/screens/user/user_profile_screen.dart';
import 'package:invy/screens/user/user_profile_screen.graphql.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/widgets/dynamic_links_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.location, required Widget icon, String? label})
      : super(icon: icon, label: label);

  final String location;
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final tabs = [
  ScaffoldWithNavBarTabItem(
    icon: const Icon(Icons.location_pin),
    label: 'マップ',
    location: const HomeRoute().location,
  ),
  ScaffoldWithNavBarTabItem(
    icon: const Icon(Icons.insert_invitation),
    label: 'おさそい',
    location: const InvitationRoute().location,
  ),
  ScaffoldWithNavBarTabItem(
    icon: const Icon(Icons.people),
    label: '友達',
    location: const FriendsRoute().location,
  ),
  ScaffoldWithNavBarTabItem(
    icon: const Icon(Icons.person),
    label: 'アカウント',
    location: const MyProfileRoute().location,
  ),
];

CustomTransitionPage<T> buildPageWithoutAnimation<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          child);
}

@riverpod
GoRouter router(RouterRef ref, {Uri? initialRoute}) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initialRoute != null ? initialRoute.path : '/',
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
    ],
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            final String location = GoRouterState.of(context).location;
            calcIndex() {
              if (location.startsWith('/invitations')) {
                return 1;
              } else if (location.startsWith('/friends')) {
                return 2;
              } else if (location.startsWith('/me')) {
                return 3;
              }
              return 0;
            }

            final screensWithBottomNavigation = [
              "/",
              "/invitations",
              "/friends",
              "/me",
            ];
            if (!screensWithBottomNavigation.contains(location)) {
              return child;
            }

            final currentIndex = calcIndex();

            return Scaffold(
                body: child,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: (tabIndex) {
                    if (tabIndex != currentIndex) {
                      context.go(tabs[tabIndex].location);
                    }
                  },
                  items: tabs,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey.shade400,
                  enableFeedback: true,
                ));
          },
          routes: $appRoutes)
    ],
    debugLogDiagnostics: kDebugMode,
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = ref.watch(isLoggedInProvider);
      if (!isLoggedIn) {
        return LoginRoute(from: state.subloc).location;
      }
      return null;
    });

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  CustomTransitionPage<void> buildPage(
          BuildContext context, GoRouterState state) =>
      const NoTransitionPage(
          child: DynamicLinksManager(child: HomeScreenScreen()));
}

@TypedGoRoute<InvitationRoute>(path: '/invitations', routes: [
  TypedGoRoute<InvitationFormRoute>(
    path: 'new',
  ),
  TypedGoRoute<InvitationLocationSelectRoute>(
    path: 'location_select',
  ),
  TypedGoRoute<InvitationFriendSelectRoute>(
    path: 'friend_select',
  ),
  TypedGoRoute<InvitationDetailRoute>(
    path: 'details/:invitationId',
  ),
])
class InvitationRoute extends GoRouteData {
  const InvitationRoute();

  @override
  CustomTransitionPage<void> buildPage(
          BuildContext context, GoRouterState state) =>
      NoTransitionPage(
          child: DynamicLinksManager(child: InvitationScreen()));
}

@TypedGoRoute<FriendsRoute>(
  path: '/friends',
  routes: [
    TypedGoRoute<FriendGroupCreateRoute>(
      path: 'groups/new',
    ),
    TypedGoRoute<FriendGroupDetailRoute>(
      path: 'groups/details/:friendGroupId',
    ),
    TypedGoRoute<FriendshipRequestRoute>(path: 'request', routes: [
      TypedGoRoute<FriendQRCodeReaderRoute>(
        path: 'qr_code_reader',
      ),
    ])
  ],
)
class FriendsRoute extends GoRouteData {
  const FriendsRoute();

  @override
  CustomTransitionPage<void> buildPage(
          BuildContext context, GoRouterState state) =>
      const NoTransitionPage(
          child: DynamicLinksManager(child: FriendsScreen()));
}

Uri buildUserProfileLink(String userId) {
  return Uri.parse("https://$invyAppUrlHost/users/$userId");
}

@TypedGoRoute<UserProfileRoute>(
  path: '/users/:userId',
  routes: [
    TypedGoRoute<UserFriendsRoute>(
      path: 'friends',
    ),
  ],
)
class UserProfileRoute extends GoRouteData {
  const UserProfileRoute(this.userId, {this.$extra});

  final String userId;
  final Fragment$userProfileScreenFragment? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DynamicLinksManager(
          child: UserProfileScreen(userId: userId, user: $extra));
}

@TypedGoRoute<MyProfileRoute>(
  path: '/me',
  routes: [
    TypedGoRoute<ProfileEditRoute>(
      path: 'edit',
    ),
    TypedGoRoute<BlockedFriendsRoute>(
      path: 'blocked_friends',
    ),
    TypedGoRoute<SettingsRoute>(
      path: 'settings',
    ),
  ],
)
class MyProfileRoute extends GoRouteData {
  const MyProfileRoute();

  @override
  CustomTransitionPage<void> buildPage(
          BuildContext context, GoRouterState state) =>
      const NoTransitionPage(
          child: DynamicLinksManager(child: MyProfileScreen()));
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  const LoginRoute({this.from});

  final String? from;

  @override
  CustomTransitionPage<void> buildPage(
          BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: LoginLandingScreen(from: from));
}
