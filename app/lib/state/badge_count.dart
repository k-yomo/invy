import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:invy/graphql/schema.graphql.dart';

final pushNotificationBadgeCounter = Provider<BadgeCounter>((_) {
  throw Exception();
});

class BadgeCounter {
  late Box<int> _box;

  int get badgeCount => _box.get('badge-count', defaultValue: 0)!;

  setBadgeCount(int badgeCount) async {
    await FlutterAppBadger.updateBadgeCount(badgeCount);
    _box.put('badge-count', badgeCount);
  }

  Stream<BoxEvent> get stream => _box.watch();

  static Future<BadgeCounter> open() async {
    final badgeCounter = BadgeCounter();
    await badgeCounter._initHive();
    return badgeCounter;
  }

  Future<BadgeCounter> _initHive() async {
    _box = await Hive.openBox('push-notification-badge-count');
    return this;
  }
}

Future handlePushMessage(RemoteMessage message) async {
  final messageType = fromJson$Enum$PushNotificationType(message.data["type"]);
  final badgeTargetTypes = [
    Enum$PushNotificationType.INVITATION_RECEIVED,
    Enum$PushNotificationType.CHAT_MESSAGE_RECEIVED,
  ];
  if (badgeTargetTypes.contains(messageType)) {
    final badgeCounter = await BadgeCounter.open();
    await badgeCounter.setBadgeCount(badgeCounter.badgeCount + 1);
  }
}
