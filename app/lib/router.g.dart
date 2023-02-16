// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeRoute,
      $invitationRoute,
      $friendsRoute,
      $myProfileRoute,
      $loginRoute,
    ];

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'invitations/:invitationId',
          factory: $InvitationDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'invitation_awaiting/new',
          factory: $InvitationAwaitingFormRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $InvitationDetailRouteExtension on InvitationDetailRoute {
  static InvitationDetailRoute _fromState(GoRouterState state) =>
      InvitationDetailRoute(
        state.params['invitationId']!,
      );

  String get location => GoRouteData.$location(
        '/invitations/${Uri.encodeComponent(invitationId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $InvitationAwaitingFormRouteExtension on InvitationAwaitingFormRoute {
  static InvitationAwaitingFormRoute _fromState(GoRouterState state) =>
      const InvitationAwaitingFormRoute();

  String get location => GoRouteData.$location(
        '/invitation_awaiting/new',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $invitationRoute => GoRouteData.$route(
      path: '/invitation/new',
      factory: $InvitationRouteExtension._fromState,
    );

extension $InvitationRouteExtension on InvitationRoute {
  static InvitationRoute _fromState(GoRouterState state) =>
      const InvitationRoute();

  String get location => GoRouteData.$location(
        '/invitation/new',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $friendsRoute => GoRouteData.$route(
      path: '/friends',
      factory: $FriendsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'group/new',
          factory: $FriendGroupCreateRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'groups/:friendGroupId',
          factory: $FriendGroupDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'request',
          factory: $FriendshipRequestRouteExtension._fromState,
        ),
      ],
    );

extension $FriendsRouteExtension on FriendsRoute {
  static FriendsRoute _fromState(GoRouterState state) => const FriendsRoute();

  String get location => GoRouteData.$location(
        '/friends',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $FriendGroupCreateRouteExtension on FriendGroupCreateRoute {
  static FriendGroupCreateRoute _fromState(GoRouterState state) =>
      const FriendGroupCreateRoute();

  String get location => GoRouteData.$location(
        '/friends/group/new',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $FriendGroupDetailRouteExtension on FriendGroupDetailRoute {
  static FriendGroupDetailRoute _fromState(GoRouterState state) =>
      FriendGroupDetailRoute(
        state.params['friendGroupId']!,
      );

  String get location => GoRouteData.$location(
        '/friends/groups/${Uri.encodeComponent(friendGroupId)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $FriendshipRequestRouteExtension on FriendshipRequestRoute {
  static FriendshipRequestRoute _fromState(GoRouterState state) =>
      const FriendshipRequestRoute();

  String get location => GoRouteData.$location(
        '/friends/request',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $myProfileRoute => GoRouteData.$route(
      path: '/me',
      factory: $MyProfileRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'edit',
          factory: $ProfileEditRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'blocked_friends',
          factory: $BlockedFriendsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'settings',
          factory: $SettingsRouteExtension._fromState,
        ),
      ],
    );

extension $MyProfileRouteExtension on MyProfileRoute {
  static MyProfileRoute _fromState(GoRouterState state) =>
      const MyProfileRoute();

  String get location => GoRouteData.$location(
        '/me',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ProfileEditRouteExtension on ProfileEditRoute {
  static ProfileEditRoute _fromState(GoRouterState state) =>
      const ProfileEditRoute();

  String get location => GoRouteData.$location(
        '/me/edit',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $BlockedFriendsRouteExtension on BlockedFriendsRoute {
  static BlockedFriendsRoute _fromState(GoRouterState state) =>
      const BlockedFriendsRoute();

  String get location => GoRouteData.$location(
        '/me/blocked_friends',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/me/settings',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
        from: state.queryParams['from'],
      );

  String get location => GoRouteData.$location(
        '/login',
        queryParams: {
          if (from != null) 'from': from!,
        },
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$routerHash() => r'5e4a8a0d09ce4ba76e9e1f7ecb2bec1b35d03b04';

/// See also [router].
final routerProvider = AutoDisposeProvider<GoRouter>(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
);
typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
