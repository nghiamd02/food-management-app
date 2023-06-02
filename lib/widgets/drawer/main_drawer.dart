import 'package:flutter/material.dart';
import 'package:food_app/widgets/drawer/drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelected});
  final void Function(String screen) onSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            )),
        DrawerItem(
          title: 'Meals',
          icon: Icons.restaurant,
          onSelected: onSelected,
        ),
        DrawerItem(
          title: 'Filter',
          icon: Icons.settings,
          onSelected: onSelected,
        )
      ]),
    );
  }
}
