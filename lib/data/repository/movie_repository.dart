import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content_api_model.dart';
import 'package:movie_app_flutter/data/api/model/credits_api_model.dart';
import 'package:movie_app_flutter/data/api/movie_api.dart';
import 'package:movie_app_flutter/data/db/content_db.dart';
import 'package:movie_app_flutter/data/db/dao/movie_dao.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';
import 'package:movie_app_flutter/data/repository/content_repository.dart';
import 'package:movie_app_flutter/data/repository/loading_status/loading_status.dart';
import 'package:movie_app_flutter/data/repository/loading_status/stream_data.dart';
import 'package:movie_app_flutter/data/repository/result.dart';
import 'package:movie_app_flutter/data/view/content_data.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';
import 'package:stream_transform/stream_transform.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final contentDao = ref.watch(movieDaoProvider);
  final peopleDao = ref.watch(peopleDaoProvider);
  return MovieRepository(MovieApi(), contentDao, peopleDao);
});

class MovieRepository extends ContentRepository {
  final MovieApi _movieApi;
  final MovieDao _movieDao;
  final LoadingStatus _popularMoviesLoadingStatus = LoadingStatus();
  final LoadingStatus _upcomingMoviesLoadingStatus = LoadingStatus();

  MovieRepository(this._movieApi, this._movieDao, PeopleDao peopleDao) : super(_movieDao, peopleDao, true);

  Future<Result> getPopularMovies(int page) {
    _popularMoviesLoadingStatus.isLoading = true;
    return _movieApi.getPopular(page).then((content) {
        if (content is ContentListResponse) {
          final result = _getMoviesWithResp(content, true);
          _popularMoviesLoadingStatus.isLoading = false;
          return result;
        }
        _popularMoviesLoadingStatus.isLoading = false;
        return ErrorResult(ErrorCause.noInternet());
      });
  }

  Future<Result> getUpcomingMovies(int page) {
    _upcomingMoviesLoadingStatus.isLoading = true;
    return _movieApi.getUpcoming(page).then((content) {
      if (content is ContentListResponse) {
        final result = _getMoviesWithResp(content, false);
        _upcomingMoviesLoadingStatus.isLoading = false;
        return result;
      }
      _upcomingMoviesLoadingStatus.isLoading = false;
      return ErrorResult(ErrorCause.noInternet());
    });
  }

  Future<Result> _getMoviesWithResp(ContentListResponse content, bool arePopular) async {
    var order = (content.page - 1) * content.results.length;

    Result result = SuccessfulResult();
    for (var movie in content.results) {
      final movieCredits = await _movieApi.getCredits(movie.id);
      if (movieCredits is ApiCredits) {
        movieCredits.cast.sort((a, b) => a.order!.compareTo(b.order!));

        final director = movieCredits.crew
            .firstWhere((element) => element.job?.startsWith("Director") ?? false, orElse: () => ApiPerson.empty())
            .name;
        // TODO: 14/02/2022 handle when only one
        final stars = movieCredits.cast.take(2).map((e) => e.name).join(" / ");
        await saveMoviesInDb(movie, arePopular, order++, director, stars, movieCredits);
      } else {
        result = ErrorResult(ErrorCause.unknown());
      }
    }
    return result;
  }

  Future saveMoviesInDb(ContentResponse content, bool arePopular, int order, String director, String stars,
      ApiCredits movieCredits) async {
    final dbMovie = MovieDb(content.id, arePopular, order);
    await saveContentInDb(content, director, stars, movieCredits, _movieDao.insertMovie(dbMovie));
  }

  DataStream<List<ContentDetailData>> observeDetailedUpcoming() =>
      _movieDao.observeAllUpcoming().asyncMap(getDetailsFromDb).withLoading(_upcomingMoviesLoadingStatus);

  DataStream<List<ContentDetailData>> observeDetailedPopular() =>
      _movieDao.observeAllPopular().asyncMap(getDetailsFromDb).withLoading(_popularMoviesLoadingStatus);
}
