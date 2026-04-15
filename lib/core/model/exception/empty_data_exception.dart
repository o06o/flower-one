
import 'api_exception.dart';

/// 빈 데이터 예외
class EmptyDataException extends APIException {
  EmptyDataException({
    super.message = "데이터가 없습니다.",
    super.severity = ErrorSeverity.info,
  });
}
