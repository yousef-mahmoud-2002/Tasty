import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/categories/presentation/manager/meals_cubit/meals_cubit.dart';
import 'package:tasty/features/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:tasty/features/categories/presentation/views/widgets/categories_tab_bar_item.dart';

class CategoriesTabBar extends StatefulWidget {
  const CategoriesTabBar({super.key});

  @override
  State<CategoriesTabBar> createState() => _CategoriesTabBarState();
}

class _CategoriesTabBarState extends State<CategoriesTabBar> {
  int selectedIndex = 0;
  List<String> categories = [];
  String filterType = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesFailure) {
          return Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text('Enable to fetch categories'),
            ),
          );
        } else {
          categories = context.read<CategoriesCubit>().categoriesList;
          filterType = context.watch<CategoriesCubit>().filterType;
          return Skeletonizer(
            enabled: state is LoadingCategories,
            child: DefaultTabController(
              length: categories.length,
              child: TabBar(
                physics: const BouncingScrollPhysics(),
                indicatorWeight: 0,
                isScrollable: true,
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: kPrimaryColor,
                indicatorAnimation: TabIndicatorAnimation.elastic,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                indicator: BoxDecoration(
                  border: Border.all(color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(8),
                  color: kPrimaryColor,
                ),
                onTap: (value) {
                  if (value != selectedIndex) {
                    BlocProvider.of<MealsCubit>(context)
                        .fetchMeals(filterType, categories[value]);
                    setState(() => selectedIndex = value);
                  }
                },
                tabs: categories
                    .map((category) => CategoriesTabBarItem(label: category))
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
