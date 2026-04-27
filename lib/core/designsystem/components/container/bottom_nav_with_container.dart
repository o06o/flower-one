import 'package:flutter/material.dart';

class BottomNavWithContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;

  const BottomNavWithContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        padding: padding,
        color: color,
        child: child,
      ),
    );
  }
}
