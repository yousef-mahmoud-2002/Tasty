import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tasty/features/categories/presentation/views/widgets/categories_header.dart';
import 'package:tasty/features/categories/presentation/views/widgets/meals_list.dart';
import 'package:tasty/features/categories/presentation/views/widgets/categories_tab_bar.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const CategoriesHeader(),
        const CategoriesTabBar()
            .animate()
            .slideX(duration: const Duration(milliseconds: 800), begin: 5),
        const MealsList()
            .animate()
            .slideX(duration: const Duration(milliseconds: 800), begin: 5),
      ],
    );
  }
}
