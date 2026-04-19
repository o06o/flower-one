import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  final Text child;
  final double strokeWidth;
  final Color? strokeColor;

  const OutlinedText({
    super.key,
    required this.child,
    required this.strokeWidth,
    this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          child.data ?? "",
          style: child.style?.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor ?? Colors.black,
          ),
        ),
        child,
      ],
    );
  }
}
