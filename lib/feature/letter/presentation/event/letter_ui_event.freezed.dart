// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LetterUiEvent {

 String get message;
/// Create a copy of LetterUiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterUiEventCopyWith<LetterUiEvent> get copyWith => _$LetterUiEventCopyWithImpl<LetterUiEvent>(this as LetterUiEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LetterUiEvent&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LetterUiEvent(message: $message)';
}


}

/// @nodoc
abstract mixin class $LetterUiEventCopyWith<$Res>  {
  factory $LetterUiEventCopyWith(LetterUiEvent value, $Res Function(LetterUiEvent) _then) = _$LetterUiEventCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LetterUiEventCopyWithImpl<$Res>
    implements $LetterUiEventCopyWith<$Res> {
  _$LetterUiEventCopyWithImpl(this._self, this._then);

  final LetterUiEvent _self;
  final $Res Function(LetterUiEvent) _then;

/// Create a copy of LetterUiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LetterUiEvent].
extension LetterUiEventPatterns on LetterUiEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowToast value)?  showToast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowToast() when showToast != null:
return showToast(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowToast value)  showToast,}){
final _that = this;
switch (_that) {
case ShowToast():
return showToast(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowToast value)?  showToast,}){
final _that = this;
switch (_that) {
case ShowToast() when showToast != null:
return showToast(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  showToast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowToast() when showToast != null:
return showToast(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  showToast,}) {final _that = this;
switch (_that) {
case ShowToast():
return showToast(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  showToast,}) {final _that = this;
switch (_that) {
case ShowToast() when showToast != null:
return showToast(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ShowToast implements LetterUiEvent {
  const ShowToast(this.message);
  

@override final  String message;

/// Create a copy of LetterUiEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'LetterUiEvent.showToast(message: $message)';
}


}

/// @nodoc
abstract mixin class $ShowToastCopyWith<$Res> implements $LetterUiEventCopyWith<$Res> {
  factory $ShowToastCopyWith(ShowToast value, $Res Function(ShowToast) _then) = _$ShowToastCopyWithImpl;
@override @useResult
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

/// Create a copy of LetterUiEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ShowToast(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
