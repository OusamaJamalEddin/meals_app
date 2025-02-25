import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectDrawerItem});
  final void Function(String identifier) onSelectDrawerItem;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onInverseSurface,
                  Theme.of(context).colorScheme.onSecondary.withAlpha(
                        (0.88 * 255).toInt(), //instead of withOpacity(0.88)
                      ),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 36,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(
                        (0.8 * 255).toInt(),
                      ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Cooking Up !",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withAlpha(
                              (0.9 * 255).toInt(),
                            ),
                        fontSize: 24,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectDrawerItem("meals");
            },
            leading: Icon(
              Icons.restaurant,
              size: 24,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectDrawerItem("filters");
            },
            leading: Icon(
              Icons.settings,
              size: 24,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            title: Text(
              "Filter",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
