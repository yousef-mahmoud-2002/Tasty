import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tasty/features/categories/presentation/views/categories_view.dart';
import 'package:tasty/features/home/presentation/views/widgets/home_header.dart';
import 'package:tasty/features/home/presentation/views/widgets/meals_search_bar.dart';
import 'package:tasty/features/random_recipe/presentation/views/random_recipe.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            spacing: 24,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(),
                    MealsSearchBar(),
                  ],
                ).animate().slideX(
                    duration: const Duration(milliseconds: 800), begin: -5),
              ),
              const CategoriesView(),
              const Expanded(child: RandomRecipe()),
            ],
          ),
        ),
      ),
    );
  }
}
