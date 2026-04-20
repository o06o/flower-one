import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/supabase/supabase_providers.dart';
import '../../data/datastore/garden_datasource.dart';
import '../../data/repository/garden_repository_impl.dart';
import '../repository/garden_repository.dart';
import '../usecase/get_garden_favorites_usecase.dart';
import '../usecase/get_garden_letter_records_usecase.dart';
import '../usecase/get_garden_situation_records_usecase.dart';

final gardenDatasourceProvider = Provider<GardenDatasource>((ref) {
  final apiClient = ref.watch(supabaseApiProvider);
  return GardenDatasource(apiClient);
});

final gardenRepositoryProvider = Provider<GardenRepository>((ref) {
  final dataSource = ref.watch(gardenDatasourceProvider);
  return GardenRepositoryImpl(dataSource);
});

final getGardenFavoritesUseCaseProvider = Provider<GetGardenFavoritesUseCase>((
  ref,
) {
  final repository = ref.watch(gardenRepositoryProvider);
  return GetGardenFavoritesUseCase(repository);
});

final getGardenSituationRecordsUseCaseProvider =
    Provider<GetGardenSituationRecordsUseCase>((ref) {
      final repository = ref.watch(gardenRepositoryProvider);
      return GetGardenSituationRecordsUseCase(repository);
    });

final getGardenLetterRecordsUseCaseProvider =
    Provider<GetGardenLetterRecordsUseCase>((ref) {
      final repository = ref.watch(gardenRepositoryProvider);
      return GetGardenLetterRecordsUseCase(repository);
    });
