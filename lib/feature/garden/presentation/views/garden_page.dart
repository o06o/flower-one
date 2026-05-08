import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/router/pages.dart';
import '../model/garden_detail_type.dart';
import '../viewmodel/garden_viewmodel.dart';
import 'components/garden_favorite_flower_card.dart';
import 'components/garden_letter_card.dart';
import 'components/garden_section_header.dart';
import 'components/garden_situation_card.dart';

class GardenPage extends HookConsumerWidget {
  const GardenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gardenViewModelProvider);
    final viewModel = ref.read(gardenViewModelProvider.notifier);
    final hasFavorites = state.favoriteFlowers.isNotEmpty;
    final hasSituations = state.situationRecords.isNotEmpty;
    final hasLetters = state.letterRecords.isNotEmpty;
    final hasAnySection = hasFavorites || hasSituations || hasLetters;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.loadGardenData();
      });
      return null;
    }, []);

    return BottomNavWithContainer(
      color: context.colorScheme.neutral,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!hasAnySection)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            '아직 정원이 채워지지 않았어요.',
                            textAlign: TextAlign.center,
                            style: context.textTheme.headline2RegularHakgyo.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SpacingVertical12(),
                          Text(
                            '꽃을 추천받거나 즐겨찾기를 해서 정원을 채워주세요',
                            textAlign: TextAlign.center,
                            style: context.textTheme.main2Regular.copyWith(
                              color: context.colorScheme.text_2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (hasFavorites) ...[
                    GardenSectionHeader(
                      icon: Icons.favorite_rounded,
                      title: GardenDetailType.favoriteFlowers.title,
                      onTapViewAll: () {
                        context.pushNamed(
                          PAGES.gardenDetail.screenName,
                          extra: GardenDetailType.favoriteFlowers,
                        );
                      },
                    ),
                    SpacingVertical12(),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.favoriteFlowers.length <= 4
                            ? state.favoriteFlowers.length
                            : 4,
                        separatorBuilder: (_, _) => const SpacingHorizontal12(),
                        itemBuilder: (context, index) {
                          final item = state.favoriteFlowers[index];
                          return GardenFavoriteFlowerCard(data: item);
                        },
                      ),
                    ),
                    SpacingVertical20(),
                  ],
                  if (hasSituations) ...[
                    GardenSectionHeader(
                      icon: Icons.event_note_rounded,
                      title: GardenDetailType.situationRecords.title,
                      onTapViewAll: () {
                        context.pushNamed(
                          PAGES.gardenDetail.screenName,
                          extra: GardenDetailType.situationRecords,
                        );
                      },
                    ),
                    SpacingVertical12(),
                    ListView.separated(
                      itemCount: state.situationRecords.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, _) => const SpacingVertical8(),
                      itemBuilder: (context, index) {
                        final item = state.situationRecords[index];
                        return GardenSituationCard(data: item);
                      },
                    ),
                    SpacingVertical20(),
                  ],
                  if (hasLetters) ...[
                    GardenSectionHeader(
                      icon: Icons.mail_rounded,
                      title: GardenDetailType.letterRecords.title,
                      onTapViewAll: () {
                        context.pushNamed(
                          PAGES.gardenDetail.screenName,
                          extra: GardenDetailType.letterRecords,
                        );
                      },
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
                          return GardenLetterCard(data: item);
                        },
                      ),
                    ),
                    SpacingVertical8(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

