// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeChatMessage {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeChatMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeChatMessage()';
}


}

/// @nodoc
class $HomeChatMessageCopyWith<$Res>  {
$HomeChatMessageCopyWith(HomeChatMessage _, $Res Function(HomeChatMessage) __);
}


/// Adds pattern-matching-related methods to [HomeChatMessage].
extension HomeChatMessagePatterns on HomeChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextMessage value)?  text,TResult Function( FlowerCardsMessage value)?  flowerCards,TResult Function( ActionButtonsMessage value)?  actionButtons,TResult Function( FlowerSelectionMessage value)?  flowerSelection,TResult Function( RecipientSelectionMessage value)?  recipientSelection,TResult Function( LoadingMessage value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextMessage() when text != null:
return text(_that);case FlowerCardsMessage() when flowerCards != null:
return flowerCards(_that);case ActionButtonsMessage() when actionButtons != null:
return actionButtons(_that);case FlowerSelectionMessage() when flowerSelection != null:
return flowerSelection(_that);case RecipientSelectionMessage() when recipientSelection != null:
return recipientSelection(_that);case LoadingMessage() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextMessage value)  text,required TResult Function( FlowerCardsMessage value)  flowerCards,required TResult Function( ActionButtonsMessage value)  actionButtons,required TResult Function( FlowerSelectionMessage value)  flowerSelection,required TResult Function( RecipientSelectionMessage value)  recipientSelection,required TResult Function( LoadingMessage value)  loading,}){
final _that = this;
switch (_that) {
case TextMessage():
return text(_that);case FlowerCardsMessage():
return flowerCards(_that);case ActionButtonsMessage():
return actionButtons(_that);case FlowerSelectionMessage():
return flowerSelection(_that);case RecipientSelectionMessage():
return recipientSelection(_that);case LoadingMessage():
return loading(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextMessage value)?  text,TResult? Function( FlowerCardsMessage value)?  flowerCards,TResult? Function( ActionButtonsMessage value)?  actionButtons,TResult? Function( FlowerSelectionMessage value)?  flowerSelection,TResult? Function( RecipientSelectionMessage value)?  recipientSelection,TResult? Function( LoadingMessage value)?  loading,}){
final _that = this;
switch (_that) {
case TextMessage() when text != null:
return text(_that);case FlowerCardsMessage() when flowerCards != null:
return flowerCards(_that);case ActionButtonsMessage() when actionButtons != null:
return actionButtons(_that);case FlowerSelectionMessage() when flowerSelection != null:
return flowerSelection(_that);case RecipientSelectionMessage() when recipientSelection != null:
return recipientSelection(_that);case LoadingMessage() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text,  bool isUser)?  text,TResult Function( List<FlowerInfoModel> flowers)?  flowerCards,TResult Function()?  actionButtons,TResult Function( List<FlowerInfoModel> flowers)?  flowerSelection,TResult Function()?  recipientSelection,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextMessage() when text != null:
return text(_that.text,_that.isUser);case FlowerCardsMessage() when flowerCards != null:
return flowerCards(_that.flowers);case ActionButtonsMessage() when actionButtons != null:
return actionButtons();case FlowerSelectionMessage() when flowerSelection != null:
return flowerSelection(_that.flowers);case RecipientSelectionMessage() when recipientSelection != null:
return recipientSelection();case LoadingMessage() when loading != null:
return loading();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text,  bool isUser)  text,required TResult Function( List<FlowerInfoModel> flowers)  flowerCards,required TResult Function()  actionButtons,required TResult Function( List<FlowerInfoModel> flowers)  flowerSelection,required TResult Function()  recipientSelection,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case TextMessage():
return text(_that.text,_that.isUser);case FlowerCardsMessage():
return flowerCards(_that.flowers);case ActionButtonsMessage():
return actionButtons();case FlowerSelectionMessage():
return flowerSelection(_that.flowers);case RecipientSelectionMessage():
return recipientSelection();case LoadingMessage():
return loading();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text,  bool isUser)?  text,TResult? Function( List<FlowerInfoModel> flowers)?  flowerCards,TResult? Function()?  actionButtons,TResult? Function( List<FlowerInfoModel> flowers)?  flowerSelection,TResult? Function()?  recipientSelection,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case TextMessage() when text != null:
return text(_that.text,_that.isUser);case FlowerCardsMessage() when flowerCards != null:
return flowerCards(_that.flowers);case ActionButtonsMessage() when actionButtons != null:
return actionButtons();case FlowerSelectionMessage() when flowerSelection != null:
return flowerSelection(_that.flowers);case RecipientSelectionMessage() when recipientSelection != null:
return recipientSelection();case LoadingMessage() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class TextMessage implements HomeChatMessage {
   TextMessage({required this.text, this.isUser = false});
  

 final  String text;
@JsonKey() final  bool isUser;

/// Create a copy of HomeChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextMessageCopyWith<TextMessage> get copyWith => _$TextMessageCopyWithImpl<TextMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextMessage&&(identical(other.text, text) || other.text == text)&&(identical(other.isUser, isUser) || other.isUser == isUser));
}


@override
int get hashCode => Object.hash(runtimeType,text,isUser);

@override
String toString() {
  return 'HomeChatMessage.text(text: $text, isUser: $isUser)';
}


}

/// @nodoc
abstract mixin class $TextMessageCopyWith<$Res> implements $HomeChatMessageCopyWith<$Res> {
  factory $TextMessageCopyWith(TextMessage value, $Res Function(TextMessage) _then) = _$TextMessageCopyWithImpl;
@useResult
$Res call({
 String text, bool isUser
});




}
/// @nodoc
class _$TextMessageCopyWithImpl<$Res>
    implements $TextMessageCopyWith<$Res> {
  _$TextMessageCopyWithImpl(this._self, this._then);

  final TextMessage _self;
  final $Res Function(TextMessage) _then;

/// Create a copy of HomeChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,Object? isUser = null,}) {
  return _then(TextMessage(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isUser: null == isUser ? _self.isUser : isUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class FlowerCardsMessage implements HomeChatMessage {
   FlowerCardsMessage({required final  List<FlowerInfoModel> flowers}): _flowers = flowers;
  

 final  List<FlowerInfoModel> _flowers;
 List<FlowerInfoModel> get flowers {
  if (_flowers is EqualUnmodifiableListView) return _flowers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flowers);
}


/// Create a copy of HomeChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlowerCardsMessageCopyWith<FlowerCardsMessage> get copyWith => _$FlowerCardsMessageCopyWithImpl<FlowerCardsMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlowerCardsMessage&&const DeepCollectionEquality().equals(other._flowers, _flowers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_flowers));

@override
String toString() {
  return 'HomeChatMessage.flowerCards(flowers: $flowers)';
}


}

/// @nodoc
abstract mixin class $FlowerCardsMessageCopyWith<$Res> implements $HomeChatMessageCopyWith<$Res> {
  factory $FlowerCardsMessageCopyWith(FlowerCardsMessage value, $Res Function(FlowerCardsMessage) _then) = _$FlowerCardsMessageCopyWithImpl;
@useResult
$Res call({
 List<FlowerInfoModel> flowers
});




}
/// @nodoc
class _$FlowerCardsMessageCopyWithImpl<$Res>
    implements $FlowerCardsMessageCopyWith<$Res> {
  _$FlowerCardsMessageCopyWithImpl(this._self, this._then);

  final FlowerCardsMessage _self;
  final $Res Function(FlowerCardsMessage) _then;

/// Create a copy of HomeChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flowers = null,}) {
  return _then(FlowerCardsMessage(
flowers: null == flowers ? _self._flowers : flowers // ignore: cast_nullable_to_non_nullable
as List<FlowerInfoModel>,
  ));
}


}

/// @nodoc


class ActionButtonsMessage implements HomeChatMessage {
   ActionButtonsMessage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionButtonsMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeChatMessage.actionButtons()';
}


}




/// @nodoc


class FlowerSelectionMessage implements HomeChatMessage {
   FlowerSelectionMessage({required final  List<FlowerInfoModel> flowers}): _flowers = flowers;
  

 final  List<FlowerInfoModel> _flowers;
 List<FlowerInfoModel> get flowers {
  if (_flowers is EqualUnmodifiableListView) return _flowers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flowers);
}


/// Create a copy of HomeChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlowerSelectionMessageCopyWith<FlowerSelectionMessage> get copyWith => _$FlowerSelectionMessageCopyWithImpl<FlowerSelectionMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlowerSelectionMessage&&const DeepCollectionEquality().equals(other._flowers, _flowers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_flowers));

@override
String toString() {
  return 'HomeChatMessage.flowerSelection(flowers: $flowers)';
}


}

/// @nodoc
abstract mixin class $FlowerSelectionMessageCopyWith<$Res> implements $HomeChatMessageCopyWith<$Res> {
  factory $FlowerSelectionMessageCopyWith(FlowerSelectionMessage value, $Res Function(FlowerSelectionMessage) _then) = _$FlowerSelectionMessageCopyWithImpl;
@useResult
$Res call({
 List<FlowerInfoModel> flowers
});




}
/// @nodoc
class _$FlowerSelectionMessageCopyWithImpl<$Res>
    implements $FlowerSelectionMessageCopyWith<$Res> {
  _$FlowerSelectionMessageCopyWithImpl(this._self, this._then);

  final FlowerSelectionMessage _self;
  final $Res Function(FlowerSelectionMessage) _then;

/// Create a copy of HomeChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flowers = null,}) {
  return _then(FlowerSelectionMessage(
flowers: null == flowers ? _self._flowers : flowers // ignore: cast_nullable_to_non_nullable
as List<FlowerInfoModel>,
  ));
}


}

/// @nodoc


class RecipientSelectionMessage implements HomeChatMessage {
   RecipientSelectionMessage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipientSelectionMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeChatMessage.recipientSelection()';
}


}




/// @nodoc


class LoadingMessage implements HomeChatMessage {
   LoadingMessage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeChatMessage.loading()';
}


}




/// @nodoc
mixin _$HomeState {

 List<HomeChatMessage> get messages; ChatStep get currentStep; List<FlowerInfoModel> get recommendedFlowers; int? get requestId; FlowerInfoModel? get selectedFlower; String? get selectedRecipient; String? get userSituation; String? get letterContent; AsyncValue<void> get requestState;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other.recommendedFlowers, recommendedFlowers)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.selectedFlower, selectedFlower) || other.selectedFlower == selectedFlower)&&(identical(other.selectedRecipient, selectedRecipient) || other.selectedRecipient == selectedRecipient)&&(identical(other.userSituation, userSituation) || other.userSituation == userSituation)&&(identical(other.letterContent, letterContent) || other.letterContent == letterContent)&&(identical(other.requestState, requestState) || other.requestState == requestState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),currentStep,const DeepCollectionEquality().hash(recommendedFlowers),requestId,selectedFlower,selectedRecipient,userSituation,letterContent,requestState);

@override
String toString() {
  return 'HomeState(messages: $messages, currentStep: $currentStep, recommendedFlowers: $recommendedFlowers, requestId: $requestId, selectedFlower: $selectedFlower, selectedRecipient: $selectedRecipient, userSituation: $userSituation, letterContent: $letterContent, requestState: $requestState)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<HomeChatMessage> messages, ChatStep currentStep, List<FlowerInfoModel> recommendedFlowers, int? requestId, FlowerInfoModel? selectedFlower, String? selectedRecipient, String? userSituation, String? letterContent, AsyncValue<void> requestState
});


$FlowerInfoModelCopyWith<$Res>? get selectedFlower;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? currentStep = null,Object? recommendedFlowers = null,Object? requestId = freezed,Object? selectedFlower = freezed,Object? selectedRecipient = freezed,Object? userSituation = freezed,Object? letterContent = freezed,Object? requestState = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<HomeChatMessage>,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as ChatStep,recommendedFlowers: null == recommendedFlowers ? _self.recommendedFlowers : recommendedFlowers // ignore: cast_nullable_to_non_nullable
as List<FlowerInfoModel>,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int?,selectedFlower: freezed == selectedFlower ? _self.selectedFlower : selectedFlower // ignore: cast_nullable_to_non_nullable
as FlowerInfoModel?,selectedRecipient: freezed == selectedRecipient ? _self.selectedRecipient : selectedRecipient // ignore: cast_nullable_to_non_nullable
as String?,userSituation: freezed == userSituation ? _self.userSituation : userSituation // ignore: cast_nullable_to_non_nullable
as String?,letterContent: freezed == letterContent ? _self.letterContent : letterContent // ignore: cast_nullable_to_non_nullable
as String?,requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlowerInfoModelCopyWith<$Res>? get selectedFlower {
    if (_self.selectedFlower == null) {
    return null;
  }

  return $FlowerInfoModelCopyWith<$Res>(_self.selectedFlower!, (value) {
    return _then(_self.copyWith(selectedFlower: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HomeChatMessage> messages,  ChatStep currentStep,  List<FlowerInfoModel> recommendedFlowers,  int? requestId,  FlowerInfoModel? selectedFlower,  String? selectedRecipient,  String? userSituation,  String? letterContent,  AsyncValue<void> requestState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.messages,_that.currentStep,_that.recommendedFlowers,_that.requestId,_that.selectedFlower,_that.selectedRecipient,_that.userSituation,_that.letterContent,_that.requestState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HomeChatMessage> messages,  ChatStep currentStep,  List<FlowerInfoModel> recommendedFlowers,  int? requestId,  FlowerInfoModel? selectedFlower,  String? selectedRecipient,  String? userSituation,  String? letterContent,  AsyncValue<void> requestState)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.messages,_that.currentStep,_that.recommendedFlowers,_that.requestId,_that.selectedFlower,_that.selectedRecipient,_that.userSituation,_that.letterContent,_that.requestState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HomeChatMessage> messages,  ChatStep currentStep,  List<FlowerInfoModel> recommendedFlowers,  int? requestId,  FlowerInfoModel? selectedFlower,  String? selectedRecipient,  String? userSituation,  String? letterContent,  AsyncValue<void> requestState)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.messages,_that.currentStep,_that.recommendedFlowers,_that.requestId,_that.selectedFlower,_that.selectedRecipient,_that.userSituation,_that.letterContent,_that.requestState);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
   _HomeState({final  List<HomeChatMessage> messages = const [], this.currentStep = ChatStep.initial, final  List<FlowerInfoModel> recommendedFlowers = const [], this.requestId, this.selectedFlower, this.selectedRecipient, this.userSituation, this.letterContent, this.requestState = const AsyncData<void>(null)}): _messages = messages,_recommendedFlowers = recommendedFlowers;
  

 final  List<HomeChatMessage> _messages;
@override@JsonKey() List<HomeChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  ChatStep currentStep;
 final  List<FlowerInfoModel> _recommendedFlowers;
@override@JsonKey() List<FlowerInfoModel> get recommendedFlowers {
  if (_recommendedFlowers is EqualUnmodifiableListView) return _recommendedFlowers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendedFlowers);
}

@override final  int? requestId;
@override final  FlowerInfoModel? selectedFlower;
@override final  String? selectedRecipient;
@override final  String? userSituation;
@override final  String? letterContent;
@override@JsonKey() final  AsyncValue<void> requestState;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other._recommendedFlowers, _recommendedFlowers)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.selectedFlower, selectedFlower) || other.selectedFlower == selectedFlower)&&(identical(other.selectedRecipient, selectedRecipient) || other.selectedRecipient == selectedRecipient)&&(identical(other.userSituation, userSituation) || other.userSituation == userSituation)&&(identical(other.letterContent, letterContent) || other.letterContent == letterContent)&&(identical(other.requestState, requestState) || other.requestState == requestState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),currentStep,const DeepCollectionEquality().hash(_recommendedFlowers),requestId,selectedFlower,selectedRecipient,userSituation,letterContent,requestState);

@override
String toString() {
  return 'HomeState(messages: $messages, currentStep: $currentStep, recommendedFlowers: $recommendedFlowers, requestId: $requestId, selectedFlower: $selectedFlower, selectedRecipient: $selectedRecipient, userSituation: $userSituation, letterContent: $letterContent, requestState: $requestState)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<HomeChatMessage> messages, ChatStep currentStep, List<FlowerInfoModel> recommendedFlowers, int? requestId, FlowerInfoModel? selectedFlower, String? selectedRecipient, String? userSituation, String? letterContent, AsyncValue<void> requestState
});


@override $FlowerInfoModelCopyWith<$Res>? get selectedFlower;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? currentStep = null,Object? recommendedFlowers = null,Object? requestId = freezed,Object? selectedFlower = freezed,Object? selectedRecipient = freezed,Object? userSituation = freezed,Object? letterContent = freezed,Object? requestState = null,}) {
  return _then(_HomeState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<HomeChatMessage>,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as ChatStep,recommendedFlowers: null == recommendedFlowers ? _self._recommendedFlowers : recommendedFlowers // ignore: cast_nullable_to_non_nullable
as List<FlowerInfoModel>,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as int?,selectedFlower: freezed == selectedFlower ? _self.selectedFlower : selectedFlower // ignore: cast_nullable_to_non_nullable
as FlowerInfoModel?,selectedRecipient: freezed == selectedRecipient ? _self.selectedRecipient : selectedRecipient // ignore: cast_nullable_to_non_nullable
as String?,userSituation: freezed == userSituation ? _self.userSituation : userSituation // ignore: cast_nullable_to_non_nullable
as String?,letterContent: freezed == letterContent ? _self.letterContent : letterContent // ignore: cast_nullable_to_non_nullable
as String?,requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlowerInfoModelCopyWith<$Res>? get selectedFlower {
    if (_self.selectedFlower == null) {
    return null;
  }

  return $FlowerInfoModelCopyWith<$Res>(_self.selectedFlower!, (value) {
    return _then(_self.copyWith(selectedFlower: value));
  });
}
}

// dart format on
