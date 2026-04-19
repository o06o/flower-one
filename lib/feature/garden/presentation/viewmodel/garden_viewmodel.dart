import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/model/exception/flower_exception.dart';
import '../../../../core/model/result/ui_result.dart';
import '../data/garden_mock_data.dart';
import '../event/garden_ui_event.dart';
import '../model/garden_section_item_model.dart';

part 'garden_viewmodel.freezed.dart';
part 'garden_viewmodel.g.dart';

@freezed
abstract class GardenState with _$GardenState {
  factory GardenState({
    @Default(false) bool isLoading,
    @Default([]) List<GardenFavoriteFlowerItemModel> favoriteFlowers,
    @Default([]) List<GardenSituationRecordItemModel> situationRecords,
    @Default([]) List<GardenLetterRecordItemModel> letterRecords,
    UiResult<GardenUiEvent>? result,
  }) = _GardenState;

  factory GardenState.init() {
    return GardenState(isLoading: true, result: null);
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

  Future<void> loadMockData() async {
    state = state.copyWith(isLoading: true);
    await Future<void>.delayed(const Duration(milliseconds: 100));

    state = state.copyWith(
      isLoading: false,
      favoriteFlowers: kGardenMockFavoriteFlowers,
      situationRecords: kGardenMockSituationRecords,
      letterRecords: kGardenMockLetterRecords,
    );
  }

  void _handleError(dynamic error) {
    if (error is FlowerException) {
      _addResult(Error(error));
    } else {
      _addResult(
        Error(
          FlowerException(
            message: error?.toString() ?? AppMessages.unknownError,
          ),
        ),
      );
    }
  }
}
