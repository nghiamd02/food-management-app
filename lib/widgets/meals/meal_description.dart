import 'package:flutter/material.dart';

class MealDescription extends StatelessWidget {
  const MealDescription(
      {super.key, required this.title, required this.details});

  final String title;
  final List<String> details;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        for (final line in details)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              line,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          )
      ],
    );
  }
}
