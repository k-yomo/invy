import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, right: 10),
      padding: const EdgeInsets.only(bottom: 3),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
