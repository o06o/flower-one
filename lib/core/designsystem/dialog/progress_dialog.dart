import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../resource/gen/assets.gen.dart';

class LottieProgressDialog {
  static OverlayEntry? _overlayEntry;

  static void show({
    required BuildContext context,
  }) {
    if (_overlayEntry != null) {
      return; // 이미 표시 중이면 무시
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black54,
        child: Center(
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: LottieProgressWidget(),
          ),
        ),
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  static void hide() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}

class LottieProgressWidget extends StatelessWidget {
  const LottieProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        Assets.lotties.indicatorFlower,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }
}
