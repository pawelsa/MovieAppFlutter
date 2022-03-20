import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content_api_model.dart';
import 'package:movie_app_flutter/data/api/model/credits_api_model.dart';
import 'package:movie_app_flutter/data/api/movie_api.dart';
import 'package:movie_app_flutter/data/db/content_db.dart';
import 'package:movie_app_flutter/data/db/dao/movie_dao.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';
import 'package:movie_app_flutter/data/repository/content_repository.dart';
import 'package:movie_app_flutter/data/view/content_data.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final contentDao = ref.watch(movieDaoProvider);
  final peopleDao = ref.watch(peopleDaoProvider);
  return MovieRepository(MovieApi(), contentDao, peopleDao);
});

class MovieRepository extends ContentRepository {
  final MovieApi _movieApi;
  final MovieDao _movieDao;

  MovieRepository(this._movieApi, this._movieDao, PeopleDao peopleDao)
      : super(_movieDao, peopleDao, true);

  Future<List<ContentDetailData>> getPopularMovies(int page) =>
      _movieApi.getPopular(page).then((content) {
        if (content is ContentListResponse) {
          return _getMoviesWithResp(content, true);
        }
        return <ContentDetailData>[];
      });

  Future<List<ContentDetailData>> getUpcomingMovies(int page) =>
      _movieApi.getUpcoming(page).then((content) {
        if (content is ContentListResponse) {
          return _getMoviesWithResp(content, false);
        }
        return <ContentDetailData>[];
      });

  Future<List<ContentDetailData>> _getMoviesWithResp(
      ContentListResponse content, bool arePopular) async {
    final contentData = <ContentDetailData>[];
    var order = (content.page - 1) * content.results.length;

    for (var movie in content.results) {
      final movieCredits = await _movieApi.getCredits(movie.id);
      if (movieCredits is ApiCredits) {
        movieCredits.cast.sort((a, b) => a.order!.compareTo(b.order!));

        final director = movieCredits.crew
            .firstWhere(
                (element) => element.job?.startsWith("Director") ?? false,
                orElse: () => ApiPerson.empty())
            .name;
        // TODO: 14/02/2022 handle when only one
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
    }
    return contentData;
  }

  Future saveMoviesInDb(ContentResponse content, bool arePopular, int order, String director, String stars,
      ApiCredits movieCredits) async {
    final dbMovie = MovieDb(content.id, arePopular, order);
    await saveContentInDb(content, director, stars, movieCredits, _movieDao.insertMovie(dbMovie));
  }

  Stream<List<ContentDetailData>> observeDetailedUpcoming() =>
      _movieDao.observeAllUpcoming().asyncMap(getDetailsFromDb);

  Stream<List<ContentDetailData>> observeDetailedPopular() => _movieDao.observeAllPopular().asyncMap(getDetailsFromDb);

  Stream<List<ContentData>> observeUpcoming() => _movieDao.observeAllUpcoming().map(getContentFromDb);

  Stream<List<ContentData>> observePopular() => _movieDao.observeAllPopular().map(getContentFromDb);
}
