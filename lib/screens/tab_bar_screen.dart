import 'package:flutter/material.dart';
import '../categories_list.dart';
import './favourites_screen.dart';
import '../MyThemeData.dart';
import '../widgets/main_drawer.dart';

class MyTabBarScreen extends StatefulWidget {
  const MyTabBarScreen({Key? key}) : super(key: key);

  @override
  _MyTabBarScreenState createState() => _MyTabBarScreenState();
}

class _MyTabBarScreenState extends State<MyTabBarScreen> {
  int _selectedTabIndex =
      0; //this is managed by us for displaying the selected tab

  List<Map<String, Object>> _tabPages = [
    {'widget': CategoriesList(), 'title': 'Categories'},
    {'widget': FavouritesScreen(), 'title': 'My Favourites'}
  ];

  void _showCurrentTabScreen(int index) {
    //the index will automatically be passed by Flutter, it demotes the index position of the selected tab
    setState(() {
      _selectedTabIndex = index; // set the selected index to _selectedTabIndex
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabPages[_selectedTabIndex]['title'] as String),
      ),
      body: _tabPages[_selectedTabIndex]['widget'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        backgroundColor: MyThemeData.PrimaryColor,
        currentIndex: _selectedTabIndex,
        onTap: _showCurrentTabScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
      drawer: MainDrawerWidget(),
    );
  }
}
