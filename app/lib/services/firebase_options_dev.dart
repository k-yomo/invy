// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDeDlEyC22AU2JUy7UAaJXbJsFrM7i1dY4',
    appId: '1:434214998297:web:2e81a7b559c93326017588',
    messagingSenderId: '434214998297',
    projectId: 'invy-dev',
    authDomain: 'invy-dev.firebaseapp.com',
    storageBucket: 'invy-dev.appspot.com',
    measurementId: 'G-6PSD0986G5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANleNFJ-HLPT9iv4e67YtCEodenp16jfY',
    appId: '1:434214998297:android:2c27d686d46de9cd017588',
    messagingSenderId: '434214998297',
    projectId: 'invy-dev',
    storageBucket: 'invy-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3jXar0DvD7RGipQyMmX73Ig_lK0ty9tg',
    appId: '1:434214998297:ios:3011c17df73cd3f9017588',
    messagingSenderId: '434214998297',
    projectId: 'invy-dev',
    storageBucket: 'invy-dev.appspot.com',
    iosClientId:
        '434214998297-qv9avs2uoq3f7mv9pv3nfsh2t39p0ue0.apps.googleusercontent.com',
    iosBundleId: 'com.invy-app.invy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3jXar0DvD7RGipQyMmX73Ig_lK0ty9tg',
    appId: '1:434214998297:ios:3011c17df73cd3f9017588',
    messagingSenderId: '434214998297',
    projectId: 'invy-dev',
    storageBucket: 'invy-dev.appspot.com',
    iosClientId:
        '434214998297-qv9avs2uoq3f7mv9pv3nfsh2t39p0ue0.apps.googleusercontent.com',
    iosBundleId: 'com.invy-app.invy',
  );
}