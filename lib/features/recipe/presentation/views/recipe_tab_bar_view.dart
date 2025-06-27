import 'package:flutter/material.dart';
import 'package:tasty/features/recipe/data/models/recipe_model.dart';
import 'package:tasty/features/recipe/presentation/views/widgets/briefly_tab.dart';
import 'package:tasty/features/recipe/presentation/views/widgets/ingredients_tab.dart';
import 'package:tasty/features/recipe/presentation/views/widgets/lets_cook_tab.dart';
import 'package:tasty/features/recipe/presentation/views/widgets/recipe_tab_bar.dart';

class RecipeTabBarView extends StatefulWidget {
  const RecipeTabBarView({super.key, required this.recipe});

  final RecipeModel recipe;

  @override
  State<RecipeTabBarView> createState() => _RecipeTabBarViewState();
}

class _RecipeTabBarViewState extends State<RecipeTabBarView> {
  int selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> recipeTabBody = [
      IngredientsTab(ingredients: widget.recipe.ingredients),
      BrieflyTab(recipe: widget.recipe),
      LetsCookTab(recipe: widget.recipe),
    ];
    return DefaultTabController(
      length: 3,
      initialIndex: selectedTab,
      child: Column(
        children: [
          RecipeTabBar(
            onTap: (index) {
              if (selectedTab != index) {
                setState(() => selectedTab = index);
              }
            },
          ),
          recipeTabBody[selectedTab],
        ],
      ),
    );
  }
}
