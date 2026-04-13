import 'package:flowerone/core/model/exception/exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/model/model/flower_info_model.dart';
import '../../../../core/model/result/ui_result.dart';
import '../event/recommend_ui_event.dart';

part 'recommend_view_model.freezed.dart';
part 'recommend_view_model.g.dart';

@freezed
abstract class RecommendState with _$RecommendState {
  factory RecommendState({
    int? lastGroupNo,
    @Default(false) bool isEditable,
    @Default(false) bool isLoading,
    @Default([]) List<FlowerInfoModel?> groupList,
    UiResult<RecommendUiEvent>? result,
}) = _RecommendState;

  factory RecommendState.init() {
    return RecommendState(
      lastGroupNo: null,
      isEditable: false,
      groupList: [],
      result: null,
    );
  }
}

@Riverpod(keepAlive: false)
class RecommendViewModel extends _$RecommendViewModel {

  @override
  RecommendState build() {
    return RecommendState.init();
  }

  void _addResult(UiResult<RecommendUiEvent> result) {
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
        message: error?.toString() ?? "알 수 없는 오류가 발생했습니다.",
      )));
    }
  }
}