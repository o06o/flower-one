import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flutter/material.dart';

class FlowerImage extends StatelessWidget {
  final String? imageUrl;

  const FlowerImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim();
    if (url == null || url.isEmpty) {
      return EmptyFlowerImage();
    }

    return Image.network(
      url,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      errorBuilder: (_, _, _) => EmptyFlowerImage(),
    );
  }
}
