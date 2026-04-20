import '../../../../core/network/supabase/supabase_api.dart';
import '../dto/garden_favorite_flower_response_dto.dart';
import '../dto/garden_letter_record_response_dto.dart';
import '../dto/garden_situation_record_response_dto.dart';

class GardenDatasource {
  final SupabaseApi _apiClient;

  GardenDatasource(this._apiClient);

  Future<List<GardenFavoriteFlowerResponseDto>> getFavoriteFlowers() async {
    final response = await _apiClient.rpc<dynamic>(
      SupabaseApi.rpcGetMyFavoriteFlowers,
    );

    if (response is! List) return [];

    return response
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .map(GardenFavoriteFlowerResponseDto.fromJson)
        .where((dto) => dto.name.trim().isNotEmpty)
        .toList();
  }

  Future<List<GardenSituationRecordResponseDto>> getSituationRecords({
    int? limit,
  }) async {
    final res = await _apiClient.getRecommendationRequests(limit: limit);

    return res
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .map(GardenSituationRecordResponseDto.fromJson)
        .toList();
  }

  Future<List<GardenLetterRecordResponseDto>> getLetterRecords({
    int? limit,
  }) async {
    final res = await _apiClient.getLetterHistories(limit: limit);

    return res
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .map(GardenLetterRecordResponseDto.fromJson)
        .toList();
  }
}
