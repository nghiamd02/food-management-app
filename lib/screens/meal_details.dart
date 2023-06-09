import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meals/meal_description.dart';
import 'package:food_app/providers/fav_meals_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favList = ref.watch(favMealsProvider);
    final isAdded = favList.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref
                  .read(favMealsProvider.notifier)
                  .onToggleFavouriteIcon(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(isAdded
                      ? "Added to your favorite successfully"
                      : "Removed from your favorite")));
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.9, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isAdded ? Icons.star : Icons.star_border,
                key: ValueKey(isAdded),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: meal.id,
            child: Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          MealDescription(title: 'Ingredients', details: meal.ingredients),
          MealDescription(title: 'Steps', details: meal.steps),
        ]),
      ),
    );
  }
}
