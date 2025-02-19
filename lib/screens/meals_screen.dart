import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meals Menu",
          //the exclamation mark is telling flutter that titlelarge is defined (its from the google fonts package)
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        //By using .map, i managed to print all widgets from the list.
        //pay attention that i didnt say children: [], because at the end i wrote toList()
        children: availableCategories.map(
          (singleCategory) {
            return MealItem(category: singleCategory);
          },
        ).toList(),
        /*
        OR ->
        children: [
          for(final category in availableCategories) {
            MealItem(category: category);
          }
        ]
        */
      ),
    );
  }
}
