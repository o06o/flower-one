import 'package:cached_network_image/cached_network_image.dart';
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

    return CachedNetworkImage(
      imageUrl: url,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => EmptyFlowerImage(),
    );
  }
}
