import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/meal.dart';
import '../../domain/usecases/search_meals.dart';
import '../../data/datasources/meal_remote_data_source.dart';
import '../../data/repositories/meal_repository_impl.dart';
import 'package:dio/dio.dart';

final mealProvider = StateNotifierProvider<MealNotifier, AsyncValue<List<Meal>>>(
  (ref) => MealNotifier(ref),
);

class MealNotifier extends StateNotifier<AsyncValue<List<Meal>>> {
  final Ref ref;
  MealNotifier(this.ref) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    try {
      final meals = await ref.read(searchMealsProvider)(query);
      state = AsyncValue.data(meals);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void clearSearch() {}
}

final searchMealsProvider = Provider<SearchMeals>((ref) {
  final dio = Dio();
  final dataSource = MealRemoteDataSource(dio);
  final repository = MealRepositoryImpl(dataSource);
  return SearchMeals(repository);
});