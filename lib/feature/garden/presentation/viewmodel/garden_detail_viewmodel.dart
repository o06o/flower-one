import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/model/exception/flower_exception.dart';
import '../../../../core/model/recipient_type.dart';
import '../../../../core/model/result/ui_result.dart';
import '../../domain/provider/garden_providers.dart';
import '../event/garden_ui_event.dart';
import '../model/garden_detail_type.dart';
import '../model/garden_section_item_model.dart';

part 'garden_detail_viewmodel.freezed.dart';
part 'garden_detail_viewmodel.g.dart';

@freezed
abstract class GardenDetailState with _$GardenDetailState {
  factory GardenDetailState({
    @Default(false) bool isLoading,
    @Default([]) List<GardenFavoriteFlowerItemModel> favoriteFlowers,
    @Default([]) List<GardenSituationRecordItemModel> situationRecords,
    @Default([]) List<GardenLetterRecordItemModel> letterRecords,
    UiResult<GardenUiEvent>? result,
  }) = _GardenDetailState;

  factory GardenDetailState.init() {
    return GardenDetailState(isLoading: true, result: null);
  }
}

@Riverpod(keepAlive: false)
class GardenDetailViewModel extends _$GardenDetailViewModel {
  @override
  GardenDetailState build(GardenDetailType type) {
    Future.microtask(() => loadByType(type));
    return GardenDetailState.init();
  }

  void _addResult(UiResult<GardenUiEvent> result) {
    state = state.copyWith(result: result);
  }

  void consumeResult() {
    state = state.copyWith(result: null);
  }

  Future<void> loadByType(GardenDetailType type) async {
    state = state.copyWith(isLoading: true, result: null);
    try {
      switch (type) {
        case GardenDetailType.favoriteFlowers:
          await _loadAllFavoriteFlowers();
          break;
        case GardenDetailType.situationRecords:
          await _loadAllSituationRecords();
          break;
        case GardenDetailType.letterRecords:
          await _loadAllLetterRecords();
          break;
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      _handleError(error);
    }
  }

  Future<void> _loadAllFavoriteFlowers() async {
    final favorites = await ref.read(getGardenFavoritesUseCaseProvider).call();
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
    );
  }

  Future<void> _loadAllSituationRecords() async {
    final situations = await ref.read(getGardenSituationRecordsUseCaseProvider).call();
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

    state = state.copyWith(
      isLoading: false,
      situationRecords: situationItems,
    );
  }

  Future<void> _loadAllLetterRecords() async {
    final letters = await ref.read(getGardenLetterRecordsUseCaseProvider).call();
    final letterItems = letters
        .map(
          (item) => GardenLetterRecordItemModel(
            title: '${RecipientTypeX.fromApiValue(item.recipientType).displayName}에게',
            date: _formatDate(item.createdAt),
            preview: item.letterText,
            backgroundImageUrl: item.flowerImageUrl,
          ),
        )
        .toList();

    state = state.copyWith(
      isLoading: false,
      letterRecords: letterItems,
    );
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
