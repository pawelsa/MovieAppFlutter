import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/credits.dart';
import 'package:movie_app_flutter/data/api/tv_show_api.dart';
import 'package:movie_app_flutter/data/db/content_db.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/dao/tv_show_dao.dart';
import 'package:movie_app_flutter/data/db/model/content_db.dart';
import 'package:movie_app_flutter/data/db/model/content_person.dart';
import 'package:movie_app_flutter/data/db/model/person_db.dart';
import 'package:movie_app_flutter/data/db/model/tv_show_db.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';
import 'package:movie_app_flutter/data/view/person.dart';

final tvShowRepositoryProvider = FutureProvider<TvShowRepository>((ref) async {
  final tvShowDao = await ref.watch(tvShowDaoProvider.future);
  final peopleDao = await ref.watch(peopleDaoProvider.future);
  return TvShowRepository(TvShowApi(), tvShowDao, peopleDao);
});

class TvShowRepository {
  final TvShowApi _tvShowApi;
  final TvShowDao _tvShowDao;
  final PeopleDao _peopleDao;

  TvShowRepository(this._tvShowApi, this._tvShowDao, this._peopleDao);

  Future<List<ContentDetailData>> getPopular(int page) =>
      _tvShowApi.getPopular(page).then((content) => _getTvShows(content, true));

  Future<List<ContentDetailData>> getTopRated(int page) => _tvShowApi
      .getTopRated(page)
      .then((content) => _getTvShows(content, false));

  Future<List<ContentDetailData>> _getTvShows(
      PageContent content, bool arePopular) async {
    final contentData = <ContentDetailData>[];
    var order = 0;
    for (var tvShow in content.results) {
      final tvShowCredits = await _tvShowApi.getCredits(tvShow.id);
      tvShowCredits.cast.sort((a, b) => a.order!.compareTo(b.order!));

      final director = tvShowCredits.crew
          .firstWhere((element) => element.job?.startsWith("Director") ?? false,
              orElse: () => ApiPerson.empty())
          .name;
      final stars = tvShowCredits.cast.take(2).map((e) => e.name).join(" / ");

      final dbTvShow = TvShowDb(tvShow.id, arePopular, order++);

      final dbContent = ContentDb(
        tvShow.id,
        false,
        tvShow.title,
        tvShow.voteAverage,
        director,
        stars,
        tvShow.posterPath,
        tvShow.backdropPath,
        tvShow.overview,
      );

      final cast = tvShowCredits.cast
          .map((e) => PersonDb(e.id, e.name, e.profilePath, e.character,
              e.order, e.department, e.job))
          .toList();
      final crew = tvShowCredits.crew
          .map((e) => PersonDb(e.id, e.name, e.profilePath, e.character,
              e.order, e.department, e.job))
          .toList();

      final contentPerson = cast
          .map((e) => ContentPersonDb(tvShow.id, e.id, false, true, e.order))
          .toList()
            ..addAll(crew.map((e) =>
                ContentPersonDb(tvShow.id, e.id, false, false, e.order)));

      await _tvShowDao.insert(dbContent);
      await _tvShowDao.insertTvShow(dbTvShow);
      await _peopleDao.insertPeople(cast);
      await _peopleDao.insertPeople(crew);
      await _tvShowDao.insertMoviePersons(contentPerson);

      contentData.add(
        ContentDetailData(
          title: tvShow.title,
          grade: tvShow.voteAverage,
          director: director,
          stars: stars,
          posterPath: tvShow.posterPath,
          backdropPath: tvShow.backdropPath,
          overview: tvShow.overview,
          isCollected: false,
          cast: tvShowCredits.cast
              .map((e) => Person(e.name, e.profilePath, e.character!))
              .toList(),
          crew: tvShowCredits.crew
              .map((e) => Person(e.name, e.profilePath, e.job!))
              .toList(),
        ),
      );
    }
    return contentData;
  }
}
