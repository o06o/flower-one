import 'package:flowerone/core/network/supabase/supabase_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../network/supabase/supabase_providers.dart';

part '../provider/item_interaction_datasource.g.dart';

class ItemInteractionDatasource {
  final SupabaseApi _apiClient;

  ItemInteractionDatasource(this._apiClient);

  Future<void> deleteLikeFlower({required int flowerId}) async {
    await _apiClient.rpc(
      SupabaseApi.rpcRemoveFavoriteFlower,
      params: {'input_flower_id': flowerId},
    );
  }

  Future<void> saveLikeFlower({required int flowerId}) async {
    await _apiClient.rpc(
      SupabaseApi.rpcAddFavoriteFlower,
      params: {'input_flower_id': flowerId},
    );
  }
}

@Riverpod()
ItemInteractionDatasource itemInteractionDatasource(Ref ref) {
  SupabaseApi apiClient = ref.watch(supabaseApiProvider);
  return ItemInteractionDatasource(apiClient);
}
