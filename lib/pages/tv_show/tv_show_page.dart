import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/repository/result.dart';
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

    final messenger = (String msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

    ref.listen(getPopularTvShowsProvider(1), (_, AsyncValue<Result> result) {
      if (result.asData?.value is ErrorResult) {
        result.asData?.value.whenOrNull(error: (cause) {
          cause.when(
            noInternet: () => messenger(context.text.popularTvShowsNoInternet),
            databaseSave: () => messenger(context.text.popularTvShowsDatabase),
            unknown: () => messenger(context.text.popularTvShowsUnknown),
          );
        });
      }
    });
    ref.listen(getTopRatedTvShowsProvider(1), (_, AsyncValue<Result> result) {
      if (result.asData?.value is ErrorResult) {
        result.asData?.value.whenOrNull(error: (cause) {
          cause.when(
            noInternet: () => messenger(context.text.topRatedTvShowsNoInternet),
            databaseSave: () => messenger(context.text.topRatedTvShowsDatabase),
            unknown: () => messenger(context.text.topRatedTvShowsUnknown),
          );
        });
      }
    });
    return BaseTabbedPage(
      pageProvider: _pageProvider,
      firstTabProvider: observePopularTvShowsProvider,
      secondTabProvider: observeTopRatedTvShowsProvider,
      contentDetailProvider: tvShowDetailProvider,
      tabs: tabs,
    );
  }
}
