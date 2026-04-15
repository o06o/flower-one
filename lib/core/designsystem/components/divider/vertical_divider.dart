import 'package:flutter/material.dart';

import '../../../resource/gen/colors.gen.dart';

class ColorVerticalDivider extends StatelessWidget {
  final double height;
  final double? width;
  final double? thickness;
  final BorderRadiusGeometry? radius;
  final Color? color;

  const ColorVerticalDivider({
    super.key,
    this.height = double.infinity,
    this.width = 25,
    this.color = ColorName.lineBox,
    this.thickness = 1,
    this.radius = BorderRadiusGeometry.zero,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(thickness: thickness, width: width, color: color, radius: radius,);
  }
}
