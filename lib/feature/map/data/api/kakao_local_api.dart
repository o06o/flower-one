import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/kakao_local_search_response_dto.dart';

part 'kakao_local_api.g.dart';

@RestApi(baseUrl: 'https://dapi.kakao.com')
abstract class KakaoLocalApi {
  factory KakaoLocalApi(Dio dio, {String baseUrl}) = _KakaoLocalApi;

  @GET('/v2/local/search/keyword.json')
  Future<KakaoLocalSearchResponseDto> searchKeyword({
    @Query('query') required String query,
    @Query('y') required String latitude,
    @Query('x') required String longitude,
    @Query('radius') int? radius,
    @Query('size') int? size,
  });
}
