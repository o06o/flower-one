import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/material.dart';

class GardenSectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTapViewAll;
  const GardenSectionHeader({
    required this.icon,
    required this.title,
    this.onTapViewAll,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
  final colorScheme = context.colorScheme;
  return Row(
    children: [
      Icon(icon, size: 18, color: colorScheme.primary),
      const SizedBox(width: 6),
      Text(
        title,
        style: context.textTheme.headline2RegularHakgyo.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      const Spacer(),
      GestureDetector(
        onTap: onTapViewAll,
        behavior: HitTestBehavior.opaque,
        child: Row(
          children: [
            Text(
              '전체보기',
              style: context.textTheme.main2Regular.copyWith(
                color: colorScheme.text_2,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: colorScheme.text_2,
            ),
          ],
        ),
      ),
    ],
  );
}
}
