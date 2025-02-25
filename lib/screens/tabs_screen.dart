import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favoriteMeals = [];
  int _selectedItemIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

/* we can either pass this function to meals_details_screen where we have the 
  favorite button on, and that would require us to pass this function through 
  multiple widget files, to check,. just accept this function in details screen
  and u will see all the other files that would require this function in order to 
  deliver it from the tabsScreen to the meals_details_screen.
  but the linear apprach is better for less compelxity
*/
  void _toggleFavoriteMeal(Meal meal) {
    bool isExisting = _favoriteMeals.contains(meal);
    setState(() {
      if (isExisting) {
        _favoriteMeals.remove(meal);
        _showInfoMessage("${meal.title} is no longer a favorite");
      } else {
        _favoriteMeals.add(meal);
        _showInfoMessage("${meal.title} is Marked as a favorite");
      }
    });
  }

  void _onSelectDrawerItem(String identifier) {
    if (identifier == "meals") {
      Navigator.pop(context);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      toggleFavoriteMeal: _toggleFavoriteMeal,
    );
    String appBarTitle = "Food Categories";

    if (_selectedItemIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favoriteMeals,
        toggleFavoriteMeal: _toggleFavoriteMeal,
      );
      appBarTitle = "Favorites";
    }

    return Scaffold(
      /*
      no need for appbar since i have it on CategoriesScreen, and also MealsScreen
      CategoriesScreen have fixed title which is Food Categories, but MealsScreen accepts
      title argument which is set based on the passed parameter, if MealsScreen is called
      from the categoriesScreen then its going to be the the selected category name as the app bar title
      if MealsScreen is called from the Favorites (bottom navigationBar, then the passed parameter will be "Favorite")
      THAT WAS MY IDEA HERE, BUT IF I WANT TO ADD A DRAWER TO THE TABSSCREEN, IT WILL
      NOT BE VISIBILE UNLESS I ADD AN APPBAR HERE IN THE TABSSCREEN
      (unless i add the drawer twice, once in the categories screen and the second in the mealsscreen
      and thats not good) 
      */
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      drawer: MainDrawer(
        onSelectDrawerItem: _onSelectDrawerItem,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItemIndex,
        selectedIconTheme: IconThemeData().copyWith(size: 28),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          )
        ],
        onTap: _selectScreen,
      ),
    );
  }
}
