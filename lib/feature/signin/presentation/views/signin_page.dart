import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/resource/gen/assets.gen.dart';
import '../../../../core/router/pages.dart';
import '../../../../core/utils/hero_tags.dart';
import '../../../../libraries/apple/widget/sign_in_with_apple_button.dart';
import '../../../../libraries/google/widget/google_sign_in_widget.dart';
import '../viewmodel/signin_view_model.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  void _showFailToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMessage = GoRouterState.of(
      context,
    ).uri.queryParameters['error_message'];

    if (errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('로그인 실패: $errorMessage')));
      });
    }

    final state = ref.watch(signInViewModelProvider);
    final viewModel = ref.read(signInViewModelProvider.notifier);

    ref.listen<SignInState>(signInViewModelProvider, (previous, next) {
      if (!(previous?.isSignedIn ?? false) && next.isSignedIn) {
        context.go(PAGES.home.screenPath);
      }

      final previousError = previous?.errorMessage;
      if (next.errorMessage != null && next.errorMessage != previousError) {
        _showFailToast(next.errorMessage!);
      }
    });

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
            onSuccess: (idToken, accessToken, _) => viewModel.signInWithGoogle(
              idToken: idToken,
              accessToken: accessToken,
            ),
            onFailed: () => _showFailToast(AppMessages.signInGoogleFailed),
          ),
          SpacingVertical16(),
          SignInWithAppleButton(
            width: 230,
            height: 44,
            backgroundColor: context.colorScheme.black,
            fontColor: context.colorScheme.white,
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            onPressed: state.isLoading ? null : viewModel.signInWithApple,
          ),
          SpacingVertical48(),
        ],
      ),
    );
  }
}
