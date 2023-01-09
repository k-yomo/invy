import 'package:flutter/material.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return navigator.canPop()
        ? IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => navigator.pop(),
          )
        : SizedBox();
  }
}
