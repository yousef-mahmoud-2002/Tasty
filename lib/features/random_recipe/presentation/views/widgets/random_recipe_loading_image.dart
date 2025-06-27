import 'package:flutter/material.dart';

class RandomRecipeLoadingImage extends StatelessWidget {
  const RandomRecipeLoadingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/rendom_recipe_loading.png',
    );
  }
}
