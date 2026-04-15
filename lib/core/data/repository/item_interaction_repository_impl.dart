import 'package:flowerone/core/data/datasource/item_interaction_datasource.dart';

import '../../domain/repository/item_interaction_repository.dart';

class ItemInteractionRepositoryImpl implements ItemInteractionRepository {
  final ItemInteractionDatasource _dataSource;

  ItemInteractionRepositoryImpl(this._dataSource);

  @override
  Future<void> deleteLikeFlower({required int flowerId}) async {
    await _dataSource.deleteLikeFlower(flowerId: flowerId);
  }

  @override
  Future<void> saveLikeFlower({required int flowerId}) async {
    await _dataSource.saveLikeFlower(flowerId: flowerId);
  }
}