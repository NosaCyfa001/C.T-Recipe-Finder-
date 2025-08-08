import '../entities/meal.dart';

abstract class MealRepository {
  Future<List<Meal>> searchMeals(String query);
}