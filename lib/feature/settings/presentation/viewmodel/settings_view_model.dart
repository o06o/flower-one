import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/provider/settings_providers.dart';

class SettingsState {
  final bool isLoading;
  final bool isSignedOut;
  final String? errorMessage;

  const SettingsState({
    required this.isLoading,
    required this.isSignedOut,
    this.errorMessage,
  });

  const SettingsState.init()
    : this(isLoading: false, isSignedOut: false, errorMessage: null);

  SettingsState copyWith({
    bool? isLoading,
    bool? isSignedOut,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      isSignedOut: isSignedOut ?? this.isSignedOut,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

final settingsViewModelProvider =
    StateNotifierProvider.autoDispose<SettingsViewModel, SettingsState>((ref) {
      return SettingsViewModel(ref);
    });

class SettingsViewModel extends StateNotifier<SettingsState> {
  final Ref _ref;

  SettingsViewModel(this._ref) : super(const SettingsState.init());

  Future<void> signOut() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _ref.read(signOutUseCaseProvider).call();
      state = state.copyWith(isLoading: false, isSignedOut: true);
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
        isSignedOut: false,
      );
    }
  }
}
