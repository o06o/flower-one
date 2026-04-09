import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/pages.dart';
import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/resource/gen/assets.gen.dart';
import '../../../../core/utils/hero_tags.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Timer? _redirectTimer;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      if (!mounted) return;
      FlutterNativeSplash.remove();
    });

    _redirectTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.go(PAGES.signIn.screenPath);
    });

  }

  @override
  void dispose() {
    _redirectTimer?.cancel();
    super.dispose();
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
              width: 240,
              height: 240,
            ),
          ),
          Transform.translate(
            offset: Offset(0, -32),
            child: Text(
              "당신이 기억하고 싶은\n오늘의 꽃 한 송이",
              style: context.textTheme.headline2RegularHakgyoMulti,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
