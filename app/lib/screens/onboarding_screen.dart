import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:invy/state/onboarding.dart';

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.read(onboardingProvider);

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              title: 'Invyへようこそ!',
              body: 'Invyは気軽に遊びや飲み会などのさそいを送ることができるアプリです。',
              image: Image.asset('assets/images/onboarding_first.png'),
            ),
            PageViewModel(
              title: '10秒でさそいを送信！',
              body: '指定したグループや友達に一括でさそいを送ることができます。',
              image: Image.asset('assets/images/onboarding_second.png'),
            ),
            PageViewModel(
              title: 'さそいの返事は1タップで',
              body: '予定や気分に応じて返事をしましょう。断る場合も相手に通知は届きません。',
              image: Image.asset('assets/images/onboarding_third.png'),
            ),
          ],
          onDone: () async {
            await onboarding.finish();
            Navigator.of(context).pop();
          },
          showBackButton: true,
          next: const Icon(Icons.arrow_forward_ios),
          back: const Icon(Icons.arrow_back_ios),
          done: const Text(
            'Invyを始める',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blue,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
