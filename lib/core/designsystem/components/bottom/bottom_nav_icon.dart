import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  final Widget child;

  const BottomNavIcon({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4), // 고정
      child: child,
    );
  }
}
