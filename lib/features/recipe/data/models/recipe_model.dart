import 'package:tasty/features/recipe/data/models/ingredient_model.dart';

class RecipeModel {
  final String id;
  final String name;
  final String category;
  final String area;
  final List<String> instructions;
  final String imageUrl;
  final String youtubeLink;
  final List<IngredientModel> ingredients;

  RecipeModel({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageUrl,
    required this.youtubeLink,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(json) {
    return RecipeModel(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: makeSteps(json['strInstructions']),
      imageUrl: json['strMealThumb'],
      youtubeLink: json['strYoutube'],
      ingredients: getIngredients(json),
    );
  }

  factory RecipeModel.empty() {
    return RecipeModel(
      id: '',
      name: '',
      category: '',
      area: '',
      instructions: [],
      imageUrl: '',
      youtubeLink: '',
      ingredients: [],
    );
  }
}

List<IngredientModel> getIngredients(dynamic json) {
  final List<IngredientModel> ingredients = [];

  for (int i = 1; i <= 20; i++) {
    final rawName = json['strIngredient$i'];
    final rawMeasure = json['strMeasure$i'];

    if (rawName != null && rawName.toString().isNotEmpty) {
      ingredients.add(
        IngredientModel(
          name: rawName.toString(),
          quantity: (rawMeasure ?? '').toString(),
        ),
      );
    }
  }

  return ingredients;
}

List<String> makeSteps(String instructions) {
  return instructions
      .split(RegExp(r'(?<=[.?!])\s+(?=[A-Z])'))
      .map((step) => step.trim())
      .where((step) => step.isNotEmpty)
      .toList();
}
