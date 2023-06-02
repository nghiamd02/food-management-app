import 'package:flutter/material.dart';
import 'package:food_app/data/categories_data.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/categories.dart';
import 'package:food_app/screens/filter_screen.dart';
import 'package:food_app/screens/meals.dart';
import 'package:food_app/widgets/drawer/main_drawer.dart';

const Map<Filter, bool> defaultFilter = {
  Filter.glutenFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
  Filter.lactoseFree: false
};

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  var _currentIndex = 0;
  final List<Meal> meals = [];
  Map<Filter, bool> _selectedFilter = defaultFilter;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _onToggleFavouriteIcon(Meal meal) {
    bool isExist = meals.contains(meal);
    if (isExist) {
      setState(() {
        meals.remove(meal);
      });
      _showSnackBar('Meal is deleted from Favourite');
    } else {
      setState(() {
        meals.add(meal);
      });
      _showSnackBar('Meal is added to Favourite');
    }
  }

  void _onSectionSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onDrawerItemSelected(String selectedScreen) async {
    Navigator.of(context).pop();
    if (selectedScreen.toLowerCase() == 'filter') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                    currentFiltered: _selectedFilter,
                  )));
      setState(() {
        _selectedFilter = result ?? defaultFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> filteredMeals = mealsData.where((meal) {
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CatergoryScreen(
      onToggleFavouriteIcon: _onToggleFavouriteIcon,
      filteredMeal: filteredMeals,
    );
    var screenTitle = 'Categories';

    if (_currentIndex == 1) {
      screenTitle = 'Your favourite';
      activeScreen = MealScreen(
        meals: meals,
        onToggleFavouriteIcon: _onToggleFavouriteIcon,
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
