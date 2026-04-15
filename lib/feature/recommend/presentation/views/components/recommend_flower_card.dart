import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../core/designsystem/components/button/heart_btn.dart';
import '../../../../../core/model/model/flower_info_model.dart';
import 'flower_image.dart';
import 'flower_item_header_section.dart';

class RecommendFlowerCard extends StatelessWidget {
  final FlowerInfoModel flower;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const RecommendFlowerCard({
    super.key,
    required this.flower,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
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
                            padding: const EdgeInsets.fromLTRB(
                              16,
                              10,
                              4,
                              10
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FlowerItemHeaderSection(
                                  label: flower.name,
                                  trailing: HeartButton(size: Size(48, 48), onTap: onFavoriteTap, isSelected: false,)
                                ),
                                SpacingHorizontal8(),
                                Text("꽃말: $desc", style: context.textTheme.main1RegularHakgyo,),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: 26,
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