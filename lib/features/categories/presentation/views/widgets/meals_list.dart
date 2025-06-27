import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasty/features/categories/data/models/meal_model.dart';
import 'package:tasty/features/categories/presentation/manager/meals_cubit/meals_cubit.dart';
import 'package:tasty/features/categories/presentation/views/widgets/meal.dart';

class MealsList extends StatelessWidget {
  const MealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: BlocBuilder<MealsCubit, MealsState>(
        builder: (context, state) {
          List<MealModel> meals = BlocProvider.of<MealsCubit>(context).meals;

          if (state is FailureMeals) {
            return Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text('Enable to fetch meals'),
              ),
            );
          } else {
            return Skeletonizer(
              enabled: state is LoadingMeals,
              child: ListView.separated(
                clipBehavior: Clip.none,
                itemCount: meals.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (BuildContext context, int index) {
                  return Meal(
                    mealModel: meals[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            );
          }
        },
      ),
    );
  }
}
