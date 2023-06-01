import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meals/meal_description.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(
      {super.key, required this.meal, required this.onToggleFavouriteIcon});
  final Meal meal;
  final void Function(Meal meal) onToggleFavouriteIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              tooltip: 'Add Favorite',
              onPressed: () {
                onToggleFavouriteIcon(meal);
              },
              icon: const Icon(Icons.star_border)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          MealDescription(title: 'Ingredients', details: meal.ingredients),
          MealDescription(title: 'Ingredients', details: meal.steps),
        ]),
      ),
    );
  }
}
