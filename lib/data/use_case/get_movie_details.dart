import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/repository/movie_repository.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';

final movieDetailProvider = FutureProvider.family<ContentDetailData, int>((ref, id) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getDetailedFromDb(id);
});
