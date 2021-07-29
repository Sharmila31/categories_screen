import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../models/FilterModel.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-meals';

  final Function onSaveFilters;

  final FilterModel filterModel;

  const FilterScreen(this.filterModel, this.onSaveFilters, {Key? key})
      : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isVegetarian = false;
  var _isVegan = false;
  var _isLactoseFree = false;
  var _isGluttenFree = false;

  void updateValues() {
    this._isLactoseFree = widget.filterModel.isLactose;
    this._isGluttenFree = widget.filterModel.isGluten;
    this._isVegan = widget.filterModel.isVegan;
    this._isVegetarian = widget.filterModel.isVegetarian;
  }

  @override
  void initState() {
    updateValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.onSaveFilters(FilterModel(
                  isVegan: _isVegan,
                  isGluten: _isGluttenFree,
                  isLactose: _isLactoseFree,
                  isVegetarian: _isVegetarian));
            },
          ),
        ],
      ),
      drawer: MainDrawerWidget(),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'Apply your filters here',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildSwitchTileWidget(
              'Vegetarian', 'Show only Vegetarian meals', _isVegetarian,
              (changedVal) {
            setState(() {
              _isVegetarian = changedVal;
            });
          }),
          buildSwitchTileWidget('Vegan', 'Show only Vegan meals', _isVegan,
              (changedVal) {
            setState(() {
              _isVegan = changedVal;
            });
          }),
          buildSwitchTileWidget(
              'Lactose-free', 'Show only Lactose-free meals', _isLactoseFree,
              (changedVal) {
            setState(() {
              _isLactoseFree = changedVal;
            });
          }),
          buildSwitchTileWidget(
              'Gluten-free', 'Show only Gluten-free meals', _isGluttenFree,
              (changedVal) {
            setState(() {
              _isGluttenFree = changedVal;
            });
          }),
        ],
      ),
    );
  }

  buildSwitchTileWidget(
      String title, String desc, bool currObj, Function currFn) {
    return SwitchListTile(
      value: currObj,
      onChanged: (newVal) {
        currFn(newVal);
      },
      title: Text(title),
      subtitle: Text(desc),
    );
  }
}
