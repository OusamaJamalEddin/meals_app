import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteProviderNotifier extends StateNotifier<List<Meal>> {
  FavoriteProviderNotifier() : super([]);

  bool favoriteToggleMeal(Meal meal) {
    bool isMealFavorite = state.contains(meal);

    if (isMealFavorite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteProviderNotifier, List<Meal>>(
  (ref) => FavoriteProviderNotifier(),
);
