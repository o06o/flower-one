import 'package:flowerone/core/model/exception/flower_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/domain/provider/toggle_favorite_flower_usecase_provider.dart';
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
    @Default({}) Set<int> favoriteFlowerIds,
    UiResult<RecommendUiEvent>? result,
}) = _RecommendState;

  factory RecommendState.init() {
    return RecommendState(
      lastGroupNo: null,
      isEditable: false,
      groupList: [],
      favoriteFlowerIds: {},
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
        message: error?.toString() ?? AppMessages.unknownError,
      )));
    }
  }

  /// 초기 즐겨찾기 상태 설정
  void initializeFavorites(List<FlowerInfoModel> flowers) {
    final favoriteIds = flowers
        .where((f) => f.isFavorited && f.flowerId != null)
        .map((f) => f.flowerId!)
        .toSet();
    state = state.copyWith(favoriteFlowerIds: favoriteIds);
  }

  /// 즐겨찾기 토글 (네트워크 처리 담당)
  Future<void> toggleFavoriteFlower(FlowerInfoModel flower) async {
    final flowerId = flower.flowerId;

    // ID 없는 경우 에러 처리
    if (flowerId == null) {
      _addResult(
        Success(ShowToast(AppMessages.favoriteNoId)),
      );
      return;
    }

    // 현재 즐겨찾기 상태 확인
    final wasFavorite = state.favoriteFlowerIds.contains(flowerId);

    try {
      await ref.read(toggleFavoriteFlowerUseCaseProvider).call(
            flowerId: flowerId,
            isFavorite: wasFavorite,
          );

      // 성공 시 상태 업데이트
      final updatedFavorites = Set<int>.from(state.favoriteFlowerIds);
      if (wasFavorite) {
        updatedFavorites.remove(flowerId);
      } else {
        updatedFavorites.add(flowerId);
      }
      state = state.copyWith(favoriteFlowerIds: updatedFavorites);

      _addResult(
        Success(
          ShowToast(wasFavorite ? AppMessages.favoriteRemoved : AppMessages.favoriteAdded),
        ),
      );
    } catch (e) {
      _handleError(e);
    }
  }
}