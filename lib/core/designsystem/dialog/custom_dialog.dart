import 'package:flutter/material.dart';

import '../components/coponents.dart';
import '../theme/theme_data.dart';

class CustomDialog {
  /// 커스텀 UI를 위한 범용 다이얼로그
  static Future<T?> show<T>({
    double widthPercent = 0.8,
    required BuildContext context,
    required Widget child,
    EdgeInsets padding = const EdgeInsets.all(24.0),
    double borderRadius = 16.0,
    Color? backgroundColor,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * widthPercent,
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor ?? context.colorScheme.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      },
    );
  }

  /// 확인 버튼만 있는 간단한 알림 다이얼로그
  static Future<void> showAlert({
    required BuildContext context,
    String title = "오류",
    required String body,
    String confirmText = '확인',
    VoidCallback? onConfirm,
    double borderRadius = 16.0,
    Color? backgroundColor,
    Color? confirmButtonColor,
    Color? confirmTextColor,
    bool barrierDismissible = false,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return PopScope(
          canPop: !barrierDismissible,
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: backgroundColor ?? context.colorScheme.white,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: context.textTheme.headline1Medium,
                    textAlign: TextAlign.center,
                  ),
                  const SpacingVertical16(),
                  Text(
                    body,
                    style: context.textTheme.main1RegularMulti,
                    textAlign: TextAlign.center,
                  ),
                  const SpacingVertical24(),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onConfirm?.call();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                        confirmButtonColor ?? context.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        confirmText,
                        style: context.textTheme.headline2Medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// 확인/취소 버튼이 있는 확인 다이얼로그
  static Future<bool?> showConfirm({
    required BuildContext context,
    required String title,
    required String body,
    String confirmText = '확인',
    String cancelText = '취소',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    double borderRadius = 16.0,
    Color? backgroundColor,
    Color? cancelButtonColor,
    Color? confirmButtonColor,
    Color? cancelTextColor,
    Color? confirmTextColor,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: backgroundColor ?? context.colorScheme.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.textTheme.headline1Medium,
                  textAlign: TextAlign.center,
                ),
                const SpacingVertical16(),
                Text(
                  body,
                  style: context.textTheme.main1RegularMulti,
                  textAlign: TextAlign.center,
                ),
                const SpacingVertical24(),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                            onCancel?.call();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: confirmButtonColor ??
                                context.colorScheme.neutral,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            cancelText,
                            style: context.textTheme.headline2MediumMultiWhite,
                          ),
                        ),
                      ),
                    ),
                    const SpacingHorizontal12(),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            onConfirm?.call();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: confirmButtonColor ??
                                context.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            confirmText,
                            style: context.textTheme.headline2MediumMulti,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}