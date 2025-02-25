import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedItemIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen();

    if (_selectedItemIndex == 1) {
      activeScreen = MealsScreen(meals: [], title: "Favorites");
    }

    return Scaffold(
      /*
      no need for appbar since i have it on CategoriesScreen, and also MealsScreen
      CategoriesScreen have fixed title which is Food Categories, but MealsScreen accepts
      title argument which is set based on the passed parameter, if MealsScreen is called
      from the categoriesScreen then its going to be the the selected category name as the app bar title
      if MealsScreen is called from the Favorites (bottom navigationBar, then the passed parameter will be "Favorite") 
      */
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
