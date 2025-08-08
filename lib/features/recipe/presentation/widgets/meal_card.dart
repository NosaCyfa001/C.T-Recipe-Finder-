import 'package:flutter/material.dart';
import '../../domain/entities/meal.dart';
import '../pages/recipe_detail_page.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipeDetailPage(meal: meal),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            Image.network(meal.thumbnail, width: 100, height: 100, fit: BoxFit.cover),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                meal.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

