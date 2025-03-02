import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.toggleFavoriteMeal,
    required this.availableMeals,
  });
  final void Function(Meal meal) toggleFavoriteMeal;
  final List<Meal> availableMeals;

  /*
  i can use function in stateless widget, to just change the screen, i am not 
  updating the UI, i am basically manupilating the widgets stack, where 
  i pop and push as i wish and the very top widget will always be displayed, 
  so thats why no statefulwidget is needed in this case.
  and sense i am CURRENTLY in the CATEGORY screen, and I want to move to mealscreen
  thats why i have to define the function here !, and then accept it as a parameter
  in the MealsScreen file.
  */
  void _selectCategory(
      BuildContext context, String categoryId, String categoryTitle) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          //availableMeals replaced dummymeals (because its the filtered {gluten  ... etc})
          meals: availableMeals
              .where((meal) => meal.categories.contains(categoryId))
              .toList(),
          title: categoryTitle,
          toggleFavoriteMeal: toggleFavoriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        //i deleted the scaffold because no need for it anymore since i added a tabsscreen with a scaffold and appbar dynamically
        //Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "Food Categories",
        //     //the exclamation mark is telling flutter that titlelarge is defined (its from the google fonts package)
        //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
        //         color: Theme.of(context).colorScheme.onSurface,
        //         fontWeight: FontWeight.w600),
        //   ),
        // ),
        // body:
        GridView(
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
          return CategoryItem(
            category: singleCategory,
            /*
              WHEN I SELECT (CLICK on A CATEGORY for example italian), 
              i am passing the informations of that category  
              to the function where i filter the meals based on the category id 
              and the meal categories attrbiutes, and also i am passing the 
              title as well to display it on the appBar title, 
              ( i can just basically pass the whole category as Category and 
              then in teh fcuntion i can get what i need, but idk i felt this way is better)
              */
            onSelectCategory: () {
              _selectCategory(context, singleCategory.id, singleCategory.title);
            },
          );
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
    );
  }
}
