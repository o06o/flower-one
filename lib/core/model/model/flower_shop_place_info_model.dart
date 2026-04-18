import 'package:freezed_annotation/freezed_annotation.dart';

part 'flower_shop_place_info_model.g.dart';
part 'flower_shop_place_info_model.freezed.dart';

@freezed
abstract class FlowerShopPlaceInfoModel with _$FlowerShopPlaceInfoModel {
  const factory FlowerShopPlaceInfoModel({
    required String name,
    required double latitude,
    required double longitude,
    required String address,
    String? phone,
    String? distance,
    String? roadAddress,
    String? placeUrl,
  }) = _FlowerShopPlaceInfoModel;

  factory FlowerShopPlaceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FlowerShopPlaceInfoModelFromJson(json);
}