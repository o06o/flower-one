import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FlowerRecommendation {
  /// API `flower_id` (즐겨찾기 등 DB 연동용)
  final int? flowerId;
  final String name;
  /// 꽃말 (API: `meaning`, `flower_meaning` 등)
  final String? meaning;
  final String reason;
  final String? imageUrl;

  const FlowerRecommendation({
    this.flowerId,
    required this.name,
    required this.reason,
    this.meaning,
    this.imageUrl,
  });
}

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
  final List<FlowerRecommendation> resultFlowers;
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
    List<FlowerRecommendation>? resultFlowers,
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
      return HomeViewModel(Supabase.instance.client);
    });

class HomeViewModel extends StateNotifier<HomeState> {
  static const String _functionName = 'recommend-flower';

  final SupabaseClient _client;

  HomeViewModel(this._client) : super(const HomeState.initial());

  Future<void> messageTest(String situation) async {
    final trimmed = situation.trim();
    if (trimmed.isEmpty || state.isSending) return;

    "테스트 시작".logI();
    state = state.copyWith(isSending: true, errorMessage: null);

    try {
      final res = await _client.functions.invoke(
        _functionName,
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
        errorMessage: '전송 중 오류가 발생했어요. $error',
      );
    }
  }

  List<FlowerRecommendation> _extractFlowers(dynamic data) {
    if (data is! Map) return const [];

    final result = data['result'];
    if (result is! Map) return const [];

    final flowers = result['flowers'];
    if (flowers is! List) return const [];

    return flowers.map<FlowerRecommendation?>((item) {
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
      final rawMeaning = item['meaning'] ?? item['flower_meaning'];
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

      if (reason == null || reason.isEmpty) {
        return null;
      }

      return FlowerRecommendation(
        flowerId: flowerId,
        name: (name == null || name.isEmpty) ? '추천 꽃' : name,
        meaning: meaning,
        reason: reason,
        imageUrl: (imageUrl == null || imageUrl.isEmpty) ? null : imageUrl,
      );
    }).whereType<FlowerRecommendation>().toList();
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
