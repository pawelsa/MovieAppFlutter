import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/movie_repository.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';

final getPopularMoviesProvider =
    FutureProvider.family<List<ContentDetailData>, int>((ref, page) async {
  final repository = ref.watch(movieRepositoryProvider);
  debugPrint("getPopularMoviesProvider:obtaining - page: $page");
  return repository.getPopularMovies(page);
});

final getUpcomingMoviesProvider =
    FutureProvider.family<List<ContentDetailData>, int>((ref, page) async {
  final repository = ref.watch(movieRepositoryProvider);
  debugPrint("getUpcomingMoviesProvider:obtaining - page: $page");
  return repository.getUpcomingMovies(page);
});

abstract class GetMoviesUseCase {
  Future<List<ContentDetailData>> call(int page);
}

class GetPopularMoviesUseCaseImpl extends GetMoviesUseCase {
  final MovieRepository _movieRepository;

  GetPopularMoviesUseCaseImpl(this._movieRepository);

  @override
  Future<List<ContentDetailData>> call(int page) =>
      _movieRepository.getPopularMovies(page);
}

class GetUpcomingMoviesUseCaseImpl extends GetMoviesUseCase {
  final MovieRepository _movieRepository;

  GetUpcomingMoviesUseCaseImpl(this._movieRepository);

  @override
  Future<List<ContentDetailData>> call(int page) =>
      _movieRepository.getUpcomingMovies(page);
}
