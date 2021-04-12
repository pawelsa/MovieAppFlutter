import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/api/model/content.dart';
import 'package:movie_app_flutter/data/api/model/credits.dart';
import 'package:movie_app_flutter/data/api/tv_show_api.dart';
import 'package:movie_app_flutter/pages/detail/detail_actors.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';

final tvShowRepositoryProvider =
    Provider((ref) => TvShowRepository(TvShowApi()));

class TvShowRepository {
  final TvShowApi _tvShowApi;

  TvShowRepository(this._tvShowApi);

  Future<List<ContentDetailData>> getPopular(int page) =>
      _tvShowApi.getPopular(page).then(_getTvShows);

  Future<List<ContentDetailData>> getTopRated(int page) =>
      _tvShowApi.getTopRated(page).then(_getTvShows);

  Future<List<ContentDetailData>> _getTvShows(PageContent content) async {
    final contentData = <ContentDetailData>[];
    for (var movie in content.results) {
      final movieCredits = await _tvShowApi.getCredits(movie.id);
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
