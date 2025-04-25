import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorite_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/provider/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

//changed to Consumer Type to use riverpod
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedItemIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

//WE SHOULD RECEIVE THE FILTERS HERE
  void _onSelectDrawerItem(String identifier) async {
    /*identifier != filters, close drwaer when pressed.
    ITS GOING TO BE CLOSED IN BOTH CONDITION
    ( i dont want to close it manualy after coming back from the filter screen)
    and i dont want to make a whole condition where if its not filters, then close it 
    and this kinda work when only having 2 items, because if i have more, i need conditions for each one of them
    here only meals identifier the one thats closing the screen, the rest( if there exist, wont be doing that surely)
    */
    Navigator.pop(context);
    //identifier == filters, close drwaer then open screen
    if (identifier == "filters") {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String appBarTitle = "Food Categories";

    if (_selectedItemIndex == 1) {
      final favoriteMeals = ref.watch(favoriteProvider);
      activeScreen = MealsScreen(
        meals: favoriteMeals,
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
