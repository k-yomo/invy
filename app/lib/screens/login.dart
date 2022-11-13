import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await signInWithGoogle();
                      } on FirebaseAuthException catch (e) {
                        print('FirebaseAuthException');
                        print('${e.code}');
                      } on Exception catch (e) {
                        print('Other Exception');
                        print('${e.toString()}');
                      }
                    },
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
    // TODO:
    // check if userId claim exists
    // signUp mutation
    // re-login to firebase auth (id token is expired here because claim is updated in backend)
    return userCredential;
  }
}
