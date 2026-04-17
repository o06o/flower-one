import 'package:flowerone/core/model/exception/flower_exception.dart';
import 'package:flowerone/libraries/logger/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';

part 'letter_view_model.freezed.dart';
part 'letter_view_model.g.dart';

@freezed
abstract class LetterState with _$LetterState {
  factory LetterState({
    @Default('') String letterContent,
    @Default(AsyncData<void>(null)) AsyncValue<void> requestState,
  }) = _LetterState;

  factory LetterState.init() {
    return LetterState(
      letterContent: '',
      requestState: const AsyncData<void>(null),
    );
  }
}

@Riverpod(keepAlive: false)
class LetterViewModel extends _$LetterViewModel {
  @override
  LetterState build() {
    return LetterState.init();
  }

  /// 편지 생성하기
  Future<void> makeLetter({
    required String message,
    required String flowerName,
  }) async {
    final trimmed = message.trim();
    if (trimmed.isEmpty) {
      state = state.copyWith(
        requestState: AsyncError<void>(
          FlowerException(message: '메시지를 입력해주세요.'),
          StackTrace.current,
        ),
      );
      return;
    }

    state = state.copyWith(requestState: const AsyncLoading<void>());

    try {
      // final response = await ref.read(makeLetterUseCaseProvider).call(
      //   message: trimmed,
      //   flowerName: flowerName,
      // );

      // "response: ${response.result.letter}".logI();
      //
      // state = state.copyWith(
      //   letterContent: response.result.letter,
      //   requestState: const AsyncData<void>(null),
      // );
    } catch (error) {
      "오류 발견 ${error.toString()}".logE();
      state = state.copyWith(
        requestState: AsyncError<void>(
          _normalizeError(error),
          StackTrace.current,
        ),
      );
    }
  }

  void consumeRequestState() {
    state = state.copyWith(requestState: const AsyncData<void>(null));
  }

  FlowerException _normalizeError(dynamic error) {
    if (error is FlowerException) {
      return error;
    }
    return FlowerException(message: error?.toString() ?? AppMessages.unknownError);
  }
}
