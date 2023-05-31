import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.lable});
  final IconData icon;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        Text(
          lable,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }
}
