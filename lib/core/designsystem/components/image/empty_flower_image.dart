import 'package:flutter/material.dart';

import '../../../resource/gen/assets.gen.dart';
import '../../../resource/gen/colors.gen.dart';

class EmptyFlowerImage extends StatelessWidget {
  const EmptyFlowerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorName.white,
      child: Center(
        child: Assets.icons.floweroneLogo.image(
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}


