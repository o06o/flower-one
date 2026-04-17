import 'package:flowerone/feature/letter/data/datastore/letter_datasource.dart';

import '../../domain/repository/letter_repository.dart';
import '../dto/make_letter_response_dto.dart';

class LetterRepositoryImpl implements LetterRepository {
  final LetterDatasource _dataSource;

  LetterRepositoryImpl(this._dataSource);

  @override
  Future<MakeLetterResponseDto> makeLetter({
    required int requestId,
    required int flowerId,
    required String recipient,
  }) async {
    return await _dataSource.makeLetter(
      requestId: requestId,
      flowerId: flowerId,
      recipient: recipient,
    );
  }
}
