import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../designsystem/toast/toast_extension.dart';

class UrlLauncherUtil {
  UrlLauncherUtil._();

  /// 외부 브라우저로 URL을 엽니다.
  /// 
  /// [context]: 에러 토스트를 표시하기 위한 BuildContext
  /// [url]: 열고자 하는 URL 문자열
  /// [errorMessage]: URL을 열 수 없을 때 표시할 에러 메시지 (기본값: 'URL을 열 수 없습니다.')
  /// 
  /// Returns: URL 열기 성공 여부
  static Future<bool> launchExternalUrl(
    BuildContext context,
    String url, {
    String errorMessage = 'URL을 열 수 없습니다.',
  }) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri);
      return true;
    } catch (e) {
      if (context.mounted) {
        context.showToast(message: errorMessage);
      }
      return false;
    }
  }

  /// 카카오맵 URL을 외부 브라우저로 엽니다.
  static Future<bool> launchKakaoMap(BuildContext context, String url) {
    return launchExternalUrl(
      context,
      url,
      errorMessage: '카카오맵을 열 수 없습니다.',
    );
  }

  /// 전화 걸기
  static Future<bool> launchPhone(BuildContext context, String phoneNumber) {
    return launchExternalUrl(
      context,
      'tel:$phoneNumber',
      errorMessage: '전화를 걸 수 없습니다.',
    );
  }

  /// 이메일 보내기
  static Future<bool> launchEmail(BuildContext context, String email) {
    return launchExternalUrl(
      context,
      'mailto:$email',
      errorMessage: '이메일 앱을 열 수 없습니다.',
    );
  }
}
