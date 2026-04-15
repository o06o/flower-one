import '../exception/flower_exception.dart';

/// UI 레이어 결과 타입
/// 
/// 성공, 실패, 로딩 상태를 표현합니다.
sealed class UiResult<T> {
  const UiResult();

  /// 패턴 매칭으로 결과 처리
  R when<R>({
    required R Function(T data) success,
    required R Function(FlowerException exception) error,
    required R Function(bool showProgress) loading,
  }) {
    return switch (this) {
      Success(data: final data) => success(data),
      Error(exception: final exception) => error(exception),
      Loading(showProgress: final show) => loading(show),
    };
  }

  R? whenData<R>({
    required R Function(T data) success,
    required R Function(FlowerException exception) error,
  }) {
    return switch (this) {
      Success(data: final data) => success(data),
      Error(exception: final exception) => error(exception),
      Loading() => null,
    };
  }

  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;
  bool get isLoading => this is Loading<T>;

  /// Success인 경우 데이터 반환, 아니면 null
  T? get dataOrNull {
    return switch (this) {
      Success(data: final data) => data,
      _ => null,
    };
  }

  /// Success인 경우 데이터 반환, 아니면 예외 발생
  T get data {
    return switch (this) {
      Success(data: final data) => data,
      Error(exception: final exception) => throw exception,
      Loading() => throw StateError('Cannot get data from Loading state'),
    };
  }

  /// Success인 경우 데이터 반환, 아니면 기본값 반환
  T getOrElse(T defaultValue) {
    return switch (this) {
      Success(data: final data) => data,
      _ => defaultValue,
    };
  }
}

/// 성공 결과
class Success<T> extends UiResult<T> {
  @override
  final T data;

  const Success(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Success(data: $data)';
}

class Error<T> extends UiResult<T> {
  final FlowerException exception;

  const Error(this.exception);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Error<T> &&
          runtimeType == other.runtimeType &&
          exception == other.exception;

  @override
  int get hashCode => exception.hashCode;

  @override
  String toString() => 'Error(exception: $exception)';
}

class Loading<T> extends UiResult<T> {
  final bool showProgress;

  const Loading({this.showProgress = true});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Loading<T> &&
          runtimeType == other.runtimeType &&
          showProgress == other.showProgress;

  @override
  int get hashCode => Object.hash(runtimeType, showProgress);

  @override
  String toString() => 'Loading(showProgress: $showProgress)';
}
