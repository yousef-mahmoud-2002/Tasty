import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tasty/core/widgets/error_image.dart';
import 'package:tasty/core/widgets/image_placeholder.dart';

class MealImage extends StatelessWidget {
  const MealImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: CachedNetworkImage(
        scale: 1,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) {
          return placeholder();
        },
        errorWidget: (context, url, error) {
          return errorImage();
        },
      ),
    );
  }
}
