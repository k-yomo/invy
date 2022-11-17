import 'package:bump/graphql/schema.graphql.dart';
import 'package:bump/state/auth.dart';
import 'package:bump/graphql/signUp.graphql.dart';
import 'package:bump/graphql/viewer.graphql.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUp = useMutation$signUp();
    final viewer = useQuery$viewer();

    onGoogleLoginPressed() async {
      try {
        await signInWithGoogle();
        final firebaseUser = FirebaseAuth.instance.currentUser;
        if (firebaseUser == null) return;

        final result = await firebaseUser.getIdTokenResult();
        if (result.claims?.containsKey("userId") ?? false) {
          viewer.refetch().then((res) {
            if (res?.parsedData?.viewer != null) {
              final user = res!.parsedData!.viewer;
              ref.read(loggedInUserProvider.notifier).state = LoggedInUser(
                id: user.id,
                nickname: user.nickname,
                avatarUrl: user.avatarUrl,
              );
              print("logged in successfully");
            }
          });
          return;
        } else {
          final res = await signUp
              .runMutation(
                  variables: Variables$Mutation$signUp(
                input: Input$SignUpInput(
                  email: firebaseUser.email!,
                  nickname: firebaseUser.displayName!,
                  avatarUrl: firebaseUser.photoURL,
                ),
              ))
              .networkResult;
          if (res?.parsedData != null) {
            final user = res!.parsedData!.signUp;
            ref.read(loggedInUserProvider.notifier).state = LoggedInUser(
                id: user.id,
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
                child: ElevatedButton(
                    onPressed: onGoogleLoginPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: textColor),
                    child: const Text('Google ログイン'))),
          ),
        ],
      ),
    );
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
