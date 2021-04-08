import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/widgets/base_tabbed_page.dart';

final _pageProvider = StateProvider((ref) => 0);

final _nowPopularMoviesProvider = StateProvider((ref) => List.generate(
      10,
      (index) => ContentData(
        "Title",
        "8.0",
        "Michael",
        "Michael / Lopez",
        "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
      ),
    ));

final _theUpcomingMoviesProvider = StateProvider((ref) => List.generate(
      10,
      (index) => ContentData(
        "Title",
        "8.0",
        "Michael",
        "Michael / Lopez",
        "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
      ),
    ));

final _moviesProvider = StateProvider<List<List<ContentData>>>((ref) {
  final nowPopular = ref.watch(_nowPopularMoviesProvider).state;
  final theUpcoming = ref.watch(_theUpcomingMoviesProvider).state;
  return <List<ContentData>>[nowPopular, theUpcoming];
});

class ContentData {
  final String title;
  final String grade;
  final String director;
  final String stars;
  final String posterPath;

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