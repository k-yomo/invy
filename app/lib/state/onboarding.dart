import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

final onboardingProvider = Provider<Onboarding>((_) {
  throw Exception();
});

class Onboarding {
  late Box<bool> _box;

  bool get isFinished => _box.get('is-finished', defaultValue: false)!;
  Stream<BoxEvent> get isFinishedStream => _box.watch(key: 'is-finished');

  finish() async {
    await _box.put('is-finished', true);
  }

  unfinish() async {
    await _box.put('is-finished', false);
  }

  static Future<Onboarding> open() async {
    final onboarding = Onboarding();
    await onboarding._initHive();
    return onboarding;
  }

  Future<Onboarding> _initHive() async {
    _box = await Hive.openBox('onboarding');
    return this;
  }
}
