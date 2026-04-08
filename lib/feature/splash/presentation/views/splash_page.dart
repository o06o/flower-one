import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      context.go(PAGES.signIn.screenPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("splash")),
    );
  }
}
