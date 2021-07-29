import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Meals.dart';
import '../MyThemeData.dart';
import '../screens/meal_details_screen.dart';

class MealsListItem extends StatelessWidget {
  final Meals mealItem;

  const MealsListItem(this.mealItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openDetailsPage(context),
      child: Container(
        height: 150,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Image.network(
                  mealItem.imageUrl,
                  width: 120,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            mealItem.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //we can use both Container or Expanded for displaying the text with ellipsis at the end
                          Container(
                            child: Text(
                              'Ingredients: ${mealItem.ingredients.join(',')}',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Divider(
                            height: 2,
                            color: MyThemeData.DividerColor,
                            thickness: 1,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(Icons.schedule),
                                      Expanded(child: Text('${mealItem.duration} min',style: TextStyle(fontSize: 12),))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.attach_money,
                                      ),
                                      Expanded(child: Text('${AffordabilityText}',style: TextStyle(fontSize: 12),))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(Icons.work),
                                      Expanded(child: Text('${ComplexityText}',style: TextStyle(fontSize: 12),maxLines: 1,overflow: TextOverflow.ellipsis,))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get AffordabilityText {
    switch (mealItem.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  String get ComplexityText {
    switch (mealItem.complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      default:
        return 'Unknown';
    }
  }

  void openDetailsPage(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: mealItem);
  }
}
