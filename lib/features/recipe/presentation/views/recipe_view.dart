import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasty/core/utils/app_services.dart';
import 'package:tasty/features/recipe/data/models/recipe_model.dart';
import 'package:tasty/features/recipe/presentation/views/widgets/recipe_body.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key, required this.id});

  final String id;

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late Future<RecipeModel> request;

  @override
  void initState() {
    request = AppServices.fetchRecipe(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<RecipeModel>(
        future: request,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text('Enable to fetch recipe'),
              ),
            );
          } else {
            return Skeletonizer(
              enabled: snapshot.connectionState == ConnectionState.waiting,
              child: RecipeBody(recipe: snapshot.data ?? RecipeModel.empty()),
            );
          }
        },
      ),
    );
  }
}
