import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/location_dto.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/ios_settings.dart';
import 'package:background_locator_2/settings/locator_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:invy/graphql/user_location.graphql.dart';
import 'package:invy/services/graphql_client.dart';

void callback(LocationDto location) async {
  if (FirebaseAuth.instance.currentUser != null) {
    graphqlClient!.mutate$updateLocation(Options$Mutation$updateLocation(
        variables: Variables$Mutation$updateLocation(
            latitude: location.latitude, longitude: location.longitude)));
  }
}

void startBackgroundLocationService() {
  BackgroundLocator.registerLocationUpdate(callback,
      autoStop: false,
      iosSettings: const IOSSettings(
          accuracy: LocationAccuracy.NAVIGATION, distanceFilter: 0),
      androidSettings: const AndroidSettings(
          accuracy: LocationAccuracy.NAVIGATION,
          interval: 60,
          distanceFilter: 0,
          androidNotificationSettings: AndroidNotificationSettings(
            // TODO: Update wording
            notificationChannelName: 'Location tracking',
            notificationTitle: 'Start Location Tracking',
            notificationMsg: 'Track location in background',
            notificationBigMsg:
                'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
            notificationIcon: '',
            notificationIconColor: Colors.grey,
          )));
}
