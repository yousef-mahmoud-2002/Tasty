import 'package:flutter/material.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/random_recipe/presentation/views/widgets/random_recipe_button.dart';

class RandomRecipe extends StatefulWidget {
  const RandomRecipe({super.key});

  @override
  RandomRecipeState createState() => RandomRecipeState();
}

class RandomRecipeState extends State<RandomRecipe> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      elevation: 20,
      color: kSecondaryColor,
      clipBehavior: Clip.hardEdge,
      shadowColor: kPrimaryColor,
      shape: CircleBorder(
        side: BorderSide(
          color: kPrimaryColor,
        ),
      ),
      child: RandomRecipeButton(),
    );
  }
}
