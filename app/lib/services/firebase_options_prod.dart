// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_prod.dart';
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
    apiKey: 'AIzaSyCnQLS7LhGwBObcxE9GyX-nyvS_J29TrGk',
    appId: '1:936800855868:web:22f1e5374d71179a372039',
    messagingSenderId: '936800855868',
    projectId: 'invy-prod',
    authDomain: 'invy-prod.firebaseapp.com',
    storageBucket: 'invy-prod.appspot.com',
    measurementId: 'G-LY64W99EJD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA00U2AzPNFCNnqjmEFBcrOe4A0xpl6WxE',
    appId: '1:936800855868:android:244cfd4a925c0cd1372039',
    messagingSenderId: '936800855868',
    projectId: 'invy-prod',
    storageBucket: 'invy-prod.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCV5O5yVDXflbvQitfo1lG_rtaAPAkZVWk',
    appId: '1:936800855868:ios:f9307aa120d6c703372039',
    messagingSenderId: '936800855868',
    projectId: 'invy-prod',
    storageBucket: 'invy-prod.appspot.com',
    iosClientId:
        '936800855868-026sf7rmspjb9lq1ggpnpnqb8uhukli1.apps.googleusercontent.com',
    iosBundleId: 'com.invy-app.invy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCV5O5yVDXflbvQitfo1lG_rtaAPAkZVWk',
    appId: '1:936800855868:ios:f9307aa120d6c703372039',
    messagingSenderId: '936800855868',
    projectId: 'invy-prod',
    storageBucket: 'invy-prod.appspot.com',
    iosClientId:
        '936800855868-026sf7rmspjb9lq1ggpnpnqb8uhukli1.apps.googleusercontent.com',
    iosBundleId: 'com.invy-app.invy',
  );
}