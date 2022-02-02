import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/credits.dart';
import 'package:movie_app_flutter/data/api/tv_show_api.dart';
import 'package:movie_app_flutter/data/db/content_db.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/dao/tv_show_dao.dart';
import 'package:movie_app_flutter/data/db/model/tv_show_db.dart';
import 'package:movie_app_flutter/data/repository/content_repository.dart';
import 'package:movie_app_flutter/data/view/content_data.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';

final tvShowRepositoryProvider = FutureProvider<TvShowRepository>((ref) async {
  final tvShowDao = await ref.watch(tvShowDaoProvider.future);
  final peopleDao = await ref.watch(peopleDaoProvider.future);
  return TvShowRepository(TvShowApi(), tvShowDao, peopleDao);
});

class TvShowRepository extends ContentRepository {
  final TvShowApi _tvShowApi;
  final TvShowDao _tvShowDao;

  TvShowRepository(this._tvShowApi, this._tvShowDao, PeopleDao peopleDao)
      : super(_tvShowDao, peopleDao, false);

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

      await saveTvShowsInDb(
          tvShow, arePopular, order++, director, stars, tvShowCredits);

      contentData.add(
        ContentDetailData(
          id: tvShow.id,
          title: tvShow.title,
          grade: tvShow.voteAverage,
          director: director,
          stars: stars,
          posterPath: tvShow.posterPath,
          backdropPath: tvShow.backdropPath,
          overview: tvShow.overview,
          isCollected: false,
          cast: mapCast(api: tvShowCredits.cast),
          crew: mapCrew(api: tvShowCredits.crew),
        ),
      );
    }
    return contentData;
  }

  Future saveTvShowsInDb(ApiContent content, bool arePopular, int order,
      String director, String stars, ApiCredits movieCredits) async {
    final dbTvShow = TvShowDb(content.id, arePopular, order);
    await saveContentInDb(content, director, stars, movieCredits,
        _tvShowDao.insertTvShow(dbTvShow));
  }

  Future<List<ContentDetailData>> getDetailedTopRatedFromDb() =>
      _tvShowDao.findAllTopRated().then(getDetailsFromDb);

  Future<List<ContentDetailData>> getDetailedPopularFromDb() =>
      _tvShowDao.findAllPopular().then(getDetailsFromDb);

  Future<List<ContentData>> getTopRatedFromDb() =>
      _tvShowDao.findAllTopRated().then(getContentFromDb);

  Future<List<ContentData>> getPopularFromDb() =>
      _tvShowDao.findAllPopular().then(getContentFromDb);
}
