import 'package:flowerone/core/model/exception/flower_exception.dart';
import 'package:flowerone/libraries/logger/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/model/result/ui_result.dart';
import '../../domain/provider/make_letter_usecase_provider.dart';
import '../event/letter_ui_event.dart';

part 'letter_view_model.freezed.dart';
part 'letter_view_model.g.dart';

@freezed
abstract class LetterState with _$LetterState {
  factory LetterState({
    @Default('') String letterContent,
    @Default(false) bool isLoading,
    UiResult<LetterUiEvent>? result,
  }) = _LetterState;

  factory LetterState.init() {
    return LetterState(
      letterContent: '',
      isLoading: false,
      result: null,
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
  Future<void> makeLetter() async {

    _addResult(const Loading(showProgress: true));
    state = state.copyWith(isLoading: true);

    try {
      final response = await ref.read(makeLetterUseCaseProvider).call(
        message: "30".toString(),
        flowerName: "123".toString(),
      );

      "response: ${response.result.letter}".logI();

      state = state.copyWith(
        letterContent: response.result.letter,
        isLoading: false,
      );

      _addResult(const Loading(showProgress: false));
    } catch (error) {
      "오류 발견 ${error.toString()}".logE();
      state = state.copyWith(isLoading: false);
      _addResult(const Loading(showProgress: false));
      _handleError(error);
    }
  }

  void _addResult(UiResult<LetterUiEvent> result) {
    state = state.copyWith(result: result);
  }

  void consumeResult() {
    state = state.copyWith(result: null);
  }

  void _handleError(dynamic error) {
    if (error is FlowerException) {
      _addResult(Error(error));
    } else {
      _addResult(Error(FlowerException(
        message: error?.toString() ?? AppMessages.unknownError,
      )));
    }
  }
}
