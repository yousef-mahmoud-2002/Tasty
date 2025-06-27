import 'package:flutter/material.dart';
import 'package:tasty/core/utils/app_services.dart';
import 'package:tasty/features/recipe/data/models/recipe_model.dart';
import 'package:tasty/features/search/presentation/views/widgets/recipe_search_bar.dart';
import 'package:tasty/features/search/presentation/views/widgets/recipe_search_list.dart';

class RecipeSearchView extends StatefulWidget {
  const RecipeSearchView({super.key});

  @override
  State<RecipeSearchView> createState() => _RecipeSearchViewState();
}

class _RecipeSearchViewState extends State<RecipeSearchView> {
  final TextEditingController controller = TextEditingController();
  Future<List<RecipeModel>>? searchResults;

  void search(String query) {
    if (query.trim().isNotEmpty) {
      setState(() {
        searchResults = AppServices.searchRecipes(query.trim());
      });
    } else {
      clearSearch();
    }
  }

  void clearSearch() {
    setState(() {
      searchResults = null;
      controller.clear();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RecipeSearchBar(
          onChanged: search,
          controller: controller,
        ),
      ),
      body: searchResults == null
          ? Center(
              child: Text(
                'Start searching for a recipe...',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : RecipeSearchList(future: searchResults!),
    );
  }
}
