import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return router.canPop()
        ? IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => router.pop(),
          )
        : const SizedBox();
  }
}
