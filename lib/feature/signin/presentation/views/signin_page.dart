import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart'
    hide SignInWithAppleButton;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/network/supabase/supabase_providers.dart';
import '../../../../core/resource/gen/assets.gen.dart';
import '../../../../core/router/pages.dart';
import '../../../../core/utils/hero_tags.dart';
import '../../../../libraries/apple/widget/sign_in_with_apple_button.dart';
import '../../../../libraries/google/widget/google_sign_in_widget.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  bool _isLoading = false;

  Future<void> _signInToSupabase(
    String idToken,
    String accessToken,
    String? serverAuthCode,
  ) async {
    if (_isLoading) return;

    setState(() => _isLoading = true);
    try {
      "result => access : $accessToken // idToken $idToken // server $serverAuthCode"
          .logI();

      await ref
          .read(supabaseAuthProvider)
          .signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: idToken,
            accessToken: accessToken,
          );
      if (!mounted) return;
      context.go(PAGES.home.screenPath);
    } catch (error) {
      _showFailToast('${AppMessages.signInFailedPrefix}$error');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showFailToast(String message) {
    message.logE();
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  Future<void> _signInWithApple() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);
    try {
      final rawNonce = _generateNonce();
      final hashedNonce = _sha256OfString(rawNonce);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
      );

      final idToken = credential.identityToken;
      if (idToken == null || idToken.isEmpty) {
        throw Exception('Apple idToken is missing.');
      }

      await ref
          .read(supabaseAuthProvider)
          .signInWithIdToken(
            provider: OAuthProvider.apple,
            idToken: idToken,
            nonce: rawNonce,
          );

      if (!mounted) return;
      context.go(PAGES.home.screenPath);
    } catch (error) {
      _showFailToast('${AppMessages.signInFailedPrefix}$error');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String _generateNonce([int length = 32]) {
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
  }

  String _sha256OfString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      color: context.colorScheme.neutral,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: HeroTags.introToSignInLogo,
            child: Image.asset(
              Assets.icons.floweroneLogoFilled.keyName,
              width: 146,
              height: 146,
            ),
          ),
          Text(
            AppMessages.signInMessage,
            style: context.textTheme.headline2RegularHakgyoMulti,
            textAlign: TextAlign.center,
          ),
          SpacingVertical64(),
          GoogleSignInWidget(
            width: 230,
            height: 42,
            onSuccess: _signInToSupabase,
            onFailed: () => _showFailToast(AppMessages.signInGoogleFailed),
          ),
          SpacingVertical16(),
          SignInWithAppleButton(
            width: 230,
            height: 44,
            backgroundColor: context.colorScheme.black,
            fontColor: context.colorScheme.white,
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            onPressed: _isLoading ? null : _signInWithApple,
          ),
          SpacingVertical48(),
        ],
      ),
    );
  }
}
