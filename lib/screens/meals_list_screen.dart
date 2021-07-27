import 'package:categories_screen/models/category_model.dart';
import 'package:categories_screen/widgets/meals_item.dart';
import 'package:flutter/material.dart';
import '/utility_class.dart';
import '../models/Meals.dart';
import '../models/category_model.dart';

class MealsListWidget extends StatelessWidget {
  const MealsListWidget({Key? key}) : super(key: key);

  static const String routeName = "/meals-list";

  @override
  Widget build(BuildContext context) {
    CategoryModel model =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    List<Meals> mealsList = DUMMY_MEALS
        .where((element) => element.categories.contains(model.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {

          return MealsListItem(mealsList[index]);
        },
        itemCount: mealsList.length,
      ),
    );
  }
}
