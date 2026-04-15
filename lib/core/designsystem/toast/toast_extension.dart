// toast_extensions.dart
import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FToast _fToast = FToast();

extension ToastExtensions on BuildContext {
  void showToast({required String message, ToastGravity gravity = ToastGravity.BOTTOM}) {
    try {
      _fToast.init(this);
      _fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: colorScheme.primary,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info, color: Colors.white),
              SizedBox(width: 12.0),
              Flexible(
                child: Text(
                  message,
                  style: textTheme.tabBar.copyWith(overflow: TextOverflow.ellipsis),
              ),)
            ],
          ),
        ),
        gravity: gravity,
        toastDuration: Duration(seconds: 3),
      );
    } catch (_) {
      // Overlay가 null인 경우 무시
    }
  }
}
