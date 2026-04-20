import 'dart:async';

import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/network/supabase/supabase_providers.dart';

class MainState {
  final String? profileImageUrl;

  const MainState({this.profileImageUrl});

  const MainState.init() : this(profileImageUrl: null);
}

final mainViewModelProvider =
    StateNotifierProvider.autoDispose<MainViewModel, MainState>((ref) {
      return MainViewModel(ref.watch(supabaseAuthProvider));
    });

class MainViewModel extends StateNotifier<MainState> {
  final GoTrueClient _authClient;
  StreamSubscription<AuthState>? _authSubscription;

  MainViewModel(this._authClient) : super(const MainState.init()) {
    _syncUserProfileImage();
    _authSubscription = _authClient.onAuthStateChange.listen((_) {
      _syncUserProfileImage();
    });
  }

  void _syncUserProfileImage() {
    final user = _authClient.currentUser;
    final metadata = user?.userMetadata ?? const <String, dynamic>{};
    "metaData $metadata".logI();
    final imageUrl =
        (metadata['avatar_url'] as String?)?.trim().isNotEmpty == true
        ? (metadata['avatar_url'] as String).trim()
        : (metadata['picture'] as String?)?.trim();

    state = MainState(
      profileImageUrl: imageUrl?.isEmpty == true ? null : imageUrl,
    );
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
