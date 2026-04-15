import 'exception.dart';

/// API 예외
/// 
/// severity에 따라 자동으로 displayType이 결정됩니다.
class APIException<T> extends FlowerException {
  final T? payload;
  final ErrorSeverity severity;

  APIException({
    super.httpStatusCode,
    String super.message = "API Error",
    this.payload,
    this.severity = ErrorSeverity.info,
  });

  /// Severity에 따른 표시 방식 자동 결정
  ErrorDisplayType get displayType => severity.displayType;

  /// severity를 변경한 새로운 APIException 생성
  APIException<T> copyWith({
    int? httpStatusCode,
    String? message,
    T? payload,
    ErrorSeverity? severity,
  }) {
    return APIException<T>(
      httpStatusCode: httpStatusCode ?? this.httpStatusCode,
      message: message ?? this.message ?? "API Error",
      payload: payload ?? this.payload,
      severity: severity ?? this.severity,
    );
  }
}

/// 에러 심각도
///
/// 심각도에 따라 자동으로 표시 방식(displayType)이 결정됩니다.
enum ErrorSeverity {
  /// 치명적 (앱 사용 불가, 즉시 조치 필요) - 다이얼로그
  critical,

  /// 경고 (기능 제한, 사용자 확인 필요) - 최상단 토스트
  warning,

  /// 정보 (일반 알림) - 토스트
  info;

  /// Severity에 따른 표시 방식 자동 결정
  ErrorDisplayType get displayType {
    switch (this) {
      case ErrorSeverity.critical:
        return ErrorDisplayType.dialog;
      case ErrorSeverity.warning:
        return ErrorDisplayType.topMostToast;
      case ErrorSeverity.info:
        return ErrorDisplayType.toast;
    }
  }
}

/// 에러 표시 방식
enum ErrorDisplayType {
  /// 다이얼로그로 표시 (사용자 액션 필요)
  dialog,

  /// 일반 토스트로 표시
  toast,

  /// 최상단 토스트로 표시 (가벼운 알림)
  topMostToast,
}


