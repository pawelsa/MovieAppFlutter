import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/movie_credits.dart';
import 'package:movie_app_flutter/data/api/movie_api.dart';
import 'package:movie_app_flutter/pages/detail/detail_actors.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';

final movieRepositoryProvider = Provider((ref) => MovieRepository(MovieApi()));

class MovieRepository {
  final MovieApi _movieApi;

  MovieRepository(this._movieApi);

  Future<List<ContentDetailData>> getPopularMovies(int page) =>
      _movieApi.getPopularMovies(page).then(_getMovies);

  Future<List<ContentDetailData>> getUpcomingMovies(int page) =>
      _movieApi.getUpcomingMovies(page).then(_getMovies);

  Future<List<ContentDetailData>> _getMovies(PageContent content) async {
    final contentData = <ContentDetailData>[];
    for (var movie in content.results) {
      final movieCredits = await _movieApi.getCredits(movie.id);
      movieCredits.cast.sort((a, b) => a.order!.compareTo(b.order!));
      contentData.add(
        ContentDetailData(
          title: movie.title,
          grade: movie.voteAverage,
          director: movieCredits.crew
              .firstWhere(
                  (element) => element.job?.startsWith("Director") ?? false,
                  orElse: () => ApiPerson.empty())
              .name,
          stars: movieCredits.cast.take(2).map((e) => e.name).join(" / "),
          posterPath: movie.posterPath,
          backdropPath: movie.backdropPath,
          overview: movie.overview,
          isCollected: false,
          cast: movieCredits.cast
              .map((e) => Person(e.name, e.profilePath, e.character!))
              .toList(),
          crew: movieCredits.crew
              .map((e) => Person(e.name, e.profilePath, e.job!))
              .toList(),
        ),
      );
    }
    return contentData;
  }
}
