import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../../model/garden_section_item_model.dart';
import 'garden_network_image_box.dart';

class GardenLetterCard extends StatelessWidget {
  final GardenLetterRecordItemModel data;

  const GardenLetterCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.line),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GardenNetworkImageBox(url: data.backgroundImageUrl, width: 140),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.colorScheme.white.withValues(alpha: 0.3),
                  context.colorScheme.white,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
          ),
          Positioned(
            bottom: 40,
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                vertical: 20,
                horizontal: 12,
              ),
              child: OutlinedText(
                strokeWidth: 2,
                strokeColor: context.colorScheme.white,
                child: Text(
                  data.preview,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.main2RegularHakgyo,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.main1RegularHakgyoBold,
                  ),
                  SpacingVertical6(),
                  Text(
                    data.date,
                    style: context.textTheme.subText2RegularHakgyo,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
