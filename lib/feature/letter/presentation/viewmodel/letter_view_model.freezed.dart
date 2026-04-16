// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LetterState {

 String get letterContent; bool get isLoading; UiResult<LetterUiEvent>? get result;
/// Create a copy of LetterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterStateCopyWith<LetterState> get copyWith => _$LetterStateCopyWithImpl<LetterState>(this as LetterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LetterState&&(identical(other.letterContent, letterContent) || other.letterContent == letterContent)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,letterContent,isLoading,result);

@override
String toString() {
  return 'LetterState(letterContent: $letterContent, isLoading: $isLoading, result: $result)';
}


}

/// @nodoc
abstract mixin class $LetterStateCopyWith<$Res>  {
  factory $LetterStateCopyWith(LetterState value, $Res Function(LetterState) _then) = _$LetterStateCopyWithImpl;
@useResult
$Res call({
 String letterContent, bool isLoading, UiResult<LetterUiEvent>? result
});




}
/// @nodoc
class _$LetterStateCopyWithImpl<$Res>
    implements $LetterStateCopyWith<$Res> {
  _$LetterStateCopyWithImpl(this._self, this._then);

  final LetterState _self;
  final $Res Function(LetterState) _then;

/// Create a copy of LetterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? letterContent = null,Object? isLoading = null,Object? result = freezed,}) {
  return _then(_self.copyWith(
letterContent: null == letterContent ? _self.letterContent : letterContent // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as UiResult<LetterUiEvent>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LetterState].
extension LetterStatePatterns on LetterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LetterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LetterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LetterState value)  $default,){
final _that = this;
switch (_that) {
case _LetterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LetterState value)?  $default,){
final _that = this;
switch (_that) {
case _LetterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String letterContent,  bool isLoading,  UiResult<LetterUiEvent>? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LetterState() when $default != null:
return $default(_that.letterContent,_that.isLoading,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String letterContent,  bool isLoading,  UiResult<LetterUiEvent>? result)  $default,) {final _that = this;
switch (_that) {
case _LetterState():
return $default(_that.letterContent,_that.isLoading,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String letterContent,  bool isLoading,  UiResult<LetterUiEvent>? result)?  $default,) {final _that = this;
switch (_that) {
case _LetterState() when $default != null:
return $default(_that.letterContent,_that.isLoading,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _LetterState implements LetterState {
   _LetterState({this.letterContent = '', this.isLoading = false, this.result});
  

@override@JsonKey() final  String letterContent;
@override@JsonKey() final  bool isLoading;
@override final  UiResult<LetterUiEvent>? result;

/// Create a copy of LetterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LetterStateCopyWith<_LetterState> get copyWith => __$LetterStateCopyWithImpl<_LetterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LetterState&&(identical(other.letterContent, letterContent) || other.letterContent == letterContent)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,letterContent,isLoading,result);

@override
String toString() {
  return 'LetterState(letterContent: $letterContent, isLoading: $isLoading, result: $result)';
}


}

/// @nodoc
abstract mixin class _$LetterStateCopyWith<$Res> implements $LetterStateCopyWith<$Res> {
  factory _$LetterStateCopyWith(_LetterState value, $Res Function(_LetterState) _then) = __$LetterStateCopyWithImpl;
@override @useResult
$Res call({
 String letterContent, bool isLoading, UiResult<LetterUiEvent>? result
});




}
/// @nodoc
class __$LetterStateCopyWithImpl<$Res>
    implements _$LetterStateCopyWith<$Res> {
  __$LetterStateCopyWithImpl(this._self, this._then);

  final _LetterState _self;
  final $Res Function(_LetterState) _then;

/// Create a copy of LetterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? letterContent = null,Object? isLoading = null,Object? result = freezed,}) {
  return _then(_LetterState(
letterContent: null == letterContent ? _self.letterContent : letterContent // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as UiResult<LetterUiEvent>?,
  ));
}


}

// dart format on
