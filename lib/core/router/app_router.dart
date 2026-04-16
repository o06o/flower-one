import 'package:flowerone/core/router/pages.dart';
import 'package:flowerone/feature/garden/presentation/views/garden_page.dart';
import 'package:flowerone/feature/letter/presentation/views/letter_page.dart';
import 'package:flowerone/feature/map/presentation/views/map_page.dart';
import 'package:flowerone/feature/recommend/presentation/views/recommend_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/presentation/views/home_page.dart';
import '../../feature/intro/presentation/views/intro_page.dart';
import '../../feature/main/presentation/navigator/scaffold_with_nested_navigation.dart';
import '../../feature/signin/presentation/views/signin_page.dart';
import '../../feature/splash/presentation/views/splash_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: PAGES.splash.screenPath,
  requestFocus: false,
  redirect: (context, state) {
    // final uri = state.uri;
    //
    // final inviteCode = uri.queryParameters["code"];
    // final clientToken = uri.queryParameters["clientToken"];
    //
    // if(inviteCode?.isNotEmpty == true || clientToken?.isNotEmpty == true) {
    //   return Uri(
    //     path: PAGES.splash.screenPath,
    //     queryParameters: {
    //       if (inviteCode != null) "code": inviteCode,
    //       if (clientToken != null) "clientToken": clientToken,
    //     },
    //   ).toString();
    // } else if (uri.path.contains('/__/auth/callback')) {
    //   return null; // 이 경로는 그대로 통과
    // } else {
      return null;
    // }
  },
  routes: [
    GoRoute(
      name: PAGES.splash.screenName,
      path: PAGES.splash.screenPath,
      pageBuilder: (context, state) => FadeTransitionPage(
        key: state.pageKey,
        child: SplashPage(),
      ),
    ),
    GoRoute(
      name: PAGES.intro.screenName,
      path: PAGES.intro.screenPath,
      pageBuilder: (context, state) => FadeTransitionPage(
        key: state.pageKey,
        duration: const Duration(milliseconds: 700),
        child: const IntroPage(),
      ),
    ),
    GoRoute(
      name: PAGES.signIn.screenName,
      path: PAGES.signIn.screenPath,
      pageBuilder: (context, state) => FadeTransitionPage(
        key: state.pageKey,
        duration: const Duration(milliseconds: 700),
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      name: PAGES.letter.screenName,
      path: PAGES.letter.screenPath,
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: LetterPage(),
        );
      },
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNestedNavigation(
            navigationShell: child,
            currentIndex: switch (state.uri.path) {
              "/map" => 0,
              "/home" => 1,
              "/garden" => 2,
              _ => 1,
            }
        );
      },
      routes: [
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          name: PAGES.map.screenName,
          path: PAGES.map.screenPath,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const MapPage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          name: PAGES.home.screenName,
          path: PAGES.home.screenPath,
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                key: state.pageKey,
                child: HomePage(),
              );
          }),
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          name: PAGES.garden.screenName,
          path: PAGES.garden.screenPath,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const GardenPage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          name: PAGES.recommend.screenName,
          path: PAGES.recommend.screenPath,
          pageBuilder: (context, state) {
            final extra = state.extra;
            final userMessage = extra is String ? extra : '';

            return FadeTransitionPage(
              key: state.pageKey,
              child: RecommendPage(userMessage: userMessage),
            );
          },
        ),
      ],
    ),
  ],
);

class FadeTransitionPage extends CustomTransitionPage<void> {
  final Duration duration;

  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
    this.duration = const Duration(milliseconds: 200),
  }) : super(
            transitionDuration: duration,
            transitionsBuilder: (c, animation, a2, child) => FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ));

  static final _curveTween = CurveTween(curve: Curves.easeInExpo);
}

class SlideTransitionPage extends CustomTransitionPage<void> {
  final Duration duration;
  final Tween<Offset> tween;

  SlideTransitionPage({
    required LocalKey super.key,
    required super.child,
    this.duration = const Duration(milliseconds: 150),
    required this.tween,
  }) : super(
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                tween.chain(
                  CurveTween(curve: Curves.linear),
                ),
              ),
              child: child,
            );
          },
        );
}
