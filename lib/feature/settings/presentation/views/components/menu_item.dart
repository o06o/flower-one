import 'package:flutter/material.dart';

import '../../../../../core/designsystem/components/coponents.dart';
import '../../../../../core/designsystem/theme/theme_data.dart';

class SettingsMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final VoidCallback? onTap;
  final bool isDanger;

  const SettingsMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final isClickable = onTap != null;
    final textColor = isDanger
        ? context.colorScheme.read
        : context.colorScheme.text_1;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: textColor),
            SpacingHorizontal12(),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.main1Regular.copyWith(
                  color: textColor,
                ),
              ),
            ),
            if (value != null)
              Text(
                value!,
                style: context.textTheme.main2Regular.copyWith(
                  color: context.colorScheme.text_2,
                ),
              ),
            if (isClickable)
              Icon(
                Icons.chevron_right_rounded,
                color: context.colorScheme.text_2,
              ),
          ],
        ),
      ),
    );
  }
}
