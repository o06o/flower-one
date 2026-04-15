import 'package:flowerone/feature/recommend/domain/repository/recommend_flower_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datastore/recommend_flower_datasource.dart';
import '../../data/repository/recommend_flower_repository_impl.dart';

part 'recommend_flower_repository_provider.g.dart';

@riverpod
RecommendFlowerRepository recommendFlowerRepository(Ref ref) {
  final dataSource = ref.watch(recommendFlowerDatasourceProvider);

  return RecommendFlowerRepositoryImpl(dataSource);
}

