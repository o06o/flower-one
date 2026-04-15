import 'package:flowerone/core/model/result/ui_result.dart';
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
  final String userMessage;

  const RecommendPage({
    super.key,
    required this.userMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;
    final viewModel = ref.read(recommendViewModelProvider.notifier);
    final state = ref.watch(recommendViewModelProvider);
    final favoriteIds = state.favoriteFlowerIds;
    final flowers = state.flowers;
    
    // 초기 상태 관리 (첫 스크롤 전까지는 모든 카드 축소)
    final hasInteracted = useState(false);

    // 초기화 및 이벤트 리스닝
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        viewModel.fetchRecommendations(userMessage);
      });
      return null;
    }, []);

    // PageController 초기화 - flowers가 있을 때만 생성
    final n = flowers.length;
    // 3개 이하는 무한스크롤 없이, 초과하면 무한스크롤
    final useInfiniteScroll = n > 3;
    final mid = _kVirtualPageCount ~/ 2;
    final infiniteInitialPage = n <= 0 ? 0 : mid - mid % n;
    
    final initialPage = useInfiniteScroll ? infiniteInitialPage : 0;
    
    final pageController = usePageController(
      viewportFraction: _kViewportFraction,
      initialPage: initialPage,
      keys: [flowers.length], // flowers 길이가 변경되면 재생성
    );
    
    useEffect(() {
      void onPageChanged() {
        if (!hasInteracted.value && pageController.hasClients) {
          final currentPage = pageController.page ?? initialPage.toDouble();
          if ((currentPage - initialPage.toDouble()).abs() > 0.1) {
            hasInteracted.value = true;
          }
        }
      }
      
      pageController.addListener(onPageChanged);
      return () => pageController.removeListener(onPageChanged);
    }, [pageController]);

    ref.listen(
      recommendViewModelProvider.select((state) => state.flowers),
      (prev, next) {
        if (next.isNotEmpty && (prev == null || prev.isEmpty)) {
          hasInteracted.value = true;
        }
      },
    );

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

    if (flowers.isEmpty && state.result is! Loading) {
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
            child: flowers.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : PageView.builder(
                    controller: pageController,
                    clipBehavior: Clip.none,
                    // 3개 이하면 실제 갯수만, 초과하면 무한 스크롤
                    itemCount: useInfiniteScroll ? _kVirtualPageCount : flowers.length,
                    itemBuilder: (context, index) {
                      final flower = flowers[index % flowers.length];
                      return _ScaledCarouselItem(
                        pageIndex: index,
                        pageController: pageController,
                        initialPage: initialPage,
                        forceSmallScale: !hasInteracted.value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                          child: RecommendFlowerCard(
                            flower: flower,
                            isFavorite: flower.flowerId != null && 
                                favoriteIds.contains(flower.flowerId!),
                            onTap: () => _showRecommendReason(context, flower),
                            onFavoriteTap: () => viewModel.toggleFavoriteFlower(flower),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          PrimaryFilledButton(
            child: Text(AppMessages.recommendFindShopButton, style: textTheme.main1RegularHakgyo,),
            onTap: (){

            },
          ),
          SpacingVertical20(),
        ],
      ),
    );
  }

  void _handleEvent({required BuildContext context, required RecommendUiEvent event}) {
    switch (event) {
      case Completed():
        break;
      case Failed():
        context.showToast(message: "일시적인 오류입니다.");
        break;
      case ShowToast(message: final message):
        context.showToast(message: message);
    }
  }

  void _showRecommendReason(BuildContext context,
      FlowerInfoModel flower,) {
    CustomBottomSheet.wrapShow(
      context: context,
      backgroundColor: context.colorScheme.white,
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, MediaQuery.paddingOf(context).bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                flower.name,
                style: context.textTheme.headline1RegularHakgyo,
              ),
              SpacingVertical16(),
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorVerticalDivider(
                      color: context.colorScheme.primary,
                      width: 4,
                      thickness: 4,
                      radius: BorderRadiusGeometry.circular(10),
                    ),
                    SpacingHorizontal8(),
                    Text(
                      AppMessages.recommendReasonLabel,
                      style: context.textTheme.headline2RegularHakgyo,
                    ),
                  ],
                ),
              ),
              SpacingVertical10(),
              Text(
                flower.reason,
                style: context.textTheme.main1RegularHakgyo,
              ),
              SpacingVertical16(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: PrimaryFilledButton(
                    child: Text(AppMessages.recommendMakeLetterShopButton, style: context.textTheme.main1RegularHakgyo,),
                    onTap: () {
        
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScaledCarouselItem extends StatelessWidget {
  final int pageIndex;
  final PageController pageController;
  final int initialPage;
  final bool forceSmallScale;
  final Widget child;

  const _ScaledCarouselItem({
    required this.pageIndex,
    required this.pageController,
    required this.initialPage,
    this.forceSmallScale = false,
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
        
        final scale = forceSmallScale
            ? _kScaleSide 
            : _kScaleSide + (_kScaleCenter - _kScaleSide) * curved;
        final opacity = forceSmallScale ? 0.72 : 0.72 + 0.28 * curved;

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