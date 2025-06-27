import 'package:flutter/material.dart';

class RandomRecipeImage extends StatelessWidget {
  const RandomRecipeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/random_recipe.png',
    );
  }
}
