import 'package:flutter/material.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/recipe/data/models/recipe_model.dart';
import 'package:tasty/features/recipe/presentation/views/recipe_tab_bar_view.dart';
import 'package:tasty/features/recipe/presentation/views/widgets/recipe_image.dart';

class RecipeBody extends StatelessWidget {
  const RecipeBody({super.key, required this.recipe});

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          leadingWidth: 75,
          toolbarHeight: 45,
          automaticallyImplyLeading: false,
          backgroundColor: kSecondaryColor,
          leading: const CircleAvatar(child: BackButton()),
          expandedHeight: MediaQuery.sizeOf(context).width -
              MediaQuery.paddingOf(context).top,
          flexibleSpace: FlexibleSpaceBar(
            background: RecipeImage(
              imageUrl: recipe.imageUrl,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: RecipeTabBarView(recipe: recipe),
        ),
      ],
    );
  }
}
