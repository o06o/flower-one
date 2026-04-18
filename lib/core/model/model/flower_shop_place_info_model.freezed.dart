// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flower_shop_place_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlowerShopPlaceInfoModel {

 String get name; double get latitude; double get longitude; String get address; String? get phone; String? get distance; String? get roadAddress; String? get placeUrl;
/// Create a copy of FlowerShopPlaceInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlowerShopPlaceInfoModelCopyWith<FlowerShopPlaceInfoModel> get copyWith => _$FlowerShopPlaceInfoModelCopyWithImpl<FlowerShopPlaceInfoModel>(this as FlowerShopPlaceInfoModel, _$identity);

  /// Serializes this FlowerShopPlaceInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlowerShopPlaceInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.roadAddress, roadAddress) || other.roadAddress == roadAddress)&&(identical(other.placeUrl, placeUrl) || other.placeUrl == placeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,latitude,longitude,address,phone,distance,roadAddress,placeUrl);

@override
String toString() {
  return 'FlowerShopPlaceInfoModel(name: $name, latitude: $latitude, longitude: $longitude, address: $address, phone: $phone, distance: $distance, roadAddress: $roadAddress, placeUrl: $placeUrl)';
}


}

/// @nodoc
abstract mixin class $FlowerShopPlaceInfoModelCopyWith<$Res>  {
  factory $FlowerShopPlaceInfoModelCopyWith(FlowerShopPlaceInfoModel value, $Res Function(FlowerShopPlaceInfoModel) _then) = _$FlowerShopPlaceInfoModelCopyWithImpl;
@useResult
$Res call({
 String name, double latitude, double longitude, String address, String? phone, String? distance, String? roadAddress, String? placeUrl
});




}
/// @nodoc
class _$FlowerShopPlaceInfoModelCopyWithImpl<$Res>
    implements $FlowerShopPlaceInfoModelCopyWith<$Res> {
  _$FlowerShopPlaceInfoModelCopyWithImpl(this._self, this._then);

  final FlowerShopPlaceInfoModel _self;
  final $Res Function(FlowerShopPlaceInfoModel) _then;

/// Create a copy of FlowerShopPlaceInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? latitude = null,Object? longitude = null,Object? address = null,Object? phone = freezed,Object? distance = freezed,Object? roadAddress = freezed,Object? placeUrl = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String?,roadAddress: freezed == roadAddress ? _self.roadAddress : roadAddress // ignore: cast_nullable_to_non_nullable
as String?,placeUrl: freezed == placeUrl ? _self.placeUrl : placeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlowerShopPlaceInfoModel].
extension FlowerShopPlaceInfoModelPatterns on FlowerShopPlaceInfoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlowerShopPlaceInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlowerShopPlaceInfoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlowerShopPlaceInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _FlowerShopPlaceInfoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlowerShopPlaceInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlowerShopPlaceInfoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double latitude,  double longitude,  String address,  String? phone,  String? distance,  String? roadAddress,  String? placeUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlowerShopPlaceInfoModel() when $default != null:
return $default(_that.name,_that.latitude,_that.longitude,_that.address,_that.phone,_that.distance,_that.roadAddress,_that.placeUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double latitude,  double longitude,  String address,  String? phone,  String? distance,  String? roadAddress,  String? placeUrl)  $default,) {final _that = this;
switch (_that) {
case _FlowerShopPlaceInfoModel():
return $default(_that.name,_that.latitude,_that.longitude,_that.address,_that.phone,_that.distance,_that.roadAddress,_that.placeUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double latitude,  double longitude,  String address,  String? phone,  String? distance,  String? roadAddress,  String? placeUrl)?  $default,) {final _that = this;
switch (_that) {
case _FlowerShopPlaceInfoModel() when $default != null:
return $default(_that.name,_that.latitude,_that.longitude,_that.address,_that.phone,_that.distance,_that.roadAddress,_that.placeUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlowerShopPlaceInfoModel implements FlowerShopPlaceInfoModel {
  const _FlowerShopPlaceInfoModel({required this.name, required this.latitude, required this.longitude, required this.address, this.phone, this.distance, this.roadAddress, this.placeUrl});
  factory _FlowerShopPlaceInfoModel.fromJson(Map<String, dynamic> json) => _$FlowerShopPlaceInfoModelFromJson(json);

@override final  String name;
@override final  double latitude;
@override final  double longitude;
@override final  String address;
@override final  String? phone;
@override final  String? distance;
@override final  String? roadAddress;
@override final  String? placeUrl;

/// Create a copy of FlowerShopPlaceInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlowerShopPlaceInfoModelCopyWith<_FlowerShopPlaceInfoModel> get copyWith => __$FlowerShopPlaceInfoModelCopyWithImpl<_FlowerShopPlaceInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlowerShopPlaceInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlowerShopPlaceInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.roadAddress, roadAddress) || other.roadAddress == roadAddress)&&(identical(other.placeUrl, placeUrl) || other.placeUrl == placeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,latitude,longitude,address,phone,distance,roadAddress,placeUrl);

@override
String toString() {
  return 'FlowerShopPlaceInfoModel(name: $name, latitude: $latitude, longitude: $longitude, address: $address, phone: $phone, distance: $distance, roadAddress: $roadAddress, placeUrl: $placeUrl)';
}


}

/// @nodoc
abstract mixin class _$FlowerShopPlaceInfoModelCopyWith<$Res> implements $FlowerShopPlaceInfoModelCopyWith<$Res> {
  factory _$FlowerShopPlaceInfoModelCopyWith(_FlowerShopPlaceInfoModel value, $Res Function(_FlowerShopPlaceInfoModel) _then) = __$FlowerShopPlaceInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String name, double latitude, double longitude, String address, String? phone, String? distance, String? roadAddress, String? placeUrl
});




}
/// @nodoc
class __$FlowerShopPlaceInfoModelCopyWithImpl<$Res>
    implements _$FlowerShopPlaceInfoModelCopyWith<$Res> {
  __$FlowerShopPlaceInfoModelCopyWithImpl(this._self, this._then);

  final _FlowerShopPlaceInfoModel _self;
  final $Res Function(_FlowerShopPlaceInfoModel) _then;

/// Create a copy of FlowerShopPlaceInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? latitude = null,Object? longitude = null,Object? address = null,Object? phone = freezed,Object? distance = freezed,Object? roadAddress = freezed,Object? placeUrl = freezed,}) {
  return _then(_FlowerShopPlaceInfoModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String?,roadAddress: freezed == roadAddress ? _self.roadAddress : roadAddress // ignore: cast_nullable_to_non_nullable
as String?,placeUrl: freezed == placeUrl ? _self.placeUrl : placeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
