import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasource/impl/preference_storage_data_source_impl.dart';
import '../datasource/preference_storage_data_source.dart';
import '../preferences_storage.dart';

final preferenceStorageProvider = Provider<PreferenceStorage>((ref) {
  throw UnimplementedError('preferenceStorageProvider was not overridden');
});

final preferenceStorageDataSourceProvider =
Provider<PreferenceStorageDataSource>((ref) {
  final storage = ref.watch(preferenceStorageProvider);
  return PreferenceStorageDataSourceImpl(storage);
});

