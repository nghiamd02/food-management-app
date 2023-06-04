import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/providers/filter_provider.dart';

class FilterItem extends ConsumerWidget {
  const FilterItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.filterOption});
  final String title;
  final String subtitle;
  final Filter filterOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return SwitchListTile(
      value: activeFilter[filterOption]!,
      onChanged: (isActive) => {
        ref.read(filterProvider.notifier).setFilter(filterOption, isActive),
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
