import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:invy/config/config.dart';
import 'package:invy/constants/appstore.dart';
import 'package:invy/constants/urls.dart';

Future<ShortDynamicLink> buildUserProfileDynamicLink(String userId) async {
  final profileLink = Uri.parse("https://invy-app.com/users/$userId");
  return buildDynamicLink(profileLink);
}

Future<ShortDynamicLink> buildDynamicLink(Uri url) async {
  final config = getConfig();
  final parameters = DynamicLinkParameters(
    uriPrefix: config.dynamicLinkUriPrefix,
    link: url,
    iosParameters: IOSParameters(
        bundleId: config.iosBundleId,
        minimumVersion: '1',
        fallbackUrl: appStorePageUrl,
        appStoreId: appStoreId),
    androidParameters: AndroidParameters(
      packageName: config.iosBundleId,
      minimumVersion: 1,
      // TODO: set android play store app page url
      // fallbackUrl: ,
    ),
  );
  return await FirebaseDynamicLinks.instance.buildShortLink(parameters);
}
