import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/screens/sms_login_screen.dart';

import '../state/onboarding.dart';
import 'onboarding_screen.dart';

class LoginLandingScreen extends HookConsumerWidget {
  const LoginLandingScreen({super.key});

  Future<void> _openSignup(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => SMSLoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.read(onboardingProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!onboarding.isFinished) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ));
      }
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/login_landing_screen_cover.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              const Spacer(),
              const Gap(30),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Invyの利用を開始する",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 80),
                        backgroundColor: Colors.black,
                        // padding: const EdgeInsets.symmetric(vertical: 12)
                      ),
                      onPressed: () => _openSignup(context),
                      child: const Text(
                        "電話番号で登録 / ログイン",
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
              const SizedBox(height: 100),
            ],
          ),
        ));
  }
}
