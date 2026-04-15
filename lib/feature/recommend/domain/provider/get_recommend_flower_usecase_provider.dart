import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecase/get_recommend_flower_usecase.dart';
import 'recommend_flower_repository_provider.dart';

part 'get_recommend_flower_usecase_provider.g.dart';

@riverpod
GetRecommendFlowerUseCase getRecommendFlowerUseCase(Ref ref) {
  final repository = ref.watch(recommendFlowerRepositoryProvider);
  return GetRecommendFlowerUseCase(repository);
}