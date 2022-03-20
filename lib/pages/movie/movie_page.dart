import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/common/extensions.dart';
import 'package:movie_app_flutter/data/repository/result.dart';
import 'package:movie_app_flutter/data/use_case/get_movie_details.dart';
import 'package:movie_app_flutter/data/use_case/get_movies.dart';
import 'package:movie_app_flutter/data/use_case/observe_movies.dart';
import 'package:movie_app_flutter/widgets/base_tabbed_page.dart';

final _pageProvider = StateProvider<int>((ref) => 0);

class MoviePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = <String>[
      context.text.moviesTabNowPopular,
      context.text.moviesTabTheUpcoming,
    ];

    final messenger = (String msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    ref.listen(getPopularMoviesProvider(1), (_, AsyncValue<Result> result) {
      if (result.asData?.value is ErrorResult) {
        result.asData?.value.whenOrNull(error: (cause) {
          cause.when(
            noInternet: () => messenger(context.text.popularMoviesNoInternet),
            databaseSave: () => messenger(context.text.popularMoviesDatabase),
            unknown: () => messenger(context.text.popularMoviesUnknown),
          );
        });
      }
    });
    ref.listen(getUpcomingMoviesProvider(1), (_, AsyncValue<Result> result) {
      if (result.asData?.value is ErrorResult) {
        result.asData?.value.whenOrNull(error: (cause) {
          cause.when(
            noInternet: () => messenger(context.text.upcomingMoviesNoInternet),
            databaseSave: () => messenger(context.text.upcomingMoviesDatabase),
            unknown: () => messenger(context.text.upcomingMoviesUnknown),
          );
        });
      }
    });

    return BaseTabbedPage(
      pageProvider: _pageProvider,
      firstTabProvider: observePopularMoviesProvider,
      secondTabProvider: observeUpcomingMoviesProvider,
      contentDetailProvider: movieDetailProvider,
      tabs: tabs,
    );
  }
}
