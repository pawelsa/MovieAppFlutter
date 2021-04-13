import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/credits.dart';
import 'package:movie_app_flutter/data/api/movie_api.dart';
import 'package:movie_app_flutter/data/db/content_db.dart';
import 'package:movie_app_flutter/data/db/dao/movie_dao.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/content_person.dart';
import 'package:movie_app_flutter/data/db/model/movie_db.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';
import 'package:movie_app_flutter/data/view/person.dart';

final movieRepositoryProvider = FutureProvider<MovieRepository>((ref) async {
  final contentDao = await ref.watch(contentDaoProvider.future);
  final peopleDao = await ref.watch(peopleDaoProvider.future);
  return MovieRepository(MovieApi(), contentDao, peopleDao);
});

class MovieRepository {
  final MovieApi _movieApi;
  final ContentDao _contentDao;
  final PeopleDao _peopleDao;

  MovieRepository(this._movieApi, this._contentDao, this._peopleDao);

  Future<List<ContentDetailData>> getPopularMovies(int page) =>
      _movieApi.getPopular(page).then((content) => _getMovies(content, true));

  Future<List<ContentDetailData>> getUpcomingMovies(int page) =>
      _movieApi.getUpcoming(page).then((content) => _getMovies(content, false));

  Future<List<ContentDetailData>> _getMovies(
      PageContent content, bool arePopular) async {
    final contentData = <ContentDetailData>[];
    // TODO when adding pages, order should be set depending on page number
    var order = 0;
    for (var movie in content.results) {
      final movieCredits = await _movieApi.getCredits(movie.id);
      movieCredits.cast.sort((a, b) => a.order!.compareTo(b.order!));

      final director = movieCredits.crew
          .firstWhere((element) => element.job?.startsWith("Director") ?? false,
              orElse: () => ApiPerson.empty())
          .name;
      final stars = movieCredits.cast.take(2).map((e) => e.name).join(" / ");

      final dbMovie = MovieDb(movie.id, arePopular, order++);

      final dbContent = ContentDb(
        movie.id,
        true,
        movie.title,
        movie.voteAverage,
        director,
        stars,
        movie.posterPath,
        movie.backdropPath,
        movie.overview,
      );

      final cast = movieCredits.cast
          .map((e) => PersonDb(e.id, e.name, e.profilePath, e.character,
              e.order, e.department, e.job))
          .toList();
      final crew = movieCredits.crew
          .map((e) => PersonDb(e.id, e.name, e.profilePath, e.character,
              e.order, e.department, e.job))
          .toList();

      final contentPerson = cast
          .map((e) => ContentPersonDb(movie.id, e.id, true, true, e.order))
          .toList()
            ..addAll(crew.map(
                (e) => ContentPersonDb(movie.id, e.id, true, false, e.order)));

      await _contentDao.insert(dbContent);
      await _contentDao.insertMovie(dbMovie);
      await _peopleDao.insertPeople(cast);
      await _peopleDao.insertPeople(crew);
      await _contentDao.insertMoviePersons(contentPerson);

      contentData.add(
        ContentDetailData(
          title: movie.title,
          grade: movie.voteAverage,
          director: director,
          stars: stars,
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
