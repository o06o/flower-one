import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/resource/gen/assets.gen.dart';
import '../../../../core/router/pages.dart';
import '../../../../core/utils/hero_tags.dart';
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
    return DefaultContainer(
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
            "꽃 한 송이로\n말로 전하기 어려운 마음\n전해보세요",
            style: context.textTheme.headline2RegularHakgyoMulti,
            textAlign: TextAlign.center,
          ),
          SpacingVertical64(),
          GoogleSignInWidget(
            onSuccess: _signInToSupabase,
            onFailed: () => _showFailToast('애플 로그인에 실패했어요.'),
          ),
          SpacingVertical16(),
          GoogleSignInWidget(
            onSuccess: _signInToSupabase,
            onFailed: () => _showFailToast('구글 로그인에 실패했어요.'),
          ),
          SpacingVertical48(),
        ],
      ),
    );
  }
}
