// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeRoute,
      $invitationRoute,
      $friendsRoute,
      $userProfileRoute,
      $userFriendsRoute,
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

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $InvitationDetailRouteExtension on InvitationDetailRoute {
  static InvitationDetailRoute _fromState(GoRouterState state) =>
      InvitationDetailRoute(
        state.params['invitationId']!,
      );

  String get location => GoRouteData.$location(
        '/invitations/${Uri.encodeComponent(invitationId)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $InvitationAwaitingFormRouteExtension on InvitationAwaitingFormRoute {
  static InvitationAwaitingFormRoute _fromState(GoRouterState state) =>
      const InvitationAwaitingFormRoute();

  String get location => GoRouteData.$location(
        '/invitation_awaiting/new',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $invitationRoute => GoRouteData.$route(
      path: '/invitation/new',
      factory: $InvitationRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'friend_select',
          factory: $InvitationFriendSelectRouteExtension._fromState,
        ),
      ],
    );

extension $InvitationRouteExtension on InvitationRoute {
  static InvitationRoute _fromState(GoRouterState state) =>
      const InvitationRoute();

  String get location => GoRouteData.$location(
        '/invitation/new',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $InvitationFriendSelectRouteExtension on InvitationFriendSelectRoute {
  static InvitationFriendSelectRoute _fromState(GoRouterState state) =>
      const InvitationFriendSelectRoute();

  String get location => GoRouteData.$location(
        '/invitation/new/friend_select',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
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

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $FriendGroupCreateRouteExtension on FriendGroupCreateRoute {
  static FriendGroupCreateRoute _fromState(GoRouterState state) =>
      const FriendGroupCreateRoute();

  String get location => GoRouteData.$location(
        '/friends/group/new',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $FriendGroupDetailRouteExtension on FriendGroupDetailRoute {
  static FriendGroupDetailRoute _fromState(GoRouterState state) =>
      FriendGroupDetailRoute(
        state.params['friendGroupId']!,
      );

  String get location => GoRouteData.$location(
        '/friends/groups/${Uri.encodeComponent(friendGroupId)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $FriendshipRequestRouteExtension on FriendshipRequestRoute {
  static FriendshipRequestRoute _fromState(GoRouterState state) =>
      const FriendshipRequestRoute();

  String get location => GoRouteData.$location(
        '/friends/request',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $userProfileRoute => GoRouteData.$route(
      path: '/users/:userId',
      factory: $UserProfileRouteExtension._fromState,
    );

extension $UserProfileRouteExtension on UserProfileRoute {
  static UserProfileRoute _fromState(GoRouterState state) => UserProfileRoute(
        state.params['userId']!,
        $extra: state.extra as dynamic,
      );

  String get location => GoRouteData.$location(
        '/users/${Uri.encodeComponent(userId)}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  void push(BuildContext context) => context.push(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);
}

GoRoute get $userFriendsRoute => GoRouteData.$route(
      path: '/users/:userId/friends',
      factory: $UserFriendsRouteExtension._fromState,
    );

extension $UserFriendsRouteExtension on UserFriendsRoute {
  static UserFriendsRoute _fromState(GoRouterState state) => UserFriendsRoute(
        state.params['userId']!,
        userNickname: state.queryParams['user-nickname'],
      );

  String get location => GoRouteData.$location(
        '/users/${Uri.encodeComponent(userId)}/friends',
        queryParams: {
          if (userNickname != null) 'user-nickname': userNickname,
        },
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
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

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ProfileEditRouteExtension on ProfileEditRoute {
  static ProfileEditRoute _fromState(GoRouterState state) =>
      const ProfileEditRoute();

  String get location => GoRouteData.$location(
        '/me/edit',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BlockedFriendsRouteExtension on BlockedFriendsRoute {
  static BlockedFriendsRoute _fromState(GoRouterState state) =>
      const BlockedFriendsRoute();

  String get location => GoRouteData.$location(
        '/me/blocked_friends',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/me/settings',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
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
          if (from != null) 'from': from,
        },
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'7ce6adbc1b29f472302789bd2ef1b7c47fd5e2bb';

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

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;

/// See also [router].
@ProviderFor(router)
const routerProvider = RouterFamily();

/// See also [router].
class RouterFamily extends Family<GoRouter> {
  /// See also [router].
  const RouterFamily();

  /// See also [router].
  RouterProvider call({
    Uri? initialRoute,
  }) {
    return RouterProvider(
      initialRoute: initialRoute,
    );
  }

  @override
  RouterProvider getProviderOverride(
    covariant RouterProvider provider,
  ) {
    return call(
      initialRoute: provider.initialRoute,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'routerProvider';
}

/// See also [router].
class RouterProvider extends AutoDisposeProvider<GoRouter> {
  /// See also [router].
  RouterProvider({
    this.initialRoute,
  }) : super.internal(
          (ref) => router(
            ref,
            initialRoute: initialRoute,
          ),
          from: routerProvider,
          name: r'routerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routerHash,
          dependencies: RouterFamily._dependencies,
          allTransitiveDependencies: RouterFamily._allTransitiveDependencies,
        );

  final Uri? initialRoute;

  @override
  bool operator ==(Object other) {
    return other is RouterProvider && other.initialRoute == initialRoute;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialRoute.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
