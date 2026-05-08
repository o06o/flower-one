import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../../model/garden_section_item_model.dart';
import 'garden_network_image_box.dart';

class GardenFavoriteFlowerCard extends StatelessWidget {
  final GardenFavoriteFlowerItemModel data;

  const GardenFavoriteFlowerCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      decoration: BoxDecoration(
        color: context.colorScheme.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: GardenNetworkImageBox(
              url: data.imageUrl,
              width: 88,
              height: 88,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.main2RegularHakgyo,
          ),
        ],
      ),
    );
  }
}
