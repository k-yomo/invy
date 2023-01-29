import 'package:flutter/material.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 0, thickness: 1, color: Colors.grey.shade200);
  }
}
