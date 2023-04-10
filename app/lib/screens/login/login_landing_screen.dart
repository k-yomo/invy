import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/constants/urls.dart';
import 'package:invy/router.dart';
import 'package:invy/screens/login/sms_login_screen.dart';
import 'package:invy/state/post_login_redict.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../state/onboarding.dart';
import '../onboarding_screen.dart';

class LoginLandingScreen extends HookConsumerWidget {
  const LoginLandingScreen({super.key, this.from});

  final String? from;

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
    final isPostFrameCallbackCalled = useState(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isPostFrameCallbackCalled.value && !onboarding.isFinished) {
        isPostFrameCallbackCalled.value = true;
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ));
      }
    });

    useEffect(() {
      if (from != null && from != const LoginRoute().location) {
        ref.read(postLoginRedirectProvider.notifier).state = from;
      }
      return null;
    }, []);

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
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              await launchUrl(termsOfServiceUrl);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              "利用規約",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                            ),
                          ),
                          const Text(
                            "・",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () async {
                              await launchUrl(privacyPolicyUrl);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              "プライバシーポリシー",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                            ),
                          ),
                          const Text(
                            "に同意して",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Invyの利用を開始する",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Gap(15),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(0),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
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
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
