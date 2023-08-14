import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNitifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNitifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNitifier,List<Meal>>((ref) {
  return FavoriteMealsNitifier();
});
