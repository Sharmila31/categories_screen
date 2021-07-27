import 'package:categories_screen/models/category_model.dart';
import 'package:flutter/material.dart';
import '../screens/meals_list_screen.dart';

class CategoryListItem extends StatelessWidget {
  final CategoryModel item;

  const CategoryListItem(this.item, {Key? key}) : super(key: key);

  void openMealsList(BuildContext context) {
    Navigator.of(context).pushNamed(MealsListWidget.routeName, arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openMealsList(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              item.color.withOpacity(0.6),
              item.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
