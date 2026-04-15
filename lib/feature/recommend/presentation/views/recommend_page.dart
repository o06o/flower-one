import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/dialog/dialog.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/designsystem/toast/toast_extension.dart';
import '../../../../core/model/model/flower_info_model.dart';
import '../../../../core/utils/error/ui_error_handler.dart';
import '../../../../libraries/logger/logger.dart';
import '../event/recommend_ui_event.dart';
import '../../presentation/viewmodel/recommend_view_model.dart';
import 'components/recommend_flower_card.dart';

/// 가상 페이지 수 (양끝까지 스크롤해도 충분히 길게 느껴지도록)
const int _kVirtualPageCount = 0x8000;

/// 한 화면에 보이는 페이지 비율 — 옆 카드가 살짝 보이도록 1보다 작게
const double _kViewportFraction = 0.72;

/// 가운데 1.0, 양옆 축소 — 겹침 없이 대비만 줌
const double _kScaleCenter = 1.0;
const double _kScaleSide = 0.85;

class RecommendPage extends HookConsumerWidget {
  final List<FlowerInfoModel> flowers;

  const RecommendPage({
    super.key,
    required this.flowers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = context.colorScheme;
    final textTheme = context.textTheme;
    final viewModel = ref.read(recommendViewModelProvider.notifier);
    final favoriteIds = ref.watch(recommendViewModelProvider).favoriteFlowerIds;

    // PageController 초기화
    final n = flowers.length;
    final mid = _kVirtualPageCount ~/ 2;
    final initialPage = n <= 0 ? 0 : mid - mid % n;
    final pageController = usePageController(
      viewportFraction: _kViewportFraction,
      initialPage: initialPage,
    );

    // 초기화 및 이벤트 리스닝
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        viewModel.initializeFavorites(flowers);
      });
      return null;
    }, []);

    // 이벤트 리스닝
    ref.listen(
      recommendViewModelProvider.select((state) => state.result),
      (prev, next) {
        if (next != null) {
          next.when(
            success: (event) {
              _handleEvent(context: context, event: event,);
            },
            error: (error) {
              UiErrorHandler.handle(context, error);
            },
            loading: (bool showProgress) {
              showProgress
                  ? LottieProgressDialog.show(context: context)
                  : LottieProgressDialog.hide();
            },
          );
          viewModel.consumeResult();
        }
      },
    );

    void showRecommendReason(FlowerInfoModel flower) {
      final bottom = MediaQuery.paddingOf(context).bottom;

      CustomBottomSheet.wrapShow(
        context: context,
        backgroundColor: colorTheme.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                flower.name,
                style: context.textTheme.headline1RegularHakgyo,
              ),
              SpacingHorizontal16(),
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorVerticalDivider(
                      color: colorTheme.primary,
                      width: 4,
                      thickness: 4,
                      radius: BorderRadiusGeometry.circular(10),
                    ),
                    SpacingHorizontal8(),
                    Text(
                      AppMessages.recommendReasonLabel,
                      style: textTheme.headline2RegularHakgyo,
                    ),
                  ],
                ),
              ),
              SpacingHorizontal10(),
              Text(
                flower.reason,
                style: textTheme.main1RegularHakgyo,
              ),
            ],
          ),
        ),
      );
    }

    if (flowers.isEmpty) {
      return const Center(child: Text(AppMessages.recommendEmpty));
    }

    return BottomNavWithContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpacingVertical20(),
          Text(
            AppMessages.recommendTitle,
            style: textTheme.headline1RegularHakgyo,
          ),
          SpacingVertical8(),
          Text(
            AppMessages.recommendSubtitle,
            style: textTheme.main1RegularHakgyo,
          ),
          SpacingVertical8(),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              clipBehavior: Clip.none,
              itemCount: _kVirtualPageCount,
              itemBuilder: (context, index) {
                final flower = flowers[index % flowers.length];
                return _ScaledCarouselItem(
                  pageIndex: index,
                  pageController: pageController,
                  initialPage: initialPage,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                    child: RecommendFlowerCard(
                      flower: flower,
                      isFavorite: flower.flowerId != null && 
                          favoriteIds.contains(flower.flowerId!),
                      onTap: () => showRecommendReason(flower),
                      onFavoriteTap: () => viewModel.toggleFavoriteFlower(flower),
                    ),
                  ),
                );
              },
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: colorTheme.primary,
            ),
            onPressed: () {},
            child: const Text(AppMessages.recommendFindShopButton),
          ),
          SpacingVertical20(),
        ],
      ),
    );
  }

  void _handleEvent({required BuildContext context, required RecommendUiEvent event}) {
    switch (event) {
      case Completed():
        "성공".logD();
        break;
      case Failed():
        context.showToast(message: "일시적인 오류입니다.");
        break;
      case ShowToast(message: final message):
        context.showToast(message: message);
    }
  }
}

class _ScaledCarouselItem extends StatelessWidget {
  final int pageIndex;
  final PageController pageController;
  final int initialPage;
  final Widget child;

  const _ScaledCarouselItem({
    required this.pageIndex,
    required this.pageController,
    required this.initialPage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, cardChild) {
        double page = initialPage.toDouble();
        if (pageController.hasClients) {
          page = pageController.page ?? initialPage.toDouble();
        }
        final delta = (page - pageIndex).abs();
        final t = (1.0 - delta.clamp(0.0, 1.0));
        final curved = Curves.easeOut.transform(t);
        final scale = _kScaleSide + (_kScaleCenter - _kScaleSide) * curved;
        final opacity = 0.72 + 0.28 * curved;

        return Center(
          child: Transform.scale(
            scale: scale,
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: opacity.clamp(0.0, 1.0),
              child: cardChild,
            ),
          ),
        );
      },
      child: child,
    );
  }
}