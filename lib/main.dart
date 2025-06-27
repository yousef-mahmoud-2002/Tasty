import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty/constants.dart';
import 'package:tasty/features/home/presentation/views/home_view.dart';
import 'features/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'features/categories/presentation/manager/meals_cubit/meals_cubit.dart';
import 'features/random_recipe/presentation/manager/random_recipe_cubit/random_recipe_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) =>
    const Tasty(), // Wrap your app
    // ),
  );
}

class Tasty extends StatelessWidget {
  const Tasty({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit()..fetchCategories('Category'),
        ),
        BlocProvider(
          create: (context) => MealsCubit()..fetchMeals('Category', 'Beef'),
        ),
        BlocProvider(
          create: (context) => RandomRecipeCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Tasty',
        color: kPrimaryColor,
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: kMaterialPrimaryColor,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
        ),
      ),
    );
  }
}
