import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/router/pages.dart';
import '../../../../libraries/google/widget/google_sign_in_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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

      await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      if (!mounted) return;
      context.go(PAGES.home.screenPath);
    } catch (error) {
      _showFailToast('로그인 실패: $error');
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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: GoogleSignInWidget(
              onSuccess: _signInToSupabase,
              onFailed: () => _showFailToast('구글 로그인에 실패했어요.'),
            ),
          ),
        ),
      ),
    );
  }
}
