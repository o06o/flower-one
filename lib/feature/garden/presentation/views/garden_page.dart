import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_messages.dart';
import '../model/garden_section_item_model.dart';
import '../viewmodel/garden_viewmodel.dart';

class GardenPage extends HookConsumerWidget {
  const GardenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gardenViewModelProvider);
    final viewModel = ref.read(gardenViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.loadGardenData();
      });
      return null;
    }, []);

    return BottomNavWithContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppMessages.gardenTitle,
            style: context.textTheme.headline1RegularHakgyo,
          ),
          SpacingVertical20(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _SectionHeader(
                    icon: Icons.favorite_rounded,
                    title: '즐겨찾기 한 꽃',
                  ),
                  SpacingVertical12(),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (_, _) => const SpacingHorizontal12(),
                      itemBuilder: (context, index) {
                        final item = state.favoriteFlowers[index];
                        return _FavoriteFlowerItem(data: item);
                      },
                    ),
                  ),
                  SpacingVertical20(),
                  _SectionHeader(
                    icon: Icons.event_note_rounded,
                    title: '상황 기록',
                    onTapViewAll: () => viewModel.loadAllSituationRecords(),
                  ),
                  SpacingVertical12(),
                  ListView.separated(
                    itemCount: state.situationRecords.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, _) => const SpacingHorizontal10(),
                    itemBuilder: (context, index) {
                      final item = state.situationRecords[index];
                      return _SituationCard(data: item);
                    },
                  ),
                  SpacingVertical20(),
                  const _SectionHeader(
                    icon: Icons.mail_rounded,
                    title: '편지 기록',
                  ),
                  SpacingVertical12(),
                  SizedBox(
                    height: 196,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.letterRecords.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final item = state.letterRecords[index];
                        return _LetterCard(data: item);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTapViewAll;

  const _SectionHeader({
    required this.icon,
    required this.title,
    this.onTapViewAll,
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

class _FavoriteFlowerItem extends StatelessWidget {
  final GardenFavoriteFlowerItemModel data;

  const _FavoriteFlowerItem({required this.data});

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
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: _NetworkImageBox(
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

class _SituationCard extends StatelessWidget {
  final GardenSituationRecordItemModel data;

  const _SituationCard({required this.data});

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
          _DateBadge(monthDay: data.monthDay, dayOfWeek: data.dayOfWeek),
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

class _DateBadge extends StatelessWidget {
  final String monthDay;
  final String dayOfWeek;

  const _DateBadge({required this.monthDay, required this.dayOfWeek});

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

class _LetterCard extends StatelessWidget {
  final GardenLetterRecordItemModel data;

  const _LetterCard({required this.data});

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
            child: _NetworkImageBox(url: data.backgroundImageUrl, width: 140),
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
              padding: const EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 12),
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

class _NetworkImageBox extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;

  const _NetworkImageBox({
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final imageUrl = url?.trim();
    if (imageUrl == null || imageUrl.isEmpty) {
      return _fallback(colorScheme, width, height);
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, _) => _fallback(colorScheme, width, height),
      errorWidget: (_, _, _) => _fallback(colorScheme, width, height),
    );
  }

  Widget _fallback(
    FlowerColorScheme colorScheme,
    double? width,
    double? height,
  ) {
    return Container(
      width: width,
      height: height,
      color: colorScheme.primary.withAlpha(18),
      alignment: Alignment.center,
      child: Icon(Icons.local_florist_rounded, color: colorScheme.primary),
    );
  }
}
