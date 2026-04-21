import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_messages.dart';
import '../../domain/provider/signin_providers.dart';

class SignInState {
  final bool isLoading;
  final bool isSignedIn;
  final String? errorMessage;

  const SignInState({
    required this.isLoading,
    required this.isSignedIn,
    this.errorMessage,
  });

  const SignInState.init()
    : this(isLoading: false, isSignedIn: false, errorMessage: null);

  SignInState copyWith({
    bool? isLoading,
    bool? isSignedIn,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      isSignedIn: isSignedIn ?? this.isSignedIn,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

final signInViewModelProvider =
    StateNotifierProvider.autoDispose<SignInViewModel, SignInState>((ref) {
      return SignInViewModel(ref);
    });

class SignInViewModel extends StateNotifier<SignInState> {
  final Ref _ref;

  SignInViewModel(this._ref) : super(const SignInState.init());

  Future<void> signInWithGoogle({
    required String idToken,
    required String accessToken,
    String? serverAuthCode,
  }) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _ref
          .read(signInWithGoogleUseCaseProvider)
          .call(idToken: idToken, accessToken: accessToken);
      state = state.copyWith(isLoading: false, isSignedIn: true);
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${AppMessages.signInFailedPrefix}$error',
      );
    }
  }

  Future<void> signInWithApple() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _ref.read(signInWithAppleUseCaseProvider).call();
      state = state.copyWith(isLoading: false, isSignedIn: true);
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '${AppMessages.signInFailedPrefix}$error',
      );
    }
  }
}
