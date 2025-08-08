import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentSearchNotifier extends StateNotifier<List<String>> {
  RecentSearchNotifier() : super([]);

  void addSearch(String query) {
    if (query.isEmpty) return;
    state = [query, ...state.where((q) => q != query)];
    if (state.length > 10) state = state.sublist(0, 10);
  }
}

final recentSearchProvider =
    StateNotifierProvider<RecentSearchNotifier, List<String>>(
  (ref) => RecentSearchNotifier(),
);