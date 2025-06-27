part of 'meals_cubit.dart';

@immutable
sealed class MealsState {}

final class InitialMeals extends MealsState {}

final class LoadingMeals extends MealsState {}

final class SuccessMeals extends MealsState {}

final class FailureMeals extends MealsState {}
