import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/network/supabase/supabase_providers.dart';
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
  final GoTrueClient _authClient;
  StreamSubscription<AuthState>? _authSubscription;

  SignInViewModel(this._ref)
    : _authClient = _ref.read(supabaseAuthProvider),
      super(const SignInState.init()) {
    _authSubscription = _authClient.onAuthStateChange.listen((event) {
      if (event.session != null) _markSignedIn();
    });
  }

  Future<void> signInWithGoogle({
    required String idToken,
    required String accessToken,
  }) async {
    return _runSignIn(() async {
      await _ref
          .read(signInWithGoogleUseCaseProvider)
          .call(idToken: idToken, accessToken: accessToken);
    });
  }

  Future<void> signInWithApple() async {
    return _runSignIn(() async {
      await _ref.read(signInWithAppleUseCaseProvider).call();
    });
  }

  Future<void> _runSignIn(Future<void> Function() action) async {
    if (state.isLoading) return;

    _startLoading();
    try {
      await action();
      _finishWithCurrentSession();
    } catch (error) {
      _setError(error);
    }
  }

  void _startLoading() {
    state = state.copyWith(
      isLoading: true,
      isSignedIn: false,
      clearError: true,
    );
  }

  void _finishWithCurrentSession() {
    state = state.copyWith(
      isLoading: false,
      isSignedIn: _authClient.currentSession != null,
    );
  }

  void _markSignedIn() {
    state = state.copyWith(
      isLoading: false,
      isSignedIn: true,
      clearError: true,
    );
  }

  void _setError(Object error) {
    state = state.copyWith(
      isLoading: false,
      errorMessage: '${AppMessages.signInFailedPrefix}$error',
    );
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
