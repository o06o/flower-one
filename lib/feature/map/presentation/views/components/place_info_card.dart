import 'package:flutter/material.dart';

import '../../../../../core/designsystem/components/coponents.dart';
import '../../../../../core/designsystem/theme/app_theme.dart';
import '../../../../../core/model/model/flower_shop_place_info_model.dart';
import '../../../../../core/resource/gen/assets.gen.dart';
import 'info_row_item.dart';

class PlaceInfoCard extends StatelessWidget {
  final FlowerShopPlaceInfoModel place;
  final VoidCallback onClose;
  final VoidCallback onOpenKakaoMap;

  const PlaceInfoCard({
    super.key,
    required this.place,
    required this.onClose,
    required this.onOpenKakaoMap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -12,
            right: -12,
            child: IconButton(
              icon: Assets.icons.icClose.svg(
                colorFilter: ColorFilter.mode(
                  context.colorScheme.black,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: onClose,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SpacingVertical16(),
              InfoRowItem(
                icon: Icons.location_on,
                text: place.roadAddress ?? place.address,
                maxLines: 2,
              ),
              if (place.distance != null) ...[
                SpacingVertical8(),
                InfoRowItem(
                  icon: Icons.directions_walk,
                  text: '${((double.tryParse(place.distance!) ?? 0) / 1000).toStringAsFixed(1)}km',
                ),
              ],
              if (place.phone != null && place.phone!.isNotEmpty) ...[
                SpacingVertical8(),
                InfoRowItem(
                  icon: Icons.phone,
                  text: place.phone!,
                ),
              ],
              SpacingVertical16(),
              _buildOpenMapButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: context.colorScheme.neutral,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            Assets.icons.floweroneLogoFilled.keyName,
            fit: BoxFit.contain,
          ),
        ),
        SpacingHorizontal8(),
        Expanded(
          child: Text(
            place.name,
            style: context.textTheme.headline2RegularHakgyo,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildOpenMapButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PrimaryFilledButton(
        onTap: onOpenKakaoMap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '카카오맵에서 보기',
              style: context.textTheme.main1RegularHakgyoWhite,
            ),
            SpacingHorizontal8(),
            Icon(Icons.open_in_new, size: 16, color: context.colorScheme.white),
          ],
        ),
      ),
    );
  }
}
