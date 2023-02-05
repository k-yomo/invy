import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/schema.graphql.dart';
import 'package:invy/graphql/viewer.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/auth.dart';
import 'package:invy/state/bottom_navigation.dart';
import 'package:pinput/pinput.dart';
import 'sms_login_screen.graphql.dart';

class SMSLoginVerificationScreen extends HookConsumerWidget {
  const SMSLoginVerificationScreen({super.key, required this.verificationId});

  final String verificationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphqlClient = ref.read(graphqlClientProvider);
    final isLoading = useState(false);

    final defaultPinTheme = PinTheme(
      textStyle: const TextStyle(fontSize: 40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(5),
    );

    signInToInvy() async {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        // TODO: show error
        return;
      }

      final result = await firebaseUser.getIdTokenResult();
      LoggedInUser loggedInUser;
      final accountExists =
          result.claims?.containsKey("currentUserId") ?? false;
      if (accountExists) {
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
            nickname: firebaseUser.displayName,
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

      if (!accountExists) {
        ref.read(bottomNavigationTabProvider.notifier).state =
            BottomNavigationTab.profile;
      }
      ref.read(loggedInUserProvider.notifier).state = loggedInUser;
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              autofocus: true,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              length: 6,
              onCompleted: (smsCode) async {
                isLoading.value = true;
                final credential = PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: smsCode);
                await FirebaseAuth.instance.signInWithCredential(credential);
                await signInToInvy();
                isLoading.value = false;
              },
            ),
          ),
          isLoading.value
              ? const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 4,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}