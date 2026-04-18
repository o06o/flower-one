// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapUiEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapUiEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapUiEvent()';
}


}

/// @nodoc
class $MapUiEventCopyWith<$Res>  {
$MapUiEventCopyWith(MapUiEvent _, $Res Function(MapUiEvent) __);
}


/// Adds pattern-matching-related methods to [MapUiEvent].
extension MapUiEventPatterns on MapUiEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowToast value)?  showToast,TResult Function( LocationPermissionDenied value)?  locationPermissionDenied,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowToast() when showToast != null:
return showToast(_that);case LocationPermissionDenied() when locationPermissionDenied != null:
return locationPermissionDenied(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowToast value)  showToast,required TResult Function( LocationPermissionDenied value)  locationPermissionDenied,}){
final _that = this;
switch (_that) {
case ShowToast():
return showToast(_that);case LocationPermissionDenied():
return locationPermissionDenied(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowToast value)?  showToast,TResult? Function( LocationPermissionDenied value)?  locationPermissionDenied,}){
final _that = this;
switch (_that) {
case ShowToast() when showToast != null:
return showToast(_that);case LocationPermissionDenied() when locationPermissionDenied != null:
return locationPermissionDenied(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  showToast,TResult Function()?  locationPermissionDenied,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowToast() when showToast != null:
return showToast(_that.message);case LocationPermissionDenied() when locationPermissionDenied != null:
return locationPermissionDenied();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  showToast,required TResult Function()  locationPermissionDenied,}) {final _that = this;
switch (_that) {
case ShowToast():
return showToast(_that.message);case LocationPermissionDenied():
return locationPermissionDenied();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  showToast,TResult? Function()?  locationPermissionDenied,}) {final _that = this;
switch (_that) {
case ShowToast() when showToast != null:
return showToast(_that.message);case LocationPermissionDenied() when locationPermissionDenied != null:
return locationPermissionDenied();case _:
  return null;

}
}

}

/// @nodoc


class ShowToast implements MapUiEvent {
  const ShowToast(this.message);
  

 final  String message;

/// Create a copy of MapUiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowToastCopyWith<ShowToast> get copyWith => _$ShowToastCopyWithImpl<ShowToast>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowToast&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MapUiEvent.showToast(message: $message)';
}


}

/// @nodoc
abstract mixin class $ShowToastCopyWith<$Res> implements $MapUiEventCopyWith<$Res> {
  factory $ShowToastCopyWith(ShowToast value, $Res Function(ShowToast) _then) = _$ShowToastCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ShowToastCopyWithImpl<$Res>
    implements $ShowToastCopyWith<$Res> {
  _$ShowToastCopyWithImpl(this._self, this._then);

  final ShowToast _self;
  final $Res Function(ShowToast) _then;

/// Create a copy of MapUiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ShowToast(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LocationPermissionDenied implements MapUiEvent {
  const LocationPermissionDenied();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPermissionDenied);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapUiEvent.locationPermissionDenied()';
}


}




// dart format on
