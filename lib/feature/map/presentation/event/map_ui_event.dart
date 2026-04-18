import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_ui_event.freezed.dart';

@freezed
abstract class MapUiEvent with _$MapUiEvent {
  const factory MapUiEvent.showToast(String message) = ShowToast;
  const factory MapUiEvent.locationPermissionDenied() = LocationPermissionDenied;
}
