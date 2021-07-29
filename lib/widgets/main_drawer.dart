import 'package:categories_screen/screens/filters_screen.dart';
import 'package:flutter/material.dart';
import '../MyThemeData.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            color: MyThemeData.PrimaryColor,
            alignment: Alignment.center,
            child: Text(
              'My Cooking App',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          getListTileWidget(Icons.restaurant_menu, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(
            thickness: 1,
          ),
          getListTileWidget(Icons.filter_alt, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }

  getListTileWidget(IconData icon, String title, Function todoAction) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        todoAction();
      },
    );
  }
}
