import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/movie_repository.dart';
import 'package:movie_app_flutter/data/repository/result.dart';

final getPopularMoviesProvider = FutureProvider.family<Result, int>((ref, page) {
  final repository = ref.watch(movieRepositoryProvider);
  debugPrint("getPopularMoviesProvider:obtaining - page: $page");
  return repository.getPopularMovies(page);
});

final getUpcomingMoviesProvider = FutureProvider.family<Result, int>((ref, page) {
  final repository = ref.watch(movieRepositoryProvider);
  debugPrint("getUpcomingMoviesProvider:obtaining - page: $page");
  return repository.getUpcomingMovies(page);
});
