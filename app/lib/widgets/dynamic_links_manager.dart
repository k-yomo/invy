import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DynamicLinksManager extends StatefulWidget {
  final Widget child;

  const DynamicLinksManager({required this.child, Key? key}) : super(key: key);

  @override
  State<DynamicLinksManager> createState() => _DynamicLinksManagerState();
}

class _DynamicLinksManagerState extends State<DynamicLinksManager> {
  @override
  void initState() {
    super.initState();
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      GoRouter.of(context).push(dynamicLinkData.link.path);
    }).onError((error) {
      // TODO: Error handling
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
