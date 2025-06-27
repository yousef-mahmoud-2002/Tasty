import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty/core/utils/app_services.dart';
import 'package:tasty/features/categories/data/models/meal_model.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit() : super(InitialMeals());

  List<MealModel> meals = [];

  void fetchMeals(String listType, String categoryName) async {
    try {
      emit(LoadingMeals());
      meals = await AppServices.fetchMeals(listType, categoryName);
      emit(SuccessMeals());
    } on Exception {
      emit(FailureMeals());
    }
  }
}
