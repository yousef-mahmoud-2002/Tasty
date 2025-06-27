import 'package:flutter/material.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/categories/data/models/meal_model.dart';
import 'package:tasty/features/categories/presentation/views/widgets/meal_image.dart';
import 'package:tasty/features/recipe/presentation/views/recipe_view.dart';

class Meal extends StatelessWidget {
  const Meal({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RecipeView(id: mealModel.id);
        }));
      },
      child: Container(
        height: 300,
        width: 250,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: kPrimaryColor,
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: Offset(0, 2),
            ),
          ],
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kPrimaryColor, width: 0.7),
        ),
        child: Column(
          children: [
            MealImage(imageUrl: mealModel.imageUrl),
            const Spacer(),
            Text(
              mealModel.mealName,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
