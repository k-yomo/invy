import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/login_screen.graphql.dart';
import 'package:invy/graphql/push_notification.graphql.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/graphql/viewer.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/state/onboarding.dart';

import '../util/device.dart';
import 'onboarding_screen.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final onboarding = ref.read(onboardingProvider);

    signInToInvy() async {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        // TODO: show error
        return;
      }

      // Ask notification permission
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      final result = await firebaseUser.getIdTokenResult();
      LoggedInUser loggedInUser;
      if (result.claims?.containsKey("currentUserId") ?? false) {
        final viewerQueryResult =
            await graphqlClient.query$viewer(Options$Query$viewer(
          fetchPolicy: FetchPolicy.networkOnly,
        ));
        // TODO: if not found, then make signUp mutation.
        if (viewerQueryResult.hasException) {
          // TODO: logging and show error
          print(viewerQueryResult.exception);
          return;
        }
        final user = viewerQueryResult.parsedData!.viewer;
        loggedInUser = LoggedInUser(
          id: user.id,
          screenId: user.screenId,
          nickname: user.nickname,
          avatarUrl: user.avatarUrl,
        );
      } else {
        final res = await graphqlClient.mutate$signUp(Options$Mutation$signUp(
            variables: Variables$Mutation$signUp(
          input: Input$SignUpInput(
            email: firebaseUser.email,
            nickname: firebaseUser.displayName!,
            avatarUrl: firebaseUser.photoURL,
          ),
        )));
        if (res.hasException) {
          print(res.exception);
          return;
        }
        // Refresh id token to get new token containing user id in claims.
        await firebaseUser.getIdToken(true);
        final user = res.parsedData!.signUp.viewer;
        loggedInUser = LoggedInUser(
            id: user.id,
            screenId: user.screenId,
            nickname: user.nickname,
            avatarUrl: user.avatarUrl);
        // TODO: redirect to user profile update page?
      }

      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        final deviceInfo = await getDeviceInfo();
        final result = await graphqlClient.mutate$registerPushNotificationToken(
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

      ref.read(loggedInUserProvider.notifier).state = loggedInUser;
    }

    onGoogleSignInPressed() async {
      try {
        await signInWithGoogle();
        await signInToInvy();
      } on FirebaseAuthException catch (e) {
        print('FirebaseAuthException');
        print(e.code);
      } on Exception catch (e) {
        print('Other Exception');
        print(e.toString());
      }
    }

    onAppleSignInPressed() async {
      try {
        await signInWithApple();
        await signInToInvy();
      } on FirebaseAuthException catch (e) {
        print('FirebaseAuthException');
        print(e.code);
      } on Exception catch (e) {
        print('Other Exception');
        print(e.toString());
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!onboarding.isFinished) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ));
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'サインイン',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          shape:
              Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                    child: Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          text: 'Google サインイン',
                          onPressed: onGoogleSignInPressed,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 25),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.black)),
                          elevation: 0,
                        ),
                      ),
                      const Gap(15),
                      SizedBox(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Apple,
                          text: 'Apple サインイン',
                          onPressed: onAppleSignInPressed,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.black)),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ));
  }

  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn(scopes: [
      'email',
    ]).signIn();
    if (googleUser == null) throw Exception("Not logged in");

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }
}
