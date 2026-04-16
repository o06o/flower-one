import 'package:flowerone/core/network/supabase/supabase_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/supabase/supabase_providers.dart';
import '../dto/make_letter_response_dto.dart';

part 'letter_datasource.g.dart';

class LetterDatasource {
  final SupabaseApi _apiClient;

  LetterDatasource(this._apiClient);

  /// 편지 생성하기
  Future<MakeLetterResponseDto> makeLetter({
    required String message,
    required String flowerName,
  }) async {
    final response = await _apiClient.invokeFunction(
      SupabaseApi.edgeMakeLetter,
      body: {
        'requestId': 30,
        'flowerId': 122,
        'recipientType': "significant other",
      },
    );
    return MakeLetterResponseDto.fromJson(response.data as Map<String, dynamic>);
  }
}

@Riverpod()
LetterDatasource letterDatasource(Ref ref) {
  SupabaseApi apiClient = ref.watch(supabaseApiProvider);
  return LetterDatasource(apiClient);
}
