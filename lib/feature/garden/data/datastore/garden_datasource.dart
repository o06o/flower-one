import '../../../../core/network/supabase/supabase_api.dart';
import '../dto/garden_favorite_flower_response_dto.dart';

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
}
