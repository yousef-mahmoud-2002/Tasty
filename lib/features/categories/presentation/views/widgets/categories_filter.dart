import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty/constants.dart';
import '../../manager/categories_cubit/categories_cubit.dart';
import '../../manager/meals_cubit/meals_cubit.dart';
import 'categories_filter_items.dart';

class CategoriesFilter extends StatefulWidget {
  const CategoriesFilter({super.key});

  @override
  State<CategoriesFilter> createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  String filterType = 'Category';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 0.7),
        color: kPrimaryColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconEnabledColor: Colors.white,
          iconSize: 20,
          isDense: true,
          elevation: 24,
          value: filterType,
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8),
          dropdownColor: kPrimaryColor.withValues(alpha: 0.8),
          items: categoriesFilterItems,
          onChanged: (value) {
            if (value != filterType) {
              setState(() => filterType = value!);
              BlocProvider.of<CategoriesCubit>(context).fetchCategories(value!);
              BlocProvider.of<CategoriesCubit>(context).filterType = value;
              BlocProvider.of<MealsCubit>(context)
                  .fetchMeals(value, value == 'Category' ? 'Beef' : 'American');
            }
          },
        ),
      ),
    );
  }
}
