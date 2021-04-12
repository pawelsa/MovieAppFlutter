import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/pages/movie/movie_page.dart';

final _pageProvider = StateProvider((ref) => 0);

final _nowPopularTvShowsProvider = StateProvider((ref) => List.generate(
      10,
      (index) => ContentData(
        "Title",
        8.0,
        "Michael",
        "Michael / Lopez",
        "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
      ),
    ));

final _theTopRatedTvShowsProvider = StateProvider((ref) => List.generate(
      10,
      (index) => ContentData(
        "Title",
        8.0,
        "Michael",
        "Michael / Lopez",
        "https://i.pinimg.com/originals/86/55/80/865580314a24d809e6fb0f12ce72e738.jpg",
      ),
    ));

final _tvShowsProvider = StateProvider<List<List<ContentData>>>((ref) {
  final nowPopular = ref.watch(_nowPopularTvShowsProvider).state;
  final topRated = ref.watch(_theTopRatedTvShowsProvider).state;
  return <List<ContentData>>[nowPopular, topRated];
});

/*
class TvShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = <String>[
      context.text.tvShowsTabNowPopular,
      context.text.tvShowsTabTopRated,
    ];

    return BaseTabbedPage(
      pageProvider: _pageProvider,
      contentProvider: _tvShowsProvider,
      tabs: tabs,
    );
  }
}
*/
