part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class LoadingCategories extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {}

final class CategoriesFailure extends CategoriesState {}
