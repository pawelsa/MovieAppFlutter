import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content_api_model.dart';
import 'package:movie_app_flutter/data/api/model/credits_api_model.dart';
import 'package:movie_app_flutter/data/api/tv_show_api.dart';
import 'package:movie_app_flutter/data/db/content_db.dart';
import 'package:movie_app_flutter/data/db/dao/person_dao.dart';
import 'package:movie_app_flutter/data/db/dao/tv_show_dao.dart';
import 'package:movie_app_flutter/data/db/model/tv_show_db.dart';
import 'package:movie_app_flutter/data/repository/content_repository.dart';
import 'package:movie_app_flutter/data/repository/result.dart';
import 'package:movie_app_flutter/data/view/content_data.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';

final tvShowRepositoryProvider = Provider<TvShowRepository>((ref) {
  final tvShowDao = ref.watch(tvShowDaoProvider);
  final peopleDao = ref.watch(peopleDaoProvider);
  return TvShowRepository(TvShowApi(), tvShowDao, peopleDao);
});

class TvShowRepository extends ContentRepository {
  final TvShowApi _tvShowApi;
  final TvShowDao _tvShowDao;

  TvShowRepository(this._tvShowApi, this._tvShowDao, PeopleDao peopleDao) : super(_tvShowDao, peopleDao, false);

  Future<Result> getPopular(int page) async {
    final response = await _tvShowApi.getPopular(page);
    if (response is ContentListResponse) {
      return _getTvShows(response, true);
    }
    return ErrorResult(ErrorCause.noInternet());
  }

  Future<Result> getTopRated(int page) async {
    final response = await _tvShowApi.getTopRated(page);
    if (response is ContentListResponse) {
      return _getTvShows(response, false);
    }
    return ErrorResult(ErrorCause.noInternet());
  }

  Future<Result> _getTvShows(ContentListResponse content, bool arePopular) async {
    var order = (content.page - 1) * content.results.length;

    Result result = SuccessfulResult();
    for (var tvShow in content.results) {
      final tvShowCredits = await _tvShowApi.getCredits(tvShow.id);
      if (tvShowCredits is ApiCredits) {
        tvShowCredits.cast.sort((a, b) => a.order!.compareTo(b.order!));

        final director = tvShowCredits.crew
            .firstWhere(
              (element) => element.job?.startsWith("Director") ?? false,
              orElse: () => ApiPerson.empty(),
            )
            .name;
        final stars = tvShowCredits.cast.take(2).map((e) => e.name).join(" / ");

        await saveTvShowsInDb(tvShow, arePopular, order++, director, stars, tvShowCredits);
      } else {
        result = ErrorResult(ErrorCause.unknown());
      }
    }
    return result;
  }

  Future saveTvShowsInDb(ContentResponse content, bool arePopular, int order, String director, String stars,
      ApiCredits movieCredits) async {
    final dbTvShow = TvShowDb(content.id, arePopular, order);
    await saveContentInDb(content, director, stars, movieCredits, _tvShowDao.insertTvShow(dbTvShow));
  }

  Stream<List<ContentDetailData>> observeDetailedTopRated() =>
      _tvShowDao.observeAllTopRated().asyncMap(getDetailsFromDb);

  Stream<List<ContentDetailData>> observeDetailedPopular() => _tvShowDao.observeAllPopular().asyncMap(getDetailsFromDb);

  Stream<List<ContentData>> observeTopRated() => _tvShowDao.observeAllTopRated().map(getContentFromDb);

  Stream<List<ContentData>> observePopular() => _tvShowDao.observeAllPopular().map(getContentFromDb);
}
