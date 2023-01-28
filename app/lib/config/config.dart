import 'package:firebase_core/firebase_core.dart';
import 'package:invy/services/firebase_options_local.dart' as local;
import 'package:invy/services/firebase_options_dev.dart' as dev;
import 'package:invy/services/firebase_options_prod.dart' as prod;
import 'package:universal_platform/universal_platform.dart';

const googleApiKey = String.fromEnvironment('GOOGLE_API_KEY');

abstract class AppConfig {
  String get apiBaseUrl;

  FirebaseOptions get firebaseOptions;
}

AppConfig getConfig() {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'prod':
      return ProdConfig();
    case 'dev':
      return DevConfig();
    default:
      return LocalConfig();
  }
}

class ProdConfig implements AppConfig {
  @override
  String get apiBaseUrl => 'https://api.invy-app.com';

  @override
  FirebaseOptions get firebaseOptions =>
      prod.DefaultFirebaseOptions.currentPlatform;
}

class DevConfig implements AppConfig {
  @override
  String get apiBaseUrl => 'https://api.invy-app.dev';

  @override
  FirebaseOptions get firebaseOptions =>
      dev.DefaultFirebaseOptions.currentPlatform;
}

class LocalConfig implements AppConfig {
  @override
  String get apiBaseUrl {
    return 'http://192.168.1.147:8000';
    // return 'http://$_host:8000';
  }

  @override
  FirebaseOptions get firebaseOptions =>
      local.DefaultFirebaseOptions.currentPlatform;

  String get _host {
// https://github.com/flutter/flutter/issues/36126#issuecomment-596215587
    if (UniversalPlatform.isAndroid) {
      return '10.0.2.2';
    } else {
      return '127.0.0.1';
    }
  }
}
