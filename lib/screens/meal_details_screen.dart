import 'package:flutter/material.dart';

import '../models/Meals.dart';

class MealDetailScreen extends StatelessWidget {

  static const String routeName = "/meal-detail";

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Meals meal = ModalRoute.of(context)?.settings.arguments as Meals;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: Container(),
    );
  }
}
