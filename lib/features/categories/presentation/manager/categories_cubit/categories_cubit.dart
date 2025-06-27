import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty/core/utils/app_services.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  List<String> categoriesList = [];
  String filterType = 'Category';

  void fetchCategories(String listType) async {
    try {
      emit(LoadingCategories());
      categoriesList = await AppServices.fetchList(listType);
      emit(CategoriesSuccess());
    } on Exception {
      emit(CategoriesFailure());
    }
  }
}
