import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../usecase/toggle_favorite_flower_usecase.dart';
import 'item_interaction_repository_provider.dart';

final toggleFavoriteFlowerUseCaseProvider = Provider<ToggleFavoriteFlowerUseCase>(
  (ref) {
    final repository = ref.watch(itemInteractionRepositoryProvider);
    return ToggleFavoriteFlowerUseCase(repository);
  },
);

