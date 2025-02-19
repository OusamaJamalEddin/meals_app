import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red,
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
