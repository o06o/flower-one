import 'package:flutter/material.dart';

import '../../designsystem/dialog/dialog.dart';
import '../../designsystem/toast/toast_extension.dart';
import '../../model/exception/exception.dart';

class UiErrorHandler {
  static void handle(
    BuildContext context,
    FlowerException exception,
  ) {
    switch (exception) {
      case AuthException():
        _showToast(context, exception.message);
      case NetworkException():
        _showDialog(context: context, title: "네트워크 오류", message: exception.message);
      case EmptyDataException():
        _showToast(context, exception.message);
        break;
      case APIException():
        if(exception.displayType == ErrorDisplayType.dialog) {
          _showDialog(context: context, title: "오류", message: exception.message);
        } else if (exception.displayType == ErrorDisplayType.topMostToast) {
          _showTopMostToast(context, exception.message);
        } else {
          _showToast(context, exception.message);
        }

      default:
        _showToast(context, exception.message);
    }
  }

  /// 다이얼로그로 표시
  static void _showDialog({required BuildContext context, String? title, String? message}) {
    CustomDialog.showAlert(
      context: context,
      title: title ?? "오류",
      body: message ?? "알수 없는 오류입니다.",
    );
  }

  /// 일반 토스트로 표시
  static void _showToast(BuildContext context, String? message) {
    context.showToast(message: message ?? "알 수 없는 오류입니다.");
  }

  /// 최상단 토스트로 표시
  static void _showTopMostToast(BuildContext context, String? message) {
    context.showToast(message: message ?? "알 수 없는 오류입니다.");
  }

}
