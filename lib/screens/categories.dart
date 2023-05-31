import 'package:flutter/material.dart';
import 'package:food_app/data/categories_data.dart';
import 'package:food_app/widgets/category_item.dart';

class CatergoryScreen extends StatelessWidget {
  const CatergoryScreen({super.key});

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
            )
        ],
      ),
    );
  }
}
