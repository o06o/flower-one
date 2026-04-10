import 'package:flutter/material.dart';

class BottomNavWithContainer extends StatelessWidget {
  final Widget child;

  const BottomNavWithContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: child,
      ),
    );
  }
}
