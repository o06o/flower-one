import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/resource/gen/assets.gen.dart';
import '../../../../core/router/pages.dart';
import '../viewmodel/main_view_model.dart';

class ScaffoldWithNestedNavigation extends ConsumerStatefulWidget {
  final Widget navigationShell;
  final int currentIndex;

  const ScaffoldWithNestedNavigation({
    super.key,
    required this.currentIndex,
    required this.navigationShell,
  });

  @override
  ConsumerState<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends ConsumerState<ScaffoldWithNestedNavigation> {
  @override
  Widget build(BuildContext context) {
    final selectedItemColor = context.colorScheme.deepRed;
    final mainState = ref.watch(mainViewModelProvider);
    return Scaffold(
      backgroundColor: context.colorScheme.neutral,
      body: widget.navigationShell,
      appBar: AppBar(
        backgroundColor: context.colorScheme.neutral,
        surfaceTintColor: Colors.transparent,
        actionsPadding: EdgeInsets.only(right: 20),
        titleTextStyle: context.textTheme.headline1RegularHakgyo,
        title: widget.currentIndex == 2 ? Text("나의 정원") : Text(""),
        actions: [
          InkWell(
            onTap: () {
              context.push(PAGES.settings.screenPath);
            },
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: _ProfileThumbnail(imageUrl: mainState.profileImageUrl),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: widget.currentIndex,
        selectedItemColor: selectedItemColor,
        selectedLabelStyle: context.textTheme.tabBar,
        items: [
          BottomNavigationBarItem(
            label: "지도",
            icon: BottomNavIcon(child: Assets.icons.icMap.svg()),
            activeIcon: BottomNavIcon(child: Assets.icons.icMapFilled.svg()),
            backgroundColor: context.colorScheme.white,
          ),
          BottomNavigationBarItem(
            label: "홈",
            icon: BottomNavIcon(child: Assets.icons.icHome.svg()),
            activeIcon: BottomNavIcon(child: Assets.icons.icHomeFilled.svg()),
            backgroundColor: context.colorScheme.white,
          ),
          BottomNavigationBarItem(
            label: "정원",
            icon: BottomNavIcon(child: Assets.icons.icGarden.svg()),
            activeIcon: BottomNavIcon(child: Assets.icons.icGardenFilled.svg()),
            backgroundColor: context.colorScheme.white,
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(PAGES.map.screenPath);
              break;
            case 1:
              context.pushNamed(PAGES.home.screenName);
              return;
            case 2:
              context.go(PAGES.garden.screenPath);
              break;
          }
        },
      ),
    );
  }
}

class _ProfileThumbnail extends StatelessWidget {
  final String? imageUrl;

  const _ProfileThumbnail({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim();
    final hasImage = url != null && url.isNotEmpty;

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: context.colorScheme.white,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: hasImage
          ? CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (_, _) => _fallback(context),
              errorWidget: (_, _, _) => _fallback(context),
            )
          : _fallback(context),
    );
  }

  Widget _fallback(BuildContext context) {
    return Icon(
      Icons.person_rounded,
      size: 18,
      color: context.colorScheme.text_2,
    );
  }
}
