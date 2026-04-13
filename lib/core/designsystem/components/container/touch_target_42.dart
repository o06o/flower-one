
import 'package:flutter/material.dart';

class TouchTarget42 extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const TouchTarget42({super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(21),
      child: SizedBox(
        width: 42,
        height: 42,
        child: Center(child: child),
      ),
    );
  }
}