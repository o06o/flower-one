import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/model/exception/flower_exception.dart';
import '../../../../core/model/result/ui_result.dart';
import '../../domain/provider/garden_providers.dart';
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

  Future<void> loadGardenData() async {
    state = state.copyWith(isLoading: true);
    try {
      final favorites = await ref
          .read(getGardenFavoritesUseCaseProvider)
          .call();
      final favoriteItems = favorites
          .map(
            (item) => GardenFavoriteFlowerItemModel(
              name: item.name,
              meaning: item.meaning,
              imageUrl: item.imageUrl,
            ),
          )
          .toList();

      state = state.copyWith(
        isLoading: false,
        favoriteFlowers: favoriteItems,
        situationRecords: kGardenMockSituationRecords,
        letterRecords: kGardenMockLetterRecords,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        favoriteFlowers: [],
        situationRecords: kGardenMockSituationRecords,
        letterRecords: kGardenMockLetterRecords,
      );
      _handleError(error);
    }
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
