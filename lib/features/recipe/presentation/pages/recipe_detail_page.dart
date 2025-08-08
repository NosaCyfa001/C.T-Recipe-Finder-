import 'package:flutter/material.dart';
import '../../domain/entities/meal.dart';

class RecipeDetailPage extends StatelessWidget {
  final Meal meal;

  const RecipeDetailPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(meal.thumbnail),
            const SizedBox(height: 16),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...meal.ingredients.map((i) => Text("• $i")).toList(),
            const SizedBox(height: 16),
            Text(
              "Instructions",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(meal.instructions),
          ],
        ),
      ),
    );
  }
}
