import 'package:flowerone/core/designsystem/components/container/bottom_nav_with_container.dart';
import 'package:flowerone/core/designsystem/dialog/bottomsheet/bottom_sheet.dart';
import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flowerone/feature/garden/presentation/model/garden_detail_type.dart';
import 'package:flowerone/feature/garden/presentation/model/garden_section_item_model.dart';
import 'package:flowerone/feature/garden/presentation/views/components/garden_network_image_box.dart';
import 'package:flowerone/feature/garden/presentation/views/components/garden_situation_card.dart';
import 'package:flowerone/feature/garden/presentation/viewmodel/garden_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GardenDetailPage extends ConsumerWidget {
  final GardenDetailType type;

  const GardenDetailPage({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gardenDetailViewModelProvider(type));

    return BottomNavWithContainer(
      color: context.colorScheme.neutral,
      child: switch (type) {
        GardenDetailType.favoriteFlowers => _FavoriteFlowerGridSection(
          isLoading: state.isLoading,
          items: state.favoriteFlowers,
        ),
        GardenDetailType.situationRecords => _SituationRecordListSection(
          isLoading: state.isLoading,
          items: state.situationRecords,
        ),
        GardenDetailType.letterRecords => _LetterRecordGridSection(
          isLoading: state.isLoading,
          items: state.letterRecords,
        ),
      },
    );
  }
}

class _FavoriteFlowerGridSection extends StatelessWidget {
  final bool isLoading;
  final List<GardenFavoriteFlowerItemModel> items;

  const _FavoriteFlowerGridSection({required this.isLoading, required this.items});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          '즐겨찾기한 꽃이 아직 없어요.',
          style: context.textTheme.main2Regular.copyWith(
            color: context.colorScheme.text_2,
          ),
        ),
      );
    }

    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return _FavoriteFlowerGridCard(
          item: item,
          onTap: () => _showFavoriteFlowerBottomSheet(context, item),
        );
      },
    );
  }

  void _showFavoriteFlowerBottomSheet(
    BuildContext context,
    GardenFavoriteFlowerItemModel item,
  ) {
    CustomBottomSheet.wrapShow(
      backgroundColor: context.colorScheme.white,
      context: context,
      child: _FavoriteFlowerBottomSheetContent(item: item),
    );
  }
}

class _FavoriteFlowerGridCard extends StatelessWidget {
  final GardenFavoriteFlowerItemModel item;
  final VoidCallback? onTap;

  const _FavoriteFlowerGridCard({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: GardenNetworkImageBox(url: item.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: context.textTheme.main2RegularHakgyo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteFlowerBottomSheetContent extends StatelessWidget {
  final GardenFavoriteFlowerItemModel item;

  const _FavoriteFlowerBottomSheetContent({required this.item});

  @override
  Widget build(BuildContext context) {
    final meaning = item.meaning.trim();

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: GardenNetworkImageBox(
                url: item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: context.textTheme.headline2RegularHakgyo.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            meaning.isEmpty ? '꽃말 정보가 없어요.' : meaning,
            textAlign: TextAlign.center,
            style: context.textTheme.main1Regular.copyWith(
              color: context.colorScheme.text_2,
            ),
          ),
        ],
      ),
    );
  }
}

class _SituationRecordListSection extends StatelessWidget {
  final bool isLoading;
  final List<GardenSituationRecordItemModel> items;

  const _SituationRecordListSection({required this.isLoading, required this.items});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          '상황 기록이 아직 없어요.',
          style: context.textTheme.main2Regular.copyWith(
            color: context.colorScheme.text_2,
          ),
        ),
      );
    }

    final groupedByDate = <String, List<GardenSituationRecordItemModel>>{};
    for (final item in items) {
      final dateKey = '${item.monthDay} (${item.dayOfWeek})';
      groupedByDate.putIfAbsent(dateKey, () => []);
      groupedByDate[dateKey]!.add(item);
    }

    final dateKeys = groupedByDate.keys.toList();

    return ListView.separated(
      itemCount: dateKeys.length,
      separatorBuilder: (_, _) => const SizedBox(height: 18),
      itemBuilder: (context, groupIndex) {
        final dateKey = dateKeys[groupIndex];
        final groupItems = groupedByDate[dateKey] ?? const [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                dateKey,
                style: context.textTheme.main1RegularHakgyo.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              itemCount: groupItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = groupItems[index];
                return GardenSituationCard(data: item);
              },
            ),
          ],
        );
      },
    );
  }
}

class _LetterRecordGridSection extends StatelessWidget {
  final bool isLoading;
  final List<GardenLetterRecordItemModel> items;

  const _LetterRecordGridSection({required this.isLoading, required this.items});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          '편지 기록이 아직 없어요.',
          style: context.textTheme.main2Regular.copyWith(
            color: context.colorScheme.text_2,
          ),
        ),
      );
    }

    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return _LetterRecordGridCard(item: item);
      },
    );
  }
}

class _LetterRecordGridCard extends StatelessWidget {
  final GardenLetterRecordItemModel item;

  const _LetterRecordGridCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GardenNetworkImageBox(url: item.backgroundImageUrl, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.35),
                ],
              ),
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.main2RegularHakgyo.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.subText2Regular.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
