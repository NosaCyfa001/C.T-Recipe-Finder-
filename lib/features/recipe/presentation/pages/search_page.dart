import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_app/features/recipe/data/datasources/category_data.dart';
import '../providers/meal_provider.dart';
import '../providers/recent_search_provider.dart';
import '../widgets/meal_card.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mealProvider);
    final recentSearches = ref.watch(recentSearchProvider);

    return Scaffold(
      appBar: AppBar(
      title: const Text("C.T Recipe Finder",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      
      centerTitle: true, // Centers on Android & iOS
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search recipes...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _controller.text.trim();
                    if (query.isNotEmpty) {
                      ref.read(mealProvider.notifier).search(query);
                      ref.read(recentSearchProvider.notifier).addSearch(query);
                    }
                  },
                ),
              ),
            ),
          ),
          if (recentSearches.isNotEmpty)
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: recentSearches
                    .map((q) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ActionChip(
                            label: Text(q),
                            onPressed: () {
                              _controller.text = q;
                              ref.read(mealProvider.notifier).search(q);
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: predefinedCategories
                  .map((cat) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          child: Text(cat),
                          onPressed: () {
                            _controller.text = cat;
                            ref.read(mealProvider.notifier).search(cat);
                            ref.read(recentSearchProvider.notifier).addSearch(cat);
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: state.when(
              data: (meals) => meals.isEmpty
                  ? const Center(child: Text("No meals found."))
                  : ListView.builder(
                      itemCount: meals.length,
                      itemBuilder: (_, i) => MealCard(meal: meals[i]),
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => const Center(child: Text("Error: \$e")),
            ),
          ),
        ],
      ),
    );
  }
}