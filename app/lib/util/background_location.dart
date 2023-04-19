import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/location_dto.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/ios_settings.dart';
import 'package:background_locator_2/settings/locator_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:invy/graphql/user_location.graphql.dart';
import 'package:invy/services/graphql_client.dart';

import '../config/config.dart';

@pragma('vm:entry-point')
void locationCallback(LocationDto location) async {
  final config = getConfig();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(options: config.firebaseOptions);
  }

  final graphqlClient = await initGraphQLClient(
    uri: '${config.apiBaseUrl}/query',
    subscriptionUri: '${config.apiBaseUrl}/subscriptions',
  );

  if (FirebaseAuth.instance.currentUser != null) {
    await graphqlClient.mutate$updateLocation(Options$Mutation$updateLocation(
        variables: Variables$Mutation$updateLocation(
            latitude: location.latitude, longitude: location.longitude)));
  }
}

void startBackgroundLocationService() {
  BackgroundLocator.registerLocationUpdate(locationCallback,
      autoStop: false,
      iosSettings: const IOSSettings(
          accuracy: LocationAccuracy.BALANCED, distanceFilter: 100),
      androidSettings: const AndroidSettings(
          accuracy: LocationAccuracy.BALANCED,
          interval: 300,
          distanceFilter: 100,
          androidNotificationSettings: AndroidNotificationSettings(
            // TODO: Update wording
            notificationChannelName: 'Location tracking',
            notificationTitle: 'Start Location Tracking',
            notificationMsg: 'バックグラウンドで位置情報を取得しています。',
            notificationBigMsg:
                '大まかな現在地を友達と共有するためにバックグラウンドで位置情報を取得しています。詳細な位置情報は共有されません。',
            notificationIcon: '',
            notificationIconColor: Colors.grey,
          )));
}
