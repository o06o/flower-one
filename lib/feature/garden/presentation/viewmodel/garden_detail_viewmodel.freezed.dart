// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garden_detail_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GardenDetailState {

 bool get isLoading; List<GardenFavoriteFlowerItemModel> get favoriteFlowers; List<GardenSituationRecordItemModel> get situationRecords; List<GardenLetterRecordItemModel> get letterRecords; UiResult<GardenUiEvent>? get result;
/// Create a copy of GardenDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GardenDetailStateCopyWith<GardenDetailState> get copyWith => _$GardenDetailStateCopyWithImpl<GardenDetailState>(this as GardenDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GardenDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.favoriteFlowers, favoriteFlowers)&&const DeepCollectionEquality().equals(other.situationRecords, situationRecords)&&const DeepCollectionEquality().equals(other.letterRecords, letterRecords)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(favoriteFlowers),const DeepCollectionEquality().hash(situationRecords),const DeepCollectionEquality().hash(letterRecords),result);

@override
String toString() {
  return 'GardenDetailState(isLoading: $isLoading, favoriteFlowers: $favoriteFlowers, situationRecords: $situationRecords, letterRecords: $letterRecords, result: $result)';
}


}

/// @nodoc
abstract mixin class $GardenDetailStateCopyWith<$Res>  {
  factory $GardenDetailStateCopyWith(GardenDetailState value, $Res Function(GardenDetailState) _then) = _$GardenDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<GardenFavoriteFlowerItemModel> favoriteFlowers, List<GardenSituationRecordItemModel> situationRecords, List<GardenLetterRecordItemModel> letterRecords, UiResult<GardenUiEvent>? result
});




}
/// @nodoc
class _$GardenDetailStateCopyWithImpl<$Res>
    implements $GardenDetailStateCopyWith<$Res> {
  _$GardenDetailStateCopyWithImpl(this._self, this._then);

  final GardenDetailState _self;
  final $Res Function(GardenDetailState) _then;

/// Create a copy of GardenDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? favoriteFlowers = null,Object? situationRecords = null,Object? letterRecords = null,Object? result = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,favoriteFlowers: null == favoriteFlowers ? _self.favoriteFlowers : favoriteFlowers // ignore: cast_nullable_to_non_nullable
as List<GardenFavoriteFlowerItemModel>,situationRecords: null == situationRecords ? _self.situationRecords : situationRecords // ignore: cast_nullable_to_non_nullable
as List<GardenSituationRecordItemModel>,letterRecords: null == letterRecords ? _self.letterRecords : letterRecords // ignore: cast_nullable_to_non_nullable
as List<GardenLetterRecordItemModel>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as UiResult<GardenUiEvent>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GardenDetailState].
extension GardenDetailStatePatterns on GardenDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GardenDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GardenDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GardenDetailState value)  $default,){
final _that = this;
switch (_that) {
case _GardenDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GardenDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _GardenDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<GardenFavoriteFlowerItemModel> favoriteFlowers,  List<GardenSituationRecordItemModel> situationRecords,  List<GardenLetterRecordItemModel> letterRecords,  UiResult<GardenUiEvent>? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GardenDetailState() when $default != null:
return $default(_that.isLoading,_that.favoriteFlowers,_that.situationRecords,_that.letterRecords,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<GardenFavoriteFlowerItemModel> favoriteFlowers,  List<GardenSituationRecordItemModel> situationRecords,  List<GardenLetterRecordItemModel> letterRecords,  UiResult<GardenUiEvent>? result)  $default,) {final _that = this;
switch (_that) {
case _GardenDetailState():
return $default(_that.isLoading,_that.favoriteFlowers,_that.situationRecords,_that.letterRecords,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<GardenFavoriteFlowerItemModel> favoriteFlowers,  List<GardenSituationRecordItemModel> situationRecords,  List<GardenLetterRecordItemModel> letterRecords,  UiResult<GardenUiEvent>? result)?  $default,) {final _that = this;
switch (_that) {
case _GardenDetailState() when $default != null:
return $default(_that.isLoading,_that.favoriteFlowers,_that.situationRecords,_that.letterRecords,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _GardenDetailState implements GardenDetailState {
   _GardenDetailState({this.isLoading = false, final  List<GardenFavoriteFlowerItemModel> favoriteFlowers = const [], final  List<GardenSituationRecordItemModel> situationRecords = const [], final  List<GardenLetterRecordItemModel> letterRecords = const [], this.result}): _favoriteFlowers = favoriteFlowers,_situationRecords = situationRecords,_letterRecords = letterRecords;
  

@override@JsonKey() final  bool isLoading;
 final  List<GardenFavoriteFlowerItemModel> _favoriteFlowers;
@override@JsonKey() List<GardenFavoriteFlowerItemModel> get favoriteFlowers {
  if (_favoriteFlowers is EqualUnmodifiableListView) return _favoriteFlowers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteFlowers);
}

 final  List<GardenSituationRecordItemModel> _situationRecords;
@override@JsonKey() List<GardenSituationRecordItemModel> get situationRecords {
  if (_situationRecords is EqualUnmodifiableListView) return _situationRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_situationRecords);
}

 final  List<GardenLetterRecordItemModel> _letterRecords;
@override@JsonKey() List<GardenLetterRecordItemModel> get letterRecords {
  if (_letterRecords is EqualUnmodifiableListView) return _letterRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_letterRecords);
}

@override final  UiResult<GardenUiEvent>? result;

/// Create a copy of GardenDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GardenDetailStateCopyWith<_GardenDetailState> get copyWith => __$GardenDetailStateCopyWithImpl<_GardenDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GardenDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._favoriteFlowers, _favoriteFlowers)&&const DeepCollectionEquality().equals(other._situationRecords, _situationRecords)&&const DeepCollectionEquality().equals(other._letterRecords, _letterRecords)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_favoriteFlowers),const DeepCollectionEquality().hash(_situationRecords),const DeepCollectionEquality().hash(_letterRecords),result);

@override
String toString() {
  return 'GardenDetailState(isLoading: $isLoading, favoriteFlowers: $favoriteFlowers, situationRecords: $situationRecords, letterRecords: $letterRecords, result: $result)';
}


}

/// @nodoc
abstract mixin class _$GardenDetailStateCopyWith<$Res> implements $GardenDetailStateCopyWith<$Res> {
  factory _$GardenDetailStateCopyWith(_GardenDetailState value, $Res Function(_GardenDetailState) _then) = __$GardenDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<GardenFavoriteFlowerItemModel> favoriteFlowers, List<GardenSituationRecordItemModel> situationRecords, List<GardenLetterRecordItemModel> letterRecords, UiResult<GardenUiEvent>? result
});




}
/// @nodoc
class __$GardenDetailStateCopyWithImpl<$Res>
    implements _$GardenDetailStateCopyWith<$Res> {
  __$GardenDetailStateCopyWithImpl(this._self, this._then);

  final _GardenDetailState _self;
  final $Res Function(_GardenDetailState) _then;

/// Create a copy of GardenDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? favoriteFlowers = null,Object? situationRecords = null,Object? letterRecords = null,Object? result = freezed,}) {
  return _then(_GardenDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,favoriteFlowers: null == favoriteFlowers ? _self._favoriteFlowers : favoriteFlowers // ignore: cast_nullable_to_non_nullable
as List<GardenFavoriteFlowerItemModel>,situationRecords: null == situationRecords ? _self._situationRecords : situationRecords // ignore: cast_nullable_to_non_nullable
as List<GardenSituationRecordItemModel>,letterRecords: null == letterRecords ? _self._letterRecords : letterRecords // ignore: cast_nullable_to_non_nullable
as List<GardenLetterRecordItemModel>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as UiResult<GardenUiEvent>?,
  ));
}


}

// dart format on
