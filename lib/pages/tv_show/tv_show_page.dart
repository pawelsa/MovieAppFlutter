import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/use_case/get_tv_show_detail.dart';
import 'package:movie_app_flutter/data/use_case/get_tv_shows.dart';
import 'package:movie_app_flutter/data/use_case/observe_tv_shows.dart';
import 'package:movie_app_flutter/widgets/base_tabbed_page.dart';

final _pageProvider = StateProvider<int>((ref) => 0);

class TvShowPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = <String>[
      context.text.tvShowsTabNowPopular,
      context.text.tvShowsTabTopRated,
    ];

    ref.watch(getPopularTvShowsProvider(1));
    ref.watch(getTopRatedTvShowsProvider(1));

    return BaseTabbedPage(
      pageProvider: _pageProvider,
      firstTabProvider: observePopularTvShowsProvider,
      secondTabProvider: observeTopRatedTvShowsProvider,
      contentDetailProvider: tvShowDetailProvider,
      tabs: tabs,
    );
  }
}
