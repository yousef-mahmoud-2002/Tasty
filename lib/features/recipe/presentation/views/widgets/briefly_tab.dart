import 'package:flutter/material.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/recipe/data/models/recipe_model.dart';

class BrieflyTab extends StatelessWidget {
  const BrieflyTab({super.key, required this.recipe});

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            recipe.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              Text(
                recipe.area,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                recipe.category,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(
              color: kPrimaryColor, height: 0, indent: 40, endIndent: 40),
          ListView.separated(
            shrinkWrap: true,
            itemCount: recipe.instructions.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (BuildContext context, int index) {
              return instruction(index + 1, recipe.instructions[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          ),
        ],
      ),
    );
  }

  Widget instruction(int stepNumber, String instruction) {
    return Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: stepColors[(stepNumber - 1) % stepColors.length],
          child: Text(
            '$stepNumber',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            instruction,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
