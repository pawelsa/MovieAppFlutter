import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/use_case/get_movies.dart';
import 'package:movie_app_flutter/pages/detail/detail_page.dart';
import 'package:movie_app_flutter/widgets/base_tabbed_page.dart';

final _pageProvider = StateProvider((ref) => 0);

final _nowPopularMoviesProvider = StateProvider((ref) => List.generate(
      10,
      (index) => ContentData(
        "Title",
        8.0,
        "Michael",
        "Michael / Lopez",
        "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
      ),
    ));

final _theUpcomingMoviesProvider = StateProvider((ref) => List.generate(
      10,
      (index) => ContentData(
    "Title",
        8.0,
        "Michael",
        "Michael / Lopez",
        "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
      ),
    ));

final _moviesProvider =
    FutureProvider<List<List<ContentDetailData>>>((ref) async {
  final nowPopular = await ref.watch(getPopularMoviesProvider(1).future);
  final theUpcoming = await ref.watch(getUpcomingMoviesProvider(1).future);
  return <List<ContentDetailData>>[nowPopular, theUpcoming];
});

class ContentData {
  final String title;
  final double grade;
  final String director;
  final String stars;
  final String? posterPath;

  ContentData(
      this.title, this.grade, this.director, this.stars, this.posterPath);
}

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
      tabs: tabs,
    );
  }
}
