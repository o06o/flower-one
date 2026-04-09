import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/designsystem/dialog/progress_dialog.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(
      () => ref.read(splashViewModelProvider.notifier).resolveInitialRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SplashState>(splashViewModelProvider, (previous, next) {
      final nextPath = next.nextPath;
      if (nextPath == null) return;
      if (previous?.nextPath == nextPath) return;
      if (!mounted) return;

      context.go(nextPath);
    });

    return const Material(child: Center(child: LottieProgressWidget()));
  }
}
