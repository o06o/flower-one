import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WhiteFilledButton extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const WhiteFilledButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: context.colorScheme.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // 원하는 둥글기 수치를 입력하세요
        ),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
