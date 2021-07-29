import 'package:flutter/material.dart';

import '../models/Meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail";

  const MealDetailScreen({Key? key}) : super(key: key);

  TextStyle getHeaderTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.purple,
      fontSize: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    int stepCount = 0;
    Meals meal = ModalRoute.of(context)?.settings.arguments as Meals;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Ingredients',
              style: getHeaderTextStyle(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(meal.ingredients.join(',')),
            ),
            Text(
              'Steps',
              style: getHeaderTextStyle(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: meal.steps.map((element) {
                  stepCount++;
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '${stepCount}',
                          ),
                        ),
                        title: Text(element),
                      ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
