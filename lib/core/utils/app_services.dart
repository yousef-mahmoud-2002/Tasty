import 'package:dio/dio.dart';
import 'package:tasty/features/categories/data/models/meal_model.dart';
import 'package:tasty/features/recipe/data/models/recipe_model.dart';

class AppServices {
  static const baseUrl = 'https://www.themealdb.com/api/json/v1/1';
  static final Dio dio = Dio();

  static Future<Response<dynamic>> get(String path) async {
    try {
      final response = await dio.get('$baseUrl/$path');
      if (response.statusCode == 200) return response;
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Server error: ${response.statusCode}',
        type: DioExceptionType.badResponse,
      );
    } on DioException {
      rethrow;
    }
  }

  static String getQueryParam(String listType) {
    switch (listType) {
      case 'Category':
        return 'c';
      case 'Area':
        return 'a';
      default:
        return 'i';
    }
  }

  static String getJsonKey(String listType) {
    switch (listType) {
      case 'Category':
        return 'strCategory';
      case 'Area':
        return 'strArea';
      default:
        return 'strIngredient';
    }
  }

  static Future<List<String>> fetchList(String listType) async {
    final queryParam = getQueryParam(listType);
    final jsonKey = getJsonKey(listType);
    final response = await get('list.php?$queryParam=list');
    final meals = response.data['meals'] as List<dynamic>;
    return meals.map((category) => category[jsonKey] as String).toList();
  }

  static Future<List<MealModel>> fetchMeals(listType, categoryName) async {
    final queryParam = getQueryParam(listType);
    final response = await get('filter.php?$queryParam=$categoryName');
    final meals = response.data['meals'] as List<dynamic>;
    return meals.map((meal) => MealModel.fromJson(meal)).toList();
  }

  static Future<MealModel> fetchRandomMeal() async {
    final response = await get('random.php');
    final meals = response.data['meals'] as List<dynamic>;
    return MealModel.fromJson(meals.first);
  }

  static Future<RecipeModel> fetchRecipe(String id) async {
    final response = await get('lookup.php?i=$id');
    final recipes = response.data['meals'] as List<dynamic>;
    return RecipeModel.fromJson(recipes.first);
  }

  static Future<List<RecipeModel>> searchRecipes(String query) async {
    final response = await get('search.php?s=$query');
    final recipes = response.data['meals'] as List<dynamic>;
    return recipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
  }
}
