import 'package:flutter/material.dart';
import 'package:tasty/features/recipe/data/models/recipe_model.dart';
import 'package:tasty/features/search/presentation/views/widgets/recipe_search_item.dart';

class RecipeSearchList extends StatelessWidget {
  const RecipeSearchList({super.key, this.future});

  final Future<List<RecipeModel>>? future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecipeModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final recipes = snapshot.data ?? [];

        if (recipes.isEmpty) {
          return Center(
            child: Text(
              'No recipes found for your search',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }
        return ListView.builder(
          itemCount: recipes.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            return RecipeSearchItem(recipe: recipes[index]);
          },
        );
      },
    );
  }
}
