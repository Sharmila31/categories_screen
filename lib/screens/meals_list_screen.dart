import 'package:categories_screen/models/category_model.dart';
import 'package:categories_screen/widgets/meals_item.dart';
import 'package:flutter/material.dart';
import '/utility_class.dart';
import '../models/Meals.dart';
import '../models/category_model.dart';
import '../models/FilterModel.dart';

class MealsListWidget extends StatelessWidget {
  final FilterModel filterModel;

  const MealsListWidget(this.filterModel, {Key? key}) : super(key: key);

  static const String routeName = "/meals-list";

  @override
  Widget build(BuildContext context) {
    CategoryModel model =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    List<Meals> mealsList = getFilteredMealsList(model.id);

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

  List<Meals> getFilteredMealsList(String id) {
    List<Meals> sortedList = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();

    return sortedList.where((element) {
      if (filterModel.isVegetarian && !element.isVegetarian) return false;
      if (filterModel.isVegan && !element.isVegan) return false;
      if (filterModel.isGluten && !element.isGlutenFree) return false;
      if (filterModel.isLactose && !element.isLactoseFree) return false;
      return true;
    }).toList();
  }
}
