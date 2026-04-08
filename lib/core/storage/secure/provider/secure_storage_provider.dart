import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasource/impl/secure_storage_data_source_impl.dart';
import '../datasource/secure_storage_data_source.dart';
import '../secure_storage.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});

final secureStorageDataSourceProvider = Provider<SecureStorageDataSource>((ref) {
  final storage = ref.read(secureStorageProvider);
  return SecureStorageDataSourceImpl(storage);
});