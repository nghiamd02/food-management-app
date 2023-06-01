import 'package:flutter/material.dart';
import 'package:food_app/data/categories_data.dart';
import 'package:food_app/widgets/category/category_item.dart';
import 'package:food_app/screens/meals.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/models/category.dart';

class CatergoryScreen extends StatelessWidget {
  const CatergoryScreen({super.key});
  void _onSelectedCategory(BuildContext context, Category category) {
    List<Meal> meals = mealsData
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealScreen(title: category.title, meals: meals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food App'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              onSelectedCategory: () {
                _onSelectedCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
