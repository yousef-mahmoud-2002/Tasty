import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty/core/utils/app_services.dart';
import 'package:tasty/features/categories/data/models/meal_model.dart';

part 'random_recipe_state.dart';

class RandomRecipeCubit extends Cubit<RandomRecipeState> {
  RandomRecipeCubit() : super(RandomRecipeInitial());

  late MealModel randomRecipe;

  void getRandomRecipe() async {
    try {
      emit(RandomRecipeLoading());
      randomRecipe = await AppServices.fetchRandomMeal();
      emit(RandomRecipeSuccess());
    } on Exception {
      emit(RandomRecipeFailure());
    }
  }
}
