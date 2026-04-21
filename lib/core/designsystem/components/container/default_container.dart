import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final Widget child;
  final Color? color;

  const DefaultContainer({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color ?? context.colorScheme.white;
    return Material(color: backgroundColor, child: child);
  }
}
