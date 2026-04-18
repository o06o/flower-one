import '../../../../core/model/model/flower_shop_place_info_model.dart';
import '../dto/kakao_local_search_response_dto.dart';

extension KakaoPlaceMapper on KakaoPlaceDto {
  FlowerShopPlaceInfoModel toFlowerShopPlaceInfoModel() {
    final name = placeName.trim();
    final lng = double.tryParse(longitude);
    final lat = double.tryParse(latitude);
    final address = addressName.trim();

    if (name.isEmpty || lat == null || lng == null) {
      throw Exception('Invalid place data');
    }

    return FlowerShopPlaceInfoModel(
      name: name,
      latitude: lat,
      longitude: lng,
      address: address,
      phone: phone?.trim(),
      distance: distance,
      roadAddress: roadAddressName?.trim(),
      placeUrl: placeUrl?.trim(),
    );
  }
}
