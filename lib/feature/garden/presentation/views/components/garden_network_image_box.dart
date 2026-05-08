import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/material.dart';

class GardenNetworkImageBox extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;

  const GardenNetworkImageBox({
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final imageUrl = url?.trim();
    if (imageUrl == null || imageUrl.isEmpty) {
      return _fallback(colorScheme, width, height);
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, _) => _fallback(colorScheme, width, height),
      errorWidget: (_, _, _) => _fallback(colorScheme, width, height),
    );
  }

  Widget _fallback(
    FlowerColorScheme colorScheme,
    double? width,
    double? height,
  ) {
    return Container(
      width: width,
      height: height,
      color: colorScheme.primary.withAlpha(18),
      alignment: Alignment.center,
      child: Icon(Icons.local_florist_rounded, color: colorScheme.primary),
    );
  }
}
