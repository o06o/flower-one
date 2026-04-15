import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../resource/gen/assets.gen.dart';

class HeartButton extends StatefulWidget {
  final Size size;
  final Function() onTap;
  final bool isSelected;
  /// Lottie 원본에 투명 여백(캔버스)이 큰 경우, 시각적으로 더 크게 보이도록 확대 배율을 줍니다.
  /// 예: 1.0(기본), 1.2, 1.4 ...
  final double scale;

  const HeartButton({
    super.key,
    required this.size,
    required this.onTap,
    required this.isSelected,
    this.scale = 2.4,
  });

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Duration? _compositionDuration;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(covariant HeartButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      _animateToSelected(widget.isSelected);
    }
  }

  void _animateToSelected(bool selected) {
    if (_compositionDuration == null) {
      // Composition not loaded yet; we'll snap in onLoaded.
      return;
    }
    if (selected) {
      _controller.animateTo(1.0, duration: _compositionDuration, curve: Curves.easeOut);
    } else {
      _controller.animateBack(0.0, duration: _compositionDuration, curve: Curves.easeOut);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Optimistically animate immediately; parent state update will confirm/correct.
        _animateToSelected(!widget.isSelected);
        widget.onTap();
      },
      child: Transform.scale(
        scale: widget.scale,
        child: Lottie.asset(
          Assets.lotties.lottieHeart,
          controller: _controller,
          width: widget.size.width,
          height: widget.size.height,
          fit: BoxFit.contain,
          onLoaded: (composition) {
            _compositionDuration = composition.duration;
            _controller.duration = composition.duration;
            // Snap to correct edge on first load (no animation).
            _controller.value = widget.isSelected ? 1.0 : 0.0;
          },
        ),
      ),
    );
  }
}
