import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/resource/gen/assets.gen.dart';
import '../../../../core/router/pages.dart';

class ScaffoldWithNestedNavigation extends ConsumerStatefulWidget {
  final Widget navigationShell;
  final int currentIndex;

  const ScaffoldWithNestedNavigation(
      {super.key, required this.currentIndex, required this.navigationShell});

  @override
  ConsumerState<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends ConsumerState<ScaffoldWithNestedNavigation> {
  @override
  Widget build(BuildContext context) {
    final selectedItemColor = context.colorScheme.deepRed;

    return Scaffold(
      backgroundColor: context.colorScheme.neutral,
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: widget.currentIndex,
        selectedItemColor: selectedItemColor,
        selectedLabelStyle: context.textTheme.tabBar,
        items: [
          BottomNavigationBarItem(
            label: "지도",
            icon: BottomNavIcon(
              child: Assets.icons.icMap.svg(),
            ),
            activeIcon: BottomNavIcon(
              child: Assets.icons.icMapFilled.svg(),
            ),
            backgroundColor: context.colorScheme.white,
          ),
          BottomNavigationBarItem(
            label: "홈",
            icon: BottomNavIcon(
              child: Assets.icons.icHome.svg(
              ),
            ),
            activeIcon: BottomNavIcon(
              child: Assets.icons.icHomeFilled.svg(),
            ),
            backgroundColor: context.colorScheme.white,
          ),
          BottomNavigationBarItem(
            label: "정원",
            icon: BottomNavIcon(
              child: Assets.icons.icGarden.svg(
              ),
            ),
            activeIcon: BottomNavIcon(
              child: Assets.icons.icGardenFilled.svg(),
            ),
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
