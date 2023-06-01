import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/categories.dart';
import 'package:food_app/screens/meals.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  var _currentIndex = 0;
  final List<Meal> meals = [];

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

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CatergoryScreen(
      onToggleFavouriteIcon: _onToggleFavouriteIcon,
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
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourte'),
      ], currentIndex: _currentIndex, onTap: _onSectionSelected),
    );
  }
}
