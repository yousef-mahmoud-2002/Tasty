import 'package:flutter/material.dart';
import 'package:tasty/constants.dart';

class BackToRecipeButton extends StatelessWidget {
  const BackToRecipeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kSecondaryColor,
        border: Border.all(color: kPrimaryColor),
        boxShadow: const [
          BoxShadow(
            color: kPrimaryColor,
            blurRadius: 4,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: const BackButton(),
    );
  }
}
