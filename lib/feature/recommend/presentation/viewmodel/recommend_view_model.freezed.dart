// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecommendState {

 List<FlowerInfoModel> get flowers; int get requestId; Set<int> get favoriteFlowerIds; UiResult<RecommendUiEvent>? get result;
/// Create a copy of RecommendState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendStateCopyWith<RecommendState> get copyWith => _$RecommendStateCopyWithImpl<RecommendState>(this as RecommendState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendState&&const DeepCollectionEquality().equals(other.flowers, flowers)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&const DeepCollectionEquality().equals(other.favoriteFlowerIds, favoriteFlowerIds)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(flowers),requestId,const DeepCollectionEquality().hash(favoriteFlowerIds),result);

@override
String toString() {
  return 'RecommendState(flowers: $flowers, requestId: $requestId, favoriteFlowerIds: $favoriteFlowerIds, result: $result)';
}


}

/// @nodoc
abstract mixin class $RecommendStateCopyWith<$Res>  {
  factory $RecommendStateCopyWith(RecommendState value, $Res Function(RecommendState) _then) = _$RecommendStateCopyWithImpl;
@useResult
$Res call({
 List<FlowerInfoModel> flowers, int requestId, Set<int> favoriteFlowerIds, UiResult<RecommendUiEvent>? result
});




}
/// @nodoc
class _$RecommendStateCopyWithImpl<$Res>
    implements $RecommendStateCopyWith<$Res> {
  _$RecommendStateCopyWithImpl(this._self, this._then);

  final RecommendState _self;
  final $Res Function(RecommendState) _then;

/// Create a copy of RecommendState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flowers = null,Object? requestId = null,Object? favoriteFlowerIds = null,Object? result = freezed,}) {
  return _then(_self.copyWith(
flowers: null == flowers ? _self.flowers : flowers // ignore: cast_nullable_to_non_nullable
as List<FlowerInfoModel>,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,favoriteFlowerIds: null == favoriteFlowerIds ? _self.favoriteFlowerIds : favoriteFlowerIds // ignore: cast_nullable_to_non_nullable
as Set<int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as UiResult<RecommendUiEvent>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendState].
extension RecommendStatePatterns on RecommendState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendState value)  $default,){
final _that = this;
switch (_that) {
case _RecommendState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendState value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FlowerInfoModel> flowers,  int requestId,  Set<int> favoriteFlowerIds,  UiResult<RecommendUiEvent>? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendState() when $default != null:
return $default(_that.flowers,_that.requestId,_that.favoriteFlowerIds,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FlowerInfoModel> flowers,  int requestId,  Set<int> favoriteFlowerIds,  UiResult<RecommendUiEvent>? result)  $default,) {final _that = this;
switch (_that) {
case _RecommendState():
return $default(_that.flowers,_that.requestId,_that.favoriteFlowerIds,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FlowerInfoModel> flowers,  int requestId,  Set<int> favoriteFlowerIds,  UiResult<RecommendUiEvent>? result)?  $default,) {final _that = this;
switch (_that) {
case _RecommendState() when $default != null:
return $default(_that.flowers,_that.requestId,_that.favoriteFlowerIds,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _RecommendState implements RecommendState {
   _RecommendState({final  List<FlowerInfoModel> flowers = const [], this.requestId = -1, final  Set<int> favoriteFlowerIds = const {}, this.result}): _flowers = flowers,_favoriteFlowerIds = favoriteFlowerIds;
  

 final  List<FlowerInfoModel> _flowers;
@override@JsonKey() List<FlowerInfoModel> get flowers {
  if (_flowers is EqualUnmodifiableListView) return _flowers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flowers);
}

@override@JsonKey() final  int requestId;
 final  Set<int> _favoriteFlowerIds;
@override@JsonKey() Set<int> get favoriteFlowerIds {
  if (_favoriteFlowerIds is EqualUnmodifiableSetView) return _favoriteFlowerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favoriteFlowerIds);
}

@override final  UiResult<RecommendUiEvent>? result;

/// Create a copy of RecommendState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendStateCopyWith<_RecommendState> get copyWith => __$RecommendStateCopyWithImpl<_RecommendState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendState&&const DeepCollectionEquality().equals(other._flowers, _flowers)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&const DeepCollectionEquality().equals(other._favoriteFlowerIds, _favoriteFlowerIds)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_flowers),requestId,const DeepCollectionEquality().hash(_favoriteFlowerIds),result);

@override
String toString() {
  return 'RecommendState(flowers: $flowers, requestId: $requestId, favoriteFlowerIds: $favoriteFlowerIds, result: $result)';
}


}

/// @nodoc
abstract mixin class _$RecommendStateCopyWith<$Res> implements $RecommendStateCopyWith<$Res> {
  factory _$RecommendStateCopyWith(_RecommendState value, $Res Function(_RecommendState) _then) = __$RecommendStateCopyWithImpl;
@override @useResult
$Res call({
 List<FlowerInfoModel> flowers, int requestId, Set<int> favoriteFlowerIds, UiResult<RecommendUiEvent>? result
});




}
/// @nodoc
class __$RecommendStateCopyWithImpl<$Res>
    implements _$RecommendStateCopyWith<$Res> {
  __$RecommendStateCopyWithImpl(this._self, this._then);

  final _RecommendState _self;
  final $Res Function(_RecommendState) _then;

/// Create a copy of RecommendState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flowers = null,Object? requestId = null,Object? favoriteFlowerIds = null,Object? result = freezed,}) {
  return _then(_RecommendState(
flowers: null == flowers ? _self._flowers : flowers // ignore: cast_nullable_to_non_nullable
as List<FlowerInfoModel>,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int,favoriteFlowerIds: null == favoriteFlowerIds ? _self._favoriteFlowerIds : favoriteFlowerIds // ignore: cast_nullable_to_non_nullable
as Set<int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as UiResult<RecommendUiEvent>?,
  ));
}


}

// dart format on
