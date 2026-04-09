import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final Widget child;

  const DefaultContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = context.colorScheme.white;
    return Material(color: backgroundColor, child: child);
  }
}
