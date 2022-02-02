import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/credits.dart';
import 'package:movie_app_flutter/data/api/movie_api.dart';
import 'package:movie_app_flutter/data/db/content_db.dart';
import 'package:movie_app_flutter/data/db/dao/movie_dao.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';
import 'package:movie_app_flutter/data/repository/content_repository.dart';
import 'package:movie_app_flutter/data/view/content_data.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';

final movieRepositoryProvider = FutureProvider<MovieRepository>((ref) async {
  final contentDao = await ref.watch(movieDaoProvider.future);
  final peopleDao = await ref.watch(peopleDaoProvider.future);
  return MovieRepository(MovieApi(), contentDao, peopleDao);
});

class MovieRepository extends ContentRepository {
  final MovieApi _movieApi;
  final MovieDao _movieDao;

  MovieRepository(this._movieApi, this._movieDao, PeopleDao peopleDao)
      : super(_movieDao, peopleDao, true);

  Future<List<ContentDetailData>> getPopularMovies(int page) =>
      _movieApi.getPopular(page).then((content) => _getMovies(content, true));

  Future<List<ContentDetailData>> getUpcomingMovies(int page) =>
      _movieApi.getUpcoming(page).then((content) => _getMovies(content, false));

  Future<List<ContentDetailData>> _getMovies(
      PageContent content, bool arePopular) async {
    final contentData = <ContentDetailData>[];
    var order = (content.page - 1) * content.results.length;

    for (var movie in content.results) {
      final movieCredits = await _movieApi.getCredits(movie.id);
      movieCredits.cast.sort((a, b) => a.order!.compareTo(b.order!));

      final director = movieCredits.crew
          .firstWhere((element) => element.job?.startsWith("Director") ?? false,
              orElse: () => ApiPerson.empty())
          .name;
      final stars = movieCredits.cast.take(2).map((e) => e.name).join(" / ");

      await saveMoviesInDb(
          movie, arePopular, order++, director, stars, movieCredits);

      contentData.add(
        ContentDetailData(
          id: movie.id,
          title: movie.title,
          grade: movie.voteAverage,
          director: director,
          stars: stars,
          posterPath: movie.posterPath,
          backdropPath: movie.backdropPath,
          overview: movie.overview,
          isCollected: false,
          cast: mapCast(api: movieCredits.cast),
          crew: mapCrew(api: movieCredits.crew),
        ),
      );
    }
    return contentData;
  }

  Future saveMoviesInDb(ApiContent content, bool arePopular, int order,
      String director, String stars, ApiCredits movieCredits) async {
    final dbMovie = MovieDb(content.id, arePopular, order);
    await saveContentInDb(
        content, director, stars, movieCredits, _movieDao.insertMovie(dbMovie));
  }

  Future<List<ContentDetailData>> getDetailedUpcomingFromDb() =>
      _movieDao.findAllUpcoming().then(getDetailsFromDb);

  Future<List<ContentDetailData>> getDetailedPopularFromDb() =>
      _movieDao.findAllPopular().then(getDetailsFromDb);

  Future<List<ContentData>> getUpcomingFromDb() =>
      _movieDao.findAllUpcoming().then(getContentFromDb);

  Future<List<ContentData>> getPopularFromDb() =>
      _movieDao.findAllPopular().then(getContentFromDb);
}
