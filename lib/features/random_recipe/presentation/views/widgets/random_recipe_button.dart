import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty/constants.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';
import '../../manager/random_recipe_cubit/random_recipe_cubit.dart';
import 'random_recipe_image.dart';
import 'random_recipe_loading_image.dart';
import 'random_recipe_result.dart';

class RandomRecipeButton extends StatefulWidget {
  const RandomRecipeButton({super.key});

  @override
  State<RandomRecipeButton> createState() => _RandomRecipeButtonState();
}

class _RandomRecipeButtonState extends State<RandomRecipeButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loading,
      child: InkWell(
        splashColor: kPrimaryColor.withValues(alpha: 0.5),
        onTap: () {
          setState(() => loading = true);
          BlocProvider.of<RandomRecipeCubit>(context).getRandomRecipe();
          Future.delayed(const Duration(milliseconds: 1500)).then((value) {
            Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
            if (context.mounted) {
              showDialog(
                context: context,
                builder: (context) => const RandomRecipeResult(),
              );
            }
            setState(() => loading = false);
          });
        },
        child: FittedBox(
          child: loading
              ? const RandomRecipeLoadingImage()
                  .animate()
                  .shake(duration: const Duration(milliseconds: 1500))
              : const RandomRecipeImage(),
        ),
      ),
    );
  }
}
