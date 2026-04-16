import 'package:freezed_annotation/freezed_annotation.dart';

part 'letter_ui_event.freezed.dart';

@freezed
abstract class LetterUiEvent with _$LetterUiEvent {
  const factory LetterUiEvent.showToast(String message) = ShowToast;
}
