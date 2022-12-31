import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/graphql/login_screen.graphql.dart';
import 'package:invy/graphql/viewer.graphql.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);

    onGoogleLoginPressed() async {
      try {
        await signInWithGoogle();
        final firebaseUser = FirebaseAuth.instance.currentUser;
        if (firebaseUser == null) {
          // TODO: show error
          return;
        }

        final result = await firebaseUser.getIdTokenResult();
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
          ref.read(loggedInUserProvider.notifier).state = LoggedInUser(
            id: user.id,
            screenId: user.screenId,
            nickname: user.nickname,
            avatarUrl: user.avatarUrl,
          );
          print("logged in successfully");
          return;
        } else {
          final res = await graphqlClient.mutate(Options$Mutation$signUp(
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
          if (res.parsedData != null) {
            final user = res.parsedData!.signUp.viewer;
            ref.read(loggedInUserProvider.notifier).state = LoggedInUser(
                id: user.id,
                screenId: user.screenId,
                nickname: user.nickname,
                avatarUrl: user.avatarUrl);
            print("signed up in successfully");
            // TODO: redirect to user profile update page?
          }
        }
      } on FirebaseAuthException catch (e) {
        print('FirebaseAuthException');
        print('${e.code}');
      } on Exception catch (e) {
        print('Other Exception');
        print('${e.toString()}');
      }
    }

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
                  margin: EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          text: 'Google サインイン',
                          onPressed: onGoogleLoginPressed,
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Colors.black)),
                          elevation: 0,
                        ),
                      ),
                      Gap(10),
                      SizedBox(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Apple,
                          text: 'Apple サインイン',
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Colors.black)),
                          elevation: 0,
                        ),
                      ),
                      Gap(10),
                      SizedBox(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Facebook,
                          text: 'Facebook サインイン',
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                      )
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
    if (googleUser == null) {
      throw Exception("sign in failed");
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential;
  }
}
