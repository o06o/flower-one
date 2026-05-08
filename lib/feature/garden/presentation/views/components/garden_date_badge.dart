import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/material.dart';

class GardenDateBadge extends StatelessWidget {
  final String monthDay;
  final String dayOfWeek;

  const GardenDateBadge({
    required this.monthDay,
    required this.dayOfWeek,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Container(
      width: 56,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.primary.withAlpha(14),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            monthDay,
            style: context.textTheme.main1RegularHakgyo.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            dayOfWeek,
            style: context.textTheme.subText2Regular.copyWith(
              color: colorScheme.text_2,
            ),
          ),
        ],
      ),
    );
  }
}
