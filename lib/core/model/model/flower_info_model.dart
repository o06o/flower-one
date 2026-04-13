import 'package:freezed_annotation/freezed_annotation.dart';

part 'flower_info_model.g.dart';
part 'flower_info_model.freezed.dart';

@freezed
abstract class FlowerInfoModel with _$FlowerInfoModel {
  const factory FlowerInfoModel({
    final int? flowerId,
    required final String name,
    String? meaning,
    required String reason,
    String? imageUrl,
    @Default(false) bool isFavorited,
  }) = _FlowerInfoModel;

  factory FlowerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FlowerInfoModelFromJson(json);
}