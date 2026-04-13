import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../core/model/model/flower_info_model.dart';
import 'flower_image.dart';
import 'flower_item_header_section.dart';

class RecommendFlowerCard extends StatelessWidget {
  final FlowerInfoModel flower;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onLetterSheetTap;

  const RecommendFlowerCard({
    super.key,
    required this.flower,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onLetterSheetTap,
  });

  @override
  Widget build(BuildContext context) {
    var desc = flower.meaning?.trim().isNotEmpty == true ? flower.meaning!.trim() : '—';
    var colorScheme = context.colorScheme;
    final radius = BorderRadius.circular(20);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          decoration: BoxDecoration(borderRadius: radius),
          child: ClipRRect(
            borderRadius: radius,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 4,
                  child: FlowerImage(imageUrl: flower.imageUrl),
                ),
                Expanded(
                  child: ColoredBox(
                    color: colorScheme.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 4,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FlowerItemHeaderSection(
                                  label: flower.name,
                                  trailing: TouchTarget42(
                                    onPressed: onFavoriteTap,
                                    child: Icon(
                                      isFavorite
                                          ? Icons.favorite_rounded
                                          : Icons.favorite_border_rounded,
                                    )
                                  )
                                ),
                                SpacingHorizontal8(),
                                Text("꽃말: $desc"),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TouchTarget42(
                              onPressed: onLetterSheetTap,
                              child: Icon(
                                Icons.keyboard_arrow_up_rounded,
                                size: 26,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}