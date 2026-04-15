import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resource/resource.dart';
import '../../theme/theme_data.dart';

class CustomBottomSheet {
  static Future<T?> show<T>({
    double heightPercent = 0.7,
    required BuildContext context,
    required Widget child,
    EdgeInsets padding = EdgeInsets.zero,
    double borderRadius = 16.0,
    bool showDragHandle = true,
    bool showCloseButton = false,
  }) {
    final backgroundColor = Colors.transparent;
    return showModalBottomSheet(
      context: context,
      showDragHandle: showDragHandle,
      isScrollControlled: true,
      backgroundColor: context.colorScheme.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius),
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * heightPercent,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(borderRadius),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }

  // static Widget _buildChildWithCloseButton(BuildContext context, Widget child) {
  //   return Column(
  //     children: [
  //       // 오른쪽 상단 X 버튼
  //       Padding(
  //         padding: EdgeInsets.only(right: 6.w, top: 6.h),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             InkWell(
  //               onTap: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Container(
  //                 padding: EdgeInsets.all(8.w),
  //                 child: Assets.icons.iconDialogClose.svg(),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       // 기존 child 컨텐츠
  //       Expanded(child: child),
  //     ],
  //   );
  // }

  static Future<T?> wrapShow<T>({
    required BuildContext context,
    required Widget child,
    Color backgroundColor = Colors.transparent,
    double borderRadius = 16.0,
  }) {

    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      useSafeArea: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        final bottomInset = Platform.isAndroid ? MediaQuery.of(context).viewInsets.bottom + 46.0 : 16.0;
        return Container(
          padding: EdgeInsets.only(bottom: bottomInset),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Wrap(
            children: [child],
          ),
        );
      },
    );
  }

  /// 홈 스크린용 bottom sheet - AppBar 바로 아래까지 올라가고 dim 처리 없음
  static Future<T?> showForHome<T>({
    required BuildContext context,
    required Widget child,
    double borderRadius = 16.0,
    Color backgroundColor = Colors.white,
  }) {
    final appBarHeight = MediaQuery.of(context).padding.top + 56.h + 20;

    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: true,
      useSafeArea: false,
      isScrollControlled: true,
      showDragHandle: true,
      useRootNavigator: true,
      backgroundColor: context.colorScheme.white,
      barrierColor: Colors.transparent,
      // dim 처리 제거
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - appBarHeight,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorName.grayscaleGray300,
          width: 1.0,
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - appBarHeight,
            width: MediaQuery.of(context).size.width,
            child: child,
          ),
        );
      },
    );
  }
}
