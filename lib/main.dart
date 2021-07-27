import 'package:categories_screen/MyThemeData.dart';
import 'package:flutter/material.dart';

import 'categories_list.dart';
import '../screens/meals_list_screen.dart';
import '../screens/meal_details_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: MyThemeData.PrimaryColor,
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    routes: {
      MealsListWidget.routeName: (ctx) => MealsListWidget(),
      MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Categories',
        ),
        backgroundColor: MyThemeData.PrimaryColor,
      ),
      body: CategoriesList(),
    );
  }
}
