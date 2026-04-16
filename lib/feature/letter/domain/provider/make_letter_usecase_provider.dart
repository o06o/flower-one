import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecase/make_letter_usecase.dart';
import 'letter_repository_provider.dart';

part 'make_letter_usecase_provider.g.dart';

@riverpod
MakeLetterUseCase makeLetterUseCase(Ref ref) {
  final repository = ref.watch(letterRepositoryProvider);
  return MakeLetterUseCase(repository);
}
