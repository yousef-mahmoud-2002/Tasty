import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/categories/presentation/views/widgets/meal.dart';
import 'package:tasty/features/random_recipe/presentation/manager/random_recipe_cubit/random_recipe_cubit.dart';

class RandomRecipeResult extends StatelessWidget {
  const RandomRecipeResult({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 24,
      shadowColor: kPrimaryColor,
      backgroundColor: kSecondaryColor,
      title: const Text('Random Recipe', textAlign: TextAlign.center),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: BlocBuilder<RandomRecipeCubit, RandomRecipeState>(
        builder: (context, state) {
          if (state is RandomRecipeFailure) {
            return Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text('Enable to fetch random recipe'),
              ),
            );
          } else {
            return Skeletonizer(
              enabled: state is RandomRecipeLoading,
              child: Meal(
                mealModel: context.read<RandomRecipeCubit>().randomRecipe,
              ),
            );
          }
        },
      ),
    );
  }
}
