import 'package:categories_screen/category_list_item.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './models/category_model.dart';
import 'utility_class.dart';
import 'package:categories_screen/MyThemeData.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    setSystemBarTheme();

    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: CATEGORIES_LIST.map((item) {
        return CategoryListItem(item);
      }).toList(),
    );
  }

  void setSystemBarTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: MyThemeData.StatusBarColor,
      // navigation bar color
      statusBarColor: MyThemeData.StatusBarColor, // status bar color
    ));
  }
}
