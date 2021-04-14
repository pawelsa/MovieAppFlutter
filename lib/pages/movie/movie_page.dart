import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/use_case/get_movie_details.dart';
import 'package:movie_app_flutter/data/use_case/get_movies.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';
import 'package:movie_app_flutter/widgets/base_tabbed_page.dart';

final _pageProvider = StateProvider((ref) => 0);

final _moviesProvider =
    FutureProvider<List<List<ContentDetailData>>>((ref) async {
  final nowPopular = await ref.watch(getPopularMoviesProvider(1).future);
  final theUpcoming = await ref.watch(getUpcomingMoviesProvider(1).future);
  return <List<ContentDetailData>>[nowPopular, theUpcoming];
});

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = <String>[
      context.text.moviesTabNowPopular,
      context.text.moviesTabTheUpcoming,
    ];

    return BaseTabbedPage(
      pageProvider: _pageProvider,
      contentProvider: _moviesProvider,
      contentDetailProvider: movieDetailProvider,
      tabs: tabs,
    );
  }
}
