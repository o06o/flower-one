import 'package:flutter/material.dart';
import 'apple_log_painter.dart';

class SignInWithAppleButton extends StatelessWidget {
  const SignInWithAppleButton({
    super.key,
    required this.onPressed,
    this.text = 'Sign in with Apple  ',
    this.width = 230,
    this.height = 44,
    this.textSize = 14,
    this.backgroundColor = Colors.black,
    this.fontColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(50.0)),
  });

  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final double textSize;
  final BorderRadius borderRadius;

  final Color backgroundColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 22 * (25 / 31),
              height: 22,
              child: CustomPaint(
                painter: AppleLogoPainter(color: fontColor),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: textSize,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
