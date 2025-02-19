import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            //0.55 * 255 withAlpha == withOpacity(0.55), same goes for the other one
            category.color.withAlpha((0.55 * 255).toInt()),
            category.color.withAlpha((0.9 * 255).toInt()),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              )),
    );
  }
}
