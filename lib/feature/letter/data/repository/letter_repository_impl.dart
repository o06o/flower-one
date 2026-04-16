import 'package:flowerone/feature/letter/data/datastore/letter_datasource.dart';

import '../../domain/repository/letter_repository.dart';
import '../dto/make_letter_response_dto.dart';

class LetterRepositoryImpl implements LetterRepository {
  final LetterDatasource _dataSource;

  LetterRepositoryImpl(this._dataSource);

  @override
  Future<MakeLetterResponseDto> makeLetter({
    required String message,
    required String flowerName,
  }) async {
    return await _dataSource.makeLetter(
      message: message,
      flowerName: flowerName,
    );
  }
}
