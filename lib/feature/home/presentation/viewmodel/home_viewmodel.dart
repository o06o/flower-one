import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/model/model/flower_info_model.dart';
import '../../../../core/network/supabase/supabase_providers.dart';
import '../../../../core/network/supabase/supabase_api.dart';

class SelectedTag {
  final String type;
  final String name;

  const SelectedTag({
    required this.type,
    required this.name,
  });
}

class HomeState {
  final bool isSending;
  final List<FlowerInfoModel> resultFlowers;
  final List<SelectedTag> selectedTags;
  final String? errorMessage;

  const HomeState({
    required this.isSending,
    required this.resultFlowers,
    required this.selectedTags,
    this.errorMessage,
  });

  const HomeState.initial()
    : this(
        isSending: false,
        resultFlowers: const [],
        selectedTags: const [],
      );

  HomeState copyWith({
    bool? isSending,
    List<FlowerInfoModel>? resultFlowers,
    List<SelectedTag>? selectedTags,
    String? errorMessage,
  }) {
    return HomeState(
      isSending: isSending ?? this.isSending,
      resultFlowers: resultFlowers ?? this.resultFlowers,
      selectedTags: selectedTags ?? this.selectedTags,
      errorMessage: errorMessage,
    );
  }
}

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>((ref) {
      return HomeViewModel(ref.watch(supabaseClientProvider));
    });

class HomeViewModel extends StateNotifier<HomeState> {
  final SupabaseClient _client;

  HomeViewModel(this._client) : super(const HomeState.initial());

  Future<void> messageTest(String situation) async {
    final trimmed = situation.trim();
    if (trimmed.isEmpty || state.isSending) return;

    "테스트 시작".logI();
    state = state.copyWith(isSending: true, errorMessage: null);

    try {
      final res = await _client.functions.invoke(
        SupabaseApi.edgeRecommendFlower,
        body: {
          'situation': trimmed,
        },
      );

      "status: ${res.status}".logI();
      "data: ${res.data}".logI();

      final parsedFlowers = _extractFlowers(res.data);
      final parsedTags = _extractSelectedTags(res.data);
      state = state.copyWith(
        isSending: false,
        resultFlowers: parsedFlowers,
        selectedTags: parsedTags,
        errorMessage: null,
      );
    } catch (error) {
      "오류 발견 ${error.toString()}".logE();
      state = state.copyWith(
        isSending: false,
        errorMessage: '${AppMessages.homeNetworkError} $error',
      );
    }
  }

  List<FlowerInfoModel> _extractFlowers(dynamic data) {
    if (data is! Map) return const [];

    final result = data['result'];
    if (result is! Map) return const [];

    final flowers = result['flowers'];
    if (flowers is! List) return const [];

    return flowers.map<FlowerInfoModel?>((item) {
      if (item is! Map) return null;

      final rawFlowerId = item['flower_id'];
      int? flowerId;
      if (rawFlowerId is int) {
        flowerId = rawFlowerId;
      } else if (rawFlowerId is num) {
        flowerId = rawFlowerId.toInt();
      }

      final rawName = item['name'];
      final rawReason = item['reason'];
      final rawMeaning = item['meaning'] ?? item['flower_meaning'] ?? item['description'];
      final rawImageUrl = item['image_url'];
      final name = rawName is String ? rawName.trim() : rawName?.toString().trim();
      final reason = rawReason is String
          ? rawReason.trim()
          : rawReason?.toString().trim();
      final meaningRaw = rawMeaning is String
          ? rawMeaning.trim()
          : rawMeaning?.toString().trim();
      final meaning =
          (meaningRaw == null || meaningRaw.isEmpty) ? null : meaningRaw;
      final imageUrl = rawImageUrl is String
          ? rawImageUrl.trim()
          : rawImageUrl?.toString().trim();

      final rawFavorited = item['is_favorited'];
      var isFavorited = false;
      if (rawFavorited is bool) {
        isFavorited = rawFavorited;
      } else if (rawFavorited is String) {
        isFavorited = rawFavorited.toLowerCase() == 'true';
      } else if (rawFavorited is num) {
        isFavorited = rawFavorited != 0;
      }

      if (reason == null || reason.isEmpty) {
        return null;
      }

      return FlowerInfoModel(
        flowerId: flowerId,
        name: (name == null || name.isEmpty) ? '추천 꽃' : name,
        meaning: meaning,
        reason: reason,
        imageUrl: (imageUrl == null || imageUrl.isEmpty) ? null : imageUrl,
        isFavorited: isFavorited,
      );
    }).whereType<FlowerInfoModel>().toList();
  }

  List<SelectedTag> _extractSelectedTags(dynamic data) {
    if (data is! Map) return const [];

    final meta = data['meta'];
    if (meta is! Map) return const [];

    final selectedTags = meta['selected_tags'];
    if (selectedTags is! List) return const [];

    return selectedTags.map<SelectedTag?>((item) {
      if (item is! Map) return null;

      final rawType = item['type'];
      final rawName = item['name'];
      final type = rawType is String ? rawType.trim() : rawType?.toString().trim();
      final name = rawName is String ? rawName.trim() : rawName?.toString().trim();

      if (name == null || name.isEmpty) return null;

      return SelectedTag(
        type: (type == null || type.isEmpty) ? 'tag' : type,
        name: name,
      );
    }).whereType<SelectedTag>().toList();
  }
}
