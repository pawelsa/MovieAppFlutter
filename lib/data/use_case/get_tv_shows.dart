import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/result.dart';
import 'package:movie_app_flutter/data/repository/tv_show_repository.dart';

final getPopularTvShowsProvider = FutureProvider.family<Result, int>((ref, page) {
  final repository = ref.watch(tvShowRepositoryProvider);
  debugPrint("getPopularTvShowsProvider:obtaining - page: $page");
  return repository.getPopular(page);
});

final getTopRatedTvShowsProvider = FutureProvider.family<Result, int>((ref, page) {
  final repository = ref.watch(tvShowRepositoryProvider);
  debugPrint("getTopRatedTvShowsProvider:obtaining - page: $page");
  return repository.getTopRated(page);
});
