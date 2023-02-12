import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key, this.icon, required this.title, required this.onPressed});

  final IconData? icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            icon != null ? Icon(icon) : const SizedBox(),
            icon != null ? const Gap(5) : const SizedBox(),
            Expanded(child: Text(title)),
            Icon(Icons.chevron_right, color: Colors.grey.shade600)
          ],
        ),
      ),
    );
  }
}
