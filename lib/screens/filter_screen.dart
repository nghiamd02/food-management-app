import 'package:flutter/material.dart';
import 'package:food_app/widgets/fliter/filter_item.dart';

enum Filter { glutenFree, vegan, vegetarian, lactoseFree }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFiltered});
  final Map<Filter, bool> currentFiltered;

  @override
  State<StatefulWidget> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFreeSet = false;
  var _isVeganSet = false;
  var _isVegetarianSet = false;
  var _isLactoseFreeSet = false;

  @override
  void initState() {
    _isGlutenFreeSet = widget.currentFiltered[Filter.glutenFree]!;
    _isVeganSet = widget.currentFiltered[Filter.vegan]!;
    _isVegetarianSet = widget.currentFiltered[Filter.vegetarian]!;
    _isLactoseFreeSet = widget.currentFiltered[Filter.lactoseFree]!;
    super.initState();
  }

  void _onFilterTap(bool isActive, String type) {
    if (type.toLowerCase() == 'gluten-free') {
      setState(() {
        _isGlutenFreeSet = isActive;
      });
    }
    if (type.toLowerCase() == 'vegan') {
      setState(() {
        _isVeganSet = isActive;
      });
    }
    if (type.toLowerCase() == 'vegetarian') {
      setState(() {
        _isVegetarianSet = isActive;
      });
    }
    if (type.toLowerCase() == 'lactose-free') {
      setState(() {
        _isLactoseFreeSet = isActive;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Filter'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFreeSet,
            Filter.vegan: _isVeganSet,
            Filter.vegetarian: _isVegetarianSet,
            Filter.lactoseFree: _isLactoseFreeSet
          });
          return false;
        },
        child: Column(children: [
          FilterItem(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              isSet: _isGlutenFreeSet,
              onFilterTap: _onFilterTap),
          FilterItem(
              title: 'Vegan',
              subtitle: 'Only include gluten-free meals',
              isSet: _isVeganSet,
              onFilterTap: _onFilterTap),
          FilterItem(
              title: 'Vegetarian',
              subtitle: 'Only include gluten-free meals',
              isSet: _isVegetarianSet,
              onFilterTap: _onFilterTap),
          FilterItem(
              title: 'Lactose-free',
              subtitle: 'Only include gluten-free meals',
              isSet: _isLactoseFreeSet,
              onFilterTap: _onFilterTap)
        ]),
      ),
    );
  }
}
