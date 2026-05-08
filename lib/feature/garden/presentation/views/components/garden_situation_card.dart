import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../../model/garden_section_item_model.dart';
import 'garden_date_badge.dart';

class GardenSituationCard extends StatelessWidget {
  final GardenSituationRecordItemModel data;

  const GardenSituationCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.line),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GardenDateBadge(monthDay: data.monthDay, dayOfWeek: data.dayOfWeek),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.main1RegularHakgyo.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpacingVertical8(),
                Text(
                  data.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.subText2Regular.copyWith(
                    color: colorScheme.text_2,
                  ),
                ),
              ],
            ),
          ),
          SpacingHorizontal8(),
          Icon(Icons.chevron_right_rounded, color: colorScheme.text_2),
        ],
      ),
    );
  }
}

