import 'package:flutter/material.dart';
import 'package:food_app/widgets/fliter/filter_item.dart';
import 'package:food_app/providers/filter_provider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Filter'),
      ),
      body: const Column(children: [
        FilterItem(
          title: 'Gluten-free',
          subtitle: 'Only include gluten-free meals',
          filterOption: Filter.glutenFree,
        ),
        FilterItem(
          title: 'Vegan',
          subtitle: 'Only include gluten-free meals',
          filterOption: Filter.vegan,
        ),
        FilterItem(
          title: 'Vegetarian',
          subtitle: 'Only include gluten-free meals',
          filterOption: Filter.vegetarian,
        ),
        FilterItem(
          title: 'Lactose-free',
          subtitle: 'Only include gluten-free meals',
          filterOption: Filter.lactoseFree,
        )
      ]),
    );
  }
}
