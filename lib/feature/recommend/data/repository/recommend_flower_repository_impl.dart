import 'package:flowerone/feature/recommend/data/datastore/recommend_flower_datasource.dart';

import '../../domain/repository/recommend_flower_repository.dart';
import '../dto/recommend_flower_response_dto.dart';

class RecommendFlowerRepositoryImpl implements RecommendFlowerRepository {
  final RecommendFlowerDatasource _dataSource;

  RecommendFlowerRepositoryImpl(this._dataSource);

  @override
  Future<RecommendFlowerResponseDto> getRecommendFlower({required String situation}) async {
    return await _dataSource.getRecommendFlower(situation: situation);
  }

}