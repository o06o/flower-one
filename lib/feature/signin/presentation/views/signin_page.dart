import 'dart:io';

import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/router/pages.dart';
import '../../../../libraries/google/google_client.dart';
import '../../../../libraries/google/widget/widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  Future<void> _signInToSupabase(GoogleSignInResult? result) async {
    if (_isLoading) return;
    if (result == null) {
      _showFailToast('구글 로그인에 실패했어요.');
      return;
    }

    setState(() => _isLoading = true);
    try {
      "result => access : ${result.accessToken} // idToken ${result.idToken} // server ${result.serverAuthCode}".logI();

      await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: result.idToken,
        accessToken: result.accessToken,
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
                googleSignClient: googleSignClient,
                onResult: _signInToSupabase,
            ),
          ),
        ),
      ),
    );
  }
}

final googleSignClient = GoogleSignClient(
  clientId: Platform.isIOS
      ? "474280061655-res7187agncqlqsn2m996dh25phugthg.apps.googleusercontent.com"
      : "391071227179-2f3rede6apfj3dlnljs5hjum35envmkf.apps.googleusercontent.com",
  serverClientId:
  "391071227179-r81ebh8bjnjl7ipviot8karfgo392f7i.apps.googleusercontent.com",
  scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
);