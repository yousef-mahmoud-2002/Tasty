import 'package:flutter/material.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/recipe/data/models/ingredient_model.dart';

class IngredientsTab extends StatelessWidget {
  const IngredientsTab({super.key, required this.ingredients});

  final List<IngredientModel> ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: kPrimaryColor, width: 0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 6,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: ingredients.length,
        padding: const EdgeInsets.all(24),
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.black45, height: 48);
        },
        itemBuilder: (BuildContext context, int index) {
          return buildIngredient(ingredients[index], index);
        },
      ),
    );
  }

  Widget buildIngredient(IngredientModel ingredient, int index) {
    return Row(
      spacing: 12,
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor: stepColors[index % stepColors.length],
        ),
        Expanded(
          child: Text(
            ingredient.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Text(ingredient.quantity, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
