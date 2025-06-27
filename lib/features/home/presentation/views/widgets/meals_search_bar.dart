import 'package:flutter/material.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/search/presentation/views/recipe_search_view.dart';

class MealsSearchBar extends StatelessWidget {
  const MealsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const RecipeSearchView();
        }));
      },
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor,
          contentPadding: EdgeInsets.zero,
          hintText: 'Discover recipes by name, ingredient, etc.',
          prefixIcon: const Icon(Icons.search, color: kPrimaryColor),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0.5,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
