import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/tv_show_repository.dart';

final observePopularTvShowsProvider = StreamProvider((ref) {
  final tvShowRepository = ref.watch(tvShowRepositoryProvider);
  return tvShowRepository.observeDetailedPopular();
});

final observeTopRatedTvShowsProvider = StreamProvider((ref) {
  final tvShowRepository = ref.watch(tvShowRepositoryProvider);
  return tvShowRepository.observeDetailedTopRated();
});
