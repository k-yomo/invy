import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/graphql/signUp.graphql.dart';
import 'package:invy/graphql/viewer.graphql.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final signUp = useMutation$signUp();

    onGoogleLoginPressed() async {
      try {
        await signInWithGoogle();
        final firebaseUser = FirebaseAuth.instance.currentUser;
        if (firebaseUser == null) {
          // TODO: show error
          return;
        }

        final result = await firebaseUser.getIdTokenResult();
        if (result.claims?.containsKey("userId") ?? false) {
          final viewerQueryResult =
              await graphqlClient.query$viewer(Options$Query$viewer(
            fetchPolicy: FetchPolicy.networkOnly,
          ));
          // TODO: if not found, then make signUp mutation.
          if (viewerQueryResult.hasException) {
            // TODO: logging and show error
            return;
          }
          final user = viewerQueryResult!.parsedData!.viewer;
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
          // Refresh id token to get new token containing user id in claims.
          await firebaseUser.getIdToken(true);
          if (res.parsedData != null) {
            final user = res.parsedData!.signUp;
            ref.read(loggedInUserProvider.notifier).state = LoggedInUser(
                id: user.id,
                screenId: user.screenId,
                nickname: user.nickname,
                avatarUrl: user.avatarUrl);
            print("signed up in successfully");
            // TODO: redirect to user profile update page?
          } else {
            print(res.exception);
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
            '友だち追加',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          shape:
              Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                    child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: onGoogleLoginPressed,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 60),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('Google ログイン')),
                      OutlinedButton(
                          onPressed: onGoogleLoginPressed,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 60),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('Apple ログイン')),
                      OutlinedButton(
                          onPressed: onGoogleLoginPressed,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 60),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('LINE ログイン')),
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
