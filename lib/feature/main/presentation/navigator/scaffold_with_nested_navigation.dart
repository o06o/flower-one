import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    // final selectedItemColor = context.colorScheme.selectedBottomItemColor;
    // final unSelectedItemColor = context.colorScheme.black;
    // final selectedItemColorFilter =
    //     ColorFilter.mode(selectedItemColor, BlendMode.srcIn);
    // final unSelectedItemColorFilter =
    //     ColorFilter.mode(unSelectedItemColor, BlendMode.srcIn);

    return Scaffold(
      // backgroundColor: context.colorScheme.surface,
      body: widget.navigationShell,
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: widget.currentIndex,
      //   backgroundColor: context.colorScheme.grayscaleWhite,
      //   selectedItemColor: selectedItemColor,
      //   unselectedItemColor: context.colorScheme.black,
      //   unselectedLabelStyle: context.textTheme.tabBar
      //       .copyWith(color: context.colorScheme.black),
      //   selectedLabelStyle: context.textTheme.tabBar,
      //   items: [
      //     BottomNavigationBarItem(
      //       label: "홈",
      //       icon: BottomNavIcon(
      //         child: Assets.icons.iconUnselectedHome.svg(
      //           colorFilter: unSelectedItemColorFilter,
      //         ),
      //       ),
      //       activeIcon: BottomNavIcon(
      //         child: Assets.icons.iconSelectedHome.svg(
      //           colorFilter: selectedItemColorFilter,
      //         ),
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "추가",
      //       icon: BottomNavIcon(
      //         child: Assets.icons.iconCircleAdd.svg(
      //           colorFilter: unSelectedItemColorFilter,
      //         ),
      //       ),
      //       activeIcon: BottomNavIcon(
      //         child: Assets.icons.iconCircleAdd.svg(
      //           colorFilter: selectedItemColorFilter,
      //         ),
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "히스토리",
      //       icon: BottomNavIcon(
      //         child: Assets.icons.iconUnselectedHistory.svg(
      //           colorFilter: unSelectedItemColorFilter,
      //         ),
      //       ),
      //       activeIcon: BottomNavIcon(
      //         child: Assets.icons.iconSelectedHistory.svg(
      //           colorFilter: selectedItemColorFilter,
      //         ),
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "MY",
      //       icon: BottomNavIcon(
      //         child: Assets.icons.iconUnselectedMy.svg(
      //           colorFilter: unSelectedItemColorFilter,
      //         ),
      //       ),
      //       activeIcon: BottomNavIcon(
      //         child: Assets.icons.iconSelectedMy.svg(
      //           colorFilter: selectedItemColorFilter,
      //         ),
      //       ),
      //     ),
      //   ],
      //   onTap: (index) {
      //     final hasGroup = ref.read(hasGroupProvider);
      //
      //     switch (index) {
      //       case 0:
      //         context.go(PAGES.home.screenPath);
      //         break;
      //       case 1:
      //         if (hasGroup == true) {
      //           context.pushNamed(PAGES.add.screenName);
      //         } else {
      //           CustomDialog.showAlert(
      //               context: context,
      //               body: "아직 가입된 그룹이 없어요.\n그룹 생성 또는 참여해서\n이용해 주세요.");
      //         }
      //         return;
      //       case 2:
      //         if (hasGroup == true) {
      //           context.go(PAGES.history.screenPath);
      //         } else {
      //           CustomDialog.showAlert(
      //               context: context,
      //               body: "아직 가입된 그룹이 없어요.\n그룹 생성 또는 참여해서\n이용해 주세요.");
      //         }
      //         break;
      //       case 3:
      //         context.go(PAGES.my.screenPath);
      //         break;
      //     }
      //   },
      // ),
    );
  }
}
