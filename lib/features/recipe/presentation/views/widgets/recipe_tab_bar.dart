import 'package:flutter/material.dart';
import 'package:tasty/constants.dart';

class RecipeTabBar extends StatelessWidget {
  const RecipeTabBar({super.key, this.onTap});

  final void Function(int)? onTap;

  static const List<String> tabs = [
    'INGREDIENTS',
    'BRIEFLY',
    'LET\'S COOK',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TabBar(
        onTap: onTap,
        labelColor: Colors.black,
        labelPadding: EdgeInsets.zero,
        unselectedLabelColor: Colors.black45,
        indicatorAnimation: TabIndicatorAnimation.elastic,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 6,
              spreadRadius: 0.1,
            ),
          ],
        ),
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }
}
