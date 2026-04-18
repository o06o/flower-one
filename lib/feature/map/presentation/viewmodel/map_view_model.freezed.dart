// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {

 List<FlowerShopPlaceInfoModel> get places; FlowerShopPlaceInfoModel? get selectedPlace; String? get selectedMarkerId; NLatLng? get lastSearchedCenter; NLatLng? get currentLocation; bool get isSearching; bool get isMovingToMyLocation; AsyncValue<void> get requestState;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&const DeepCollectionEquality().equals(other.places, places)&&(identical(other.selectedPlace, selectedPlace) || other.selectedPlace == selectedPlace)&&(identical(other.selectedMarkerId, selectedMarkerId) || other.selectedMarkerId == selectedMarkerId)&&(identical(other.lastSearchedCenter, lastSearchedCenter) || other.lastSearchedCenter == lastSearchedCenter)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isMovingToMyLocation, isMovingToMyLocation) || other.isMovingToMyLocation == isMovingToMyLocation)&&(identical(other.requestState, requestState) || other.requestState == requestState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(places),selectedPlace,selectedMarkerId,lastSearchedCenter,currentLocation,isSearching,isMovingToMyLocation,requestState);

@override
String toString() {
  return 'MapState(places: $places, selectedPlace: $selectedPlace, selectedMarkerId: $selectedMarkerId, lastSearchedCenter: $lastSearchedCenter, currentLocation: $currentLocation, isSearching: $isSearching, isMovingToMyLocation: $isMovingToMyLocation, requestState: $requestState)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 List<FlowerShopPlaceInfoModel> places, FlowerShopPlaceInfoModel? selectedPlace, String? selectedMarkerId, NLatLng? lastSearchedCenter, NLatLng? currentLocation, bool isSearching, bool isMovingToMyLocation, AsyncValue<void> requestState
});


$FlowerShopPlaceInfoModelCopyWith<$Res>? get selectedPlace;

}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? places = null,Object? selectedPlace = freezed,Object? selectedMarkerId = freezed,Object? lastSearchedCenter = freezed,Object? currentLocation = freezed,Object? isSearching = null,Object? isMovingToMyLocation = null,Object? requestState = null,}) {
  return _then(_self.copyWith(
places: null == places ? _self.places : places // ignore: cast_nullable_to_non_nullable
as List<FlowerShopPlaceInfoModel>,selectedPlace: freezed == selectedPlace ? _self.selectedPlace : selectedPlace // ignore: cast_nullable_to_non_nullable
as FlowerShopPlaceInfoModel?,selectedMarkerId: freezed == selectedMarkerId ? _self.selectedMarkerId : selectedMarkerId // ignore: cast_nullable_to_non_nullable
as String?,lastSearchedCenter: freezed == lastSearchedCenter ? _self.lastSearchedCenter : lastSearchedCenter // ignore: cast_nullable_to_non_nullable
as NLatLng?,currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as NLatLng?,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isMovingToMyLocation: null == isMovingToMyLocation ? _self.isMovingToMyLocation : isMovingToMyLocation // ignore: cast_nullable_to_non_nullable
as bool,requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,
  ));
}
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlowerShopPlaceInfoModelCopyWith<$Res>? get selectedPlace {
    if (_self.selectedPlace == null) {
    return null;
  }

  return $FlowerShopPlaceInfoModelCopyWith<$Res>(_self.selectedPlace!, (value) {
    return _then(_self.copyWith(selectedPlace: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapState value)  $default,){
final _that = this;
switch (_that) {
case _MapState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapState value)?  $default,){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FlowerShopPlaceInfoModel> places,  FlowerShopPlaceInfoModel? selectedPlace,  String? selectedMarkerId,  NLatLng? lastSearchedCenter,  NLatLng? currentLocation,  bool isSearching,  bool isMovingToMyLocation,  AsyncValue<void> requestState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.places,_that.selectedPlace,_that.selectedMarkerId,_that.lastSearchedCenter,_that.currentLocation,_that.isSearching,_that.isMovingToMyLocation,_that.requestState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FlowerShopPlaceInfoModel> places,  FlowerShopPlaceInfoModel? selectedPlace,  String? selectedMarkerId,  NLatLng? lastSearchedCenter,  NLatLng? currentLocation,  bool isSearching,  bool isMovingToMyLocation,  AsyncValue<void> requestState)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.places,_that.selectedPlace,_that.selectedMarkerId,_that.lastSearchedCenter,_that.currentLocation,_that.isSearching,_that.isMovingToMyLocation,_that.requestState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FlowerShopPlaceInfoModel> places,  FlowerShopPlaceInfoModel? selectedPlace,  String? selectedMarkerId,  NLatLng? lastSearchedCenter,  NLatLng? currentLocation,  bool isSearching,  bool isMovingToMyLocation,  AsyncValue<void> requestState)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.places,_that.selectedPlace,_that.selectedMarkerId,_that.lastSearchedCenter,_that.currentLocation,_that.isSearching,_that.isMovingToMyLocation,_that.requestState);case _:
  return null;

}
}

}

/// @nodoc


class _MapState implements MapState {
   _MapState({final  List<FlowerShopPlaceInfoModel> places = const [], this.selectedPlace, this.selectedMarkerId, this.lastSearchedCenter, this.currentLocation, this.isSearching = false, this.isMovingToMyLocation = false, this.requestState = const AsyncData<void>(null)}): _places = places;
  

 final  List<FlowerShopPlaceInfoModel> _places;
@override@JsonKey() List<FlowerShopPlaceInfoModel> get places {
  if (_places is EqualUnmodifiableListView) return _places;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_places);
}

@override final  FlowerShopPlaceInfoModel? selectedPlace;
@override final  String? selectedMarkerId;
@override final  NLatLng? lastSearchedCenter;
@override final  NLatLng? currentLocation;
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  bool isMovingToMyLocation;
@override@JsonKey() final  AsyncValue<void> requestState;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&const DeepCollectionEquality().equals(other._places, _places)&&(identical(other.selectedPlace, selectedPlace) || other.selectedPlace == selectedPlace)&&(identical(other.selectedMarkerId, selectedMarkerId) || other.selectedMarkerId == selectedMarkerId)&&(identical(other.lastSearchedCenter, lastSearchedCenter) || other.lastSearchedCenter == lastSearchedCenter)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isMovingToMyLocation, isMovingToMyLocation) || other.isMovingToMyLocation == isMovingToMyLocation)&&(identical(other.requestState, requestState) || other.requestState == requestState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_places),selectedPlace,selectedMarkerId,lastSearchedCenter,currentLocation,isSearching,isMovingToMyLocation,requestState);

@override
String toString() {
  return 'MapState(places: $places, selectedPlace: $selectedPlace, selectedMarkerId: $selectedMarkerId, lastSearchedCenter: $lastSearchedCenter, currentLocation: $currentLocation, isSearching: $isSearching, isMovingToMyLocation: $isMovingToMyLocation, requestState: $requestState)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 List<FlowerShopPlaceInfoModel> places, FlowerShopPlaceInfoModel? selectedPlace, String? selectedMarkerId, NLatLng? lastSearchedCenter, NLatLng? currentLocation, bool isSearching, bool isMovingToMyLocation, AsyncValue<void> requestState
});


@override $FlowerShopPlaceInfoModelCopyWith<$Res>? get selectedPlace;

}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? places = null,Object? selectedPlace = freezed,Object? selectedMarkerId = freezed,Object? lastSearchedCenter = freezed,Object? currentLocation = freezed,Object? isSearching = null,Object? isMovingToMyLocation = null,Object? requestState = null,}) {
  return _then(_MapState(
places: null == places ? _self._places : places // ignore: cast_nullable_to_non_nullable
as List<FlowerShopPlaceInfoModel>,selectedPlace: freezed == selectedPlace ? _self.selectedPlace : selectedPlace // ignore: cast_nullable_to_non_nullable
as FlowerShopPlaceInfoModel?,selectedMarkerId: freezed == selectedMarkerId ? _self.selectedMarkerId : selectedMarkerId // ignore: cast_nullable_to_non_nullable
as String?,lastSearchedCenter: freezed == lastSearchedCenter ? _self.lastSearchedCenter : lastSearchedCenter // ignore: cast_nullable_to_non_nullable
as NLatLng?,currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as NLatLng?,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isMovingToMyLocation: null == isMovingToMyLocation ? _self.isMovingToMyLocation : isMovingToMyLocation // ignore: cast_nullable_to_non_nullable
as bool,requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,
  ));
}

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlowerShopPlaceInfoModelCopyWith<$Res>? get selectedPlace {
    if (_self.selectedPlace == null) {
    return null;
  }

  return $FlowerShopPlaceInfoModelCopyWith<$Res>(_self.selectedPlace!, (value) {
    return _then(_self.copyWith(selectedPlace: value));
  });
}
}

// dart format on
