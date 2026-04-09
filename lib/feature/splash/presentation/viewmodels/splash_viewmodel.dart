import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/router/pages.dart';

class SplashState {
  final bool isLoading;
  final String? nextPath;

  const SplashState({required this.isLoading, this.nextPath});

  const SplashState.loading() : this(isLoading: true);

  const SplashState.routed(String path)
    : this(isLoading: false, nextPath: path);
}

final splashViewModelProvider =
    StateNotifierProvider.autoDispose<SplashViewModel, SplashState>((ref) {
      return SplashViewModel(Supabase.instance.client.auth);
    });

class SplashViewModel extends StateNotifier<SplashState> {
  final GoTrueClient _authClient;
  bool _isResolved = false;

  SplashViewModel(this._authClient) : super(const SplashState.loading());

  Future<void> resolveInitialRoute() async {
    if (_isResolved) return;
    _isResolved = true;

    await Future<void>.delayed(const Duration(milliseconds: 700));

    final session = _authClient.currentSession;
    state = SplashState.routed(
      session == null ? PAGES.intro.screenPath : PAGES.home.screenPath,
    );
  }
}
