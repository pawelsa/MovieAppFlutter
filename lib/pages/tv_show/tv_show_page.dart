import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/use_case/get_tv_show_detail.dart';
import 'package:movie_app_flutter/data/use_case/get_tv_shows.dart';
import 'package:movie_app_flutter/data/view/content_detail_data.dart';
import 'package:movie_app_flutter/widgets/base_tabbed_page.dart';

final _pageProvider = StateProvider<int>((ref) => 0);

final _tvShowsProvider =
    FutureProvider<List<List<ContentDetailData>>>((ref) async {
  final nowPopular = await ref.watch(getPopularTvShowsProvider(1).future);
  final theUpcoming = await ref.watch(getTopRatedTvShowsProvider(1).future);
  return <List<ContentDetailData>>[nowPopular, theUpcoming];
});

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
      contentDetailProvider: tvShowDetailProvider,
      tabs: tabs,
    );
  }
}
