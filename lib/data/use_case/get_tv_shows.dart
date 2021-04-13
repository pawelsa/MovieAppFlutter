import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/tv_show_repository.dart';
import 'package:movie_app_flutter/data/use_case/get_content.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';

final getPopularTvShowsProvider =
    FutureProvider.family<List<ContentDetailData>, int>((ref, page) async {
  final repository = await ref.watch(tvShowRepositoryProvider.future);
  debugPrint("getPopularTvShowsProvider:obtaining - page: $page");
  return repository.getPopular(page);
});

final getTopRatedTvShowsProvider =
    FutureProvider.family<List<ContentDetailData>, int>((ref, page) async {
      final repository = await ref.watch(tvShowRepositoryProvider.future);
  debugPrint("getTopRatedTvShowsProvider:obtaining - page: $page");
  return repository.getTopRated(page);
});

class GetPopularMoviesUseCaseImpl extends GetContentUseCase {
  final TvShowRepository _tvShowRepository;

  GetPopularMoviesUseCaseImpl(this._tvShowRepository);

  @override
  Future<List<ContentDetailData>> call(int page) =>
      _tvShowRepository.getPopular(page);
}

class GetTopRatedTvShowsUseCaseImpl extends GetContentUseCase {
  final TvShowRepository _tvShowRepository;

  GetTopRatedTvShowsUseCaseImpl(this._tvShowRepository);

  @override
  Future<List<ContentDetailData>> call(int page) =>
      _tvShowRepository.getTopRated(page);
}
