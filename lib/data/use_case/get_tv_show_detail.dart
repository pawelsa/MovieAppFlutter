import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/tv_show_repository.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';

final tvShowDetailProvider =
    FutureProvider.family<ContentDetailData, int>((ref, id) async {
  final tvShowRepository = await ref.watch(tvShowRepositoryProvider.future);
  return tvShowRepository.getDetailedFromDb(id);
});
