// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flower_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlowerInfoModel {

 int? get flowerId; String get name; String? get meaning; String get reason; String? get imageUrl; bool get isFavorited;
/// Create a copy of FlowerInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlowerInfoModelCopyWith<FlowerInfoModel> get copyWith => _$FlowerInfoModelCopyWithImpl<FlowerInfoModel>(this as FlowerInfoModel, _$identity);

  /// Serializes this FlowerInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlowerInfoModel&&(identical(other.flowerId, flowerId) || other.flowerId == flowerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flowerId,name,meaning,reason,imageUrl,isFavorited);

@override
String toString() {
  return 'FlowerInfoModel(flowerId: $flowerId, name: $name, meaning: $meaning, reason: $reason, imageUrl: $imageUrl, isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class $FlowerInfoModelCopyWith<$Res>  {
  factory $FlowerInfoModelCopyWith(FlowerInfoModel value, $Res Function(FlowerInfoModel) _then) = _$FlowerInfoModelCopyWithImpl;
@useResult
$Res call({
 int? flowerId, String name, String? meaning, String reason, String? imageUrl, bool isFavorited
});




}
/// @nodoc
class _$FlowerInfoModelCopyWithImpl<$Res>
    implements $FlowerInfoModelCopyWith<$Res> {
  _$FlowerInfoModelCopyWithImpl(this._self, this._then);

  final FlowerInfoModel _self;
  final $Res Function(FlowerInfoModel) _then;

/// Create a copy of FlowerInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flowerId = freezed,Object? name = null,Object? meaning = freezed,Object? reason = null,Object? imageUrl = freezed,Object? isFavorited = null,}) {
  return _then(_self.copyWith(
flowerId: freezed == flowerId ? _self.flowerId : flowerId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,meaning: freezed == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FlowerInfoModel].
extension FlowerInfoModelPatterns on FlowerInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlowerInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlowerInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlowerInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _FlowerInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlowerInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlowerInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? flowerId,  String name,  String? meaning,  String reason,  String? imageUrl,  bool isFavorited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlowerInfoModel() when $default != null:
return $default(_that.flowerId,_that.name,_that.meaning,_that.reason,_that.imageUrl,_that.isFavorited);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? flowerId,  String name,  String? meaning,  String reason,  String? imageUrl,  bool isFavorited)  $default,) {final _that = this;
switch (_that) {
case _FlowerInfoModel():
return $default(_that.flowerId,_that.name,_that.meaning,_that.reason,_that.imageUrl,_that.isFavorited);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? flowerId,  String name,  String? meaning,  String reason,  String? imageUrl,  bool isFavorited)?  $default,) {final _that = this;
switch (_that) {
case _FlowerInfoModel() when $default != null:
return $default(_that.flowerId,_that.name,_that.meaning,_that.reason,_that.imageUrl,_that.isFavorited);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlowerInfoModel implements FlowerInfoModel {
  const _FlowerInfoModel({this.flowerId, required this.name, this.meaning, required this.reason, this.imageUrl, this.isFavorited = false});
  factory _FlowerInfoModel.fromJson(Map<String, dynamic> json) => _$FlowerInfoModelFromJson(json);

@override final  int? flowerId;
@override final  String name;
@override final  String? meaning;
@override final  String reason;
@override final  String? imageUrl;
@override@JsonKey() final  bool isFavorited;

/// Create a copy of FlowerInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlowerInfoModelCopyWith<_FlowerInfoModel> get copyWith => __$FlowerInfoModelCopyWithImpl<_FlowerInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlowerInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlowerInfoModel&&(identical(other.flowerId, flowerId) || other.flowerId == flowerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flowerId,name,meaning,reason,imageUrl,isFavorited);

@override
String toString() {
  return 'FlowerInfoModel(flowerId: $flowerId, name: $name, meaning: $meaning, reason: $reason, imageUrl: $imageUrl, isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class _$FlowerInfoModelCopyWith<$Res> implements $FlowerInfoModelCopyWith<$Res> {
  factory _$FlowerInfoModelCopyWith(_FlowerInfoModel value, $Res Function(_FlowerInfoModel) _then) = __$FlowerInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int? flowerId, String name, String? meaning, String reason, String? imageUrl, bool isFavorited
});




}
/// @nodoc
class __$FlowerInfoModelCopyWithImpl<$Res>
    implements _$FlowerInfoModelCopyWith<$Res> {
  __$FlowerInfoModelCopyWithImpl(this._self, this._then);

  final _FlowerInfoModel _self;
  final $Res Function(_FlowerInfoModel) _then;

/// Create a copy of FlowerInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flowerId = freezed,Object? name = null,Object? meaning = freezed,Object? reason = null,Object? imageUrl = freezed,Object? isFavorited = null,}) {
  return _then(_FlowerInfoModel(
flowerId: freezed == flowerId ? _self.flowerId : flowerId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,meaning: freezed == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
