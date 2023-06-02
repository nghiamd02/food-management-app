import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onSelected});
  final String title;
  final IconData icon;
  final void Function(String screen) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onSelected(title);
      },
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground, fontSize: 24),
      ),
    );
  }
}
