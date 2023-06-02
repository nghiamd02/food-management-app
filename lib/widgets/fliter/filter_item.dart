import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isSet,
      required this.onFilterTap});
  final String title;
  final String subtitle;
  final bool isSet;

  final void Function(bool isActive, String type) onFilterTap;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isSet,
      onChanged: (isActive) => {
        onFilterTap(isActive, title),
      },
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
