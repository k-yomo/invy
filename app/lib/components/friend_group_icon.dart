import 'package:flutter/material.dart';

class FriendGroupIcon extends StatelessWidget {
  const FriendGroupIcon(
    this.groupName, {
    super.key,
    this.size,
  });

  final String groupName;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size ?? 100),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple,
            Colors.pink,
            Colors.orange,
          ],
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Text(groupName.substring(0, 1),
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
