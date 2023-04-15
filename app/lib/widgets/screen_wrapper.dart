import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invy/graphql/version.graphql.dart';
import 'package:invy/services/graphql_client.dart';
import 'package:invy/state/device.dart';
import 'package:invy/state/version.dart';
import 'package:invy/widgets/require_version_up_dialog.dart';
import 'package:version/version.dart';

class ScreenWrapper extends HookConsumerWidget {
  final Widget child;

  const ScreenWrapper({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final versionChecked = ref.read(versionCheckedProvider);
    if (!versionChecked) {
      final graphqlClient = ref.read(graphqlClientProvider);
      final packageInfo = ref.read(packageInfoProvider);
      final getMinRequiredAppVersionQuery = useMemoized(() =>
          graphqlClient.query$getMinRequiredAppVersion(
              Options$Query$getMinRequiredAppVersion(
            fetchPolicy: FetchPolicy.networkOnly,
          )));
      getMinRequiredAppVersionQuery.then((result) async {
        ref.read(versionCheckedProvider.notifier).state = true;
        if (result.parsedData == null) {
          return;
        }
        final minRequiredVersion = Version.parse(
            result.parsedData!.getMinRequiredAppVersion.minRequiredAppVersion);
        final currentVersion = Version.parse(packageInfo.version);
        if (currentVersion < minRequiredVersion) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const RequireVersionUpDialog();
              },
            );
          });
        }
      });
    }

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      GoRouter.of(context).push(dynamicLinkData.link.path);
    }).onError((error) {
      // TODO: Error handling
    });
    return child;
  }
}
