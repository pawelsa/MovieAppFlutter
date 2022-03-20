import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/movie_repository.dart';

final observePopularMoviesProvider = StreamProvider((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.observeDetailedPopular();
});

final observeUpcomingMoviesProvider = StreamProvider((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.observeDetailedUpcoming();
});
