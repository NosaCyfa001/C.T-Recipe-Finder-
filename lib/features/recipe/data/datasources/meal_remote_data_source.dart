import 'package:dio/dio.dart';
import '../models/meal_model.dart';

class MealRemoteDataSource {
  final Dio dio;

  MealRemoteDataSource(this.dio);

  Future<List<MealModel>> searchMeals(String query) async {
    final response = await dio.get(
      'https://www.themealdb.com/api/json/v1/1/search.php',
      queryParameters: {'s': query},
    );

    print('API response: ${response.data}');

    if (response.statusCode == 200) {
      final data = response.data['meals'];
      if (data == null) return []; // No meals found

      return (data as List)
          .map((meal) => MealModel.fromJson(meal))
          .toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
