import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FlowerItemHeaderSection extends StatelessWidget {
  final String label;
  final Widget? trailing;

  const FlowerItemHeaderSection({
    super.key,
    required this.label,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: context.textTheme.headline1Medium,
        ),
        if (trailing != null) ...[
          const Spacer(),
          trailing!,
        ],
      ],
    );
  }
}
