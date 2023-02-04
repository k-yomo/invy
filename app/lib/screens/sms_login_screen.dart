import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/screens/sms_login_verification_screen.dart';

class SMSLoginScreen extends HookConsumerWidget {
  SMSLoginScreen({super.key});

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'サインイン',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Gap(15),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: const Center(
                          child: Text(
                            "+81",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          // TODO: Implement formatter
                          // inputFormatters: [],
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            hintText: "080-1234-5678",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 1.0),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          // inputFormatters: [widget.formatter],
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(30),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.verifyPhoneNumber(
                        timeout: const Duration(seconds: 120),
                        phoneNumber: "+81${phoneController.text}",
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {
                          if (e.code == 'invalid-phone-number') {
                            print('電話番号が正しくありません。');
                          }
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SMSLoginVerificationScreen(
                                verificationId: verificationId,
                              ),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: const Text(
                      "サインイン",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
