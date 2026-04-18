import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'kakao_local_api.dart';

part 'kakao_local_api_provider.g.dart';

@riverpod
Dio kakaoLocalDio(KakaoLocalDioRef ref) {
  const kakaoRestKey = String.fromEnvironment('KAKAO_REST_KEY');
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://dapi.kakao.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Authorization': 'KakaoAK $kakaoRestKey',
    },
  ));

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ),
  );

  return dio;
}

@riverpod
KakaoLocalApi kakaoLocalApi(KakaoLocalApiRef ref) {
  final dio = ref.watch(kakaoLocalDioProvider);
  return KakaoLocalApi(dio);
}
