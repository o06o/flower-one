import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase 접근(네트워크) 레이어.
///
/// - **DB 접근**: `table()` / `rpc()`
/// - **Edge Function**: `invokeFunction()`
///
/// 기능별 feature 레이어에서는 `Supabase.instance.client`를 직접 쓰지 말고,
/// 여기로 모아서 패키지 분리가 쉬워지도록 합니다.
class SupabaseApi {
  /// Edge Function / RPC 이름(백엔드 계약)을 한 곳에서 관리합니다.
  ///
  /// - Edge Function: Supabase Dashboard > Edge Functions 이름과 동일
  /// - RPC: Postgres function 이름과 동일
  static const String edgeRecommendFlower = 'recommend-flower';
  static const String edgeMakeLetter = 'make-letter';

  static const String rpcAddFavoriteFlower = 'add_favorite_flower';
  static const String rpcRemoveFavoriteFlower = 'remove_favorite_flower';

  static const String rpcGetMyFavoriteFlowers = 'get_my_favorite_flowers';

  final SupabaseClient _client;

  SupabaseApi(this._client);

  SupabaseClient get client => _client;
  GoTrueClient get auth => _client.auth;

  /// DB Table 접근: `api.table('flowers').select()...`
  PostgrestQueryBuilder table(String tableName) => _client.from(tableName);

  /// DB RPC 호출: `api.rpc('fn_name', params: {...})`
  Future<T> rpc<T>(String fnName, {Map<String, dynamic>? params}) {
    return _client.rpc<T>(fnName, params: params);
  }

  /// recommendation_requests 조회 (상황 기록)
  Future<List<dynamic>> getRecommendationRequests({int? limit}) async {
    var query = _client
        .from('recommendation_requests')
        .select('''
          id,
          input_text,
          created_at,
          recommendation_results (
            flower_id,
            rank_order,
            flowers (
              korean_name
            )
          )
        ''')
        .order('created_at', ascending: false);

    if (limit != null) {
      query = query.limit(limit);
    }

    return await query;
  }

  /// letter_histories 조회 (편지 기록)
  Future<List<dynamic>> getLetterHistories({int? limit}) async {
    var query = _client
        .from('letter_histories')
        .select()
        .order('created_at', ascending: false);

    if (limit != null) {
      query = query.limit(limit);
    }

    return await query;
  }

  /// Edge Function 호출: `api.invokeFunction('recommend-flower', body: {...})`
  Future<FunctionResponse> invokeFunction(
    String functionName, {
    Object? body,
    Map<String, String>? headers,
  }) {
    return _client.functions.invoke(functionName, body: body, headers: headers);
  }
}
