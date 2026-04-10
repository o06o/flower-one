import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FlowerRecommendation {
  final String name;
  final String reason;

  const FlowerRecommendation({
    required this.name,
    required this.reason,
  });
}

class HomeState {
  final bool isLoadingTags;
  final bool isSending;
  final List<String> tags;
  final List<FlowerRecommendation> resultFlowers;
  final String? errorMessage;

  const HomeState({
    required this.isLoadingTags,
    required this.isSending,
    required this.tags,
    required this.resultFlowers,
    this.errorMessage,
  });

  const HomeState.initial()
    : this(
        isLoadingTags: true,
        isSending: false,
        tags: const [],
        resultFlowers: const [],
      );

  HomeState copyWith({
    bool? isLoadingTags,
    bool? isSending,
    List<String>? tags,
    List<FlowerRecommendation>? resultFlowers,
    String? errorMessage,
  }) {
    return HomeState(
      isLoadingTags: isLoadingTags ?? this.isLoadingTags,
      isSending: isSending ?? this.isSending,
      tags: tags ?? this.tags,
      resultFlowers: resultFlowers ?? this.resultFlowers,
      errorMessage: errorMessage,
    );
  }
}

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>((ref) {
      return HomeViewModel(Supabase.instance.client)..loadTags();
    });

class HomeViewModel extends StateNotifier<HomeState> {
  static const String _tagTable = 'tags';
  static const String _orderColumn = 'id';
  static const String _functionName = 'recommend-flower-letter';

  final SupabaseClient _client;

  HomeViewModel(this._client) : super(const HomeState.initial());

  Future<void> loadTags() async {
    state = state.copyWith(isLoadingTags: true, errorMessage: null);
    try {
      final rows = await _client.from(_tagTable).select().order(_orderColumn);
      final tags = rows
          .map<String?>((row) {
            final value = row['name'];
            return value is String ? value : value?.toString();
          })
          .whereType<String>()
          .map((value) => value.trim())
          .where((value) => value.isNotEmpty)
          .toList();

      state = state.copyWith(isLoadingTags: false, tags: tags, errorMessage: null);
    } catch (error) {
      state = state.copyWith(
        isLoadingTags: false,
        errorMessage: '태그를 불러오지 못했어요. $error',
      );
    }
  }

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

      final parsed = _extractFlowers(res.data);
      state = state.copyWith(
        isSending: false,
        resultFlowers: parsed,
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

      final rawName = item['name'];
      final rawReason = item['reason'];
      final name = rawName is String ? rawName.trim() : rawName?.toString().trim();
      final reason = rawReason is String
          ? rawReason.trim()
          : rawReason?.toString().trim();

      if (name == null || name.isEmpty || reason == null || reason.isEmpty) {
        return null;
      }

      return FlowerRecommendation(name: name, reason: reason);
    }).whereType<FlowerRecommendation>().toList();
  }
}
