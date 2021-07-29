import 'package:categories_screen/MyThemeData.dart';
import 'package:categories_screen/models/FilterModel.dart';
import 'package:flutter/material.dart';

import '../screens/meals_list_screen.dart';
import '../screens/meal_details_screen.dart';
import './screens/tab_bar_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  FilterModel filterModel = FilterModel(
      isVegetarian: false, isVegan: false, isGluten: false, isLactose: false);

  void setFilter(FilterModel newModel) {

    filterModel = newModel;
  }

  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyThemeData.PrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      // home: MyApp(),
      routes: {
        '/': (ctx) => MyTabBarScreen(), //load by default
        MealsListWidget.routeName: (ctx) => MealsListWidget(widget.filterModel),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) =>
            FilterScreen(widget.filterModel, widget.setFilter),
      },
    );
  }
}
