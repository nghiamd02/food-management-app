import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/categories.dart';
import 'package:food_app/screens/filter_screen.dart';
import 'package:food_app/screens/meals.dart';
import 'package:food_app/widgets/drawer/main_drawer.dart';
import 'package:food_app/providers/fav_meals_provider.dart';
import 'package:food_app/providers/filter_provider.dart';

class NavScreen extends ConsumerStatefulWidget {
  const NavScreen({super.key});

  @override
  ConsumerState<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends ConsumerState<NavScreen> {
  var _currentIndex = 0;
  void _onSectionSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onDrawerItemSelected(String selectedScreen) async {
    Navigator.of(context).pop();
    if (selectedScreen.toLowerCase() == 'filter') {
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // final meals = ref.watch(mealsProvider);
    // final activeFilter = ref.watch(filterProvider);
    List<Meal> filteredMeals = ref.watch(mealsFilterProvider);

    Widget activeScreen = CatergoryScreen(
      filteredMeal: filteredMeals,
    );
    var screenTitle = 'Categories';

    if (_currentIndex == 1) {
      screenTitle = 'Your favourite';
      final favMeals = ref.watch(favMealsProvider);
      activeScreen = MealScreen(
        meals: favMeals,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      drawer: MainDrawer(onSelected: _onDrawerItemSelected),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourte'),
      ], currentIndex: _currentIndex, onTap: _onSectionSelected),
    );
  }
}
