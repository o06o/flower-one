import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/network/supabase/supabase_providers.dart';
import '../../../../core/storage/pref/provider/preference_storage_provider.dart';
import '../../domain/provider/settings_providers.dart';

class SettingsState {
  final bool isLoading;
  final bool isSignedOut;
  final String userName;
  final String userEmail;
  final String? profileImageUrl;
  final bool isPushNotificationEnabled;
  final String appVersion;
  final String? errorMessage;

  const SettingsState({
    required this.isLoading,
    required this.isSignedOut,
    required this.userName,
    required this.userEmail,
    required this.profileImageUrl,
    required this.isPushNotificationEnabled,
    required this.appVersion,
    this.errorMessage,
  });

  const SettingsState.init({
    String userName = '',
    String userEmail = '',
    String? profileImageUrl,
    bool isPushNotificationEnabled = true,
    String appVersion = '',
  }) : this(
         isLoading: false,
         isSignedOut: false,
         userName: userName,
         userEmail: userEmail,
         profileImageUrl: profileImageUrl,
         isPushNotificationEnabled: isPushNotificationEnabled,
         appVersion: appVersion,
         errorMessage: null,
       );

  SettingsState copyWith({
    bool? isLoading,
    bool? isSignedOut,
    String? userName,
    String? userEmail,
    String? profileImageUrl,
    bool? isPushNotificationEnabled,
    String? appVersion,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      isSignedOut: isSignedOut ?? this.isSignedOut,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isPushNotificationEnabled:
          isPushNotificationEnabled ?? this.isPushNotificationEnabled,
      appVersion: appVersion ?? this.appVersion,
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

  SettingsViewModel(this._ref)
    : super(
        SettingsState.init(
          userName: _extractUserName(
            _ref.read(supabaseAuthProvider).currentUser,
          ),
          userEmail:
              _ref.read(supabaseAuthProvider).currentUser?.email?.trim() ?? '',
          profileImageUrl: _extractProfileImageUrl(
            _ref.read(supabaseAuthProvider).currentUser,
          ),
        ),
      ) {
    _loadPushNotificationSetting();
    _loadAppVersion();
  }

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

  Future<void> withdrawMembership() async {
    state = state.copyWith(errorMessage: '회원탈퇴 기능은 준비 중입니다.');
  }

  Future<void> togglePushNotification(bool enabled) async {
    final previous = state.isPushNotificationEnabled;
    state = state.copyWith(
      isPushNotificationEnabled: enabled,
      clearError: true,
    );

    try {
      await _ref
          .read(preferenceStorageDataSourceProvider)
          .setPushNotificationEnabled(enabled);
    } catch (error) {
      state = state.copyWith(
        isPushNotificationEnabled: previous,
        errorMessage: error.toString(),
      );
    }
  }

  static String _extractUserName(User? user) {
    if (user == null) return '';
    final metadata = user.userMetadata ?? const <String, dynamic>{};
    final candidates = [
      metadata['name'],
      metadata['full_name'],
      metadata['nickname'],
      user.email?.split('@').first,
    ];

    for (final value in candidates) {
      if (value is String && value.trim().isNotEmpty) return value.trim();
    }
    return '';
  }

  static String? _extractProfileImageUrl(User? user) {
    if (user == null) return null;
    final metadata = user.userMetadata ?? const <String, dynamic>{};

    String? readUrl(String key) {
      final value = metadata[key];
      if (value is String && value.trim().isNotEmpty) {
        return value.trim();
      }
      return null;
    }

    return readUrl('avatar_url') ?? readUrl('picture');
  }

  Future<void> _loadAppVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      state = state.copyWith(appVersion: '${info.version}+${info.buildNumber}');
    } catch (_) {
      state = state.copyWith(appVersion: '');
    }
  }

  void _loadPushNotificationSetting() {
    final saved = _ref
        .read(preferenceStorageDataSourceProvider)
        .getPushNotificationEnabled();
    state = state.copyWith(isPushNotificationEnabled: saved ?? true);
  }
}
