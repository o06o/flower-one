
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/model/exception/flower_exception.dart';
import '../../../../core/model/model/flower_info_model.dart';
import '../../../../core/model/result/ui_result.dart';
import '../event/garden_ui_event.dart';

part 'garden_viewmodel.freezed.dart';
part 'garden_viewmodel.g.dart';

@freezed
abstract class GardenState with _$GardenState {
  factory GardenState({
    int? lastGroupNo,
    @Default(false) bool isEditable,
    @Default(false) bool isLoading,
    @Default([]) List<FlowerInfoModel?> favoriteList,
    UiResult<GardenUiEvent>? result,
  }) = _GardenState;

  factory GardenState.init() {
    return GardenState(
      lastGroupNo: null,
      isEditable: false,
      favoriteList: [],
      result: null,
    );
  }
}

@Riverpod(keepAlive: false)
class GardenViewModel extends _$GardenViewModel {

  @override
  GardenState build() {
    return GardenState.init();
  }

  void _addResult(UiResult<GardenUiEvent> result) {
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