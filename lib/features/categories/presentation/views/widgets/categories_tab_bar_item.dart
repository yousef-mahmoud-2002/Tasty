import 'package:flutter/material.dart';

class CategoriesTabBarItem extends StatelessWidget {
  const CategoriesTabBarItem({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Text(label),
    );
  }
}
