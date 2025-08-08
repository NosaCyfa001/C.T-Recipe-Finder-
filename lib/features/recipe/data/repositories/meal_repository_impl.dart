import '../../domain/entities/meal.dart';
import '../../domain/repositories/meal_repository.dart';
import '../datasources/meal_remote_data_source.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource dataSource;

  MealRepositoryImpl(this.dataSource);

  @override
  Future<List<Meal>> searchMeals(String query) async {
    final models = await dataSource.searchMeals(query);
    return models.map((e) => e.toEntity()).toList();

  }
}