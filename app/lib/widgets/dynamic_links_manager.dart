import 'package:flutter/scheduler.dart';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DynamicLinksManager extends StatelessWidget {
  final Widget child;

  const DynamicLinksManager({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      GoRouter.of(context).push(dynamicLinkData.link.path);
    }).onError((error) {
      // TODO: Error handling
    });
    return child;
  }
}
