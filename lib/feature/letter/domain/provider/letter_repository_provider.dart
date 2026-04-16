import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datastore/letter_datasource.dart';
import '../../data/repository/letter_repository_impl.dart';
import '../repository/letter_repository.dart';

part 'letter_repository_provider.g.dart';

@riverpod
LetterRepository letterRepository(Ref ref) {
  final dataSource = ref.watch(letterDatasourceProvider);
  return LetterRepositoryImpl(dataSource);
}
