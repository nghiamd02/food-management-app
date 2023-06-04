import 'package:flutter_riverpod/flutter_riverpod.dart';
import './meals_provider.dart';

enum Filter { glutenFree, vegan, vegetarian, lactoseFree }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
          Filter.lactoseFree: false
        });
  void setFilters(Map<Filter, bool> selectedFilter) {
    state = selectedFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());

final mealsFilterProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filter = ref.watch(filterProvider);
  return meals.where((meal) {
    if (filter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (filter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
