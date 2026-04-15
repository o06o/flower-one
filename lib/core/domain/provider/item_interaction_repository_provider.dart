import 'package:flowerone/core/data/repository/item_interaction_repository_impl.dart';
import 'package:flowerone/core/domain/repository/item_interaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasource/item_interaction_datasource.dart';

part 'item_interaction_repository_provider.g.dart';

@riverpod
ItemInteractionRepository itemInteractionRepository(Ref ref) {
  final dataSource = ref.watch(itemInteractionDatasourceProvider);

  return ItemInteractionRepositoryImpl(dataSource);
}

