import 'package:firebase_core/firebase_core.dart';
import 'package:invy/services/firebase_options_local.dart' as local;
import 'package:invy/services/firebase_options_dev.dart' as dev;
import 'package:invy/services/firebase_options_prod.dart' as prod;
import 'package:universal_platform/universal_platform.dart';

const googleApiKey = String.fromEnvironment('GOOGLE_API_KEY');

enum Environment { Prod, Dev, Local }

abstract class AppConfig {
  Environment get environment;
  String get apiBaseUrl;
  String get iosBundleId;
  String get androidPackageName;

  String get dynamicLinkUriPrefix;

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
  Environment get environment => Environment.Prod;

  @override
  String get apiBaseUrl => 'https://api.invy-app.com';

  @override
  String get iosBundleId => 'com.invy-app';
  @override
  String get androidPackageName => 'com.invy_app';

  @override
  String get dynamicLinkUriPrefix => 'https://link.invy-app.com';

  @override
  FirebaseOptions get firebaseOptions =>
      prod.DefaultFirebaseOptions.currentPlatform;
}

class DevConfig implements AppConfig {
  @override
  Environment get environment => Environment.Dev;

  @override
  String get apiBaseUrl => 'https://api.invy-app.dev';

  @override
  String get iosBundleId => 'com.invy-app.dev';
  @override
  String get androidPackageName => 'com.invy_app.dev';

  @override
  String get dynamicLinkUriPrefix => 'https://link.invy-app.dev';

  @override
  FirebaseOptions get firebaseOptions =>
      dev.DefaultFirebaseOptions.currentPlatform;
}

class LocalConfig implements AppConfig {
  @override
  Environment get environment => Environment.Local;

  @override
  String get apiBaseUrl {
    // return 'http://$_host:8000';
    return 'http://192.168.1.147:8000';
  }

  @override
  String get iosBundleId => 'com.invy-app.local';
  @override
  String get androidPackageName => 'com.invy_app.local';

  @override
  String get dynamicLinkUriPrefix => 'https://invylocal.page.link';

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
