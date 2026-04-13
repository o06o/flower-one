import 'package:flowerone/core/resource/gen/colors.gen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resource/gen/assets.gen.dart';

class FlowerImage extends StatelessWidget {
  final String? imageUrl;

  const FlowerImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim();
    if (url == null || url.isEmpty) {
      return _fallback();
    }

    return Image.network(
      url,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      errorBuilder: (_, __, ___) => _fallback(),
    );
  }

  Widget _fallback() {
    return ColoredBox(
      color: ColorName.backgroundLightBlue,
      child: Center(
        child: Assets.icons.floweroneLogo.image(
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
