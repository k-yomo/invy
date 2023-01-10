import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/util/device.dart';
import 'package:package_info_plus/package_info_plus.dart';

String? uuidFromObject(Object object) {
  if (object is Map<String, Object>) {
    final String typeName = object['__typename'] as String;
    final String? id = (object['id'] as String?)?.toString();
    if (id != null) {
      return <String>[typeName, id].join('/');
    }
  }
  return null;
}

final graphqlClientProvider = Provider<GraphQLClient>((_) {
  throw Exception();
});

Future<GraphQLClient> initGraphQLClient({
  required String uri,
  String? subscriptionUri,
}) async {
  await initHiveForFlutter();

  final packageInfo = await PackageInfo.fromPlatform();
  final deviceInfo = await getDeviceInfo();

  Link httpLink = HttpLink(uri, defaultHeaders: {
    "X-App-Version": packageInfo.version,
    "X-App-Build-Number": packageInfo.buildNumber,
    "X-Device-Manufacturer": deviceInfo.manufacturer,
    "X-Device-Platform": Platform.operatingSystem,
    "X-Device-OS-Version": deviceInfo.osVersion,
    "X-Device-Model": deviceInfo.model,
    "X-Device-Id": deviceInfo.deviceId,
  });
  Link authLink = AuthLink(getToken: () async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return "";
    }
    final idToken = await currentUser.getIdToken();
    return "Bearer $idToken";
  });
  Link link = authLink.concat(httpLink);
  if (subscriptionUri != null) {
    final WebSocketLink websocketLink = WebSocketLink(
      subscriptionUri,
    );

    link = Link.split((request) => request.isSubscription, websocketLink, link);
  }

  return GraphQLClient(
    cache: GraphQLCache(store: HiveStore()),
    link: link,
  );
}
