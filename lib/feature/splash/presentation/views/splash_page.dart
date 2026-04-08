import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          context.go(PAGES.intro.screenPath);
        },
        child: Center(child: Text("splash")),
      ),
    );
  }
}
