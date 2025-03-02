import 'package:flutter/material.dart';

// import 'package:meals_app/screens/tabs_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';
enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });
  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeCheck = false;
  bool _lactoseFreeCheck = false;
  bool _vegetarianCheck = false;
  bool _veganCheck = false;
  @override
  void initState() {
    super.initState();
    _glutenFreeCheck = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeCheck = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianCheck = widget.currentFilters[Filter.vegetarian]!;
    _veganCheck = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters")),
      //This PopScope, will allow us to pass values to the tabsscreen;
      //to save our filters and actually apply them
      body: PopScope(
        canPop: false, //because we are already popping manually.
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeCheck,
            Filter.lactoseFree: _lactoseFreeCheck,
            Filter.vegetarian: _vegetarianCheck,
            Filter.vegan: _veganCheck,
          });
        },
        child: Column(
          children: [
            //gluten
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 32, right: 20),
              value: _glutenFreeCheck,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeCheck = isChecked;
                });
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              subtitle: Text(
                "Include only gluten-free meals.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
            ),
            //lactose
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 32, right: 20),
              value: _lactoseFreeCheck,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeCheck = isChecked;
                });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              subtitle: Text(
                "Include only lactose-free meals.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
            ),
            //vegetarian
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 32, right: 20),
              value: _vegetarianCheck,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianCheck = isChecked;
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              subtitle: Text(
                "Include only vgetarian meals.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
            ),
            //vegan
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 32, right: 20),
              value: _veganCheck,
              onChanged: (isChecked) {
                setState(() {
                  _veganCheck = isChecked;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              subtitle: Text(
                "Include only vegan meals.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
