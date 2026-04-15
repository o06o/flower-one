import 'package:flowerone/core/network/supabase/supabase_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/supabase/supabase_providers.dart';
import '../dto/recommend_flower_response_dto.dart';

part 'recommend_flower_datasource.g.dart';

class RecommendFlowerDatasource {
  final SupabaseApi _apiClient;

  RecommendFlowerDatasource(this._apiClient);

  /// 꽃 추천 받기
  Future<RecommendFlowerResponseDto> getRecommendFlower({required String situation}) async {
    final response = await _apiClient.invokeFunction(
      SupabaseApi.edgeRecommendFlower,
      body: {'situation': situation},
    );
    return RecommendFlowerResponseDto.fromJson(response.data as Map<String, dynamic>);
  }
}

@Riverpod()
RecommendFlowerDatasource recommendFlowerDatasource(Ref ref) {
  SupabaseApi apiClient = ref.watch(supabaseApiProvider);
  return RecommendFlowerDatasource(apiClient);
}
