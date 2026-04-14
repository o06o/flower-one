// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garden_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GardenState {

 int? get lastGroupNo; bool get isEditable; bool get isLoading; List<FlowerInfoModel?> get favoriteList; UiResult<GardenUiEvent>? get result;
/// Create a copy of GardenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GardenStateCopyWith<GardenState> get copyWith => _$GardenStateCopyWithImpl<GardenState>(this as GardenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GardenState&&(identical(other.lastGroupNo, lastGroupNo) || other.lastGroupNo == lastGroupNo)&&(identical(other.isEditable, isEditable) || other.isEditable == isEditable)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.favoriteList, favoriteList)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,lastGroupNo,isEditable,isLoading,const DeepCollectionEquality().hash(favoriteList),result);

@override
String toString() {
  return 'GardenState(lastGroupNo: $lastGroupNo, isEditable: $isEditable, isLoading: $isLoading, favoriteList: $favoriteList, result: $result)';
}


}

/// @nodoc
abstract mixin class $GardenStateCopyWith<$Res>  {
  factory $GardenStateCopyWith(GardenState value, $Res Function(GardenState) _then) = _$GardenStateCopyWithImpl;
@useResult
$Res call({
 int? lastGroupNo, bool isEditable, bool isLoading, List<FlowerInfoModel?> favoriteList, UiResult<GardenUiEvent>? result
});




}
/// @nodoc
class _$GardenStateCopyWithImpl<$Res>
    implements $GardenStateCopyWith<$Res> {
  _$GardenStateCopyWithImpl(this._self, this._then);

  final GardenState _self;
  final $Res Function(GardenState) _then;

/// Create a copy of GardenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastGroupNo = freezed,Object? isEditable = null,Object? isLoading = null,Object? favoriteList = null,Object? result = freezed,}) {
  return _then(_self.copyWith(
lastGroupNo: freezed == lastGroupNo ? _self.lastGroupNo : lastGroupNo // ignore: cast_nullable_to_non_nullable
as int?,isEditable: null == isEditable ? _self.isEditable : isEditable // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,favoriteList: null == favoriteList ? _self.favoriteList : favoriteList // ignore: cast_nullable_to_non_nullable
as List<FlowerInfoModel?>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as UiResult<GardenUiEvent>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GardenState].
extension GardenStatePatterns on GardenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GardenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GardenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GardenState value)  $default,){
final _that = this;
switch (_that) {
case _GardenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GardenState value)?  $default,){
final _that = this;
switch (_that) {
case _GardenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? lastGroupNo,  bool isEditable,  bool isLoading,  List<FlowerInfoModel?> favoriteList,  UiResult<GardenUiEvent>? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GardenState() when $default != null:
return $default(_that.lastGroupNo,_that.isEditable,_that.isLoading,_that.favoriteList,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? lastGroupNo,  bool isEditable,  bool isLoading,  List<FlowerInfoModel?> favoriteList,  UiResult<GardenUiEvent>? result)  $default,) {final _that = this;
switch (_that) {
case _GardenState():
return $default(_that.lastGroupNo,_that.isEditable,_that.isLoading,_that.favoriteList,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? lastGroupNo,  bool isEditable,  bool isLoading,  List<FlowerInfoModel?> favoriteList,  UiResult<GardenUiEvent>? result)?  $default,) {final _that = this;
switch (_that) {
case _GardenState() when $default != null:
return $default(_that.lastGroupNo,_that.isEditable,_that.isLoading,_that.favoriteList,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _GardenState implements GardenState {
   _GardenState({this.lastGroupNo, this.isEditable = false, this.isLoading = false, final  List<FlowerInfoModel?> favoriteList = const [], this.result}): _favoriteList = favoriteList;
  

@override final  int? lastGroupNo;
@override@JsonKey() final  bool isEditable;
@override@JsonKey() final  bool isLoading;
 final  List<FlowerInfoModel?> _favoriteList;
@override@JsonKey() List<FlowerInfoModel?> get favoriteList {
  if (_favoriteList is EqualUnmodifiableListView) return _favoriteList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteList);
}

@override final  UiResult<GardenUiEvent>? result;

/// Create a copy of GardenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GardenStateCopyWith<_GardenState> get copyWith => __$GardenStateCopyWithImpl<_GardenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GardenState&&(identical(other.lastGroupNo, lastGroupNo) || other.lastGroupNo == lastGroupNo)&&(identical(other.isEditable, isEditable) || other.isEditable == isEditable)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._favoriteList, _favoriteList)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,lastGroupNo,isEditable,isLoading,const DeepCollectionEquality().hash(_favoriteList),result);

@override
String toString() {
  return 'GardenState(lastGroupNo: $lastGroupNo, isEditable: $isEditable, isLoading: $isLoading, favoriteList: $favoriteList, result: $result)';
}


}

/// @nodoc
abstract mixin class _$GardenStateCopyWith<$Res> implements $GardenStateCopyWith<$Res> {
  factory _$GardenStateCopyWith(_GardenState value, $Res Function(_GardenState) _then) = __$GardenStateCopyWithImpl;
@override @useResult
$Res call({
 int? lastGroupNo, bool isEditable, bool isLoading, List<FlowerInfoModel?> favoriteList, UiResult<GardenUiEvent>? result
});




}
/// @nodoc
class __$GardenStateCopyWithImpl<$Res>
    implements _$GardenStateCopyWith<$Res> {
  __$GardenStateCopyWithImpl(this._self, this._then);

  final _GardenState _self;
  final $Res Function(_GardenState) _then;

/// Create a copy of GardenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastGroupNo = freezed,Object? isEditable = null,Object? isLoading = null,Object? favoriteList = null,Object? result = freezed,}) {
  return _then(_GardenState(
lastGroupNo: freezed == lastGroupNo ? _self.lastGroupNo : lastGroupNo // ignore: cast_nullable_to_non_nullable
as int?,isEditable: null == isEditable ? _self.isEditable : isEditable // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,favoriteList: null == favoriteList ? _self._favoriteList : favoriteList // ignore: cast_nullable_to_non_nullable
as List<FlowerInfoModel?>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as UiResult<GardenUiEvent>?,
  ));
}


}

// dart format on
