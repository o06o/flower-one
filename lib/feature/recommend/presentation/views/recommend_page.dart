import 'package:flowerone/feature/recommend/presentation/views/components/recommend_flower_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/model/model/flower_info_model.dart';


/// 가상 페이지 수 (양끝까지 스크롤해도 충분히 길게 느껴지도록)
const int _kVirtualPageCount = 0x8000;

/// 한 화면에 보이는 페이지 비율 — 옆 카드가 살짝 보이도록 1보다 작게
const double _kViewportFraction = 0.72;

/// 가운데 1.0, 양옆 축소 — 겹침 없이 대비만 줌
const double _kScaleCenter = 1.0;
const double _kScaleSide = 0.85;

class RecommendPage extends ConsumerStatefulWidget {
  final List<FlowerInfoModel> flowers;

  const RecommendPage({
    super.key,
    required this.flowers,
  });

  @override
  ConsumerState<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends ConsumerState<RecommendPage> {
  late final PageController _pageController;
  late final int _initialPage;

  final Set<String> _favoriteFlowerKeys = {};

  void _syncFavoritesFromFlowers(List<FlowerInfoModel> flowers) {
    _favoriteFlowerKeys.clear();
    for (final f in flowers) {
      if (f.isFavorited) {
        _favoriteFlowerKeys.add(_favoriteKey(f));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _syncFavoritesFromFlowers(widget.flowers);
    final n = widget.flowers.length;
    final mid = _kVirtualPageCount ~/ 2;
    _initialPage = n <= 0 ? 0 : mid - mid % n;
    _pageController = PageController(
      viewportFraction: _kViewportFraction,
      initialPage: _initialPage,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void didUpdateWidget(covariant RecommendPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.flowers != widget.flowers) {
      setState(() => _syncFavoritesFromFlowers(widget.flowers));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showRecommendReason(BuildContext context, FlowerInfoModel flower) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: scheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final bottom = MediaQuery.paddingOf(ctx).bottom;
        return Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                flower.name,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 3,
                    height: 14,
                    decoration: BoxDecoration(
                      color: scheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '추천 이유',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                flower.reason,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                  color: scheme.onSurface.withOpacity(0.9),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _favoriteKey(FlowerInfoModel flower) {
    final id = flower.flowerId;
    if (id != null) return 'id:$id';
    return 'name:${flower.name.trim()}';
  }

  Future<void> _toggleFavorite(FlowerInfoModel flower) async {
    final key = _favoriteKey(flower);
    final wasFavorite = _favoriteFlowerKeys.contains(key);

    if (!wasFavorite) {
      final id = flower.flowerId;
      if (id == null) {
        Fluttertoast.showToast(
          msg: '이 꽃은 아직 즐겨찾기할 수 없어요',
          toastLength: Toast.LENGTH_SHORT,
        );
        return;
      }
      try {
        await Supabase.instance.client.rpc(
          'add_favorite_flower',
          params: {'input_flower_id': id},
        );
        if (!mounted) return;
        setState(() => _favoriteFlowerKeys.add(key));
        Fluttertoast.showToast(
          msg: '즐겨찾기에 추가했어요',
          toastLength: Toast.LENGTH_SHORT,
        );
      } catch (_) {
        if (!mounted) return;
        Fluttertoast.showToast(
          msg: '즐겨찾기에 실패했어요',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } else {
      setState(() => _favoriteFlowerKeys.remove(key));
      Fluttertoast.showToast(
        msg: '즐겨찾기에서 해제했어요',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  void _showLetterBottomSheet(BuildContext context, FlowerInfoModel flower) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: scheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final bottom = MediaQuery.paddingOf(ctx).bottom;
        return Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                flower.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: scheme.primary,
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  // TODO: 편지 작성 화면 연결
                },
                child: const Text('편지 쓰기'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final flowers = widget.flowers;
    if (flowers.isEmpty) {
      return const Center(child: Text('추천 결과가 없어요.'));
    }

    return BottomNavWithContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpacingVertical20(),
          Text(
            '당신을 위한 추천',
            style: context.textTheme.headline1RegularHakgyo,
          ),
          SpacingVertical8(),
          Text(
            '오늘의 상황을 담아 고른 세 가지 꽃입니다.',
            style: context.textTheme.main1RegularHakgyo,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              clipBehavior: Clip.none,
              itemCount: _kVirtualPageCount,
              itemBuilder: (context, index) {
                final flower = flowers[index % flowers.length];
                return _ScaledCarouselItem(
                  pageIndex: index,
                  pageController: _pageController,
                  initialPage: _initialPage,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                    child: RecommendFlowerCard(
                      flower: flower,
                      isFavorite:
                          _favoriteFlowerKeys.contains(_favoriteKey(flower)),
                      onTap: () => _showRecommendReason(context, flower),
                      onFavoriteTap: () => _toggleFavorite(flower),
                      onLetterSheetTap: () =>
                          _showLetterBottomSheet(context, flower),
                    ),
                  ),
                );
              },
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
            ),
            onPressed: () {},
            child: const Text('주변 꽃집 찿기'),
          ),
          SpacingVertical20(),
        ],
      ),
    );
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