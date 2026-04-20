import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/model/exception/flower_exception.dart';
import '../../../../core/model/result/ui_result.dart';
import '../../domain/provider/garden_providers.dart';
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
  static const int _defaultSituationRecordLimit = 3;
  static const int _defaultLetterRecordLimit = 3;

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
      final situations = await ref
          .read(getGardenSituationRecordsUseCaseProvider)
          .call(limit: _defaultSituationRecordLimit);
      final letters = await ref
          .read(getGardenLetterRecordsUseCaseProvider)
          .call(limit: _defaultLetterRecordLimit);

      final favoriteItems = favorites
          .map(
            (item) => GardenFavoriteFlowerItemModel(
              name: item.name,
              meaning: item.meaning,
              imageUrl: item.imageUrl,
            ),
          )
          .toList();
      final situationItems = situations
          .map(
            (item) => GardenSituationRecordItemModel(
              monthDay: _formatMonthDay(item.createdAt),
              dayOfWeek: _formatDayOfWeek(item.createdAt),
              title: item.title,
              description: item.description,
              tag: item.tag,
              imageUrl: item.imageUrl,
            ),
          )
          .toList();
      final letterItems = letters
          .map(
            (item) => GardenLetterRecordItemModel(
              title: item.title,
              date: _formatDate(item.createdAt),
              preview: item.preview,
              backgroundImageUrl: item.backgroundImageUrl,
            ),
          )
          .toList();

      state = state.copyWith(
        isLoading: false,
        favoriteFlowers: favoriteItems,
        situationRecords: situationItems,
        letterRecords: letterItems,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        favoriteFlowers: [],
        situationRecords: [],
        letterRecords: [],
      );
      _handleError(error);
    }
  }

  Future<void> loadAllSituationRecords() async {
    try {
      final situations = await ref
          .read(getGardenSituationRecordsUseCaseProvider)
          .call();

      final situationItems = situations
          .map(
            (item) => GardenSituationRecordItemModel(
              monthDay: _formatMonthDay(item.createdAt),
              dayOfWeek: _formatDayOfWeek(item.createdAt),
              title: item.title,
              description: item.description,
              tag: item.tag,
              imageUrl: item.imageUrl,
            ),
          )
          .toList();

      state = state.copyWith(situationRecords: situationItems);
    } catch (error) {
      _handleError(error);
    }
  }

  String _formatMonthDay(DateTime dateTime) {
    return '${dateTime.month}.${dateTime.day}';
  }

  String _formatDayOfWeek(DateTime dateTime) {
    const weekDays = ['월', '화', '수', '목', '금', '토', '일'];
    return weekDays[dateTime.weekday - 1];
  }

  String _formatDate(DateTime dateTime) {
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    return '${dateTime.year}.$month.$day';
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
